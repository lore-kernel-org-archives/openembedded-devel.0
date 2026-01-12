Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C7BC9EC74
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30999.1768216822049402806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J1xuJoNg;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so5391460f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768216820; x=1768821620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjNu46rEm3PlXXgQWcRtGqPnCqtPlblxbE/FJmBleiQ=;
        b=J1xuJoNgM9er4MaSl2VKJfqFTXMnVDaTRmvZeSGfeDaAxsun8ecF+y4kNXOY+vbqo4
         Vi+TIzsmnpRVy53JhQXEZOPI+6hPFLEhEwWow0J4r6XHPq8Cs7/saRXiSXiPaZpgE5Zn
         wjyI6ND36HfHWP8YkkogE4AycBxFIxSnCVX0qo9MNdWrMqoKQsewEe8ChcpHjbPyQdNy
         CmHuwxxYS1AOZuDoZHshfK5yXoZmmRlRaopnYbofAIC62qgkHSuirDc+xYUJz6gd6Lam
         lrG7X1jW2DG+NUxt617u1rysLruCmZE8rPivYOPypxudGzMYvETwdfN/jUDxIpLIJ5g3
         31zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216820; x=1768821620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LjNu46rEm3PlXXgQWcRtGqPnCqtPlblxbE/FJmBleiQ=;
        b=CjSIYHD6YRFV30QSo+LiqXnSYmN/CveDYf03wTXrUICygIygHBAS/RbRqC4UNyQP4e
         AiJFVL+y5c7H6tJamD8ct7pyShToqPDiy6UIJizTtRLz5yOLBiv59N1Mv4pTjXQ5n99x
         OWUXPTlFFK4naPIJ0E9FzP7S+4BZRnonUVTZ9DmX/SjH4LMCNIj9blHpfTIh83PFE6Xn
         TFhUEsw5w05glGzksJOLzdlxlwa7xQK8Ah0X4B8Pjt9wCsE64kd87+VQmuKFHJwqLLim
         +brZM7DLOEprBDVJZqX2x+eZh8xLKVf+yw/k+oK8nWybx6x8/OaiJ6UTqTSMjZNLdJ1a
         NHmQ==
X-Gm-Message-State: AOJu0Yzcko36TpA9nm8EvSbbqjar5t6n0zrlWoZA9qqNFoCSZsT5aEN2
	ueeyB3liuXyUBGNJPPZ/iqh9NeXXQmB9oq1nvcnc9NFDaHHek0hGnNChFDn9SA==
X-Gm-Gg: AY/fxX5//Mgzx5k9nCpxFYoZgfaPJkatDyeYfviVHOjBAJGF9MKLLiaK6YYv4autFbA
	QqQXAFDZNqZsEVs5CkK78aIkBRuea2NmmV32eDCq5zcEsAWGqLlgaYi8vcMStySIQjhAAR4bf+k
	xOE8KUnio2wqG08Q+yS0RaxhaQJoF9+hilybb1HOsX0tvleFNrw+8C490R/YdcdXude7o9MOpaR
	4Ju6qBiJgN1wS+4Tuq+ZuuYMvT9XW8yBslPJLhn7ahVyvf6SAwbgC5VA3G1rLi0j7Ya/8GnQMX+
	elK1WdRvadFObNb2ldneQo4stu96WdZdtDsUwpaWlGJivb4jrV7B95uh3ivcvCGiAW1fQqERI7l
	LqfEKpgrZdmjFsqa9CD9Ie7waHC56/vYA3I0SGLPfrwfHIO4R690fY8TKi03nUbHfGvS5xRUIRl
	z7lYdaQTx4
X-Google-Smtp-Source: AGHT+IFUzlaJqjALJP0m6evJrifAz34jCocm8JA/BFBuEGQzGot7vaEBsWY5sBI+vuaS3grQUq67lQ==
X-Received: by 2002:a05:600c:1393:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47d84b3bad4mr193129765e9.19.1768216820163;
        Mon, 12 Jan 2026 03:20:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695225sm351382935e9.4.2026.01.12.03.20.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:20:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] raptor2: patch CVE-2024-57822
Date: Mon, 12 Jan 2026 12:20:14 +0100
Message-ID: <20260112112016.515266-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112112016.515266-1-skandigraun@gmail.com>
References: <20260112112016.515266-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 11:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123379

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-57822

Pick the patch mentioned in the related github issue[1].
The issue contains fixes for 2 issues, but only the first
patch is related to this vulnerability.

[1]: https://github.com/dajobe/raptor/issues/70

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/files/CVE-2024-57822.patch        | 42 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.15.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2024-57822.patch

diff --git a/meta-oe/recipes-support/raptor2/files/CVE-2024-57822.patch b/meta-oe/recipes-support/raptor2/files/CVE-2024-57822.patch
new file mode 100644
index 0000000000..ee31474cf9
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/CVE-2024-57822.patch
@@ -0,0 +1,42 @@
+From 9dc72f9534df6e2b94ce22ceb3d90224c1153184 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Thu, 6 Feb 2025 21:12:37 -0800
+Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
+ raptor_uri_normalize_path()
+
+(raptor_uri_normalize_path): Return empty buffer if path gets to 0
+length
+
+CVE: CVE-2024-57822
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_rfc2396.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
+index 89183d9..2f0195f 100644
+--- a/src/raptor_rfc2396.c
++++ b/src/raptor_rfc2396.c
+@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+           *dest++ = *s++;
+         *dest = '\0';
+         path_len -= len;
++        if(path_len <= 0) {
++          *path_buffer = '\0';
++          return 0;
++        }
+ 
+         if(p && p < prev) {
+           /* We know the previous prev path component and we didn't do
+@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+     /* Remove <component>/.. at the end of the path */
+     *prev = '\0';
+     path_len -= (s-prev);
++    if(path_len <= 0) {
++      *path_buffer = '\0';
++      return 0;
++    }
+   }
+ 
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
index 7ee097b6ce..d110b8475f 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
            file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
            file://CVE-2017-18926.patch \
            file://CVE-2020-25713.patch \
+           file://CVE-2024-57822.patch \
            "
 SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
 SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"

