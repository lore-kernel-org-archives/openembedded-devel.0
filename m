Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E858DC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.51049.1643733317429040697
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAE64113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96D4B3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/14] libjs-jquery: remove
Date: Tue,  1 Feb 2022 16:35:07 +0000
Message-Id: <20220201163507.1320861-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95199

This is a very old release of jQuery, 1.7.2 was released in 2012.

As nothing depends on this, remove it.  If someone needs a jQuery recipe
they can add a new recipe for a supported version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../libjs/libjs-jquery_1.7.2.bb               | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e14ca405ca..7f75f30a36 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -823,7 +823,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D"\
     libusbgx \
     lockdev \
     logwarn \
-    libjs-jquery \
     libjs-sizzle \
     liblinebreak \
     mailcap \
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb b/meta-o=
e/recipes-support/libjs/libjs-jquery_1.7.2.bb
deleted file mode 100644
index 4dc2e8041c..0000000000
--- a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "JavaScript library for dynamic web applications"
-HOMEPAGE =3D "https://jquery.com/"
-LICENSE =3D "MIT | BSD | GPL-2"
-LIC_FILES_CHKSUM =3D "file://usr/share/doc/libjs-jquery/copyright;md5=3D=
5d1ec6f95e0a91d38e2f71de93ddb00e"
-
-SRC_URI =3D "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BP=
N}_${PV}+debian-1ubuntu1~ubuntu12.04.1_all.deb;subdir=3D${BP}"
-SRC_URI[md5sum] =3D "fa511ab67f6e960c5b6d39a4d665e47f"
-SRC_URI[sha256sum] =3D "190ca18a71e35c8ab2ba73fe5be3c7cc601fe20b45709d80=
1110818f1b602cc1"
-
-JQUERYDIR =3D "${datadir}/javascript/jquery"
-JQUERYDOCDIR =3D "${docdir}/libjs-jquery"
-
-do_install() {
-    install -d -m 0755 ${D}${JQUERYDIR}
-    install -m 0644 ${S}${JQUERYDIR}/jquery.js ${D}${JQUERYDIR}/
-    install -m 0644 ${S}${JQUERYDIR}/jquery.min.js ${D}${JQUERYDIR}/
-
-    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.lite.js
-    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.pack.js
-
-    install -d -m 0644 ${D}${JQUERYDOCDIR}
-    install -m 0644 ${S}${JQUERYDOCDIR}/copyright ${D}${JQUERYDOCDIR}/
-}
-
-FILES:${PN} =3D "/usr/share/javascript/jquery"
--=20
2.25.1


