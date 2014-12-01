Return-Path: <aguirre.nicolas@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 800E1722DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 08:34:14 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hl2so8420647igb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 00:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=gKhkB6o7a2BNUF/jTRdBiLIcFgHV52+P6WNwx2U+HL0=;
	b=adQ/8zRZ0U5NbFVi9FxilvFRagu5MEMUnQXHQ9M8zJsnWidLZtv0nbNr53WPuT5kYN
	iZw1zdgiEjzOq9v+MpdMHb/td8uARVlFupX3KJI2fJts0qoPDwFYYyPieEmsDoBQhayZ
	ISbfKpVNr6aU2Cms7MQcMOxre41eGbhDDK0/2YMZv3vRoS4dzry8bR5+lr/dKIohFqwQ
	OVSI7Pz/eAouG4snoAGrpl33KfwSKYxRByHGbVhtOpa5HBk6DlIpHVMZjAdR27hhmWck
	wiy3U2aFCCqceiMmbpwm7lj0/zm8pLeMfI3DMvGVJtBz50B9LM2tbpL5psp84OvUUElH
	u6hg==
X-Received: by 10.107.16.130 with SMTP id 2mr49385704ioq.81.1417422854283;
	Mon, 01 Dec 2014 00:34:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.1.197 with HTTP; Mon, 1 Dec 2014 00:33:54 -0800 (PST)
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
Date: Mon, 1 Dec 2014 09:33:54 +0100
Message-ID: <CAHTvVMceh=5-LomPqyYSCGh9s0wH6MrMfm=Eik93XX0qV+rAVw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] QT5, OpenGL and wayland only DISTRO
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 08:34:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm trying to build an Wayland only based image with Dizzy for x86
hardware, atom based, with i945 chipset.

DISTRO_FEATURES = "alsa ext2 largefile usbhost wifi xattr zeroconf
wayland ${DISTRO_FEATURES_LIBC} systemd opengl ipv4 ipv6 pci nfs"

First, i need to add mesa-megadriver in IMAGE_INSTALL, otherwise, the
wayland drm backend didn't load and only fbdev was working. I don't
know the difference between them. But adding mesa-megadriver added
/usr/lib/dri/i915_dri.so in the image and now weston is happy.

During qtbase configure phase, i get an error "cannot find -lGL"

OpenGL auto-detection... ()
i586-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
--sysroot=/home/ubuntu/oe/
intel-core2-32/tmp-glibc/sysroots/intel-core2-32
-c -pipe  -O2 -pipe -g -feliminate-unused-debug-types
-fvisibility-inlines-hidden -O2 -Wall -W -fPIE
-I../../../../qtbase-opensource-src-5.3.2/mkspecs/linux-oe-g++
-I../../../../qtbase-opensource-src-5.3.2/config.tests/unix/opengldesktop
-I. -o opengldesktop.o
../../../../qtbase-opensource-src-5.3.2/config.tests/unix/opengldesktop/opengldesktop.cpp
i586-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
--sysroot=/home/ubuntu/oe/intel-core2-32/tmp-glibc/sysroots/intel-core2-32
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-O1 -o opengldesktop
opengldesktop.o   -lGL
/home/ubuntu/oe/intel-core2-32/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.9.1/ld:
cannot find -lGL
collect2: error: ld returned 1 exit status
make: *** [opengldesktop] Error 1
OpenGL disabled.
The OpenGL functionality test failed!
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_OPENGL, QMAKE_LIBDIR_OPENGL and QMAKE_LIBS_OPENGL in
 /home/ubuntu/oe/intel-core2-32/tmp-glibc/work/core2-32-oe-linux/qtbase/5.3.2-r0/qtbase-opensource-src-5.3.2/mkspecs/linux-oe-g++.
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_configure (log file is located at
/home/ubuntu/oe/intel-core2-32/tmp-glibc/work/core2-32-oe-linux/qtbase/5.3.2-r0/temp/log.do_configure.23186)

I created qtbase_%.bbappend with the following content to force the gles flavor.

PACKAGECONFIG_GL = "gles"

The build is now ok, but when i launch QTCinematicExperience for
example, i get horribles performances, Near from 1FPS !

Weston is launched with DRM backend, and i export QT_QPA_PLATFORM=wayland-egl.

Did i missed something ?

Regards,
Nicolas


-- 
Nicolas Aguirre
Mail: aguirre.nicolas@gmail.com
Web: http://www.calaos.fr
Blog: http://dev.enlightenment.fr/~captainigloo/

