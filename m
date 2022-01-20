Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2ECC43219
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 11:40:41 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.10584.1642678839768090944
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 03:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=tHMu6Kis;
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
	bh=2IKuoIEzSJr6ruiPg1jetnr38aZP5Axvmt/UozXo3gY=; b=tHMu6KisO/fIJojyGRr38l5kfp
	5AioKmxcGUUZiTCxmo9viC62LXQu5DpB/c0UaQ8VbCMnhCVQJHwsaIDMfv260qzD2KOfIuV7dwwHb
	nRBqPntFERNcYHDNAKJKTWiEHNfkUt2brSKZNEFSKr5ateGtUYsGmuAYnqFqJdpsRv++jECN4GsAy
	XljPAqn61TGQbvXotUqxidTabtphJLtERBsvKby/jfh9IrwvcQEzG+Jf6Rh5mueP0gFmUBMt1L/oT
	ZPihmgj/w/C1+WLS2Wny9XhrpKlKCOrlgqRoDpxFnm75GqI30lnTqeGqE0YQGyM37YwT3maF7KiPT
	HGdmNt/Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:48770 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAVnv-00098G-L3; Thu, 20 Jan 2022 13:40:37 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-twine: Upgrade 3.4.1 -> 3.7.1
Date: Thu, 20 Jan 2022 13:40:27 +0200
Message-Id: <20220120114027.1857045-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120114027.1857045-1-leon.anavi@konsulko.com>
References: <20220120114027.1857045-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 11:40:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94957

Upgrade to release 3.7.1:

- Fix broken link to packaging tutorial
- Add support for core metadata version 2.2, defined in PEP 643.
- Add support for Python 3.10
- Show more helpful messages for invalid passwords
- Allow the --skip-existing option to work with GCP Artifact
  Registry
- Add a helpful error message when an upload fails due to missing
  a trailing slash in the URL
- Generalize --verbose suggestion when an upload fails

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-twine_3.4.1.bb             | 14 -----------
 .../python/python3-twine_3.7.1.bb             | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twine_3.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.4.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
deleted file mode 100644
index 111366dba..000000000
--- a/meta-python/recipes-devtools/python/python3-twine_3.4.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Utilities for interacting with PyPI"
-HOMEPAGE = "https://twine.readthedocs.io/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
-
-SRC_URI[sha256sum] = "a56c985264b991dc8a8f4234eb80c5af87fa8080d0c224ad8f2cd05a2c22e83b"
-
-inherit pypi setuptools3
-
-DEPENDS += "\
-    ${PYTHON_PN}-setuptools-scm-native \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-twine_3.7.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.7.1.bb
new file mode 100644
index 000000000..bcc881e44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twine_3.7.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Utilities for interacting with PyPI"
+HOMEPAGE = "https://twine.readthedocs.io/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
+
+SRC_URI[sha256sum] = "28460a3db6b4532bde6a5db6755cf2dce6c5020bada8a641bb2c5c7a9b1f35b8"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+	${PYTHON_PN}-setuptools-scm-native \
+"
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-importlib-metadata \
+"
+
+do_compile:prepend() {
+	echo "from setuptools import setup" > ${S}/setup.py
+	echo "setup()" >> ${S}/setup.py
+}
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


