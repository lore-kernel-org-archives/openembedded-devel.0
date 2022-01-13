Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75059C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:26:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.8729.1642080363607531305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=BHAyE6RL;
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
	bh=tzObLkwRX2Ni+jME16IJOmVBnHCJm6D6UMUJ4GFZIOo=; b=BHAyE6RLPyZLgV9DyvG8m4npZS
	P+bjle5OBKRDP5llNwQpkVhLjLhR4jh0Gs6Cqfh6hujGrYhMCeoUu7WDIXfOjztTfb1YbsIufzrF6
	sPUrQCE4FJgwY+bUUYTS9JDCB3DF8mQ3P226KbIjyQ049hVsPo48gRdDV9MWlC9YD5guSCAjZ77PS
	yUYWb10WmMPBJ4ioXDbOQB8XY4jfxjlXu//3nd2YR0YBm40pmTGa7JaxBQIITFM/0iBN7gpuh1UPE
	lGYSXyGsWTS6I1Xef9Ie/pibkmBxKj7oFDP5neg2Q6F8KrN01Gnls8SNACfRvnQvNO1rSVN9Uxb+n
	UdwTj1ug==;
Received: from lan.nucleusys.com ([92.247.61.126]:51702 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n8075-00068z-Ul; Thu, 13 Jan 2022 15:26:02 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-charset-normalizer: Upgarde 2.0.7 ->
 2.0.10
Date: Thu, 13 Jan 2022 15:25:44 +0200
Message-Id: <20220113132544.779928-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220113132544.779928-1-leon.anavi@konsulko.com>
References: <20220113132544.779928-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 13:26:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94808

Upgrade to release 2.0.10:

- Fallback match entries might lead to UnicodeDecodeError for
  large bytes sequence
- Skipping the language-detection (CD) on ASCII

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...zer_2.0.7.bb => python3-charset-normalizer_2.0.10.bb} | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.0.7.bb => python3-charset-normalizer_2.0.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.7.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb
index 7db106398..3c1e6804e 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb
@@ -3,6 +3,13 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "e019de665e2bcf9c2b64e2e5aa025fa991da8720daa3c1138cadd2fd1856aed0"
+SRC_URI[sha256sum] = "876d180e9d7432c5d1dfd4c5d26b72f099d503e8fcc0feb7532c9289be60fcbd"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-codecs \
+	${PYTHON_PN}-json \
+"
-- 
2.30.2


