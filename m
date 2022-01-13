Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C52C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:26:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.8734.1642080359416543862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=T7UbT12u;
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
	bh=VeUxy+nabhYq9EYAVEaewlHHxjbcXJyUBUZdMuZUwHU=; b=T7UbT12uBgTxbh31yZRqKL/UY0
	Jl58XmAauOpLgpGu6P0TgUnGtv8h7j0kxITVOvOoyHn/XUVffNLgO/zZ6mRFnJg+DNwdUeAA3ytgN
	PataPYf4f47H6QNYL0Y2phiGLT5AZGfuD3sVlrbn9HZy3x68UfQL/Ua8Js/yF2Pd0vmyOSZ/Twj2h
	CKusOeUF5ZG3Iowh3o4aVh4bLETk9zgpARgDhLMxeD0So3/Dh5yTUAnsprUEjg7JlkZ33VuchwWN7
	rErwkWSKqR2bJqEM2b1hqFruFoxcXX4LY0Zh4wmXFVo7YXLWE2ELfH+hMg6CVeEvdZbM1rAcHeonH
	qkCeY2nQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:51702 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n8071-00068z-3A; Thu, 13 Jan 2022 15:25:57 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-regex: Upgrade 2021.10.8 ->
 2021.11.10
Date: Thu, 13 Jan 2022 15:25:42 +0200
Message-Id: <20220113132544.779928-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.4
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
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 13:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94806

Upgrade to release 2021.11.10:

- Minor changes to some tests
- Removed unused functions
- Fuzzy regex matching doesn't seem to test insertions correctly

License-Update: Use LICENSE.txt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-regex_2021.10.8.bb => python3-regex_2021.11.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.10.8.bb => python3-regex_2021.11.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb b/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
index e7978970c..dce232ba6 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.11.10.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Alternative regular expression module, to replace re."
 HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "26895d7c9bbda5c52b3635ce5991caa90fbb1ddfac9c9ff1c7ce505e2282fb2a"
+SRC_URI[sha256sum] = "f341ee2df0999bfdf7a95e448075effe0db212a59387de1a70690e4acb03d4c6"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.30.2


