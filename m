Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D08D3567F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:51:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6995.1769579483046019756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQeRpUOd;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so3837493f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579481; x=1770184281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pazEs2PHw/A0Q+z3l7tP4/eFAAz9hq1JQ5Ym6/tkuY=;
        b=PQeRpUOdxrHUD8wcisx849Sr33vauoAECRb3MPai0Ka1ij9vwsyT79NZ7C2tbeR0sn
         KqoFBkHUBItMI18uBTsIzm78zUSXt9v0M8yFrFMgkh3+hnuy2TRmmTcTgW+5tK+ycvox
         wxhgvRd5Wt2pYTBavy0W7eJIXYa4LOl86dhu6RQiKB3Zt9o2qae3uu7YV14JFjrE7bQV
         fVlUUm5YmmBtJ1rtf1FFjQejHVLebHHTxTQEezH35aKw8Z5xPuc8RyPIFpuNb2un9vVA
         fMwHod8kp7g6c8YPgjrCqUodWVK7k6PLbdzb60/iNV6Hq31lGnauP0lkQbP0e0nK+bv/
         n7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579481; x=1770184281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1pazEs2PHw/A0Q+z3l7tP4/eFAAz9hq1JQ5Ym6/tkuY=;
        b=iw4JrdmJT0vcrKNE0MBX3lbSlBlcAMf0BHroqbS3DDII6pGz+1VcBABwMOpMmLQTEA
         twVA4svpoXlhVCEqV55Xc+zdgVKU+dkyO416DeH/AsvgatwFhZsi6dJDsOUT42bOUdxS
         PiQGzxtWdso1NaP5IjABkcM6TyB2TTH913h6RapkTD+4bSvd+DkigsJhD+78tYOYllRu
         MM0kf3VeCqo05mrWCH6p2MUaJdics2CExdALtapLC6hM/GRNKfj2s37vfnD/rlbEp6bi
         D1X5oqUEVH1+G7wRCIC+cEnxpYtXljV9NpKUcezZw8/yECfhjDVnl7A2hWwy5AhPEMFU
         Nusw==
X-Gm-Message-State: AOJu0Ywx0HBNNwD0seeP2V5M90mEdk+vY+aWG2RFB9elCUuV7QyHrqkm
	e4J9EPCFHyqI/Nsx7yapdy5gJ7CCF3oLwcYjOunBsmWrLdqW+RIvvArZ+7HVrQ==
X-Gm-Gg: AZuq6aJqbaT8Apejdaq4kjBRKxv42DsaGjF4ppVLM6d4W5gbKwpEn//gnBpLWTPblzY
	ZmlYx68xLSTERM/L28SUMCtl9FK6+5KsXH24KsPTlx5Cf1xnS6/ztrmu1yxZXUqCLGZ1pf6nSGc
	q7yeWfXHtywOvHLnWigvC2vLAqIkSZagw7QKEXcsl7tJg6r+vBu1gyBaXLyFTX9S8FXBeBO/+GN
	ZhZTZVSRcUvYMifq1nRJgbkcJsOZma1Ip0plrqe5BYPmPOE+deHlTNfpcUI1j29zGxx8hw9KYRl
	wHaD8OCsvO1kSKLl2yR6go4mDZ6NhqcQGbE2FL7Q0EdWaTPmot3Qy+h4vEFdWqbbf3sBdW2L4Wn
	TyP64Ayd1jhzso1HBGnascd3/iMR3v+z3Gpk+Ti47+mozOWhxompNeUbH2X91jOlhEQNLGHysOr
	rsGwZWt34j
X-Received: by 2002:a05:6000:2082:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-435dd05af7emr6407923f8f.15.1769579481348;
        Tue, 27 Jan 2026 21:51:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm4371777f8f.19.2026.01.27.21.51.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:51:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] libvncserver: patch CVE-2020-29260
Date: Wed, 28 Jan 2026 06:51:17 +0100
Message-ID: <20260128055118.2011068-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128055118.2011068-1-skandigraun@gmail.com>
References: <20260128055118.2011068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 05:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123967

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-29260

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libvncserver/CVE-2020-29260.patch         | 28 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.13.bb       |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2020-29260.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2020-29260.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2020-29260.patch
new file mode 100644
index 0000000000..c865b8e067
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2020-29260.patch
@@ -0,0 +1,28 @@
+From 060f7b71c2ae62c2253a387efe27b0593d04a1ae Mon Sep 17 00:00:00 2001
+From: Christian Beier <info@christianbeier.net>
+Date: Sat, 21 Nov 2020 12:52:31 +0100
+Subject: [PATCH] libvncclient: free vncRec memory in rfbClientCleanup()
+
+Otherwise we leak memory. Spotted by Ramin Farajpour Cami
+<ramin.blackhat@gmail.com>, thanks!
+
+CVE: CVE-2020-29260
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/bef41f6ec4097a8ee094f90a1b34a708fbd757ec]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libvncclient/vncviewer.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libvncclient/vncviewer.c b/libvncclient/vncviewer.c
+index d6b91f02..0a1bdcf6 100644
+--- a/libvncclient/vncviewer.c
++++ b/libvncclient/vncviewer.c
+@@ -534,6 +534,8 @@ void rfbClientCleanup(rfbClient* client) {
+     client->clientData = next;
+   }
+ 
++  free(client->vncRec);
++
+   if (client->sock != RFB_INVALID_SOCKET)
+     rfbCloseSocket(client->sock);
+   if (client->listenSock != RFB_INVALID_SOCKET)
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
index 93f6951739..96cf9591b1 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
@@ -44,7 +44,9 @@ FILES:libvncclient = "${libdir}/libvncclient.*"
 
 inherit cmake
 
-SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
+SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https \
+           file://CVE-2020-29260.patch \
+           "
 SRCREV = "2aa20dad4c23c18948d3f63b33f9dfec1f837729"
 
 S = "${WORKDIR}/git"

