Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A618C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:33:14 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.10954.1663252388593728193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=gntfMMOL;
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
	bh=3ViZ0kqYyh+muBJKFrPc+Vqjm+mWdoMAFEUlaSNRVlU=; b=gntfMMOLb87UkqlGJc6Xu3iEco
	cJu4JnHZAIMMv4j/hW4s2CF6nEpqBTmqcmRNvtQlYeHptGoehD1qC/8CcR7+SyO05PnoRovozn+8R
	LY7AS0x46FNc4GhzV4SNx0T3QnfUK5a3UqLi0x1V8eBWH/GISA8WY+GWqJS0PmLt7lJtP8/L7oOII
	gO23q5Hi5nTg2L6AH+xgB+arJiMe5I135xNa0gM12Sg76mtQmuThDYFsMywhIFS0YqTcSfz/+auBl
	qIIDN9de5tRwe5+QxOiMjM/2LdzqT79veCGROwwd3Wcnu0Mi8lvUVrY97GVdxt+uO8K/cZ62kCgQU
	9EtDPZwQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:44644 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYpvS-00022M-61;
	Thu, 15 Sep 2022 17:33:07 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-awesomeversion: Upgrade 22.8.0 ->
 22.9.0
Date: Thu, 15 Sep 2022 17:32:55 +0300
Message-Id: <20220915143255.258714-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220915143255.258714-1-leon.anavi@konsulko.com>
References: <20220915143255.258714-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 14:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98822

Upgrade to release 22.9.0:

- Allow and add named sections for CalVer
- Add diff method to AwesomeVersion to list out changes between
  2 objects

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...wesomeversion_22.8.0.bb => python3-awesomeversion_22.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.8.0.bb => python3-awesomeversion_22.9.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb
index 550a8c439..20ed1890d 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "0469a801faafb3a7a13c529edc977ea04c3bce825af9ebb602f58012bc487db5"
+SRC_URI[sha256sum] = "2f4190d333e81e10b2a4e156150ddb3596f5f11da67e9d51ba39057aa7a17f7e"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.30.2


