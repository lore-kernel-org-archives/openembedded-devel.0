Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68402C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:05:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.958.1642442716459102081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 10:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=JztVFCig;
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
	bh=CUHMZ56Tg8hmJAYknXch6uQrmgFFMBux5TNk2I7KOGY=; b=JztVFCigsJQw44+FcARZzwF66c
	YKLtcUvVa/HinEqgwp2FwB5lRNMhYAveTF5hGy0Avta9m02/ahV9zidpFpU+5fY7iYbLnNGpTizTK
	rkq9BEiXCaSVXQaTR8NVZA8dpx8fzjEz18vo9UIMg1WrUsYQEwkpcsT33rAHavZSGjGGN2sdOtVqg
	4jTVixHPpBRU/zjgtT4raXwZZ4X+qyb7Ra9uUgP5muqpm3GHZAWXq6uior2vYYQmLLaEDVqq4j79j
	2hAl1gy0JbrTPBp4H0T2P9YWC/fvEbiw7rktewjkc9K5dK2Vhmwh4rjFPSu9VUQHf4Snpcyon5eDv
	Z7jT3IXg==;
Received: from lan.nucleusys.com ([92.247.61.126]:57514 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n9WNn-0006Ib-Vm; Mon, 17 Jan 2022 20:05:16 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-jdatetime: Upgrade 3.6.4 -> 3.8.1
Date: Mon, 17 Jan 2022 20:05:03 +0200
Message-Id: <20220117180505.571730-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 18:05:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94902

Upgrade to release 3.8.1:

- Fixed pickle problem of jdate and jdatetime objects
- Fixed unicode literal problem in isoformat

License-Update: Use the LICENSE file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-jdatetime_3.6.4.bb => python3-jdatetime_3.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.6.4.bb => python3-jdatetime_3.8.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb
index ad1ca428f..37c99e676 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Jalali implementation of Python's datetime module"
 HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f6890b2f685363312aff7f520831cdef"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "39d0be41076b3a3850c3bfa90817e7ed459edc0e9cadce37dc7229b11f121c7e"
+SRC_URI[sha256sum] = "db57ee517356b1bfc1603ef412f5da61eae92241ba0bcaf0851028cae424780c"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.30.2


