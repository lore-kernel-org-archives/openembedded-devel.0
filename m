Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9268BCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:25:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6238.1762457138533168837
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ism4B5Wi;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427007b1fe5so857761f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762457137; x=1763061937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDsmfcYhcKUvGTRuTqeiVJyU33X+xqvTz6lVGpwRhms=;
        b=Ism4B5WibqGCV6gEwsnFhuC/5LNmsJeCw4icZNy0MA4ICyNSgAVNtPQyn7x0NPBPLW
         kZ6pn2oecQ7RA0B4oiJ9mhhsz16DRX67svWIHktW5v6KLlqp93T+YjaPJI1Q0xPikkJG
         nIIy/mT0bybjttPVh7x6LBJdNlMsjYypoe8kIGgMg6YvEbWaPLzQl5mZCOls38WspzzL
         Mym9kAhlS882U70vUDQ+H0rnlu+fUdu4nWJYaQlEq4JuZfxioOUsjCjMWlv3UY6TZm0V
         yorj+rmE/le9XTgZrB141WyQuz/00yM2aKVFbxYvEtmDGtJmbjlrvm8PZ54rKgorFJgw
         RZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762457137; x=1763061937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDsmfcYhcKUvGTRuTqeiVJyU33X+xqvTz6lVGpwRhms=;
        b=rgYhuQDDbnsWgpT7UHJnWH083RtM4WZAXdbj+W/ibiASVedRuF8YChE8FJ4RzatClx
         pAl4WytXcTHuOoRwjC4cziItUQIHM7devpe/EXpnmz2ND7I0CVP6IfTf5xUCQshCgY0P
         MoxAhK5SiEreG1S+nZYBOLBO6b/qS9BFfEOHzh5KPIs8aTdLzMuAEoPHi/91kPEc0iTr
         QkiRhkqqX+/0hvKQPk9h1bihaKK9R2vLMU5jLNglDz04APw6XsxZtMz//Sv/wVFRJrB9
         AJ9IaSF1iukaP263lnPiO/6XXuToEIORWWs0WVB+vCvaSn7Hnlti1oqmtSz6zmO9SLGt
         lfaw==
X-Gm-Message-State: AOJu0Yw1B8MN65iFnZaP9vetfBRDLCWO67sP1p9D68OwnKwcLnqxcYtK
	wnu9rShECJGND4PbLPcHN7Cv4FfOtPaapDeqnTbcb8RUeQkiVUXEvt5mMcN9v5h/
X-Gm-Gg: ASbGncunZ96MiGUWrR4fI316kHSBPtxeQZu+Y4pFCt9IoRhG+FyDq4KQGSS40ZPExMH
	PnV+LwCFZiAn1Oyqnb7zPstphU7s2qKao5e9neKwxcdvty6K2WW/IJcz52jrz4o5JAbNylVqd6b
	GURpHGR4fS0jJBnV2HMOm541O5C3RZ28zbXJ4jtr3Lfur+21G15e0Y2zDQ7LQnXEkG1M718vbfq
	1jcOBQTWJ2Y5J527hS11GTU52JbsZl6mnxNhyc698NoROZLby9/slVt3ceK+E7gPUdyn20FkmKO
	zKlEYonhZ7mrikpsCSY8LsEDVSwuTmzCBqC9m/4YHfkChAnCC31gyr06UDMaPkUWs2vPaP1W4qD
	DIl4eeYQVPOXnZsCWXb7nbOGM0XQLqb6xA6b9OipzmYbJz1g0QoOZdK5ZVu3FkZ00CzZAIY8upw
	==
X-Google-Smtp-Source: AGHT+IGDrG9wOuRyOwuCGsXasqQkzc18HkC5R909YUXGRNv5T6+O2GF4dunQpqVntDabeQET0J3ivQ==
X-Received: by 2002:a05:6000:1786:b0:429:d437:cdf3 with SMTP id ffacd0b85a97d-42ae5afbd20mr245371f8f.34.1762457136566;
        Thu, 06 Nov 2025 11:25:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b28asm777789f8f.6.2025.11.06.11.25.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:25:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/2] gimp: patch CVE-2022-30067
Date: Thu,  6 Nov 2025 20:25:34 +0100
Message-ID: <20251106192535.2538484-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 19:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121365

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-30067

Pick patch that resolved the issue mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2022-30067.patch            | 64 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |  4 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch
new file mode 100644
index 0000000000..fca1d16ac9
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2022-30067.patch
@@ -0,0 +1,64 @@
+From ba698607ab24905d5e7fca24c11f6413c886a2a2 Mon Sep 17 00:00:00 2001
+From: Jacob Boerema <jgboerema@gmail.com>
+Date: Fri, 29 Apr 2022 16:40:32 -0400
+Subject: [PATCH] app: fix #8120 GIMP 2.10.30 crashed when allocate large
+ memory
+
+GIMP could crash if the information regarding old path properties read
+from XCF was incorrect. It did not check if xcf_old_path succeeded and
+kept trying to load more paths even if the last one failed to load.
+
+Instead we now stop loading paths as soon as that function fails.
+In case we have a failure here we also try to skip to the next property
+based on the size of the path property, in hopes that the only problem
+was this property.
+
+(cherry picked from commit 4f99f1fcfd892ead19831b5adcd38a99d71214b6)
+
+CVE: CVE-2022-30067
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/8cd6d05232795ac31076013db1c6be3dc67e8e09]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ app/xcf/xcf-load.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/app/xcf/xcf-load.c b/app/xcf/xcf-load.c
+index fe28d28..a178e40 100644
+--- a/app/xcf/xcf-load.c
++++ b/app/xcf/xcf-load.c
+@@ -1052,7 +1052,12 @@ xcf_load_image_props (XcfInfo   *info,
+           break;
+ 
+         case PROP_PATHS:
+-          xcf_load_old_paths (info, image);
++          {
++            goffset base = info->cp;
++
++            if (! xcf_load_old_paths (info, image))
++              xcf_seek_pos (info, base + prop_size, NULL);
++          }
+           break;
+ 
+         case PROP_USER_UNIT:
+@@ -2720,8 +2725,11 @@ xcf_load_old_paths (XcfInfo   *info,
+   xcf_read_int32 (info, &last_selected_row, 1);
+   xcf_read_int32 (info, &num_paths,         1);
+ 
++  GIMP_LOG (XCF, "Number of old paths: %u", num_paths);
++
+   while (num_paths-- > 0)
+-    xcf_load_old_path (info, image);
++    if (! xcf_load_old_path (info, image))
++      return FALSE;
+ 
+   active_vectors =
+     GIMP_VECTORS (gimp_container_get_child_by_index (gimp_image_get_vectors (image),
+@@ -2772,7 +2780,7 @@ xcf_load_old_path (XcfInfo   *info,
+     }
+   else if (version != 1)
+     {
+-      g_printerr ("Unknown path type. Possibly corrupt XCF file");
++      g_printerr ("Unknown path type (version: %u). Possibly corrupt XCF file.\n", version);
+ 
+       return FALSE;
+     }
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index a24fa993cf..3f3e56f6ec 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -43,7 +43,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
+           file://CVE-2022-30067.patch \
+           "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 
 EXTRA_OECONF = "--disable-python \

