Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1F7C25B0E
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:24:16 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.10498.1660310652480247610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rYyxiN6o;
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
	bh=mo3lj20A08kej73DKAe6Pyga9+MyZGjk3w5WhU+aQrI=; b=rYyxiN6ooggxulbyeTdJ3IrrGJ
	HflHmYFeorC0BPMEaSlmOKfkiOx5wjeANdAPTF5twafR/un0XULSr8gjSX9Nr8mcdBjkfAN+dNKyE
	aIFHHkvF+DEV+nDO62oMHOrqlsWT6fMCw0h9tKTgxJpbuyWRiJs3A7p1GNzt9Fn0StB3ksjFSiOfc
	QRZx5R6r2YViT94f4S/csXpKu/QJ5rXXQsu6qO55kHst2L3Itfg3NgDzi5h8P7xMzqIyV0Drrpsun
	4Ns3Xhzrf/8BRcWapns7qMaEXkPkKz+oAYWbk0VCbEP4td2/B5QUgmB00NQcnegMcsYRwAZhHpDTq
	yjfIE4FQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:37172 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oMUfF-000B58-Cr;
	Fri, 12 Aug 2022 16:24:12 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pyhamcrest: Upgrade 2.0.3 -> 2.0.4
Date: Fri, 12 Aug 2022 16:23:53 +0300
Message-Id: <20220812132354.1588599-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220812132354.1588599-1-leon.anavi@konsulko.com>
References: <20220812132354.1588599-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 13:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98215

Upgrade to release 2.0.4:

- has_properties now returns Matcher[Any] type, which addresses
  type checking errors when nested as a matcher.
- Added Python 3.11 testing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...yhamcrest_2.0.3.bb => python3-pyhamcrest_2.0.4.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyhamcrest_2.0.3.bb => python3-pyhamcrest_2.0.4.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
index 5b06e52aa..b1122e089 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.0.4.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://github.com/hamcrest/PyHamcrest"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=79391bf1501c898472d043f36e960612"
 
-PYPI_PACKAGE = "PyHamcrest"
+#PYPI_PACKAGE = "PyHamcrest"
 
-SRC_URI[sha256sum] = "dfb19cf6d71743e086fbb761ed7faea5aacbc8ec10c17a08b93ecde39192a3db"
+SRC_URI[sha256sum] = "b5d9ce6b977696286cf232ce2adf8969b4d0b045975b0936ac9005e84e67e9c1"
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "${PYTHON_PN}-six"
+DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-numbers \
+"
-- 
2.30.2


