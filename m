Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00195C47085
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.4020.1650374051170044146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 06:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Q1xJGEKc;
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
	bh=epOQSMe49xLlvAX8s/agHynLRk5QYpioEbnuE+vbjec=; b=Q1xJGEKcCkjItyfJO349gRzx9w
	JMKD2mA4x/rMw2tQ1D3YXCJwBB/c+qMd/NxLyNJKggraA0OzKb7+X5dNO0hEDMaI6wsSgIWtrIAkV
	KPsJLEDIkJ1zGd0uiQFYKJNgXqKKjq4iao8BOlFmpD/Zfc98Ikd5dzYOHVu3kCmNRJI/cJPOgbiyY
	9W/ebQW+83PpFLPszSv5gIn3/91PBk5NBJaqNJmiH8ABXtlQXcl991IimbwjZbUZw43iHtfkNzDQv
	Px5P+FnBN/nb0lMPG/310jayEdgwS74c8iw9j1mjtKkxKvHQBGANer9ZwtxWoeRg1PE0kaGmh507F
	VOYdszMA==;
Received: from lan.nucleusys.com ([92.247.61.126]:53650 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ngnh8-0001vU-AI; Tue, 19 Apr 2022 16:14:10 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-marshmallow: Upgrade 3.14.1 ->
 3.15.0
Date: Tue, 19 Apr 2022 16:13:54 +0300
Message-Id: <20220419131354.2593158-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419131354.2593158-1-leon.anavi@konsulko.com>
References: <20220419131354.2593158-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-2.4
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
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96693

Upgrade to release 3.15.0:

- Allow passing a dict to fields.Nested
- Address distutils deprecation warning in Python 3.10
- Add py310 to black target-version
- Drop support for Python 3.6
- Use postponed evaluation of annotations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...allow_3.14.1.bb => python3-marshmallow_3.15.0.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.14.1.bb => python3-marshmallow_3.15.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb
index dc5f17388..c8e0fa4dd 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.15.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "41afdefd93afd1b95f48f45fd284ff8add3e91b7"
+SRCREV = "f251dfb08d79c755c2e95371f2c5580bf5937e60"
 
 S = "${WORKDIR}/git"
 
@@ -17,4 +17,12 @@ inherit setuptools3
 
 PIP_INSTALL_PACKAGE = "marshmallow"
 
-RDEPENDS:${PN} += "python3-core"
+RDEPENDS:${PN} += " \
+	python3-core \
+	python3-datetime \
+	python3-netclient \
+	python3-numbers \
+	python3-json \
+	python3-pprint \
+	python3-packaging \
+"
-- 
2.30.2


