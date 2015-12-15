Return-Path: <jbriance@cisco.com>
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
	by mail.openembedded.org (Postfix) with ESMTP id F0A6B6E665
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3771; q=dns/txt; s=iport;
	t=1450186020; x=1451395620;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=zyQOKiy9yeXi3+W9oZYJPeS6seOnEM5Cv0RKpRSMYn4=;
	b=hnaNuILl804hALdmUqz6/CLk0v7r4rTG5+kgmwUTfEewVRKj+ibQyk+K
	+cN2AefhTEkcD1/218kyHE6fZWCp9HHOnXbTtZrGRYbVHJ5gmtIXVogXX
	4HVGbhn3zG6eJzz/xYM7Pqo8B0OmBtHPmjbpRNU6C3jOQdFI/YZjcWz// U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AkAgBFFHBW/5ldJa1egzpSbQa9UgENg?=
	=?us-ascii?q?WMXCoUiSgKBPTgUAQEBAQEBAX8LhDQBAQEEAQEBaxcEAgEIEQQBASgHJwEKFAk?=
	=?us-ascii?q?IAgQTCBOIFA69ZwEBAQEBAQEDAQEBAQEBAQEBGoZWhH2EYYRfBY1viQ0BhTiFI?=
	=?us-ascii?q?oJmgWNJlwGDcwEfAQFCghEdgVZyg2yBCAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.20,432,1444694400"; d="scan'208";a="218456579"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
	by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Dec 2015 13:26:59 +0000
Received: from XCH-ALN-006.cisco.com (xch-aln-006.cisco.com [173.36.7.16])
	by rcdn-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id tBFDQxci006297
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 13:26:59 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-006.cisco.com
	(173.36.7.16) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 15 Dec 2015 07:26:58 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.009;
	Tue, 15 Dec 2015 07:26:57 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Build Qt5 with X11 backend for EGLFS
Thread-Index: AQHRNzc+YC01uKcFKkK83SpNJVuPWZ7MCNOg
Date: Tue, 15 Dec 2015 13:26:57 +0000
Message-ID: <e2e7c19968164da7ac5990857dc0fade@XCH-ALN-008.cisco.com>
References: <BLU436-SMTP207C9BA27436C22DD6BBA47B8EE0@phx.gbl>
In-Reply-To: <BLU436-SMTP207C9BA27436C22DD6BBA47B8EE0@phx.gbl>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.60.62.150]
MIME-Version: 1.0
Subject: Re: Build Qt5 with X11 backend for EGLFS
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
X-List-Received-Date: Tue, 15 Dec 2015 13:26:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

From what I see, you just need to define EGLFS_PLATFORM_HOOKS_LIBS.

Your do_configure_prepend() should look like this:

do_configure_prepend() {
	cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
EGLFS_PLATFORM_HOOKS_SOURCES =3D \$\$PWD/qeglfshooks_x11.cpp
EGLFS_PLATFORM_HOOKS_LIBS =3D -lxcb
EOF
	# copy the hook in the mkspecs directory OE is using
	cp ${S}/src/plugins/platforms/eglfs/qeglfshooks_x11.cpp ${S}/mkspecs/linux=
-
oe-g++/
}

Of course, you can add other xcb libraries if needed (-lxcb-shm, -lxcb-keys=
yms, etc ...)

Julien

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Gerhard de Clercq
Sent: mardi 15 d=E9cembre 2015 13:46
To: openembedded-devel@lists.openembedded.org
Subject: [oe] Build Qt5 with X11 backend for EGLFS

Hi,

I am trying to build Qt5 on Fido for my Tegra 3 based device that only=20
provides hardware acceleration through X11 but does have EGL. I have been=20
using the XCB backend but have run into tearing issues and have found that=
=20
everyone regards switching to EGLFS as the best solution.=20

I initially thought this was not an option but have recently found that one=
=20
can use EGLFS with an X11 backend. To do so I created a qtbase_git.bbappend=
 in=20
my layer and filled it with the following:

PACKAGECONFIG[gles2] =3D "-opengl es2 -xcb -eglfs -no-kms,,virtual/libgles2=
=20
virtual/egl"

do_configure_prepend() {
	cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
EGLFS_PLATFORM_HOOKS_SOURCES =3D \$\$PWD/qeglfshooks_x11.cpp
EOF
	# copy the hook in the mkspecs directory OE is using
	cp ${S}/src/plugins/platforms/eglfs/qeglfshooks_x11.cpp ${S}/mkspecs/linux=
-
oe-g++/
}

Unfortunately when I try to compile Qt, I get hit with a lot of errors=20
relating to xcb references like:

| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:159: error: undefined refer=
ence=20
to 'xcb_wait_for_event'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:219: error: undefined refer=
ence=20
to 'XOpenDisplay'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:223: error: undefined refer=
ence=20
to 'XSetEventQueueOwner'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:224: error: undefined refer=
ence=20
to 'XGetXCBConnection'
| /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp-neon-
angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:228: error: undefined refer=
ence=20
to 'xcb_get_setup'

Those aren't all the errors but they all seem to point to the fact that xcb=
 (I=20
guess libxcb) is not being linked to Qt. I thought adding "-xcb" to the=20
packageconfig might have helped but I did not seem to do so. What I can I d=
o to=20
try and fix this?

PS. Considering it is possible to build the proper XCB backend I guess the=
=20
files must exist somewhere...=20

--=20
Regards,
Gerhard de Clercq
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

