Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6BBC4332F
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:42:46 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.43304.1636368165518468228
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36832 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mk26p-0005f5-Kc; Mon, 08 Nov 2021 12:42:40 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pytz-deprecation-shim: Add recipe
Date: Mon,  8 Nov 2021 12:42:33 +0200
Message-Id: <20211108104235.24727-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108104235.24727-1-leon.anavi@konsulko.com>
References: <20211108104235.24727-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 10:42:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93872

Add release 0.1.0.post0:

- Fixes the project_urls metadata to point to the correct bug
  tracker and documentation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-pytz-deprecation-shim_0.1.0.post0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
new file mode 100644
index 0000000000..76487c830f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Shims to help you safely remove pytz"
+HOMEPAGE = "https://github.com/pganssle/pytz-deprecation-shim"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48"
+
+SRC_URI[sha256sum] = "af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129610d85b87445a59d"
+
+PYPI_PACKAGE = "pytz_deprecation_shim"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/94/f0/909f94fea74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV}.tar.gz"
+
+inherit pypi setuptools3
+
+do_compile:prepend() {
+	echo "from setuptools import setup" > ${S}/setup.py
+	echo "setup()" >> ${S}/setup.py
+}
-- 
2.17.1


