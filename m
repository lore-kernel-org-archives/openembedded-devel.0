Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E990FC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:56:24 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.100816.1673348183955899753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 02:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=JftGYXIe;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SALp4Ts0Py/NNhsT6CVbV0csBhLxe7+icGs37LYANcU=; b=JftGYXIebaN++yTMzEnfomEyJj
	x3zEqcamLUWMC2uxQ1PcgVsgJkM/q7ii9b+0y4CZr3Sq+GmsAPQtU28zdz4kydtJlKIu5mDYMxsk9
	ICPVk6AoYsNq6Rt4kgXHnhjyfeYO2+aRRuwon8wdPtlJ66tDeFi6EQWXz97/FxiZ7HZ9Xgiiq/P8c
	W7/zUqJMXpll1pB9furhM7KRBveepTcAG2IVqFzA0kdS6AEuODkhQbgaZN2TxFoaZeWyJYeGmYuib
	zWsufKIRUjNjAQmOM/CvLg7p4lVR30GSMpD55PhWgRJD1PItJ4Yl/2wZVjWgtIR768wVFILReiNnP
	93l/9ZYQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:53480 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFCIm-0009km-5n;
	Tue, 10 Jan 2023 12:56:22 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-prettytable: Upgrade 3.4.1 -> 3.6.0
Date: Tue, 10 Jan 2023 12:56:08 +0200
Message-Id: <20230110105609.56178-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110105609.56178-1-leon.anavi@konsulko.com>
References: <20230110105609.56178-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 10:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100518

Upgrade to release 3.6.0:

- Updated pre-commit with mypy
- Test Python 3.12 pre-releases
- Fix to min_table_width parameter
- Widen tables with long titles

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-prettytable_3.4.1.bb => python3-prettytable_3.6.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.4.1.bb => python3-prettytable_3.6.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb
index c8b50f0b2..0c0692b14 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "7d7dd84d0b206f2daac4471a72f299d6907f34516064feb2838e333a4e2567bd"
+SRC_URI[sha256sum] = "2e0026af955b4ea67b22122f310b90eae890738c08cb0458693a49b6221530ac"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -16,13 +16,15 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
 UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
 
 BBCLASSEXTEND = "native nativesdk"
-inherit pypi ptest setuptools3
+inherit pypi ptest python_hatchling
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "\
+    ${PYTHON_PN}-hatch-vcs-native \
+"
 
 RDEPENDS:${PN} += " \
 	${PYTHON_PN}-math \
-- 
2.30.2


