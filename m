Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AA0E7FDE2
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1610.1770066846854595582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fx34pKk9;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435a517be33so2946884f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066845; x=1770671645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Isj4Dezs4JgU1kV6mcSXbCjMM4UQE6LZ/4cM5K4raAY=;
        b=Fx34pKk9D9Hxj/I55c0vLU2L1ZqFRjGHHwU5znCTdvwpv+lb6gvAJpaB/VFsjBuW6N
         EdCyhTUKcloHziXJ95BDKtAeyzHxqZNYKOvHaA1UkMSGeDULkVFMp0iGKKmetWeGh9vK
         yRNVEQZ1MqAHM3pJumZfiVofB4xcDmD6fykGoZQqIeK04/0U1n9tFzkErcRh23TCy5zr
         +IbYKNXXpVncWUSJpTEz89tuGWmctUtVUlvu8XyCScAA0gNIW4B8J745OnvltXP3oLp8
         oEKq3XQV1Y8rS0yeZu0R3Zhj9jOwp1mjU3CY2LDHFuwK2W1VgSu6Pbob9jxE2ZBxYQD9
         SL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066845; x=1770671645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Isj4Dezs4JgU1kV6mcSXbCjMM4UQE6LZ/4cM5K4raAY=;
        b=bx5d3UUP2KUgryGrKTeBWmt78tMi0zzwdsPXRAqJFXA3TBZpqA63SvCDfWvP0M1d2T
         xFEA1Y1FGcAPUy5xi5q/cR4lPwLCEYLF4HJ5kD0XXiU3q+XVll3wA+KvhXl4JbnlQfDG
         LpKaE6GfomjZZG25btaSK9K6jtgDE9GzxdX5ELAbMoD+7CaIXDqWP4jjgtoVFPMMf1Fw
         gD4yXl6o61G2A4W7YWe79uY3DjxtN3ki1tEa0HGL20NUgdiq8AiZXWTqg5YmjtQHv2ez
         NVnw2CHVu1IEKTXKjfKaS0DY+cmFmERCVPradUNaC+pL1O7DluHmwZkaCJCfng9woPtC
         5FNw==
X-Gm-Message-State: AOJu0Yy6v3hwxrxzuogRnlGOYHC09V5zH+kBRW1YERU3+L77Hh+Cvd39
	62C4gsjP7CXL+AhbOBdVWvYUGHXYKkIz0W3zbKBWMKzL01dsbg9HbOMfkzjeMg==
X-Gm-Gg: AZuq6aKiRIZRQx2aI3T0YHFFg0XP0Ukm0tTJds0NyV3OBr/3ecWGi3pvb8tNgB4tm0m
	FvwNT8BGIAJ0q3i/dO3pdjwyoYXqqlCcRvb/9WXA4A+HwAU75XprBsGPuOo7rMDWOyl4oOxzAl0
	FVvSCyXU0Dgc0thYr3kPsm5aIYu5EXlo3N3rfTGoKXe4Cic0/UceccXfVJ8fbx+b/6yrQYMlyPD
	8XV+Vc+ibE2N3seHRijJDITLE2RlsIOp4CztL5YcUJwd9xvI0FubS3bi9XhkJhRP83IPnwYOQec
	2+E7IzERxYjvd6bPa3bsOm6z1KJHpVayfKviM514XoyZ8jOcRhVNRAtXl7TYv1bRxWEL1l5XgI9
	7GZfoeoX/aiKNdJteqAXX2VefRvuSaY9KBSzdE2gfkBjO5iwRVl0LCpVsqOWgCqYIqGAtI2ss6m
	aGFCnGrSVq
X-Received: by 2002:a5d:5d09:0:b0:430:f742:fbc7 with SMTP id ffacd0b85a97d-435f3a73d06mr20721751f8f.14.1770066845083;
        Mon, 02 Feb 2026 13:14:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 04/15] fontforge: patch CVE-2025-15270
Date: Mon,  2 Feb 2026 22:13:50 +0100
Message-ID: <20260202211401.1287664-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124077

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15270

Pick the patch that mentions this vulnerbaility explicitly
in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15270.patch  | 44 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
new file mode 100644
index 0000000000..335aa3f9a2
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
@@ -0,0 +1,44 @@
+From 647e17c1313b0be5159616e4345e6007e1f377a5 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Sat, 31 Jan 2026 21:23:41 +0100
+Subject: [PATCH] Fix CVE-2025-15270: Heap buffer overflow in SFD kern class
+ parsing (#5743)
+
+Fixes: CVE-2025-15270 | ZDI-25-1194 | ZDI-CAN-28563
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15270
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/d01333a5bfa2ac4ed698c24b323d02107deacad7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 894176254..3692973fe 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -8286,6 +8286,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=classstart; i<kc->first_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->firsts[i] = malloc(temp+1); kc->firsts[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->firsts[i],1,temp,sfd);
+@@ -8303,6 +8307,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	for ( i=1; i<kc->second_cnt; ++i ) {
+ 	  if (kernclassversion < 3) {
+ 	    getint(sfd,&temp);
++	    if (temp < 0) {
++	      LogError(_("Corrupted SFD file: Invalid kern class name length %d. Aborting load."), temp);
++	      return false;
++	    }
+ 	    kc->seconds[i] = malloc(temp+1); kc->seconds[i][temp] = '\0';
+ 	    nlgetc(sfd);	/* skip space */
+ 	    fread(kc->seconds[i],1,temp,sfd);
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 7db8a66654..72d233fe0c 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
            file://CVE-2025-15269.patch \
+           file://CVE-2025-15270.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

