Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D622CC4332F
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.2713.1665136024110850347
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 02:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LvRSXHry;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9JxFk7134DAbntroVUqjlr//alAsEK0M5Z7e+kIZwgo=; b=LvRSXHryKvhemJCNkLcwVIXB38
	W/cV8ZxzYJ+gpEQIPBnbVXkMp2N49/XELqw48DwidTs2tZjpYr7SMgGN4hwB+gabO3KzBfrVP+Xn9
	Wd0Nhdac5xgjIz4g9i9HFySRf6eNQuPF763cMBRpxPQehKhSKe5ZLQZrX9OUtQjp1r3PcauY+oMvn
	Tu5q/h2Vx7+uR3phJwGUFUI9YkSy+8rz9tR9t4aVI1d9Pnbykw3eMYC4G8s0FNDqDrO12zRrBz5vn
	w2JujKEvwh42n4VXFTbS0kX1Vp8C48qHoG2oIl3LdKOZKIVxfOsbWethR7xr4bBXwTF2b8u7T3ax6
	XIv+SApA==;
Received: from lan.nucleusys.com ([92.247.61.126]:59576 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ogjwd-0008m2-M1;
	Fri, 07 Oct 2022 12:47:01 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-tabulate: Upgrade 0.8.10 -> 0.9.0
Date: Fri,  7 Oct 2022 12:46:48 +0300
Message-Id: <20221007094649.3896430-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Oct 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99085

Upgrade to release 0.9.0:

- Migrate to pyproject.toml project layout (PEP 621).
- New output formats: `asciidoc`, various `*grid` and `*outline`
  formats.
- New output features: vertical row alignment, separating lines.
- New input format: list of dataclasses (Python 3.7 or later).
- Support infinite iterables as row indices.
- Improve column width options.
- Improve support for ANSI escape sequences and document the
  behavior.
- Various bug fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-tabulate_0.8.10.bb         |  8 -------
 .../python/python3-tabulate_0.9.0.bb          | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
deleted file mode 100644
index 222e6e7bb..000000000
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.8.10.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Pretty-print tabular data"
-HOMEPAGE = "https://github.com/astanin/python-tabulate"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ad1430c0c4824ec6a5dbb9754b011d7"
-
-SRC_URI[sha256sum] = "6c57f3f3dd7ac2782770155f3adb2db0b1a269637e42f27599925e64b114f519"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
new file mode 100644
index 000000000..a25a1c66d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Pretty-print tabular data"
+HOMEPAGE = "https://github.com/astanin/python-tabulate"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ad1430c0c4824ec6a5dbb9754b011d7"
+
+SRC_URI[sha256sum] = "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+	${PYTHON_PN}-setuptools-scm-native \
+	${PYTHON_PN}-toml-native \
+"
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-html \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-io \
+	${PYTHON_PN}-math \
+	${PYTHON_PN}-profile \
+"
-- 
2.30.2


