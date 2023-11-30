Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A35BC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:31:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.70185.1701343858946058654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B161042;
	Thu, 30 Nov 2023 03:31:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABAF63F6C4;
	Thu, 30 Nov 2023 03:30:57 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-validators: add new recipe
Date: Thu, 30 Nov 2023 11:30:54 +0000
Message-Id: <20231130113054.2687686-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 11:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107171

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-validators_0.22.0.bb                | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-validator=
s_0.22.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.22.=
0.bb b/meta-python/recipes-devtools/python/python3-validators_0.22.0.bb
new file mode 100644
index 0000000000..1da7ee4a04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-validators_0.22.0.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Python Data Validation for Humans"
+HOMEPAGE =3D "https://python-validators.github.io/validators"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf28bd09a60e145c3171c531b9e6=
77d"
+SRC_URI[sha256sum] =3D "77b2689b172eeeb600d9605ab86194641670cdb73b60afd5=
77142a9397873370"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


