Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1Sx0xq-0000hQ-1i
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 21:21:42 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q72J6ZIR015457
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2012 14:06:35 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q72J6ZOC031232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2012 14:06:35 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 2 Aug 2012 14:06:35 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH] ltrace: Fix make error
Thread-Index: AQHNcOGjj8EgkN4J40KIv8rZIb1PyZdG4b9w
Date: Thu, 2 Aug 2012 19:06:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2801F0@DFLE30.ent.ti.com>
References: <1343934541-12253-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1343934541-12253-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-oe][PATCH] ltrace: Fix make error
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
X-List-Received-Date: Thu, 02 Aug 2012 19:21:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please pull this patch into the denzil branch also.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Thursday, August 02, 2012 2:09 PM
To: openembedded-devel@lists.openembedded.org
Cc: Cooper Jr., Franklin
Subject: [oe][meta-oe][PATCH] ltrace: Fix make error

* Fixes the make: invalid option -- '/' error

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_0.5.3.bb
index 109bf82..9fd423f 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
@@ -5,7 +5,7 @@ DEPENDS =3D "elfutils binutils"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a"
=20
-PR =3D "r4"
+PR =3D "r5"
=20
 # ltrace is not ported to sh3/sh4 targets at this time
 COMPATIBLE_TARGET_SYS =3D "(?!sh[34])"
@@ -52,7 +52,7 @@ do_compile() {
 		sparc*)   LTRACE_ARCH=3Dsparc ;;
 		x86_64*)  LTRACE_ARCH=3Dx86_64 ;;
 	esac
-	oe_runmake LDFLAGS=3D${TARGET_LDFLAGS} LIBS=3D"-lsupc++ -liberty -Wl,-Bst=
atic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=3D${LTRACE_ARCH}
+	oe_runmake LDFLAGS=3D"${TARGET_LDFLAGS}" LIBS=3D"-lsupc++ -liberty -Wl,-B=
static -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=3D${LTRACE_ARCH}
 }
=20
 do_install() {
--=20
1.7.0.4



