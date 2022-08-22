Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FD8C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:18:45 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.18688.1661177916947939438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ZW5c2KRq;
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
	bh=DC1K0NPBYWV0ShnfgHWyxj6DvsP85ZxtwOJUMBbDYCA=; b=ZW5c2KRqNOcps7YpRSb8F0RqKP
	4gt5Ct8SVcpOrscc4Vq4mD1NakrVm1O+SRPvW2pvMKfHO2f2jY2lga4YHJOIOeD7k/qtgLmWtejFd
	t9/TO+Xo4kUU2X7PMLuV2PwOS1w7MIgQMOgWeZsrUvZF74cXSOh8OQ/1xUMOAppjsjZeWzcs+kH6+
	oJeR1CuhqYc8YAKw6jZI+xkgU3mFu2nZTYWzqv5N/EcfdrPCI26pIjNZCAeG3ztAJgNCqIEg+LgeT
	EUn5IQ5cSOFwRGttJoadbr7sfbiNBwGz8wVXtWXik1Wum647baq/xSucv1r0eCWmH2xuP7/uxLTVs
	bQB1Pb7A==;
Received: from lan.nucleusys.com ([92.247.61.126]:58168 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQ8G9-0007Y5-Ih;
	Mon, 22 Aug 2022 17:18:35 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-coverage: Upgrade 6.4.1 -> 6.4.4
Date: Mon, 22 Aug 2022 17:18:27 +0300
Message-Id: <20220822141828.2554564-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 14:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98366

Upgrade to release 6.4.4:

- Wheels are now provided for Python 3.11
- Fix a failure when combining data files if the file names
  contained glob-like patterns
- Fix a messaging failure when combining Windows data files on a
  different drive than the current directory
- Fix path calculations when running in the root directory, as you
  might do in a Docker container
- Filtering in the HTML report wouldn't work when reloading the
  index page. This is now fixed
- Fix a problem with Cython code measurement

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.4.1.bb => python3-coverage_6.4.4.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.4.1.bb => python3-coverage_6.4.4.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb b/meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb
index d352cdadf..5bff96901 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "4321f075095a096e70aff1d002030ee612b65a205a0a0f5b815280d5dc58100c"
+SRC_URI[sha256sum] = "e16c45b726acb780e1e6f88b286d3c10b3914ab03438f32117c4aa52d7f30d58"
 
 inherit pypi setuptools3
 
@@ -13,4 +13,7 @@ RDEPENDS:${PN} += " \
 	${PYTHON_PN}-pprint \
 	${PYTHON_PN}-json \
 	${PYTHON_PN}-xml \
+	${PYTHON_PN}-crypt \
+	${PYTHON_PN}-shell \
+	${PYTHON_PN}-io \
 "
-- 
2.30.2


