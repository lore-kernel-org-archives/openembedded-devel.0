Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6011E68150
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:01:44 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8211.1771318900811489778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IS7dUpz+;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a95de4b5cbso36763575ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 01:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318900; x=1771923700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uSs3a5CCNddVNUFgszf13QY/vGsIVMTQKLdqg9rcSU=;
        b=IS7dUpz+FZB83t8oxJrDWYnFD/rmlE/4bJMaI8VqJonNrjLm7zG/tMBAsVVwEuslZg
         f2DbYYlXjjmI9Y6X3Cy8cIBHSqv6omrUzoNzX7HCHFZd0RF8aYA1ibvZwAFbsVd88S6V
         eUbBHf5CH7mZmn/FlXd3FifWcBasKaUP+SejUJWauqAB9stIauqXUROItDJglTPSJNgx
         631uPfNNoGH/Au9A6aPUm68PVT1aQsj2hyYe0hGDt6at3A5XEa5o5386eHGGrHqt2MhK
         l9pWyrCtSS8UaBDkFi2zlxSk+/K0R5uAKYzlK9xGDN5yQdZpF6F2QC+QuWkq4WsGuP0L
         kYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318900; x=1771923700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uSs3a5CCNddVNUFgszf13QY/vGsIVMTQKLdqg9rcSU=;
        b=TQfVMKOeClsqvKTIAxuALhddQKCRjPW99lopLPaXkRgi90sGBXvgSZRhV0TDfGsO5E
         JF9ZSUp+0fY3PC2oivTEcx8lZlkLBouk7XdgOY+Ffs+DZsGkCsNdnq30GWsnhQ0W/EvV
         gd5pMje7+/pWNg3+zTWMukxS1eq/7yRAKJ93uTkg7hOre3TWV7v/RtWiIz/jcXtoH5Hn
         CMbL0RUeHP/Tcn6xljRqZXdf2vVx8SiTIcfpfcShWeyxePigMmfAnZasjal5x+tdZHf7
         z4CrHmE9DzFoMSNC8V485xFmDpQcPILiHgKqNTCt8T5tbYf5yPAi8LaAeh9hNTbiU58e
         ZVtw==
X-Gm-Message-State: AOJu0YxhT5bqYSbk01ZaX1JPO37Oc64v6hPZ9XYRTTI3bIDviZ8cxK3y
	tbRBEBvBXtcpCXfOwmu8sqq9Rq8Xux8Pbc3QmZgtamxjmMjW4O8lxabRFPXCKA==
X-Gm-Gg: AZuq6aK7Q66mSGGQ4+IK4DnmPoZ2WvEONg0by707kBK0lEzMYqOQq1sWSFJLjk5tfal
	nhpiTEPcSic+KksNkreVN2SQsBK46HGWnG1nhhKBPzLWAZqZYnUXVUWcK4bEJSl3pWgti5jEq6i
	ewfcyGZ+5/jA4lwYdVKQv9GMRekBCMJC5dmFd086Y6QQDCuI4M7QI2rIEEK2QW2JJ5NHce63CA9
	lpYDklmsYh9tRRyMh32SNBgK+8vYm6zcQ1RQVvkm4P1bwtnCfKAzir0UNVAo6qAD83SWaQJ26l0
	qXIWl2tpGtakU4Ri0DKQctD+CdXr5MQgM/JT3K6tvF693GPF9M+OE9a5X+DVvofkgK4Fi7XLx7f
	2fCGXrpCsSGXxfzjzHK8gkuHTBY7Gfpx1TntYCzMGQ8SLiQJUW9ntNvKpMrrlb7n5SuyDDRj7Bl
	kUkoBUZo8EV/9xS9oBEpALLjN3QTTDTA==
X-Received: by 2002:a17:903:388c:b0:2a0:d636:71e7 with SMTP id d9443c01a7336-2ab4cf7c628mr122087455ad.13.1771318899868;
        Tue, 17 Feb 2026 01:01:39 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332facfsm9171274a12.32.2026.02.17.01.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:01:39 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scartgap][PATCH 4/4] imagemagick: Fix CVE-2026-23952
Date: Tue, 17 Feb 2026 14:30:19 +0530
Message-Id: <20260217090019.1076725-4-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
References: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 09:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124444

Fix CVE-2026-23952 with patch provided by Debian from fixed version.

Link: https://security-tracker.debian.org/tracker/CVE-2026-23952

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-23952.patch          | 57 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch
new file mode 100644
index 0000000000..d8eb44b44d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23952.patch
@@ -0,0 +1,57 @@
+From 1eefab41bc0ab1c6c2c1fd3e4a49e3ee1849751d Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 15 Jan 2026 17:34:46 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-5vx3-wx4q-6cj8
+
+CVE: CVE-2026-23952
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1eefab41bc0ab1c6c2c1fd3e4a49e3ee1849751d]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ PerlMagick/quantum/quantum.pm |  2 +-
+ coders/msl.c                  | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/PerlMagick/quantum/quantum.pm b/PerlMagick/quantum/quantum.pm
+index 1dd5921fa8e..74cc8168f37 100644
+--- a/PerlMagick/quantum/quantum.pm
++++ b/PerlMagick/quantum/quantum.pm
+@@ -6,7 +6,7 @@ package Image::Magick::Q16HDRI;
+ #  You may not use this file except in compliance with the License.  You may
+ #  obtain a copy of the License at
+ #
+-#    https://imagemagick.org/script/license.php
++#    https://imagemagick.org/license/
+ #
+ #  Unless required by applicable law or agreed to in writing, software
+ #  distributed under the License is distributed on an "AS IS" BASIS,
+diff --git a/coders/msl.c b/coders/msl.c
+index fa29764563b..5b182b5922f 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7088,6 +7088,12 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+     {
+       if (LocaleCompare((const char *) tag,"comment") == 0 )
+         {
++          if (msl_info->image[n] == (Image *) NULL)
++            {
++              ThrowMSLException(OptionError,"NoImagesDefined",
++                (const char *) tag);
++              break;
++            }
+           (void) DeleteImageProperty(msl_info->image[n],"comment");
+           if (msl_info->content == (char *) NULL)
+             break;
+@@ -7137,6 +7143,12 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+     {
+       if (LocaleCompare((const char *) tag,"label") == 0 )
+         {
++          if (msl_info->image[n] == (Image *) NULL)
++            {
++              ThrowMSLException(OptionError,"NoImagesDefined",
++                (const char *) tag);
++              break;
++            }
+           (void) DeleteImageProperty(msl_info->image[n],"label");
+           if (msl_info->content == (char *) NULL)
+             break;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index abad1fe5d1..3917eed92e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-22770.patch \
            file://CVE-2026-23874.patch \
            file://CVE-2026-23876.patch \
+           file://CVE-2026-23952.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


