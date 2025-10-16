Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0661CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4055.1760606962273282179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PWgh9asn;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47114a40161so2819935e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760606961; x=1761211761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Trhv4x+ol06BIXVkNSzZMUCUVQ830dP7CDsUujlzym8=;
        b=PWgh9asnVJ9QbQBeaBsGQdutAxipYH3xyVJDM8pG75ejz0wE3olvp4PINpVHrItJ+p
         8nt77Xdeak+j04pgukV1MsOkVVAtWdjKETZbQdTsw5Uha1zvV+N3f564xR03vMXLiAfI
         lOG8SvnCXd1+elVWvb1CaVhh5pHAGlqX4AcVn5jRxuyf7TwhwyV3rELQJgJbaX92gv+L
         n9sfC9gn6G8BcirCN0BW2YVZPNkWpyGN1oRVAZfKrsw0ZbFlbqHlP1HU+tlIsmRzXCJ5
         xcCqXFvlFSaV3fRQsOIN0gFJAfogC/w0BF6jkwS/5KtrHeo3+7hJ7z1kFwUjip19fwHN
         fBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606961; x=1761211761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trhv4x+ol06BIXVkNSzZMUCUVQ830dP7CDsUujlzym8=;
        b=FuooKpW/0cOkjPh+fbZ0QFEp458EK6qDRJ5n2YUVGy7vInxIEp9B20w0QXVREntnR9
         euugZPBXF9EwLV8Q4RR+s5L5O5kNSbGN3tMrQe0VNz3WB3F3jpG68wbplzGtl6GvzyML
         Z56uezdmPcVP+SbJjyjHsb8yDx2edcKquLM0oBcsADpGrbLU7QSmqxnKZSEc4f0r2lP5
         AEbCCiTIHgvn1B8E21fucJgEVRROVVN/DKKxF6Ldw9IG2q23vN9DjFspQfmyu5JkqWCh
         8WLMMkMLR4mjISeF5n8vtuLKsj+VBl+bLpO0AcBMvMWIL4Gneb10DgkiYd3IZaIQ1MLg
         MMDQ==
X-Gm-Message-State: AOJu0YwCWh6SvrAYL2R70kWbC/4je4ydBdTCc0yheMwXy4wr9GgJMzaQ
	4AWkmG28NdF6UyHhfvl04T2hoIj0I24hfbrFY+coF563IEkzs/jFEAiLYt+wxQ==
X-Gm-Gg: ASbGncs2fH3j3bF11D9qHc3Gl6R1nqG78Yp/mIpgYplHhrsj4qkVCcw5sOxie5yyZI+
	JHd79CGczRw8+L09IimOIICbGu/uYlatLSgSxbk4A7zAoOMVNKDDjJKOqFq/+z4W+o/XzDBX9wm
	MCVHZve9Os9H5ycxWI9LEAtjboIwXlK5BGi28BJaPL2KUYcIJAfPuc6jsFBC/rlM4OLgMj+5CDF
	d0S6oPkgLzMrraEy9bV/dZmJP4ZLYnAKfUp5k5ofUL+SvQLBfEt8KQs28McOgWe5BT8Mv9bSrkV
	kEu9giIXIia5HRAq9RjUF91WVMSVMAkZqrEX5oPlLC2FwYgWZQ8lVef5RnNdlDZ7Qs9MXxeA9qO
	6aLBxR98NrpbvMGetYsJ87rCSjTede2JWw4+3qUG2qCxfBlNpTIpgrOZpJfNaoLD2l60WpneZuW
	qVcaTwpvdGCcyH2yTaeyA=
X-Google-Smtp-Source: AGHT+IEbADxOoDirg/VkBWoSdIf03WjNLCe3dk4kx0SXiyyqTxBpvqu9BDgN7n/2fxtPw0Nt8IlgJA==
X-Received: by 2002:a05:600c:354f:b0:471:12c2:2025 with SMTP id 5b1f17b1804b1-47112c22146mr13453565e9.32.1760606960561;
        Thu, 16 Oct 2025 02:29:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed9e7d7sm16819345e9.3.2025.10.16.02.29.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:29:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] faad2: patch CVE-2021-32278
Date: Thu, 16 Oct 2025 11:29:17 +0200
Message-ID: <20251016092917.1946972-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016092917.1946972-1-skandigraun@gmail.com>
References: <20251016092917.1946972-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120726

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32278

Pick the patch that is marked to revolve the issue linked in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Check-return-value-of-ltp_data.patch | 31 +++++++++++++++++++
 .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_data.patch

diff --git a/meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_data.patch b/meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_data.patch
new file mode 100644
index 0000000000..3cd72baf79
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/0001-Check-return-value-of-ltp_data.patch
@@ -0,0 +1,31 @@
+From 4f8a793807d57d6a28aac3ab73ba0992efd5d828 Mon Sep 17 00:00:00 2001
+From: Andrew Wesie <awesie@gmail.com>
+Date: Mon, 5 Oct 2020 00:33:44 -0500
+Subject: [PATCH] Check return value of ltp_data.
+
+Fixes #62.
+
+CVE: CVE-2021-32278
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/e19a5e491354e0e4664d02b796dacee28fb2521e]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfaad/syntax.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libfaad/syntax.c b/libfaad/syntax.c
+index 462ba9e..4e57efd 100644
+--- a/libfaad/syntax.c
++++ b/libfaad/syntax.c
+@@ -872,7 +872,10 @@ static uint8_t ics_info(NeAACDecStruct *hDecoder, ic_stream *ics, bitfile *ld,
+                     if ((ics->ltp.data_present = faad_get1bit(ld
+                         DEBUGVAR(1,50,"ics_info(): ltp.data_present"))) & 1)
+                     {
+-                        ltp_data(hDecoder, ics, &(ics->ltp), ld);
++                        if ((retval = ltp_data(hDecoder, ics, &(ics->ltp), ld)) > 0)
++                        {
++                            return retval;
++                        }
+                     }
+                 }
+ #endif
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
index 731600205a..f354c99d33 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
            file://0001-fix-heap-buffer-overflow-in-mp4read.c.patch \
            file://0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch \
            file://0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch \
+           file://0001-Check-return-value-of-ltp_data.patch \
            "
 SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
 SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"

