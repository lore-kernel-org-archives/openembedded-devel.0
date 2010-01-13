Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUyeE-00087Y-4A for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:32:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUyc7-00060f-Vc
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:30:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 09:30:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 09:30:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 09:29:05 +0100
Message-ID: <hik08h$l2q$2@ger.gmane.org>
References: <20100108132344.GB2156@jama> <20100112222121.GD10781@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100110 Shredder/3.0.1pre
In-Reply-To: <20100112222121.GD10781@jama>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update-alternatives broken badly (by me :()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2010 08:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-01-10 23:21, Martin Jansa wrote:
> Hi,
> 
> Still no review/ACK :(.

They seem to look decent enough, but I lack the time to test them, so
feel free to apply them

regards,

Koen

> I'll try to explain it better to show how bad it can be and even make
> review easier.
> 
> We have target where sysvinit as init is crucial for successful boot (ie
> SHR on freerunner) and u-a-cworth is installed on image, because
> task-boot RDEPENDs on update-alternatives.
> 
> Let's start with image built after 2009-12-08.
> u-a-opkg is used for in do_rootfs, but u-a-cworth is installed in image
> too and is used by default.
> 
> T1) after flashing
>   ipkg/alternatives/init        opkg/alternatives/init
>     doesnt-exist                  /sbin/init
>                                   /sbin/init.sysvinit 60
>                                  ../bin/busybox 50
>   =>sysvinit is used, everything is fine
> 
> good scenario:
> T2a) sysvinit is upgraded first
>   ipkg/alternatives/init        opkg/alternatives/init
>     /sbin/init                    /sbin/init
>     /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
>                                   ../bin/busybox 50
>   =>sysvinit is used, everything is fine
>   - newer file works but is incomplete
> 
> T3a) busybox is upgraded
>   ipkg/alternatives/init        opkg/alternatives/init
>     /sbin/init                    /sbin/init
>     /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
>     ../bin/busybox 50             ../bin/busybox 50
>   =>sysvinit is used, everything is fine
>   - newer file works and is the same as opkg
> 
> bad scenario
> T2b) busybox is upgrade first
>   ipkg/alternatives/init        opkg/alternatives/init
>     /sbin/init                    /sbin/init
>     ../bin/busybox 50             /sbin/init.sysvinit 60
>                                   ../bin/busybox 50
>   =>busybox is used, device won't boot anymore
>   - newer file is from cworth but is worse
> 
> T3b) sysvinit is upgraded
>   ipkg/alternatives/init        opkg/alternatives/init
>     /sbin/init                    /sbin/init
>     /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
>   ../bin/busybox 50             ../bin/busybox 50
>   
>   =>sysvinit is used again, everything is fine
>   - newer file works and is the same again
> 
> If we merge ipkg/alternatives and opkg/alternatives before T2b) there
> will be no problem.
> 
> If we merge it after T2b) and then force busybox upgrade then we will
> fix broken image too (as busybox is using probably the most u-a links
> and has lowest priority). So busybox PR bump is good idea AFTER merging
> u-a alternatives.
> 
> Worst scenario (where merger fails):
> Tfsck) After T3a) or T3b) user intentionally remove sysvint package 
>   (ie because he can boot even with busybox)
>   ipkg/alternatives/init        opkg/alternatives/init
>     /sbin/init                    /sbin/init
>     ../bin/busybox 50             /sbin/init.sysvinit 60
>                                   ../bin/busybox 50
>   =>busybox is used, user is happy
> 
> then we run merge script (longer alternative file wins
> =>sysvinit is used again, but without actuall /sbin/init.sysvinit file
> in fs.. boot fails, user is sad. I think there is no way to distinguish
> between T2b where newer shorter file is wrong and Tfsck where newer
> shorter file is the right one (without checking opkg history..)
> 
> With images built before 2009-12-08 it should be simple
> opkg/alternatives should be empty, all files from ipkg/alternatives are
> just moved there..
> 
> Why would I like to add the same merge script to opkg?
> 1) someone maybe already removed -cworth from image with first sign of
>    issues (but still too late) and -cworth postinst is still needed
> 
> 2) task-boot will be fixed (RDEPEND on same u-a as
>    virtual/update-alternatives-native) and user won't get -cworth update.
> 
> 3) If I get new -cworth and busybox in one opkg upgrade batch, then I'm
>    not sure which postinst will be executed first (we need -cworth first),
>    but opkg maybe run own postinst before configuring other packages (ie
>    portage does that completely even with restart of upgrade process)
> 
> Updated -cworth is already used in SHR (from shr/merge branch).
> 
> My shell foo is maybe not strong enough to check that everything is available 
> in all environments and no bashisms were used..)
> 
> Thanks and please comment (I'll resend whole patch serie as soon as
> someone confirms that's good path to go).
> 
> Regards,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTYRRMkyGM64RGpERAqECAKCx2TxGSWTxSt0JlFP2APfRu7sEIwCeM/bc
CKNj3N9TmFmaWj0LGCAlrJc=
=vegr
-----END PGP SIGNATURE-----



