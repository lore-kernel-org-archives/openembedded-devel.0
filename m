Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IY2Cr-0003UH-S1
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Sep 2007 18:15:17 +0200
Received: by fk-out-0910.google.com with SMTP id 18so245118fks
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2007 09:11:27 -0700 (PDT)
Received: by 10.82.152.16 with SMTP id z16mr1175538bud.1190218287291;
	Wed, 19 Sep 2007 09:11:27 -0700 (PDT)
Received: by 10.82.119.6 with HTTP; Wed, 19 Sep 2007 09:11:27 -0700 (PDT)
Message-ID: <74d0deb30709190911m1a74245fl47f594f615553d@mail.gmail.com>
Date: Wed, 19 Sep 2007 18:11:27 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1190158491.6159.93.camel@localhost.localdomain>
MIME-Version: 1.0
References: <46F0077F.3050807@student.utwente.nl>
	<1190158491.6159.93.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: Revisiting bitbake stamp handling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2007 16:15:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/19/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2007-09-18 at 19:14 +0200, Koen Kooi wrote:
> > For a number of features in OE (e.g packaged-staging, rm_work) a change to bitbake stamp
> > handling would make things a lot easier. As I understand it bitbake currently does for
> > 'bitbake foo -c compile':
> >
> > if(dependency stamps are missing OR depency stamps have newer mtime) then start from scratch
> >
> > For rm_work we want to remove the do_unpack upto do_install stamps, but leave do_fetch and
> > do_package_write* and for packaged-staging we want to only create a do_populate_staging
> > stamps. So 'bitbake foo -c compile' would only do:
> >
> > if(depency stamps have newer mtime) then start from scratch
> >
> > this has implications for do_clean and do_rebuild, and possibly other things. Since this
> > looks to good to be true, I want to know what else might break and how we could solve that
> > when implementing this. This just a gedankenexperiment for now, so bitbake hackers can
> > relax now :)
>
> When you type bitbake strace, bitbake splits this into queue of tasks.
> This might be for example:
>
> 1. strace.do_fetch
> 2. strace.do_unpack
> 3. strace.do_patch
> 4. strace.do_configure
> 5. strace.do_compile
> 6. etc.
>
> Say you "bitbake strace -c compile":
>
> * Bitbake looks at step 1. Does it need to build it? If the stamp
>   doesn't exist, yes it does. If the stamp exists, it checks dependency
>   stamps (there are none).
>
> * Bitbake looks at step 2. Does it need to build it? If the stamp
>   doesn't exist, yes it does. If the stamp exists, it checks dependency
>   stamps.
>
> * etc.
>
> The logic you propose above simply breaks this and its fundamental to
> the way bitbake currently works.
>
> I guess what you propose is bitbake does this backwards. Assuming you
> "bitbake strace -c compile":
>
> * Look at step 5. Does it need to build it? If the stamp exists, and
>   any present dependency stamps are valid and older [repeat for all
> present stamps], no, else yes.
>
> * No further processing
>
> This needs two changes:
>
>   a) stamps are checked before we start processing the queue
>   b) stamps are checked on a global basis (cross PN)
>
> both of which are fairly major changes.

So is it worth it? Possible to do at all? It would enable us to have
missing dependency stamps if that more accurately reflects the state
of work/staging dirs.
I certainly find the idea of walking down from the last step much more
elegant than always starting at step 1. OTOH I have no idea how much
work it would be to implement this and what other problems this might
bring other than the examples you already gave.

> The breakage:
>
> Say you're using rm_work and want to rebuild strace for the image. You
> run "bitbake strace -c compile -f". A subsequent "bitbake someimage"
> will not cause strace to install/package/stage or get included in the
> image. Broken and one of the things you wanted to fix!

For stampless tasks like rootfs we should check the stamps of all its
dependencies
(task-something, depends on strace:do_package_write, which is not
current if a newer do_compile stamp is found). I don't see the problem
here.

> Say you want to trigger a reinstall of all packages like the recent
> pkgmaps change. How do you do it? In the case without rm_work you could
> touch all a dependent task like compile to trigger the install (ugly),
> or remove *every* install task stamp and *every* stamp which depends on
> install (near impossible). With rm_work, you're screwed basically.

That's right, with rm_work you're screwed either way, you have to rebuild.

> So I really think this is the wrong tree to bark up...

But I'm not sure using stamps not only as indicators of work/staging
state, but also as a mechanism to manipulate bitbake behaviour is the
right way either. Wouldn't it be better to have a bitbake option that
just skips task whose dependencies are not met and do
bitbake -cinstall -f world --no-task-dependencies to force a reinstall
of all compiled packages?

regards
Philipp


