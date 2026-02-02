Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47971E7317A
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:50:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52875.1770040249195855365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gBuXDA17;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so49679665e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 05:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040247; x=1770645047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGORD5HJR/e2ibKZmVj+XjsS0RuOFVUClM390eoGkc0=;
        b=gBuXDA17yEIrFv+/1RGDcEMcb0aHPDa+z23WRT1a069h1BbW1XEAYM4lIQAi+JibPQ
         mR0CyuyI2J5JJxVgGyyZ8VH+XjxLkXFcJa/E2QvJjJK/FNROdOYPJxcbNaYwRzi18jV7
         5COs4CmcUqu2MCpoXGID2KswJw5Jy1EJoZ8C3340fWI2tJ7edb5wXwIYYKwYxeiGtqBa
         8slRLyLYqqRY+blYWvLt0apixbweodCrk/vqeo6KCS33dN8ny4qqyUh35GI7vg45gM1G
         B8K29KSdn9ADMSUPip7p4kiWYqfGaWU9D5dZGaiVVYrso9jrx1PZBjklh6yxvbg3mceF
         +HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040247; x=1770645047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGORD5HJR/e2ibKZmVj+XjsS0RuOFVUClM390eoGkc0=;
        b=nNgzW8FZxgL5tf5EZYXa8LrirXBQxU0059ubnMNkQCMXrGtfGEZvYfd1DPvcWQs3tk
         smxQPQ/hI5vkiThBe14JestjS1bFqaO78f7jK8PUArBjEiHggXvAARX971AEzMSirbp1
         kr07S296SQwcIxoZdk2mnhtM1CCaa/QP3dVnzK6EoehIA2dbvhhWLKvtjm1CdSBttLlT
         FgGth9h1QYlcKw5J+ZOs97QoLpCojQgRyW5wwzSVtgMe+/6cTlhM9sO0opZHVydnrxmx
         ZMkY2FvFjJA2Xl7izzs5rFHEnB2Chr+ZERvNdnamOkjBGQT8Kj19h6CQF8DjTO76A78F
         dINA==
X-Gm-Message-State: AOJu0YwXKYupdHWsreQqpqKjrFrp41LknI7Cco4uzG+ATMHGdI1kaYYB
	i//UjjSNTEEipC4iiH4dbLwKZkT5SkiZN6vCNlHeiy7Q52YVXaBKyAvoe6y82Q==
X-Gm-Gg: AZuq6aI/uw56BoakF2XOPb75KaH87ciG2bFeZh+7JoFuvQIFRahBCr14eU3hDxqErck
	6wBq46/39zWOCP5evluUVh5Orjkl9nzuMzIsCjmJmAcGSx23bifNPCgTeXPMCg35Utaj/aZHo9t
	I4eC4nynX6hwTXfjTwmBpRym1zXiREl8RiDZ1u8m9XRJPtPF8iA5Twci1A7mPM3csJWA2eHqKmA
	Xna1s/xesPRLyjmi79wO/1sSa0BpTGFYnCik03UUggT74/4cqNxOTq8yHWCVd+jBaGHuayDx/y2
	HIxd8r50oDKOmGI0BLHtXz7vJ8HP7vHpvB4mgXYGi/82G3fsgueVLcG2bCrxazNYnxCYIBe2jD0
	4qDQv2mbcoN0ankL1hLYQ+mjlJtJl53XsPzLNaGy0Bc8M5bCja70r6Ox6i6kPOkqQlph2X+k/7a
	fDxkCeqLYN
X-Received: by 2002:a05:6000:240c:b0:433:42d1:f71f with SMTP id ffacd0b85a97d-435f3aa79f3mr16672016f8f.38.1770040247506;
        Mon, 02 Feb 2026 05:50:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4360ef9e804sm2843518f8f.41.2026.02.02.05.50.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:50:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] fontforge: patch CVE-2025-15270
Date: Mon,  2 Feb 2026 14:50:44 +0100
Message-ID: <20260202135045.1476359-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202135045.1476359-1-skandigraun@gmail.com>
References: <20260202135045.1476359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124060

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15270

Pick the patch that mentions this vulnerbaility explicitly
in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15270.patch  | 45 +++++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
new file mode 100644
index 0000000000..2ff0fd0b08
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
@@ -0,0 +1,45 @@
+From 99067ccd695619686646905e637993f0654abb41 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 31 Jan 2026 21:23:41 +0100
+Subject: [PATCH] Fix CVE-2025-15270: Heap buffer overflow in SFD kern class
+ parsing (#5743)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
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
+index be4220515..d550f02fb 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -8147,6 +8147,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
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
+@@ -8164,6 +8168,10 @@ bool SFD_GetFontMetaData( FILE *sfd,
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
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index cc45740153..8d65f69354 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
            file://CVE-2025-15269.patch \
+           file://CVE-2025-15270.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

