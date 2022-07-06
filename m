Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A1CCA473
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:20:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.3738.1657095595499596747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=faA+qrwC;
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
	bh=v9MTubyoKXEs6FguTcbwOKhaG+BjMP8BsJIw6Ds1rwI=; b=faA+qrwCmqiCOlwr80OS00D+oK
	w2jIhEnpW09dLMSkpPAjd4IF8N8WcRWJoMbFRqsXWtjA0z73UW40oQTNPjyq28JLhmROFaTlQzvnC
	Mv2zQQmMUnBi3ssrOZZ1P5qtXgbb9xYXwT9y8Vpc+U9JfJslZxnML0l2MksuET66pe/Gu02IEqaZ+
	v/JmxR9N8LcNDzGLI7WSKSOrZlHXzX1cJ2d+LE66J92J3MysN6opPNAKTwJkf6WWdwxvIlG8j2AwW
	Vt1a6Uubuk/wccsxLxB+Znk4jj0ZKWWu6h6kPvrOOw0eXsqiepWz3HB68q4BJKDucUrnI7Nu8TDrj
	phNjQeag==;
Received: from lan.nucleusys.com ([92.247.61.126]:46700 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o90HL-0000Lq-2G;
	Wed, 06 Jul 2022 11:19:54 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-serpent: Upgrade 1.40 -> 1.41
Date: Wed,  6 Jul 2022 11:19:39 +0300
Message-Id: <20220706081940.1256838-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706081940.1256838-1-leon.anavi@konsulko.com>
References: <20220706081940.1256838-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 08:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97726

Upgrade to release 1.41:

- support for python 3.11 added (__getstate__ behavior change)
- replaced travis CI by Github actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-serpent_1.40.bb => python3-serpent_1.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.40.bb => python3-serpent_1.41.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.40.bb b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-serpent_1.40.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.41.bb
index 935531a85..480e3ab38 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.40.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.41.bb
@@ -2,7 +2,7 @@ SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7c28f460fafe7be454fcdcac0b60263"
 
-SRC_URI[sha256sum] = "10b34e7f8e3207ee6fb70dcdc9bce473851ee3daf0b47c58aec1b48032ac11ce"
+SRC_URI[sha256sum] = "0407035fe3c6644387d48cff1467d5aa9feff814d07372b78677ed0ee3ed7095"
 
 inherit pypi ptest setuptools3
 
-- 
2.30.2


