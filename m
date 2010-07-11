Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXxbD-0005pj-3V
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 16:33:57 +0200
Received: from [127.0.0.1] (helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXwzV-0000xs-PI
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 14:54:45 +0100
Received: from ip-80-226-0-1.vodafone-net.de (ip-80-226-0-1.vodafone-net.de
	[80.226.0.1]) by webmail.htc-linux.org (Horde MIME library) with HTTP;
	Sun, 11 Jul 2010 14:54:45 +0100
Message-ID: <20100711145445.r2ay8zxe1wwoggoc@webmail.htc-linux.org>
Date: Sun, 11 Jul 2010 14:54:45 +0100
From: lukas gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.6)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 83.167.180.132
X-SA-Exim-Mail-From: lukas@htc-linux.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL, BAYES_00,
	MIME_QP_LONG_LINE, 
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xf86-video-msm
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
X-List-Received-Date: Sun, 11 Jul 2010 14:34:02 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

As I was told the bugtracker is not frequented much, I am taking the =20
liberty to quote
from oebug http://bugs.openembedded.org/show_bug.cgi?id=3D5451 in the =20
following :

Project Website:

https://www.codeaurora.org/contribute/projects/xwinp/


Problem:

currently xf86-video-msm is only confirmed to compile on armv6-novfp htcdrea=
m
device. htcdream selects patches to remove the neon support and other stuff
from the driver that is actually designed for the cortex-a8 based qualcomm
qsd8xxxx.

Building for the htc-qsd8 htcleo machine in current org.openembedded.dev
revision it fails.



Recipe:

require xorg-driver-video.inc
DESCRIPTION =3D "X.Org X server -- MSM display driver"
PE =3D "1"
PV =3D "1.1.0+${PR}+gitr${SRCREV}"
PR =3D "${INC_PR}.0"

SRC_URI =3D
"git://codeaurora.org/quic/xwin/xf86-video-msm.git;protocol=3Dgit;branch=3Dc=
hromium
\
            file://compile_cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1.patch \
            file://kgsl_drm.h "
SRC_URI_append_htcdream =3D
"file://no_neon_cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1.patch"

SRCREV =3D "cfbbd17f0d4ab0f30915594d74e1b2b12c4ff8a1"
S =3D "${WORKDIR}/git"

do_compile_prepend() {
         install -d ${S}/src/linux
         install -d ${S}/src/drm
         install -m 0644 ${STAGING_KERNEL_DIR}/include/linux/msm_mdp.h
${S}/src/linux/
         install -m 0644 ${WORKDIR}/kgsl_drm.h ${S}/src/drm/
}

PACKAGE_ARCH =3D "${MACHINE_ARCH}"

ARM_INSTRUCTION_SET =3D "arm"

CFLAGS +=3D " -I${STAGING_INCDIR}/xorg "
CFLAGS +=3D " -Wno-error "


Error:

| msm-driver.c: In function 'MSMPreInit':
| msm-driver.c:413: error: 'MSMFB_RESUME_SW_REFRESHER' undeclared =20
(first use in
this function)
| msm-driver.c:413: error: (Each undeclared identifier is reported only once
| msm-driver.c:413: error: for each function it appears in.)
| msm-driver.c:624: error: 'MDP_FB_PAGE_PROTECTION_WRITETHROUGHCACHE'
undeclared (first use in this function)
| make[2]: *** [msm-driver.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| mv -f .deps/msm-exa-mixed.Tpo .deps/msm-exa-mixed.Plo
| mv -f .deps/msm-exa.Tpo .deps/msm-exa.Plo
| mv -f .deps/msm-exa-neon.Tpo .deps/msm-exa-neon.Plo
| make[2]: Leaving directory
`/media/lenny/home/luke-g/build/openembedded/tmp/work/htcleo-angstrom-linux-=
gnueabi/xf86-video-msm-1_1.1.0+r14.0+gitrcfbbd17f0d4ab0f30915594d74e1b2b12c4=
ff8a1-r14.0/git/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/media/lenny/home/luke-g/build/openembedded/tmp/work/htcleo-angstrom-linux-=
gnueabi/xf86-video-msm-1_1.1.0+r14.0+gitrcfbbd17f0d4ab0f30915594d74e1b2b12c4=
ff8a1-r14.0/git'
| make: *** [all] Error 2
| FATAL: oe_runmake failed

It seems like it is missing some variables from the msm_fb driver inside the
kernel. Currently the recipe installs parts from it (include/linux/msm_mdp.h=
,
kgsl_drm.h) . I am not sure if it is taken from the right kernel source as
there are quite some different versions of both, xf86-video-msm and msm_fb
driver..
Maybe for the above error we just need to add an additional header file. I
searched for the missing defines in the current kernel branch for htcleo at
http://linuxtogo.org/cgi-bin/gitweb.cgi?p=3Dgroups/mobile-linux/kernel.git;a=
=3Dshortlog;h=3Drefs/heads/htc-msm-2.6.32
  but could not find them.
I guess this means we need to

*pick a different/older version of the xf86-video-msm to match htcleo =20
kernel or

*find correct kernel tree which has the missing defines and try putting the
headers and still use unmodified kernel on device or

*patch the kernel with matching msm_fb version


It might be a good approach to cleanly start over with the recipe for both
machines.

Different kernel versions for the qsd8 devices are available at
https://www.codeaurora.org/gitweb/quic/kernel/
Like I mentioned I have no clue which xf86-video-msm version matches which
drivers/video/msm version. I can't see where this is documented.

On a side note, I tried to compile xf86-video-msm manually outside of =20
OE but it
did not compile. And I am very puzzled about the total lack of information o=
n
kernel in the README
https://www.codeaurora.org/gitweb/quic/xwin/?p=3Dxf86-video-msm.git;a=3Dblob=
;f=3DREADME;h=3Dc38a80e901d0ff033c39ac157cdfb80530b4830a;hb=3Drefs/heads/chr=
omium

As this a bit out of my league I will be happy about any comment.


Best regards,

Lukas



