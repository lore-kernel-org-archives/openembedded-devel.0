Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D3C25B08
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:24:16 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.10625.1660310650689308259
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=FxAHNWX8;
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
	bh=s5s+VJmlqwu2b/irZQZTwg2IJe6Zcy8OK9FJgbbuGTw=; b=FxAHNWX8ggqm47aep+ESNZij+8
	/6+NjjJkDZCiaa+B8b0JzsgM1skzaVcvgb4NXXeGFYz9Lc803y4oIZnmHUuDyB+M6KfpLgPM+Fxyh
	FJ25lov1MiS4t0S96cs4Enfpawg/wTZv/2ufMRAfHLIHgXE6CzbOWfqYcUkLr+02hV6AOWWZUMA2C
	pYyOFf4XbUYqnIJofvTC8GX9eIoChQXTUPhXaAeW35pQ7WVVe7ad+Sb60Vn9clmf8PcP8/uAqJbRt
	4ZvW8zaCbV3/lZPpo41ovl4Ew3Jvelawxf4oCoE3p2MnUq/gTbIqVSX3wH3jp91XyofQCiXoNU5CL
	Weo6NTPQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:37172 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oMUfC-000B58-PR;
	Fri, 12 Aug 2022 16:24:09 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-frozenlist: Upgrade 1.3.0 -> 1.3.1
Date: Fri, 12 Aug 2022 16:23:52 +0300
Message-Id: <20220812132354.1588599-2-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98214

Upgrade to release 1.3.1:

- The published source distribution package became buildable under
  Python 3.11.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-frozenlist_1.3.0.bb => python3-frozenlist_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.3.0.bb => python3-frozenlist_1.3.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb
index 4dd77383b..b95a014f5 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6ffce2ca896eb35b0b"
+SRC_URI[sha256sum] = "3a735e4211a04ccfa3f4833547acdf5d2f863bfeb01cfd3edaffbc251f15cec8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


