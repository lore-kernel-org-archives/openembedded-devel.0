Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38561C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:47:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9858.1641577673004302454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 09:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=e7IUc23t;
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
	bh=jrgXxxxkD1mj8zwN28YBo5ZfrUgnEJz9dO2+93Cp/YI=; b=e7IUc23tX2VuUkjT+2cWHylR8z
	fvvs3zyHv4r6JqyYowiVGQQM7MDfqJC1MXGWT7uU04H3rWNlatKsADuPHGFb/0P+H7Fl2KLKb7mzJ
	yR+zrDfXpJaEXXDU8j6dF75ApgEdgemAmksQ5/erPQ9q/vo8gZVArriACILOopkY8aFA3D91sys88
	3H1pqGDdGgf1BcshFrSYY6G/rnP+XJDpMNkaXOyCzypVAyp2mpdPmLSBbM0WB6Mge8aU4vIaHyI5/
	SaPaYj7joBhp1v8MAHfA7FUclNG+AxLyjbGQ1q2X2x7NTeWvvuKkaLXi097g9SsPposXClcyqzo9u
	XEa+DlvA==;
Received: from lan.nucleusys.com ([92.247.61.126]:48914 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5tMl-0000YW-7p; Fri, 07 Jan 2022 19:47:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-cantools: Upgrade 37.0.0 -> 37.0.1
Date: Fri,  7 Jan 2022 19:47:30 +0200
Message-Id: <20220107174730.3326962-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107174730.3326962-1-leon.anavi@konsulko.com>
References: <20220107174730.3326962-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 17:47:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94696

Upgrade to release 37.0.1:

- Fix issue Wrong compare type in _check_signals_ranges_scaling()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-cantools_37.0.0.bb => python3-cantools_37.0.1.bb} | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.0.0.bb => python3-cantools_37.0.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb
index c8c2b2592..9642bc528 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb
@@ -3,10 +3,17 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ac5f8901940693ce4b798e7ae07ed69a60856ae8a1ca47079088530813b57287"
+SRC_URI[sha256sum] = "5852ad9fd17ddd7b1a1ce87b21b000e7f5716b358cdac4fdaca13b3e292f4c99"
 
 PYPI_PACKAGE = "cantools"
 
 inherit pypi setuptools3
 
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-can \
+	${PYTHON_PN}-bitstruct \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-textparser \
+"
+
 CLEANBROKEN = "1"
-- 
2.30.2


