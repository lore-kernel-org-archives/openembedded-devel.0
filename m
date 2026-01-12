Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14936C9EC77
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30753.1768216821237687850
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 03:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwaNOFPr;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so50105245e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768216820; x=1768821620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC3Zorj5HvFzCgnZy23j+jtdnsKWZDOf8aCId+bCR2E=;
        b=EwaNOFPrQp5GAfeVWuBd0A/tzBw90NOVwMAT3JtYQZePp7fPmg79zbO0Z/zAN45tZk
         F6tkkjChY4GlkKCs8uEiN3IDNjmV0KzRk1i1iPii7Uw+cEjhqg9TqdmdAuACU5jPO4uK
         i2erXfwueahVOcdd89jzqL6uiBz9y3+0ZeF4tk0ADmdCtacZqmJLR+HlXXyhRrDCnnXI
         Tr047Ot2SIlUGkQgRGch38HLuLktp9963kNR3TJQ8591Zu7EmahVLZsPbowYmmkW+J+R
         F4n28zxoLGpiTwkwjOPv+SuDza6cPnKke0t0mpwMMRLaX6aCPoovQTlK6z7grj4AG+EP
         b5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216820; x=1768821620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mC3Zorj5HvFzCgnZy23j+jtdnsKWZDOf8aCId+bCR2E=;
        b=qZ0xorjCZc9oMtgn92dZe7DD7/jm6B+FgvgpCkN8TLyKgbV8XyHmqdmIrc/nUyIjT5
         PaaaqpZJaaciR+r018HIH1SHh/Flp8u+hE6cDishwmzRhBodbxG3q71230Mvt86NeR5e
         VyibgLfMK6v5/gQApKSHBymUlQQrGuJQnDDrpNK1DVpKmASgrGkC4nE0KU1IMQchm8pK
         tgp81Wy6XJR9GJqW1wabnQcVwMyFdDRPVqX4W7B22rN8pB84X80rcZBBpd8jqXl9eUj/
         huuNkpQJQaGY2GYu61CJEbJy4Y+XK2u0pr1FW/VrwrahzS/bzCI7370/UMRc7UIrtQoi
         3K1g==
X-Gm-Message-State: AOJu0Yx7i7Ux+DaznSTBRWf47ssH4kfEndVTbCYcsvy0aECa1Tzxn9Yk
	2jjb5/rq9unO9h8F4hyZHxoiBhUuZL8JPqax0OF+C11VQC2GWEDyHgeoxazAAw==
X-Gm-Gg: AY/fxX4t5e3uQtUQ4PVEyLNwZY0jJuGOjpYkuUwz3WU3rSqf6c/G4rZHTtTovDfeuTA
	kX/Jc7adhk/elo/52SM+3wVd5dl5nblMeR9DJv3+EZL2smrEinCvbp/f94wnC5+q4bAN2oi4m5E
	DurXdEbFgRgoAPiDE8U3v1RfBZwly1eb22mNGCkjnQ7QJiX+gvx3YPD31hgKEmtbUnFIBmQWEZs
	2zYR3xGXY9WXAk/OFSTE8B0xxh+VsKSMhT/Yb3hsZeKEjw2YfXwHw/FmJ3uqOxUJeGVlG+za1xq
	DzHvfIQXJoyJIEqbELZUcWLUg3zGhzBPh62d1R6/vPCDxa3aRFBKabhv+Pk2y2IlpBCJbMOdfLv
	zVIsa553j9WS+ikIUlqz2x1XuirjK2cUVTp6sh0cAq8iPeKxmAUfZC8GbVCnlsVxI4Dr/Ik5L+v
	uBLyl8+KnAKO+9rfvxPAc=
X-Google-Smtp-Source: AGHT+IFuah87ypyR1nr1hdgD4wKBh3vntjriLfu+lDiytC5shhhwmNId1/M2NhXNdy9NAMakslMmGg==
X-Received: by 2002:a05:600c:1d0c:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47d84b1fcf9mr188632945e9.14.1768216819420;
        Mon, 12 Jan 2026 03:20:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f695225sm351382935e9.4.2026.01.12.03.20.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:20:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] raptor2: patch CVE-2020-25713
Date: Mon, 12 Jan 2026 12:20:13 +0100
Message-ID: <20260112112016.515266-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112112016.515266-1-skandigraun@gmail.com>
References: <20260112112016.515266-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 11:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123378

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-25713

Pick the git cmmit that is mentioned as a solution in the related bug[1]
from the NVD advisory.

[1]: https://bugs.librdf.org/mantis/view.php?id=650

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/files/CVE-2020-25713.patch        | 33 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.15.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/files/CVE-2020-25713.patch

diff --git a/meta-oe/recipes-support/raptor2/files/CVE-2020-25713.patch b/meta-oe/recipes-support/raptor2/files/CVE-2020-25713.patch
new file mode 100644
index 0000000000..a2694135e2
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/files/CVE-2020-25713.patch
@@ -0,0 +1,33 @@
+From 00fa124e379fab85217ac62bdd0feddfd9510ae5 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Sat, 18 Sep 2021 17:40:00 -0700
+Subject: [PATCH] XML Writer : compare namespace declarations correctly
+
+Apply patch from
+0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
+that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
+which overwrote heap during XML writing in parse type literal
+content.  This was detected with clang asan.
+
+Thanks to Michael Stahl / mst2 for the fix.
+
+CVE: CVE-2020-25713
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_xml_writer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
+index 0d3a36a..17b1c44 100644
+--- a/src/raptor_xml_writer.c
++++ b/src/raptor_xml_writer.c
+@@ -221,7 +221,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+           
+           /* check it wasn't an earlier declaration too */
+           for(j = 0; j < nspace_declarations_count; j++)
+-            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
++            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
+               declare_me = 0;
+               break;
+             }
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
index 193cf13b21..7ee097b6ce 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
@@ -12,6 +12,7 @@ DEPENDS = "libxml2 libxslt curl yajl"
 SRC_URI = "http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
            file://0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch \
            file://CVE-2017-18926.patch \
+           file://CVE-2020-25713.patch \
            "
 SRC_URI[md5sum] = "a39f6c07ddb20d7dd2ff1f95fa21e2cd"
 SRC_URI[sha256sum] = "ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed"

