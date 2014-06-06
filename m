Return-Path: <yaoxp@cn.fujitsu.com>
X-Greylist: delayed 617 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Jun 2014 10:29:17 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2218460D67
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 10:29:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,988,1392134400"; d="scan'208";a="31562694"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2014 18:16:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s56AIxKk026206
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jun 2014 18:19:00 +0800
Received: from FEDORA20.fnst.cn.fujitsu.com (10.167.226.101) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 6 Jun 2014 18:19:06 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jun 2014 06:18:48 -0400
Message-ID: <1402049928-10313-2-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
X-Originating-IP: [10.167.226.101]
Subject: [meta-oe][PATCH] lvm2.inc: EXTRA_OECONF is been overwrited.
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
X-List-Received-Date: Fri, 06 Jun 2014 10:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EXTRA_OECONF has been assigned before =E2=80=98EXTRA_OECONF =3D "--with-usr=
libdir=3D${libdir}"=E2=80=99.
collaps the 2 lines into a single EXTRA_OECONF.

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-suppor=
t/lvm2/lvm2.inc
index c6a9ec0..5f77fe6 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -28,6 +28,7 @@ EXTRA_OECONF =3D "--with-user=3D \
                 --enable-pkgconfig \
                 --enable-dmeventd \
                 --with-udev-prefix=3D \
+                --with-usrlibdir=3D${libdir} \
 "
=20
 PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinu=
x', '', d)}"
@@ -47,4 +48,3 @@ FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_lib=
dir}/udev"
 FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
=20
 RDEPENDS_${PN} =3D "bash"
-EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"
--=20
1.8.4.2


