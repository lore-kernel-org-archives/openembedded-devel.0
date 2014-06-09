Return-Path: <yaoxp@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB6165F99
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 01:01:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,1000,1392134400"; d="scan'208";a="31627063"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jun 2014 08:58:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s5911Igv019732
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jun 2014 09:01:18 +0800
Received: from FEDORA20.fnst.cn.fujitsu.com (10.167.226.101) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 9 Jun 2014 09:01:19 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Jun 2014 08:59:53 +0800
Message-ID: <1402275593-19156-1-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
X-Originating-IP: [10.167.226.101]
Subject: [meta-oe][PATCH v2] lvm2: don't overrwrite EXTRA_OECONF
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
X-List-Received-Date: Mon, 09 Jun 2014 01:01:20 -0000
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


