Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F411FE7FDE1
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1609.1770066844871019426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJQOQeli;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so36356185e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066843; x=1770671643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOHmlKFHAz5Q+kEAX5PV0+/YfvC0xlkw24aYluXtOTQ=;
        b=MJQOQeliHUFzE7QgpbQALcMLNiNnV/hQvWcHlhSoqW93CZheyOpmvpeOLBezWxUixk
         H2vdhyyzQ0N0VKjC+EBEKBI8E4kjcqyOHi+Ih7bC0Ap6swt1k8cHqzZqIPkWTAVgrr1j
         129IzUux4R20a4smV1M4WNd0EG+axbczGw0rD2db8c9NSX9+/2wI1zOgdd3/o1fDUT0E
         neJSCcIAwcrX9Yy3rHfWcm2Q/Zcj+gMjC28Z8dwl8g9Yk9qpFmgxVf7k0Q9ldBsAHtc5
         amyhceoMueyO+6tfUsJaUYNfcKGjXxBHeUzh0XLyKLfHYsl5RMe8gkesiiWav5YDaHcK
         Wz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066843; x=1770671643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOHmlKFHAz5Q+kEAX5PV0+/YfvC0xlkw24aYluXtOTQ=;
        b=VOMOe1AqiIpgnHK2ADDXOioqinCqcCVlyz98xh4b2714U+fi1OAb4R7QOw0dj5Bcqj
         yK+kP9eqbeHT3pfJVrSXwiDqMt5FbC7fuL2YlVT7h4Kt3PvyZpbYV7/BA4AgY6ZAh6pf
         TwLewb8lACfdTpA5hfWwStrBfRPN4TaQU2uReyAqG8IgU5tMwcUvxHWUSv05+WGtsgVE
         XE7bn/zDJrakQDBf2vMzcfRoj2upoOkWQf0iIEhG0QIDgBUvSzbFp8isLqIEn/thIzhl
         7k7Ip1mLsQ66nu5FHdtDcF2I4nw1ijVaRKXADksCyPS173OwvS8MO3+4xViyzR83sDHZ
         w31Q==
X-Gm-Message-State: AOJu0Ywj0zxqNuISFwlg08rf4c41eu0OzSUoRUWOtV9ufp0ot88E5Jvp
	YDGsRloryu+kG+vFYqGMVL0ousJHvvytFBNr/wqLQm0P36UQNoPtgYEKVkXbVw==
X-Gm-Gg: AZuq6aJNUWqriJlGCTz911LUXP7baVe4nvVS+72ZqDQQv4TzDgSo6+323N9teDJ7RXQ
	xmS7WoSah2GW2KHTXKFBIJrducyjlLa/6A26XgKmS4A60In3fzKLM7fNZkrUnItEa2p68j16pF6
	qZp4IgR7cpwMcXPpVjMytIHxxPQj6pu2tNS+oZEYlHfeQ/mCwZq80fbQ8yjB39dv5AwwKaeY/4q
	16l2xPMPBRusuSu6PlbfqgyX0JlCczihtLkdm9lUqXleXrHW3Pzcq5Ygy7GPADSccWRHM2Y2+j3
	GKsEI5j/Xhgb9G70XKlwBHSxUYLlGFpEp82s0jQ6RnCa2e1141fbY00q0AU4/hzZODGxC7R5SLn
	MD46N9LWSjmJf1ovb6ohHvF8+9nRuD4UltIuSrEcunCBfRF+X9+fz1Ia8HxyICPXg4X38byyeSP
	g6Qgm2Z10O
X-Received: by 2002:a05:6000:1ac7:b0:435:b7b9:a39a with SMTP id ffacd0b85a97d-435f3aaa47cmr20345211f8f.38.1770066843117;
        Mon, 02 Feb 2026 13:14:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 01/15] fontforge: patch CVE-2025-15279
Date: Mon,  2 Feb 2026 22:13:47 +0100
Message-ID: <20260202211401.1287664-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124074

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15279

Pick the patch that mentions this vulnerability ID explicitly.
Also, this patch has caused some regression - pick the patch also
that fixed that regression.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2025-15279-1.patch          | 41 +++++++++++++++++++
 .../fontforge/CVE-2025-15279-2.patch          | 34 +++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  4 +-
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
new file mode 100644
index 0000000000..91306c57c6
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
@@ -0,0 +1,41 @@
+From 545b5eedf2a6866aecc04102f2e0853089cb760e Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Thu, 8 Jan 2026 15:47:43 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Heap buffer overflow in BMP RLE
+ decompression (#5720)
+
+CVSS: 7.8 (High)
+ZDI-CAN-27517
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7d67700cf8888e0bb37b453ad54ed932c8587073]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 5a137e28a..133336787 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -181,12 +181,18 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 	int ii = 0;
+ 	while ( ii<head->height*head->width ) {
+ 	    int cnt = getc(file);
++	    if (cnt < 0 || ii + cnt > head->height * head->width) {
++		return 0;
++	    }
+ 	    if ( cnt!=0 ) {
+ 		int ch = getc(file);
+ 		while ( --cnt>=0 )
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
++		if (cnt < 0 || ii + cnt > head->height * head->width) {
++		    return 0;
++		}
+ 		if ( cnt>= 3 ) {
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
new file mode 100644
index 0000000000..8ef833ff63
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
@@ -0,0 +1,34 @@
+From 3bbdf6c7c161ff45d793e3bf5047720156e466ae Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Mon, 12 Jan 2026 22:45:16 +0100
+Subject: [PATCH] Fix CVE-2025-15279: Move bounds check inside cnt >= 3 block
+ (#5723)
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15279
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/720ea95020c964202928afd2e93b0f5fac11027e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gutils/gimagereadbmp.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gutils/gimagereadbmp.c b/gutils/gimagereadbmp.c
+index 133336787..ad365158c 100644
+--- a/gutils/gimagereadbmp.c
++++ b/gutils/gimagereadbmp.c
+@@ -190,10 +190,10 @@ static int readpixels(FILE *file,struct bmpheader *head) {
+ 		    head->byte_pixels[ii++] = ch;
+ 	    } else {
+ 		cnt = getc(file);
+-		if (cnt < 0 || ii + cnt > head->height * head->width) {
+-		    return 0;
+-		}
+ 		if ( cnt>= 3 ) {
++		    if (ii + cnt > head->height * head->width) {
++			return 0;
++		    }
+ 		    int odd = cnt&1;
+ 		    while ( --cnt>=0 )
+ 			head->byte_pixels[ii++] = getc(file);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index af77ec913e..901b289f11 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -21,7 +21,9 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
            file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
            file://CVE-2024-25081_CVE-2024-25082.patch \
-"
+           file://CVE-2025-15279-1.patch \
+           file://CVE-2025-15279-2.patch \
+           "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
 PACKAGECONFIG = "readline"

