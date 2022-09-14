Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C79C6FA8E
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:58:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.5359.1663156727226624611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 04:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=m9z4jwpJ;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=V0yABUIKOmmXG8/HR8HE7dM3MT735iRiEFGJFe03mJo=; b=m9z4jwpJuNaRBA86OiWb0KzlkE
	KcwIPxhr36b6XRSS8RDFx48MFM82sSTVVXr8Zdy3yZ5Ip/iGg+Ox3vBg/bkFgXjny+yW7IdnQJ5iL
	rAGRbkxN2QKEDfdMpVD/cq2mxPNzqKMQZtMMUuBLXK386reIVyeiHMlRweulPXvQrIUvadkwgJhGG
	txGxGHO8F4jm5/9U1rfjVbxkSlFkNJv2Tn5HXsZbesyQGO7EsKJ54ehnyta364yu/ULotD/0QPvbh
	7JGlrGXDXhcdrt7f5wr1UGwlR2nYTeO6MhnP5A1nf3cupz8DQYVdgus7NHimlnY8SjZjiVhaJu+95
	84Xzf5Cg==;
Received: from lan.nucleusys.com ([92.247.61.126]:58898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYR2S-0002R1-0q;
	Wed, 14 Sep 2022 14:58:46 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pydantic: Upgrade 1.9.1 -> 1.10.2
Date: Wed, 14 Sep 2022 14:58:31 +0300
Message-Id: <20220914115833.177477-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914115833.177477-1-leon.anavi@konsulko.com>
References: <20220914115833.177477-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 11:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98792

Upgrade to release 1.10.2:

- Revert Change: Revert percent encoding of URL parts
- Prevent long (length > 4_300) strings/bytes as input to int
  fields, see python/cpython#95778 and CVE-2020-10735
- fix: dataclass wrapper was not always called
- Use tomllib on Python 3.11 when parsing mypy configuration
- Basic fix of GenericModel cache to detect order of arguments in
  Union models
- Fix mypy plugin when using bare types like list and dict as
  default_factory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic_1.10.2.bb         | 20 +++++++++++++++++++
 .../python/python3-pydantic_1.9.1.bb          | 11 ----------
 2 files changed, 20 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb
new file mode 100644
index 000000000..16bb1f6ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Data validation and settings management using Python type hinting"
+HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "91b8e218852ef6007c2b98cd861601c6a09f1aa32bbbb74fab5b1c33d4a1e410"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-typing-extensions \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-image \
+    ${PYTHON_PN}-logging \
+"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.9.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.9.1.bb
deleted file mode 100644
index 1d113c9c5..000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.9.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Data validation and settings management using Python type hinting"
-HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
-RDEPENDS:${PN} += "\
-    python3-typing-extensions \
-"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "1ed987c3ff29fff7fd8c3ea3a3ea877ad310aae2ef9889a119e22d3f2db0691a"
-- 
2.30.2


