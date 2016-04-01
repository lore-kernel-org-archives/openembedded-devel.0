Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7B76F7665F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 19:53:58 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z0081A0LJ3ES0@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	01 Apr 2016 14:53:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=stkexhm8AAAA:8 a=gVGD3344AAAA:8
	a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8	a=pGLkceISAAAA:8
	a=ycLL-6VzrwhdzTfFz20A:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 22e0b69c; Fri, 01 Apr 2016 19:53:59 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BD38E161F74; Fri,
	1 Apr 2016 15:53:41 -0400 (EDT)
Date: Fri, 01 Apr 2016 15:53:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160401195341.GC16135@denix.org>
References: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
	<20160401113608.GD2567@jama>
MIME-version: 1.0
In-reply-to: <20160401113608.GD2567@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: James Minor <james.minor@ni.com>
Subject: Re: [meta-oe][PATCH] ti-wifi-utils: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2016 19:54:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 01, 2016 at 01:36:08PM +0200, Martin Jansa wrote:
> On Tue, Mar 22, 2016 at 11:57:16AM +0200, Ioan-Adrian Ratiu wrote:
> > This recipe is for a TI WiFi calibrator utility [1]. The firmware from
> > this project is already shipped inside linux-firmware so we do not
> > package it in this recipe.
> > 
> > [1] http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/#Calibration
> > 
> > Signed-off-by: James Minor <james.minor@ni.com>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../ti-wifi-utils/ti-wifi-utils_git.bb             | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
> > 
> > diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
> > new file mode 100644
> > index 0000000..fcae729
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils_git.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "The calibrator and other useful utilities for TI wireless solution based on wl12xx driver"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
> > +
> > +DEPENDS = "libnl"
> > +
> > +PV = "0.1+gitr${SRCPV}"
> > +
> > +SRCREV = "b03d9ce6362e6d22d6929f2736409af3b0fd3c88"
> > +SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;branch=r5-jb"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} \
> > +                CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \

Reinventing the wheel much?

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ti-wifi-utils


> This doesn't respect all flags usually available in $CC variable, why
> haven't you used $CC?
> 
> Maybe it's other part of Makefiles which is using CROSS_COMPILE instead
> of CC, but currently it's failing e.g. for hardfloat builds with
> typical:
> 
> ../SYSROOT/MACHINE/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-soft.h: No such file or directory
> 
> because the build doesn't have correct -mfloat-abi parameter
> 
> | arm-DISTRO-linux-gnueabi-gcc  --sysroot=/SYSROOTS/MACHINE -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=TMPDIRwork/MACHINE-DISTRO-linux-gnueabi/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0=/usr/src/debug/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0 -fdebug-prefix-map=TMPDIRsysroots/x86_64-linux= -fdebug-prefix-map=/SYSROOTS/MACHINE=  -I/SYSROOTS/MACHINE/usr/include/libnl3 -DCONFIG_LIBNL20   -c -o misc_cmds.o misc_cmds.c
> 
> > +                CFLAGS="${CFLAGS} -I${STAGING_INCDIR}/libnl3 -DCONFIG_LIBNL20" NLVER=3 \
> > +                LDFLAGS="${LDFLAGS} ${TOOLCHAIN_OPTIONS}" \
> > +'
> > +
> > +#only install the calibrator utility, firmware is already within linux-firmware
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 0755 calibrator ${D}${bindir}/
> > +}
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


