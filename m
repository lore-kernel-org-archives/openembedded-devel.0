Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IXmeS-0004uE-BK
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 01:38:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8INYwDp009733
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 00:34:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09309-09 for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 00:34:52 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8INYq4D009727
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Sep 2007 00:34:52 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46F0077F.3050807@student.utwente.nl>
References: <46F0077F.3050807@student.utwente.nl>
Date: Wed, 19 Sep 2007 00:34:51 +0100
Message-Id: <1190158491.6159.93.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 18 Sep 2007 23:38:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-09-18 at 19:14 +0200, Koen Kooi wrote:
> For a number of features in OE (e.g packaged-staging, rm_work) a change to bitbake stamp
> handling would make things a lot easier. As I understand it bitbake currently does for
> 'bitbake foo -c compile':
> 
> if(dependency stamps are missing OR depency stamps have newer mtime) then start from scratch
> 
> For rm_work we want to remove the do_unpack upto do_install stamps, but leave do_fetch and
> do_package_write* and for packaged-staging we want to only create a do_populate_staging
> stamps. So 'bitbake foo -c compile' would only do:
> 
> if(depency stamps have newer mtime) then start from scratch
> 
> this has implications for do_clean and do_rebuild, and possibly other things. Since this
> looks to good to be true, I want to know what else might break and how we could solve that
> when implementing this. This just a gedankenexperiment for now, so bitbake hackers can
> relax now :)

When you type bitbake strace, bitbake splits this into queue of tasks.
This might be for example:

1. strace.do_fetch
2. strace.do_unpack
3. strace.do_patch
4. strace.do_configure
5. strace.do_compile
6. etc.

Say you "bitbake strace -c compile":

* Bitbake looks at step 1. Does it need to build it? If the stamp 
  doesn't exist, yes it does. If the stamp exists, it checks dependency 
  stamps (there are none).

* Bitbake looks at step 2. Does it need to build it? If the stamp 
  doesn't exist, yes it does. If the stamp exists, it checks dependency 
  stamps.

* etc.

The logic you propose above simply breaks this and its fundamental to
the way bitbake currently works.

I guess what you propose is bitbake does this backwards. Assuming you
"bitbake strace -c compile":

* Look at step 5. Does it need to build it? If the stamp exists, and 
  any present dependency stamps are valid and older [repeat for all
present stamps], no, else yes.

* No further processing

This needs two changes:

  a) stamps are checked before we start processing the queue
  b) stamps are checked on a global basis (cross PN)

both of which are fairly major changes.

The breakage:

Say you're using rm_work and want to rebuild strace for the image. You
run "bitbake strace -c compile -f". A subsequent "bitbake someimage"
will not cause strace to install/package/stage or get included in the
image. Broken and one of the things you wanted to fix!

Say you want to trigger a reinstall of all packages like the recent
pkgmaps change. How do you do it? In the case without rm_work you could
touch all a dependent task like compile to trigger the install (ugly),
or remove *every* install task stamp and *every* stamp which depends on
install (near impossible). With rm_work, you're screwed basically.

So I really think this is the wrong tree to bark up...

Regards,

Richard



