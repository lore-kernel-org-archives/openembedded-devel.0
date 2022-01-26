Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D0FC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 14:07:37 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.12676.1643206055236851606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LWm7/pqx;
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
	bh=q+5kPRJvi4TowhRdAnbFANXEivTXTXXD0w7cx80Vr90=; b=LWm7/pqxdX9azvYUnHOqv0Gsy0
	0fzo8qp8FMqbPGLlCxlA7R8q8CqoELcETcptHrE7YrzYhOYJy2hzDTnuAdPr1x3xIsEvYJ3E2ApgT
	R0suZzYJgbDUM8GSckztvka/3j7WznrJZ5cJosfaRSozql7uyzlt0DfAldOSRhWWhVxDqxW0ZaBT8
	jgoJsKq29hpV63NIjQfyPUOxv6pLAAFCuqA7Hgy4YhRrotYLwJ8kvW6q46taCVM06LJpCibeHo+2l
	uilVx+/LcHMs9Pfk1LC8jNKBKUg944UtNFyTgLwjnoYGg1wdevr5XTFnFFui9v/AjqhWStA2qSPl1
	1YSJDvDg==;
Received: from lan.nucleusys.com ([92.247.61.126]:57062 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nCixq-0009aJ-Pe; Wed, 26 Jan 2022 16:07:34 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-jdatetime: Upgrade 3.8.1 -> 3.8.2
Date: Wed, 26 Jan 2022 16:07:22 +0200
Message-Id: <20220126140724.3923567-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 14:07:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95104

Upgrade to release 3.8.2:

- Fix older version objects unpickling problem

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jdatetime_3.8.1.bb => python3-jdatetime_3.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.8.1.bb => python3-jdatetime_3.8.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb
index 37c99e676..67a6ea1f2 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "db57ee517356b1bfc1603ef412f5da61eae92241ba0bcaf0851028cae424780c"
+SRC_URI[sha256sum] = "c685687e3f39e1b9a3ba9c00ed9d8e88603bc8994413e84623e6c5d43214e6f8"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.30.2


