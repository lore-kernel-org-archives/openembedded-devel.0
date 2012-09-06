Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9afI-0003Wt-Lj for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:54:33 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9aTK-0008B3-Pf for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:42:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:42:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:42:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Sep 2012 13:41:57 +0200
Message-ID: <k2a264$d2a$1@ger.gmane.org>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][for-denzil][PATCH 1/8] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Thu, 06 Sep 2012 11:54:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

One day I will figure out how to write a cover letter :)

The matching OE-core patchset is in denzil-next for testing and will
hopefully get merged soon (provided it passes the testsuite).

My main objective is to support on-target builds of external kernel-modules
and initial reports are that it is working as expected.

Since there's a bitbake.conf change needed the matching oe-core set needs to
go in first and ideally this goes in right after that (provided this passes
the testsuite as well).

As you can imagine, this kind of inter-layer dependency sucks, but I don't
see a way around it in this case with the bitbake.conf change.

Op 06-09-12 13:23, Koen Kooi schreef:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> The kernel source tree in the sysroot has all unecessary source code
> removed. The existing use case is to support module building out of the
> sysroot, but as more toolsa are moved into the kernel tree itself there
> are new use cases for the kernel sysroot source.
> 
> To avoid putting dependencies on the kernel, and to be able to 
> individually build and package these tools out of the source tree, we can
> save $kerndir/tools and $kernddir/lib from being removed. This enables
> tools like perf to be built our of the kernel source in the sysroot,
> without significantly increasing the amount of source in the sysroot.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> Signed-off-by: Koen
> Kooi <koen@dominion.thruhere.net> --- meta-oe/classes/kernel.bbclass |
> 2 +- 1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/classes/kernel.bbclass
> b/meta-oe/classes/kernel.bbclass index ce82351..c44a2f5 100644 ---
> a/meta-oe/classes/kernel.bbclass +++ b/meta-oe/classes/kernel.bbclass @@
> -178,7 +178,7 @@ kernel_do_install() { # oe_runmake -C $kerneldir
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean make -C $kerneldir
> _mrproper_scripts -	find $kerneldir -path $kerneldir/scripts -prune -o
> -name "*.[csS]" -exec rm '{}' \; +	find $kerneldir -path $kerneldir/lib
> -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts
> -prune -o -name "*.[csS]" -exec rm '{}' \; find $kerneldir/Documentation
> -name "*.txt" -exec rm '{}' \;
> 
> # As of Linux kernel version 3.0.1, the clean target removes
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQSIwFMkyGM64RGpERAjCgAJ9PFqqoYUsY+deeN9gVy89hod+TqACeJFO3
hJ8tR0ZLZeookvwClEGnpD8=
=CRRt
-----END PGP SIGNATURE-----



