Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IKhhI-0006O5-6H
	for openembedded-devel@openembedded.org; Mon, 13 Aug 2007 23:43:36 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7DLhHj1008267 for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2007 23:43:18 +0200
Message-ID: <46C0D076.9030906@dominion.kabel.utwente.nl>
Date: Mon, 13 Aug 2007 23:43:18 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <19c1b8a90708131341n2d627e99y1d73332dd9542f09@mail.gmail.com>
In-Reply-To: <19c1b8a90708131341n2d627e99y1d73332dd9542f09@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: omap2 support.
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
X-List-Received-Date: Mon, 13 Aug 2007 21:43:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef:
> Hi
> 
> This adds support of omap2430sdp board. I have added recipe for a new kernel
> and u-boot. The angstrom-2008.1 build with MACHINE=omap2430sdp till the kernel.
> Kernel is having issues due to a compile problem.

Looks pretty, some minor issues, see below.


- --- conf/machine/omap2430sdp.conf	a9af9a075c6a90b2d65f3966f1fb4b8fc1eb662e
+++ conf/machine/omap2430sdp.conf	a9af9a075c6a90b2d65f3966f1fb4b8fc1eb662e
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@NAME: ARM 1136 cpu on OMAP2430 SDP board
+#@DESCRIPTION: Machine configuration for the OMAP 2430 SDP development board with a
arm1136 processor.
+
+TARGET_ARCH = "arm"
+PACKAGE_EXTRA_ARCHS = "armv5te armv6"

that should be PACKAGE_EXTRA_ARCHS = "armv4t armv5te armv6"

+PREFERRED_VERSION_u-boot = "omap2430sdp"

'omap2430sdp' is not a proper version (see below)


+PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"

MACHINE_FEATURES = "kernel26" should take care of that


+BOOTSTRAP_EXTRA_RDEPENDS += "modutils-collateral"

That shouldn't be needed



============================================================
- --- packages/linux/linux-omap2_git.bb	f7dd822d0aa5d74967b00c6b49bde9755d89e1f8
+++ packages/linux/linux-omap2_git.bb	f7dd822d0aa5d74967b00c6b49bde9755d89e1f8
@@ -0,0 +1,13 @@
+require linux-omap.inc
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/linux-omap2-git"
+PV = "2.6+git${SRCDATE}"

That should be PV = "2.6.<micro release number>+git${SRCDATE}"



- --- packages/uboot/u-boot_omap2430sdp.bb	fe281ead4f04210e0876f455ed429333d5f6d40d

That should be u-boot-omap2430_1.<minor version>.<microversion>.bb, so we know which uboot
version it was originally based on.



- --- conf/machine/include/tune-arm1136jf-s.conf	b8cdf4c6533420f583f03a1a756edec48bc2e823
+++ conf/machine/include/tune-arm1136jf-s.conf	3a32f71999f930e828ad32e4ce1e7af1b4dc9662
@@ -1,2 +1,2 @@
- -TARGET_CC_ARCH = "-march=armv6 -mtune=arm1136jf-s -mfpu=vfp"
+TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s -mfpu=vfp -mfloat-abi=softfp"

What does -mfloat-abi=softfp" imply, and shouldn't TARGET_FPU take care of that?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGwNB2MkyGM64RGpERAl/5AKCgCr7+XYfYcaGFCcuNHruNzyuFRACghfso
5A6AOBkSHh+ZHiLwjTqSTuc=
=u0ys
-----END PGP SIGNATURE-----


