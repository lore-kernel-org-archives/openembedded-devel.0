Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDC7C433FE
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 11:39:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.31218.1643629192725520592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jan 2022 03:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=RBYmpi8T;
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
	bh=AzEMr3Tdkz+kZW1AhRl7HvpL2Ko3IPTnFcYgHSf4E8o=; b=RBYmpi8T5EC2h3dmZsTUmC8a0g
	EpxGFUbA7hufXkIksQkp+myTZOdbP7t+En1aQeeE+1oMn0LKAHCip9mQXMoadCEvbd6nYWJdziqi9
	4DKRdiaDEQgp+QOCCd29QtbYDZ4FD5ePV8zdk95SVk/qTHbE4liw7u7MqtCIpd5HiJbvalYKytiFX
	x+iv/xtRAl21mYEtaU99T1uGWAfPtymVRPRMowKz/vbG7P94Q2yL6Ps+FQcqzG2exVb0c2clX5tKN
	iietGJoILXZBA+yCB9se2vINgf+V+/62eNfrZbS+d39VciTirgw2EA89J2vz9jwYblKqdnldbYw1i
	81Rj3/DQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:32774 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nEV30-000ATm-JR; Mon, 31 Jan 2022 13:39:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-ansi2html: Upgrade 1.6.0 -> 1.7.0
Date: Mon, 31 Jan 2022 13:39:41 +0200
Message-Id: <20220131113942.2417929-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jan 2022 11:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95181

Upgrade to release 1.7.0:

- Replace recommendation of using system packages with pip3
- Add truecolor support
- Generate documentation with Sphinx and use Read the Docs
- Adds support for OSC hyperlink sequences
- Add test coverage
- Replace pkg_resources with importlib.metadata
- Fix including of CHANGELOG.rst
- Update linting dependencies
- Upgrade the build process
- Add type hinting
- Update CI badges in readme
- Bump setuptools-scm version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-ansi2html_1.6.0.bb         | 13 ----------
 .../python/python3-ansi2html_1.7.0.bb         | 25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
deleted file mode 100644
index 0b6ba9ff7..000000000
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.6.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRPTION = "ansi2html - Convert text with ANSI color codes to HTML or to LaTeX"
-HOMEPAGE = "https://github.com/ralphbean/ansi2html"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3000208d539ec061b899bce1d9ce9404"
-LICENSE = "GPLv3"
-
-PYPI_PACKAGE = "ansi2html"
-
-SRC_URI[sha256sum] = "0f124ea7efcf3f24f1f9398e527e688c9ae6eab26b0b84e1299ef7f94d92c596"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
-RDEPENDS:${PN} = "${PYTHON_PN}-six"
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
new file mode 100644
index 000000000..df50bc7a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
@@ -0,0 +1,25 @@
+DESCRPTION = "ansi2html - Convert text with ANSI color codes to HTML or to LaTeX"
+HOMEPAGE = "https://github.com/ralphbean/ansi2html"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3000208d539ec061b899bce1d9ce9404"
+LICENSE = "GPLv3"
+
+PYPI_PACKAGE = "ansi2html"
+
+SRC_URI[sha256sum] = "69316be8c68ac91c5582d397c2890e69c993cc7cda52062ac7e45fcb660d8edc"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+	${PYTHON_PN}-setuptools-scm-native \
+	${PYTHON_PN}-toml-native \
+"
+
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-six \
+	${PYTHON_PN}-compression \
+"
+
+do_compile:prepend() {
+	echo "from setuptools import setup" > ${S}/setup.py
+	echo "setup()" >> ${S}/setup.py
+}
-- 
2.30.2


