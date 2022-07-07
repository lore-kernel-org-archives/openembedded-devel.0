Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1DACCA480
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.3702.1657187229938685265
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=qb0vsXED;
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
	bh=wLYy2uaTrC0dfygcDIXbPDfnqH6qC2YpQd8cI177eOw=; b=qb0vsXED7uaL6DWBjWdPjjjckl
	YGHuZCU0jdqCb40UFklHrGt1FkNgTJnoBDmSlcRodbicSQ5bj9465P+fXRYkPlF+zHwJ5wLnrwQ0U
	Evd2v1BVFBKxcSI6gADaPnI9VkuaOdMqOgnxvmUaRLv8w3Nq4z7vDWeztzCGnZ7vNHTPZkqZhAtzY
	2d2pfmHsIzi7WcHVyP6ahbOreD11lBLiHbf0tcsMZhvQRSDU/cR6h5NO/g7jMDlJvIJZGhnuknuzt
	242kzbFMvMioCJa24APIrjxe4aKvRoNd5qurZWt60c4TqQYFaZeguSXup37Hk06pYIrUfqwo3wzYS
	tqEe3laQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:48688 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9O7O-0004Fc-0O;
	Thu, 07 Jul 2022 12:47:08 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-marshmallow: Upgrade 3.15.0 ->
 3.17.0
Date: Thu,  7 Jul 2022 12:46:50 +0300
Message-Id: <20220707094651.1716295-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707094651.1716295-1-leon.anavi@konsulko.com>
References: <20220707094651.1716295-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97772

Upgrade to release 3.17.0:

- Support serialization as float in TimeDelta field
- Add messages_dict property to ValidationError to facilitate type
  checking

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.15.0.bb => python3-marshmallow_3.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.15.0.bb => python3-marshmallow_3.17.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb
index c8e0fa4dd..f2f5281d6 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "f251dfb08d79c755c2e95371f2c5580bf5937e60"
+SRCREV = "4a6c08d53f181195c78b505abe155b2f35cbc0c1"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


