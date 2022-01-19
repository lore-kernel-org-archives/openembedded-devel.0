Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AB6C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:10 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.5487.1642594748331672403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=t8a9fgk8;
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
	bh=1WwH4jT4m12erkF/ZVoImMzpw3RSVvsd8rpx7pz+Sm4=; b=t8a9fgk8gtuIJYX8rnZuF71IZ6
	X3SZUarTPq6HZGu5let2EXPb/EHrnmfcb2hz+9j3PT7kKvRMiX9wYuH5yg2g+ABToL4WDU/wcaIl0
	gU72UP8JWuHD5J9vNh1JmCYy2/i0XRAkhSleIGEmcMSttw9bO9tw7ZXD+Vdo/QyKnmKA2ZdPzPEgL
	/LaRyOODXprAydrJvkoaMi4TmMj++fGcoj3QGEuZ/Zemufj8daVZjEoKBhlogW2Z88HtAe/jRFJ0Y
	G0z8O85KiHzm7welFVvhuilCaVG9PT3+H6D7SxmBpETwH/+gwqA5LV26OBW+8r/f5T1jrw3NBjjEw
	G85UZfTA==;
Received: from lan.nucleusys.com ([92.247.61.126]:45782 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nA9vc-0006gb-IY; Wed, 19 Jan 2022 14:19:06 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aenum: Upgrade 3.1.5 -> 3.1.6
Date: Wed, 19 Jan 2022 14:18:54 +0200
Message-Id: <20220119121858.1575699-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94941

Upgrade to release 3.1.6.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_3.1.5.bb => python3-aenum_3.1.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.5.bb => python3-aenum_3.1.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb
index 4da70b86d..1d9bd32fb 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "2ebad8590b6a0183c0d9893523b458edce987ae4533339c5ac185cfac32daf1a"
+SRC_URI[sha256sum] = "3ba2c25dd03fbf3992353595be18152e2fb6042f47b526ea66cd5838bb9f1fb6"
 
 inherit pypi setuptools3
 
-- 
2.30.2


