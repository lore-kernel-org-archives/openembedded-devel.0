Return-Path: <gerharddeclercq@outlook.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Dec 2015 12:50:47 UTC
Received: from BLU004-OMC4S30.hotmail.com (blu004-omc4s30.hotmail.com
	[65.55.111.169])
	by mail.openembedded.org (Postfix) with ESMTP id ECAE46FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:50:47 +0000 (UTC)
Received: from BLU436-SMTP207 ([65.55.111.135]) by BLU004-OMC4S30.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 15 Dec 2015 04:45:47 -0800
X-TMN: [rMfcRd8VlCOPI2o3d1s3/rdhSkRDwy5J2s1zomikn8M=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <BLU436-SMTP207C9BA27436C22DD6BBA47B8EE0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 14:45:40 +0200
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Dec 2015 12:45:45.0412 (UTC)
	FILETIME=[84140040:01D13736]
Subject: Build Qt5 with X11 backend for EGLFS
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
X-List-Received-Date: Tue, 15 Dec 2015 12:50:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I am trying to build Qt5 on Fido for my Tegra 3 based device that only 
provides hardware acceleration through X11 but does have EGL. I have been 
using the XCB backend but have run into tearing issues and have found that 
everyone regards switching to EGLFS as the best solution. 

I initially thought this was not an option but have recently found that one 
can use EGLFS with an X11 backend. To do so I created a qtbase_git.bbappend in 
my layer and filled it with the following:

PACKAGECONFIG[gles2] = "-opengl es2 -xcb -eglfs -no-kms,,virtual/libgles2 
virtual/egl"

do_configure_prepend() {
	cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
EGLFS_PLATFORM_HOOKS_SOURCES = \$\$PWD/qeglfshooks_x11.cpp
EOF
	# copy the hook in the mkspecs directory OE is using
	cp ${S}/src/plugins/platforms/eglfs/qeglfshooks_x11.cpp ${S}/mkspecs/linux-
oe-g++/
}

Unfortunately when I try to compile Qt, I get hit with a lot of errors 
relating to xcb references like:

| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:159: error: undefined reference 
to 'xcb_wait_for_event'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:219: error: undefined reference 
to 'XOpenDisplay'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:223: error: undefined reference 
to 'XSetEventQueueOwner'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:224: error: undefined reference 
to 'XGetXCBConnection'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:228: error: undefined reference 
to 'xcb_get_setup'

Those aren't all the errors but they all seem to point to the fact that xcb (I 
guess libxcb) is not being linked to Qt. I thought adding "-xcb" to the 
packageconfig might have helped but I did not seem to do so. What I can I do to 
try and fix this?

PS. Considering it is possible to build the proper XCB backend I guess the 
files must exist somewhere... 

-- 
Regards,
Gerhard de Clercq

