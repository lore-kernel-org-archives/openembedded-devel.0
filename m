Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64E6C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:38:36 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.36860.1641843514811344745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=R4KqfRpy;
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
	bh=q3+d4IH0PWMUb4L/sCSKOCd1JLmuHiGkp7Dx1HIuFu0=; b=R4KqfRpyvJWvLmSYEkUkgvG/Hi
	UkWbeKdJlb0F4cU2cwmn9mzOXXnWdTe/VO/OAEOTU4/J1d6467MGdtGrDdv78euX9JxDYCbpLIGxe
	ouOgY7Q5F84GiUdOci8eLDCgzDjYMK7dY+JnFyvrzGwS6XCr0a4v9Me5lq9hOQLynL17sUs71hjs5
	5endEsowon6cVKe+pdp/YA6xaeONIx9oa1o02axCsDHJiZ6gJw4VDZ35ONYUmNBsCL9qDYZBJl1nh
	rk9LqTilHoTqCghgp41fl+6vFufzjPZSMBniySaGWj1Ts/PlYNvTVSBKdoKAjOefex0uEcxhviyFm
	xDYj5V4w==;
Received: from lan.nucleusys.com ([92.247.61.126]:51302 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n70Wj-0009id-DH; Mon, 10 Jan 2022 21:38:34 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-urllib3: Upgrade 1.26.7 -> 1.26.8
Date: Mon, 10 Jan 2022 21:38:13 +0200
Message-Id: <20220110193815.103592-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110193815.103592-1-leon.anavi@konsulko.com>
References: <20220110193815.103592-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 19:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94726

Upgrade to release 1.26.8:

- Added extra message tourllib3.exceptions.ProxyError when urllib3
  detects that a proxy is configured to use HTTPS but the proxy
  itself appears to only use HTTP.
- Added a mention of the size of the connection pool when
  discarding a connection due to the pool being full.
- Added explicit support for Python 3.11.
- Deprecated the Retry.MAX_BACKOFF class property in favor of
  Retry.DEFAULT_MAX_BACKOFF to better match the rest of the default
  parameter names. Retry.MAX_BACKOFF is removed in v2.0.
- Changed location of the vendored ssl.match_hostname function from
  urllib3.packages.ssl_match_hostname to urllib3.util.ssl_match_hostname
  to ensure Python 3.10+ compatibility after being repackaged by
  downstream distributors.
- Fixed absolute imports, all imports are now relative.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-urllib3_1.26.7.bb => python3-urllib3_1.26.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.7.bb => python3-urllib3_1.26.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb
index 72696749b..c2a51b914 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "4987c65554f7a2dbf30c18fd48778ef124af6fab771a377103da0585e2336ece"
+SRC_URI[sha256sum] = "0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c"
 
 inherit pypi setuptools3
 
-- 
2.30.2


