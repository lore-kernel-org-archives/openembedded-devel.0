Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C881F71BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 21:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8999F209AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 21:57:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id F5Bid1KAI4X0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 21:57:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F6DB20059
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 21:57:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F04181632CD; Mon, 26 Feb 2018 16:57:18 -0500 (EST)
Date: Mon, 26 Feb 2018 16:57:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180226215718.GK2786@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] qtwebengine/chromium/v8 requires lib32 version of host C++ headers (libc++-dev:i386)
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
X-List-Received-Date: Mon, 26 Feb 2018 21:57:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've got this error below on one of my build machines, and on close=20
inspection, it looks like qtwebengine/chromium/v8 requires host side C++=20
headers in 32-bit besides normal 64-bit version, i.e. libc++-dev:i386 or=20
lib32stdc++-dev.

How can we check for this and/or document this requirement?

Logs (notice hosttools/g++ and -m32):

FAILED: v8_snapshot/obj/v8/mkpeephole/bytecodes.o=20
=2E../tmp-glibc/hosttools/g++ -MMD -MF v8_snapshot/obj/v8/mkpeephole/byteco=
des.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=3D1 -DUSE_NSS_CERTS=
=3D1 -DUSE_OZONE=3D1 -DNO_TCMALLOC -DDISABLE_NACL -DENABLE_TASK_MANAGER=3D1=
 -DENABLE_THEMES=3D1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSI=
NG_DB_LOCAL -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_F=
ILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNDEBUG -DN=
VALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -DV8_I18N_SUPPORT -DV8_TARGET_AR=
CH_ARM -DCAN_USE_ARMV7_INSTRUCTIONS -DCAN_USE_VFP3_INSTRUCTIONS -DCAN_USE_V=
FP32DREGS -DCAN_USE_NEON -DUSE_EABI_HARDFLOAT=3D1 -Iv8_snapshot/gen -I../..=
/../../git/src/3rdparty/chromium -I../../../../git/src/3rdparty/chromium/v8=
/include -Iv8_snapshot/gen/v8/include -I../../../../git/src/3rdparty/chromi=
um/v8 -fno-strict-aliasing --param=3Dssp-buffer-size=3D4 -fstack-protector =
-funwind-tables -fPIC -pipe -pthread -m32 -msse2 -mfpmath=3Dsse -mmmx -g0 -=
fvisibility=3Dhidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-unused-parameter -O3 -fno-ident -fdata-s=
ections -ffunction-sections -fno-threadsafe-statics -fvisibility-inlines-hi=
dden -std=3Dgnu++11 -fno-delete-null-pointer-checks -fno-rtti -fno-exceptio=
ns -Wno-deprecated -Wno-narrowing -c ../../../../git/src/3rdparty/chromium/=
v8/src/interpreter/bytecodes.cc -o v8_snapshot/obj/v8/mkpeephole/bytecodes.o
In file included from ../../../../git/src/3rdparty/chromium/v8/src/interpre=
ter/bytecodes.h:8:0,
                 from ../../../../git/src/3rdparty/chromium/v8/src/interpre=
ter/bytecodes.cc:5:
/usr/include/c++/5/cstdint:38:28: fatal error: bits/c++config.h: No such fi=
le or directory
compilation terminated.

