Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F5AECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:38:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.4516.1663324696350009795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ksnvIm+P;
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
	bh=zc/JLuUZ80C7kUktQOXgqf2hHuH82dgonc3tGNfp818=; b=ksnvIm+Pjc6f+SY+u9rGRa/bUE
	IhXamU/+8brMHFl6gbf86YY1V+j1+d9/MksLB6cJuuxRSxdIQp0bFh5MBA9P/7Rx5D5n8kBbsi17C
	rMPC5qP41JynTvmBPGVyU7LqVzQtD8j1YkZmFdPt4mpjF7oQCpcMc3ymTGiQ06cVlt1Jis15eSFun
	xorerbC9JvJrS3J7G1E3asplOKs265YG8TIeGqfAa6IoaKzCnL5r3ONBbYLQukpvXXqXzgMPy7omI
	Bk8VAMmYW2Jp4Q0zzJMcxHcEK9Og/aHhq7D/iuiWI3ML98wANfTGuyqCkihC6kiy/+GAgBjswfDBP
	L24USm6A==;
Received: from lan.nucleusys.com ([92.247.61.126]:49096 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oZ8jl-0005VH-DA;
	Fri, 16 Sep 2022 13:38:14 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-ujson: Upgrade 5.4.0 -> 5.5.0
Date: Fri, 16 Sep 2022 13:37:57 +0300
Message-Id: <20220916103800.573091-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 10:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98831

Upgrade to release 5.5.0:

- Add support for Python 3.11 and PyPy3.9
- Add separators encoding parameter
- Fix encoding of infinity

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_5.4.0.bb => python3-ujson_5.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.4.0.bb => python3-ujson_5.5.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
index 15cf80e36..9f080eb27 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "6b953e09441e307504130755e5bd6b15850178d591f66292bba4608c4f7f9b00"
+SRC_URI[sha256sum] = "b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780"
 
 inherit pypi ptest setuptools3
 
-- 
2.30.2


