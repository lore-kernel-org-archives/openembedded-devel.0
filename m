Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BEBC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:27:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9802.1672914441610942839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 02:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=XZO4tf/1;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sMh1jdeZCsrpbF4HUoZ1un6qkdiOkdLfOhg27yFjQms=; b=XZO4tf/1ednOdlETWyhQqfeH2C
	Yoxi6lAzxacSseb88OEVBpQ5THqfnWuq2JJmrFDcKETxjblFUX1Plx0yvq8FlHDCleVFOdhiFb5Xp
	QKUaDZEmmOpnCzasfGwIdd0ngBz5+QRnYm9vamtunocU5AzE2I3OFqlwLnH9ljhDu4VZdE+Jmm7vF
	89yodfWs4QsYBrsLV9cD9PR0yr6rHnzWk16gjWyTBg8WiCluHvHEIHNqthz6ktGkyCKwJXgheoU1g
	odQJ4/HSMV/0wSIaLxn20gn8orF5/k3ZDnzzyFuoBe+VJS0xwymkNRKkDQSwyVW4R037lT77axPqg
	6l6f0TIg==;
Received: from lan.nucleusys.com ([92.247.61.126]:57110 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pDNTi-000BqI-Dj;
	Thu, 05 Jan 2023 12:27:18 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-termcolor: Upgrade 2.1.1 -> 2.2.0
Date: Thu,  5 Jan 2023 12:27:08 +0200
Message-Id: <20230105102710.166099-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 10:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100410

Upgrade to release 2.2.0:

- Add light shades, dark grey and black

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-termcolor_2.1.1.bb => python3-termcolor_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.1.1.bb => python3-termcolor_2.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb
index 4f48f5e5c..05c39c2c5 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "67cee2009adc6449c650f6bcf3bdeed00c8ba53a8cda5362733c53e0a39fb70b"
+SRC_URI[sha256sum] = "dfc8ac3f350788f23b2947b3e6cfa5a53b630b612e6cd8965a015a776020b99a"
 
 DEPENDS += " \
 	${PYTHON_PN}-toml-native \
-- 
2.30.2


