Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IXqJX-0000Cl-64
	for openembedded-devel@openembedded.org; Wed, 19 Sep 2007 05:33:23 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8J3TUxW029919 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2007 05:29:30 +0200
Message-ID: <46F097AD.3030103@student.utwente.nl>
Date: Wed, 19 Sep 2007 05:29:49 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46F0077F.3050807@student.utwente.nl>
	<1190158491.6159.93.camel@localhost.localdomain>
In-Reply-To: <1190158491.6159.93.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Wed, 19 Sep 2007 03:33:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-09-18 at 19:14 +0200, Koen Kooi wrote:
>> For a number of features in OE (e.g packaged-staging, rm_work) a change to bitbake stamp
>> handling would make things a lot easier. As I understand it bitbake currently does for
>> 'bitbake foo -c compile':
>>
>> if(dependency stamps are missing OR depency stamps have newer mtime) then start from scratch
>>
>> For rm_work we want to remove the do_unpack upto do_install stamps, but leave do_fetch and
>> do_package_write* and for packaged-staging we want to only create a do_populate_staging
>> stamps. So 'bitbake foo -c compile' would only do:
>>
>> if(depency stamps have newer mtime) then start from scratch
>>
>> this has implications for do_clean and do_rebuild, and possibly other things. Since this
>> looks to good to be true, I want to know what else might break and how we could solve that
>> when implementing this. This just a gedankenexperiment for now, so bitbake hackers can
>> relax now :)
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
> 
> The breakage:
> 
> Say you're using rm_work and want to rebuild strace for the image. You
> run "bitbake strace -c compile -f". A subsequent "bitbake someimage"
> will not cause strace to install/package/stage or get included in the
> image. Broken and one of the things you wanted to fix!

Actually, that would work, since -c compile -f would update the do_compile stamp, so its
mtime is newer than the do_rootfs.


> Say you want to trigger a reinstall of all packages like the recent
> pkgmaps change. How do you do it? In the case without rm_work you could
> touch all a dependent task like compile to trigger the install (ugly),
> or remove *every* install task stamp and *every* stamp which depends on
> install (near impossible). With rm_work, you're screwed basically.

Which highlights exactly why the current situation is broken. In this case the user has to
discover he needs to run install again (which a lot of them don't, looking at IRC and the
ml), so what's stopping us from adding an do_installall task that does exactly that? Or
even requiring a rebuild, since it needs the user to find out *and* the user to take action.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG8JetMkyGM64RGpERAnjNAJ43AqthGee++19Ovs5PLsFEg6howgCeI/xL
eIzIqoYzRvGUbPLcrzWNlKY=
=s3+J
-----END PGP SIGNATURE-----


