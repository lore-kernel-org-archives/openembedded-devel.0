Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6650BC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:02:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.19.1652716926445729070
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 09:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E0701063;
	Mon, 16 May 2022 09:02:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D02213F73D;
	Mon, 16 May 2022 09:02:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] Revert "python3-cbor2: upgrade 5.4.2 -> 5.4.3"
Date: Mon, 16 May 2022 17:02:02 +0100
Message-Id: <20220516160202.2721086-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 16:02:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97137

This build is broken and doesn't generate any files: it is missing a
DEPENDS on python3-setuptools-scm-native, and our setuptools recipe
isn't new enough to build this version.

This reverts commit 1e050deca1977906b510516cb2d48f65cfc3056f.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/{python3-cbor2_5.4.3.bb =3D> python3-cbor2_5.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.3.bb =3D> =
python3-cbor2_5.4.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index 0890b99c08..cafc32ad10 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -4,7 +4,7 @@ DEPENDS +=3D"${PYTHON_PN}-setuptools-scm-native"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
=20
-SRC_URI[sha256sum] =3D "62b863c5ee6ced4032afe948f3c1484f375550995d3b8498=
145237fe28e546c2"
+SRC_URI[sha256sum] =3D "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664=
c69e639135e6b3b8"
=20
 inherit pypi python_setuptools_build_meta ptest
=20
--=20
2.25.1


