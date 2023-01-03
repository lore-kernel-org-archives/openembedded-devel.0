Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A996AC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 10:48:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.61075.1672742923203211315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 02:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ICHlwMw5;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nWUVWt/w5A7RytWnau0prjEXuQNjEPTAUbZZjYa+2NI=; b=ICHlwMw5QjobNZRdfilK6TQ2O5
	EX8gvW+MKwvjsjv/dEw0cWYQSYWPovSV+EEZtOsiJzSG2tpy5/YMazIFNhLm7siWRBmSiNLKvHWsx
	+kNyYMtbrb85I1BdU/rmeP/4Tmc2/VDKs/3IEnI58PBYHdjMnaV57rEzfBwWXG1UrXZmi1rYcZIlM
	w0D8lH/WP2S4TlbssSEE8g9zPgAcwt8kXaKuCxVA8L3Ow9Cfhn/Na1UW2Oep2Fv6beXvBGNO1xYAf
	aCndTjkwJv8+mnw19O1SP7L9WdydXVys5+DjUE+yT4UmtFYXmkAHTqklwhX/DGaiPLBotXP5tBr7x
	DnhDwEfQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:60722 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pCerA-0009mZ-Q0;
	Tue, 03 Jan 2023 12:48:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-zeroconf: Upgrade 0.39.4 -> 0.47.1
Date: Tue,  3 Jan 2023 12:48:27 +0200
Message-Id: <20230103104827.1211241-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230103104827.1211241-1-leon.anavi@konsulko.com>
References: <20230103104827.1211241-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 10:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100363

Upgrade to release 0.47.1:

- The equality checks for DNSPointer and DNSService should be case
  insensitive
- Optimize equality checks for DNS records
- Optimize the dns cache
- Optimize construction of outgoing packets
- Optimize dns objects by adding pxd files
- Optimize incoming parser by reducing call stack
- Optimize incoming parser by using unpack_from
- Optimize incoming parser by adding pxd files
- Fix project name in pyproject.toml
- Drop async_timeout requirement for python 3.11+

License-Update: Use PKG-INFO to check the license

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.39.4.bb => python3-zeroconf_0.47.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.39.4.bb => python3-zeroconf_0.47.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb
index 8d6290e5a..0c0304aa2 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.47.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295"
+SRC_URI[sha256sum] = "65ab91068f8fafe00856b63756c72296b69682709681e96e8bb5d101345d5011"
 
 inherit pypi setuptools3
 
-- 
2.30.2


