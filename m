Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF270C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:55:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.7241.1667400896779743437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 07:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Glkrk4Zs;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=C+tDlyR33WAhrU9ebyfOq2Zf3aawOA3kNJLG0XMoO+E=; b=Glkrk4ZsVhgghfP14ZCYWqqRMk
	2oCwWO277B9I1IqKAwrltkKV2xeX/6zbLhGEfWykxXzz/KQ61DyiRHGvg2q2vnpPGbGj8A6NfovaN
	uLyANxDIaCz2zGW1mHcxO+I10KyCDWrGbd/TS/NT94MSpQs8vPvMtAccBRqpDXsTx6sxdNxb1AlVc
	xy8j1EV0BUZTrex4HD19mpZ2bA6jedvWeIT/yUjrwQtG6xheMeI9OecLTloCn0GZ5ofdUt9sLFED6
	PVfvvoUkllyHdI3U6BEkbqhOwGVL2/4FklYQkcLgQOZsEetSi9owh2CV40jXHzHoHqKRWdSL4ierA
	oG0qVxPw==;
Received: from lan.nucleusys.com ([92.247.61.126]:44148 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqFAL-0004Ql-BX;
	Wed, 02 Nov 2022 16:54:56 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-httplib: Upgrade 0.20.4 -> 0.21.0
Date: Wed,  2 Nov 2022 16:54:40 +0200
Message-Id: <20221102145441.3101891-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221102145441.3101891-1-leon.anavi@konsulko.com>
References: <20221102145441.3101891-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 14:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99421

Upgrade to release 0.21.0:

- Bugfix for Content-Encoding: deflate

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
index 52fd88ddf..3e285d9ae 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5b47aef259eb5c585"
+SRC_URI[sha256sum] = "fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


