Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA62ACED27B
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9418.1763461894375222379
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gthgNhJP;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632d9326so36126465e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461893; x=1764066693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8E5G/WXZrknHdgrVwEPbggNc2daDaBxr15FVhUMAACQ=;
        b=gthgNhJP/IMIeD7/eI0y6k4kaBm22rpw/xc7yQMZlYpbuiDNlpbciuQ0tYPIxSpSzp
         8KrmP1SaC7pKuZkqZ7yVyuI0HGcFwntrLhv0gVRmeJqrXCJ7gvBgV0uEF6677f+iTWmv
         jZy9WZeCS/PLVahDNhJ3KQqVkmeiOwNUH71iuHT24wLzZd6KD8WDzMKr9cuJHk2dgWNy
         Ijshlnz1holq5nI4JsR/d5L/YoP5Ra+siXWtpW5oF2gRxqPjTJdtQulo6A0q6lzmqKGj
         O49z3DOl4XwzogO+RVTqk1JdOO3mKABOVIdNlwRgYD0bsI2z/57VB/wHmb61WbaUH3Nm
         6Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461893; x=1764066693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8E5G/WXZrknHdgrVwEPbggNc2daDaBxr15FVhUMAACQ=;
        b=JiGrhpkGiSuONJrr+z2g6Orn6iUdcyYquD6yy+dH/WgtHz0IvwJbuhA3Pj0w/gXEJv
         YWFxmZnLdn92nCZtBnVYjrgyrpFFTIE+OVyaSOi56IYMFX1ne5/Sjr7/HAh2Si/TVfty
         pEa50EEALVCWbSh18ybnH1g/OvkEc+2jDwn1iggfckr9fjP5pdJLmj05MpbFTDb82SxY
         zYXZ3zSNRvLkmoedFmI5gxbireGT1I8Oxt4doqp0yp8RXhxSggdHNeYJTabonRkA10pH
         7u2kJGBftPjp70tbbiCXLygKGUtrWnI2ELYAzQvAnanhmUBgcvyswENsFB94eNvzUZ9b
         F7xw==
X-Gm-Message-State: AOJu0Yx8/1GFF6JwbjG3PotmqQOBIt3pf9FPFX+/ybWGFgc1u7eTPr07
	w+9B5X9N0AAsKkgl3d9H7WVxKC14Jw3KQXZMcHG1IzOo10Ubnx/92MmKVBqw14Zn
X-Gm-Gg: ASbGncsrqDplHqDR9oHgCjAaFgNCBGt5rs7A37fKX7IlZwtUlPGphVYgZtl09QtMSfZ
	sZRX48UXGznh7Vx+rVH/WXTDvP63DY3WPbE10aJ4D5RxpQ7jX6NWh0C/qht5SItI+RWnyvPA7a9
	hw4c2Nm0SapoZYMcMBI0swx3TiUDtDWHmCa6HmQ/TzmjXutM2EEMIypOEfCv1dXNwB0DBd2nK8z
	ZoztpZMq3Dq7TeT2p0Rvc+99LC8zt/NLDrKbzq81Y7qSSugQQymuYB4Ki8JOaNbONOZhOcM9bF8
	y1FvhLCP/6pDhi0hxMBIJWHDuUDZJggyueGjbaiMnlX2Xe6KN9xDhwpp+yZ0FiiGE3O5TJUksFA
	5WTsm/x09HeCzaL8Oh3nAqGTMicr8aZsMO8jfsCQtCpY/zbDQJHbEKlrdGVCK5z2koW0YlrFgsh
	8CXL0Ib9HN
X-Google-Smtp-Source: AGHT+IG7omhLzo/tLwYy/fID3YhN+nkTT+4tjLK18fDHjiZNvoY5QXZ8yVEUgkUGgsaVl5CVg0MDZA==
X-Received: by 2002:a05:600c:1986:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-4778fea7037mr140631085e9.27.1763461892573;
        Tue, 18 Nov 2025 02:31:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/6] libwmf: patch CVE-2015-4695
Date: Tue, 18 Nov 2025 11:31:26 +0100
Message-ID: <20251118103128.1471091-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118103128.1471091-1-skandigraun@gmail.com>
References: <20251118103128.1471091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121846

From: Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-4695

Pick the commit that explicitly mentions the vulnerability ID.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2015-4695.patch         | 70 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
new file mode 100644
index 0000000000..fe6163af3e
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4695.patch
@@ -0,0 +1,70 @@
+From 7a7f58c0ebb84b9a3c44c875a667ce8ba191b325 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 13:59:37 +0100
+Subject: [PATCH] CVE-2015-4695
+
+CVE: CVE-2015-4695
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/b5ae5d1f3bbddf051a5c9dd01897bd835817f013]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player/meta.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/player/meta.h b/src/player/meta.h
+index 252e68b..3e13688 100644
+--- a/src/player/meta.h
++++ b/src/player/meta.h
+@@ -1565,7 +1565,7 @@ static int meta_rgn_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -2142,7 +2142,7 @@ static int meta_dib_brush (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlist
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3067,7 +3067,7 @@ static int meta_pen_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3181,7 +3181,7 @@ static int meta_brush_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrl
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3288,7 +3288,7 @@ static int meta_font_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrli
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
+@@ -3396,7 +3396,7 @@ static int meta_palette_create (wmfAPI* API,wmfRecord* Record,wmfAttributes* att
+ 	objects = P->objects;
+ 
+ 	i = 0;
+-	while (objects[i].type && (i < NUM_OBJECTS (API))) i++;
++	while ((i < NUM_OBJECTS (API)) && objects[i].type) i++;
+ 
+ 	if (i == NUM_OBJECTS (API))
+ 	{	WMF_ERROR (API,"Object out of range!");
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index bea9ed6dc8..364bf4b022 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://libwmf-0.2.8.4-useafterfree.patch \
            file://0001-configure-use-pkg-config-for-freetype.patch \
            file://CVE-2015-0848-CVE-2015-4588.patch \
+           file://CVE-2015-4695.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"

