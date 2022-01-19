Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6362C43217
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:12 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.5369.1642594751621548246
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LttEU+AO;
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
	bh=yHR+axLVj9Yq5TAojgFi3wD9mRSCOpV5IWwQM34HtLc=; b=LttEU+AONeM0ncn5aqmjPSYsqt
	LI+Wc6rgXKfOuiCexdOHk5RHy9h5qBbncQSKF6ELx8IUGCbjox0oYvx8uFkElqVl1odUXeYltozLB
	E23wqP/sOgYiS9FmNhZeQaG5tkmjbXTagJhKh2M1jnkhqlathZTwDlp46HZR3hMnRV4HYaJjeAt2F
	e9tWCtA2Y33RDcNSm7wxnL3UhgG+Y0ZOo2Kf9SArtNzIjtjSbd5iGrTtERVC5PpfhhT1SCVpcANDj
	2EGe3c57aXXDlbigWlaS3qvEVEkEA8SccaWMwvYJ1no0vZ0u/Ez1ch2Apb65MqNTS7kFgWADZY+yJ
	yWJAl+ww==;
Received: from lan.nucleusys.com ([92.247.61.126]:45782 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nA9vh-0006gb-Ct; Wed, 19 Jan 2022 14:19:11 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pythonping: Upgrade 1.1.0 -> 1.1.1
Date: Wed, 19 Jan 2022 14:18:56 +0200
Message-Id: <20220119121858.1575699-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119121858.1575699-1-leon.anavi@konsulko.com>
References: <20220119121858.1575699-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:19:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94943

Upgrade to release 1.1.1:

- Fix packet length representation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pythonping_1.1.0.bb => python3-pythonping_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.0.bb => python3-pythonping_1.1.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb
index 55e642c27..75cef501f 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[sha256sum] = "71199bdeee942ba1258b65f88ca5624278e63b31e7643ee8ca7292d2f5f77e99"
+SRC_URI[sha256sum] = "0022f6cbe52762e9d596316e3bccb8a3b794355a49c0d788f7228d90f9461cfc"
 
 inherit pypi setuptools3
 
-- 
2.30.2


