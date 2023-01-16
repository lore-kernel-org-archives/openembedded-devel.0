Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045C6C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 13:57:08 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.166744.1673877418460701615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 05:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GLtJsbUy;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qPL/dda6y797FOJ3UEHfQDRG4AcaNP/JUjuKY2xd9GA=; b=GLtJsbUyKyqCq+Aff/gi/yiw1/
	eFdzqQMTVsP0UstIPvxUjAf1KO4E9OyopWJ58iJEWweteGEpx5bzPT6yuxJdc+4hO4QlBqpTnSKrI
	ZNMFstvgbnc1/X4Yi5//GHG1AYN16J9fBgAV24qSU7ylZPDlXV9r14LoG7i2yOaDNM8yY4yjJWQWw
	l+OXvVq1x+fXq9oR3W+OvkuWYjN59n8Wf8T0qxQ+I3RaaRJPjHbDxe9srepOlZct1ZILUenXgDSz3
	y+VfXdgNZX0NfvbdUa3gcPQTdNY3eBJZNwpyc/bjHHSfyzYIhRxK91SHtxmO6mhBMr8F2ILtnb6tv
	9E/jdGrQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:53414 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pHPzH-000B4g-Jz;
	Mon, 16 Jan 2023 15:56:57 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-autobahn: Upgrade 22.12.1 -> 23.1.1
Date: Mon, 16 Jan 2023 15:56:45 +0200
Message-Id: <20230116135645.2836536-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230116135645.2836536-1-leon.anavi@konsulko.com>
References: <20230116135645.2836536-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 13:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100584

Upgrade to release 23.1.1:

- fix: support for Python up to v3.11
- fix: update GitHub CI
- fix: copyright transferred to typedef int GmbH -
  no license change!
- fix: remove coverage crap

License-Update: Company name changed from Crossbar.io Technologies
GmbH to typedef int GmbH, the license remains MIT.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-autobahn_22.12.1.bb => python3-autobahn_23.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.12.1.bb => python3-autobahn_23.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb
index 54f42fdc3..b67e90068 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_23.1.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
 HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
 
-SRC_URI[sha256sum] = "43b4e8b1aeaeb20a0cc0a81572e613dc958057c0ab248a7d6b41b2763270f925"
+SRC_URI[sha256sum] = "a88882ab4700ee9eee46c69c38e2b625f6fda48ab1ce61cf7b58b23cf2fadcb8"
 
 inherit pypi setuptools3
 
-- 
2.30.2


