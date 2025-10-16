Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA31CCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3912.1760606960825219536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9wtC3ly;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e5980471eso4151365e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760606959; x=1761211759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPKdhY4LLmFE1YJg5Fbf5oifohWnaqh4DhwCZsNl9eo=;
        b=l9wtC3lyxPqJQ2KnPtRQXCSa3JEPJTi+hovkA3PZxCPyv7cAUpCrWqMxhFyinX/Z0w
         hgQGK0yGUlXk1WGZFE2L0ncQm1rBfh1pPpDKsvsoV6e2PWQrlhjnLMuOMwdrt1uv3j+W
         tMRd6slYLsPBc0mi/414dUxOFEypNTMG5JH1IUDIlFIFhJhwh1za5Y6qkMXBdkXrfnlz
         pPoTyK/OasQjVLHOdk19Y2vghIR7XAnx6ooMBWMFDvJ34kfhqrGNNIvNhbBBOTdu97Lt
         /Gmbkn3DmaCb0izdzYHwC/mQBAYNtV5qycPT0VzyZ0GY5i3IDdAlK6bwnFf4RHIqRqdK
         gPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606959; x=1761211759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPKdhY4LLmFE1YJg5Fbf5oifohWnaqh4DhwCZsNl9eo=;
        b=qJBhsiKgM9ahzWQXZUj/iEbVfyu2eY/r+yCrGjXsEi569VH9l6ijDnejqdnEdpv5NL
         WMxXZoGAZjdDl+UHIXwIFMXRHib520FK7WaI74aXI3ai8r+WCawPNys7afrHLpycOZ/4
         /DX7ZOmmYSzvpWTrKTYVrYQEu/hMh1O721Sfuiik1dkZxw5gAUOaO2nQKNTvgQE3IXjK
         X4Eb0EPRxDX/zrpWSEBBf4qUycgdnrsfdLRk75bv3Cvd8BRNPn/pxSUWxY7v74bswG3v
         LvN4CbXMu/M4sgi0OiuMm0836A0onKGBcuhuYZL5erFURe68DRY2xqMV9jvd1zzhBFi5
         rk+A==
X-Gm-Message-State: AOJu0YxOniSzqrXlsItZ4KRQudzr7/h1jOOZmCvMzJWsVtT8lM2waJOx
	iwTVGGzaFEyjnDy6EjP8QACZuSkuILhG4R5W3zvu3A9nJyQOa19+j8A1Fp0nhQ==
X-Gm-Gg: ASbGnctQVyww5es2R3StnPo6A4TdP+LIMKK111ElsLSHZ5spRx7ZrcClMotcryfo0o8
	fM4lcQW6FUrUTixBoywUSiDHrb8+mO7irfbka2OIyyiI+fZ89IwMZw/Fku8KJcpDfScnqOUwZgV
	QSxhiLeDN2mL2lQDLmWFVo6YXAq/uLr4b8omtWtSi0+LTE0sKKJ6IAc3PKw1ARjC7BeCfhwwIsD
	P5a8DYzpLSmUHQ/a9VxZp2APkQ/Zr8yAmwcsm9wFs0nEiw1b1c7LiTIRaya1ppyIpgFBCJQKfC1
	HSv11Xp5tA6dFbyaro/sVPmUCCJVrup4E6woAdspFYJnMz7GRjI+4tg+hprAjwcmqlwsPzFKizG
	7lW1t7vXyTA3a3dO5nflQFvWoyzSnW49dXqYCofTguPZJGhmFSOIPUKjWku1pBf5VNFcKGUzILA
	==
X-Google-Smtp-Source: AGHT+IGUyWXg1o20W1qRrIG1wC6mWqJb1RyFmL9Chrc/cXi8XzQnpHFW0GJ96/o4T97yStZfswo7kw==
X-Received: by 2002:a05:600c:8206:b0:46e:19f8:88d3 with SMTP id 5b1f17b1804b1-46fa9af313bmr222917555e9.22.1760606959080;
        Thu, 16 Oct 2025 02:29:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed9e7d7sm16819345e9.3.2025.10.16.02.29.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:29:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] faad2: patch CVE-2021-32273
Date: Thu, 16 Oct 2025 11:29:15 +0200
Message-ID: <20251016092917.1946972-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016092917.1946972-1-skandigraun@gmail.com>
References: <20251016092917.1946972-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120724

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32273

Pick the patch that resolved the issue linked in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ack-buffer-overflow-in-stringin-ftyp.patch | 28 +++++++++++++++++++
 .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch

diff --git a/meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch b/meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch
new file mode 100644
index 0000000000..3925cde545
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch
@@ -0,0 +1,28 @@
+From a58cf881b820bfb4544995192fe5992ae010f1d7 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Mon, 17 Aug 2020 07:37:09 +0200
+Subject: [PATCH] mp4read.c: fix stack-buffer-overflow in stringin()/ftypin()
+
+Terminate the string read into the stack buffer,
+fixes #56.
+
+CVE: CVE-2021-32273
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/1073aeef823cafd844704389e9a497c257768e2f]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ frontend/mp4read.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/frontend/mp4read.c b/frontend/mp4read.c
+index 5dc36b7..a978e62 100644
+--- a/frontend/mp4read.c
++++ b/frontend/mp4read.c
+@@ -91,6 +91,7 @@ static int stringin(char *txt, int sizemax)
+         if (!txt[size])
+             break;
+     }
++    txt[sizemax-1] = '\0';
+ 
+     return size;
+ }
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
index d70c18f43d..6ac09c19ce 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -9,6 +9,7 @@ LICENSE_FLAGS = "commercial"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
            file://0001-fix-heap-buffer-overflow-in-mp4read.c.patch \
+           file://0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch \
            "
 SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
 SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"

