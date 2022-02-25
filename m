Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F45C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 13:23:41 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.6188.1645795419627283677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 05:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=UmaMkCuJ;
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
	bh=dGFxh562cjaWvyBCzZXicMBkdv6WbUAzE95796G/vgg=; b=UmaMkCuJRfi9iC7N1inK8tkQrJ
	Q5FrIL5p5u6z5pe42nn92mdzZC/29WwAWubCoXO94TOHlfiaQyaP7zDrcixZob2Qq21okUlgtVsHB
	JkvXx3QpEv5sIjJEZ1LguPfMwxox+jKJqOEQwLhaPS5cLoJ1CI8w5fY6TebRYkb+KTvnpRVxPsvG6
	okO9lnfdJzYTEwgTFXCt/sKn5XXvZF+sAb5pgUPiUgMdWVApBM1U6UOUdFcmjPdaEZGBmU4Q17EHK
	Mt1ySJdKO72/tof1VLeIPkV3lpzprQjrnIuZNDetQRREyASxwmwJ/5A4vI5XGxnEkkshJpWjGKOFN
	yGcCCEpA==;
Received: from lan.nucleusys.com ([92.247.61.126]:56822 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nNabx-0009rs-Hx; Fri, 25 Feb 2022 15:23:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-prettytable: Upgrade 2.4.0 -> 3.1.1
Date: Fri, 25 Feb 2022 15:23:26 +0200
Message-Id: <20220225132328.2469153-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95521

Upgrade to release 3.1.1:

- Drop support for EOL Python 3.6
- Use <caption> tags to print html table titles
- Add colorful tables and themes
- Convert None to empty cell or custom value
- Resolve "KeyError" issue on _stringify_row

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-prettytable_2.4.0.bb => python3-prettytable_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_2.4.0.bb => python3-prettytable_3.1.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
index 8f5eb4299..3b75086fc 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "18e56447f636b447096977d468849c1e2d3cfa0af8e7b5acfcf83a64790c0aca"
+SRC_URI[sha256sum] = "43c9e23272ca253d038ae76fe3adde89794e92e7fcab2ddf5b94b38642ef4f21"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.30.2


