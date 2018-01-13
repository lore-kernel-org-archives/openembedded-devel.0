Return-Path: <nickaein.i@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4E31A786BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jan 2018 16:31:59 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id d4so9620574qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jan 2018 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DbbpnM5dOxT6vTFaQM2/ZogxmQ6SDzFWHIrABX5j64w=;
	b=YNduyrVJZz3NQsiPcWSFNlCEp+A6/WPxwZZvvINUazADDv3JtZTykesH6Ej9NqIIor
	vEyH03mMHMmm+fLqLsYwdzLBzPfi5aSxV2hrlofWC7Rw54r7D/9tZ9KZwX3kJQ+/1qy2
	umn8kJ+/YLlBIwWukakub7A/EmgF/qC13QW/W1Qml/9nBqQ2jkKoB6xyL5qqH2h6Jr+O
	mpBQrSZBSct48tlnk2hQHqynmOEvR5EivTu75pGWW1yKenIibtpaDBX6ZFxlkBPPlIol
	kM/sE+KKJTIuyf+0+S2aKjS+r/buI5rOFSkjQ7LZqzDsfDz9KW+6DdR70rVMW8Faox1b
	dd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DbbpnM5dOxT6vTFaQM2/ZogxmQ6SDzFWHIrABX5j64w=;
	b=O7sVpnGcKvBTf0mrrkKQ0Ur2g62RrmrwQqKi1dkHk5S1O33WLCJpwXPozofSfBQVAL
	qO05TO1vDwwhYhaiy2rqRvMMJ1Go8S4CYb6fnhxj0FCMOPNvJYb4ZdQbdZzkt7UqfWx0
	aS3oC+nV7ClTLanfcqlzvPhf3e/whIATJSC8VCn3HtZ06s7chziU7LBuu51rXVZw272f
	xphqdhxG/XtrWru8AC6C/VAzIh9CkJThpi/b67TKRHovnAAYGyAtqzjpCkivuq2ucC2i
	EtN4hghtNY0ziFGT+m65ATXilS56bulOykls/Frq8cCofEsCZpza8kS4WafqRc7XZS4F
	AAMg==
X-Gm-Message-State: AKwxytebdfGQHNmjPPOirSaPpHmv6dydGyTwxGSyof2OQL5hH0fSd1px
	bEiSKy1v5msGRrtgAZd+5oo/09ay/TxaJPAXEtDu8g==
X-Google-Smtp-Source: ACJfBosvUUTVIk79zEC0i2oFp8cepL3STF42mOtMlqCSysxIscP3GTkar6YleBeBeRpqyqoS5ZvRPIXZgt6ijNcoiKw=
X-Received: by 10.237.45.165 with SMTP id i34mr40639912qtd.112.1515861120961; 
	Sat, 13 Jan 2018 08:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.214.82 with HTTP; Sat, 13 Jan 2018 08:31:30 -0800 (PST)
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Sat, 13 Jan 2018 20:01:30 +0330
Message-ID: <CA+NJmkdfNKmdi=6RZDtBt2tiZfp3nqZ=Nd5jy=+fGPXKGNODHw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] [rocko] qtbase fails at do_compile for i.MX7
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
X-List-Received-Date: Sat, 13 Jan 2018 16:32:00 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been trying to build the qt5 using meta-qt5 layer for Colibri
i.MX7 modules.
I've cloned meta-oe and related layers on rocko branch and also
meta-qt5. The list of all layers are mentioned down below.

The compile error I am getting is apparently related to
mis-configuration of recipes that don't exactly know the i.MX7
hardware. For instance:

/opt/yocto/rocko-poky/poky/build-saba/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.9.3+gitAUTOINC+4d8ae444c2-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:146:10:
fatal error: X11/Xlib.h: No such file or directory
 #include <X11/Xlib.h>
          ^~~~~~~~~~~~
compilation terminated.
Makefile:621: recipe for target '.obj/qeglstreamconvenience.o' failed


Apparently something is wrong with Qt 5 configuration which tries to
use X11 while I have removed it.

I've tried various settings in my setup but none of them help to
resolve the issue.
I think there is a problem either in meta-oe or meta-qt5 that
mis-configures the qt build.

Here is the conf/local.conf:

MACHINE = "colibri-imx6"
DISTRO = "poky"

PACKAGECONFIG_remove = " x11 wayland wifi 3g bluetooth irda nfc ipv6
largefile pam pci pcmcia ppp smbfs"

DISTRO_FEATURES_remove = " x11 wayland wifi 3g bluetooth irda nfc ipv6
largefile pam pci pcmcia ppp smbfs"

PACKAGECONFIG_append_pn-qtbase = " gles2 eglfs linuxfb "

DISTRO_FEATURES_append = " opengles2 egl"



Here is the bblayers.conf:


BBLAYERS ?= " \
  ${BSPDIR}/meta \
  ${BSPDIR}/meta-poky \
  ${BSPDIR}/meta-openembedded/meta-oe \
  ${BSPDIR}/meta-openembedded/meta-python \
  ${BSPDIR}/meta-openembedded/meta-networking \
  ${BSPDIR}/meta-openembedded/meta-webserver \
  ${BSPDIR}/meta-freescale \
  ${BSPDIR}/meta-freescale-3rdparty \
  ${BSPDIR}/meta-freescale-distro \
  ${BSPDIR}/meta-toradex-bsp-common \
  ${BSPDIR}/meta-toradex-nxp \
  ${BSPDIR}/meta-swupdate \
  ${BSPDIR}/meta-qt5 \
"


qtbase configuration log:
https://pastebin.com/GLv04BAZ

qtbase compile log (with errors):
https://pastebin.com/JxnRx6nT

Here is the env variables (outptut of bitbake -e qtbase):
http://www.pastebin.xyz/p?q=eEIyNW8

