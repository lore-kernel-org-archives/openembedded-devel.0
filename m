Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924BBC5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24494.1786747572859139360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gJS0/Jma;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322441a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747572; x=1787352372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBoTsjAa4jJqVr0LfNKA/rWeEf43LKJObuGqgJZOsds=;
        b=gJS0/JmaKlJStk8GsOWfGlRMWqZ8oTG98I1HT4mkXr2ZDaH+4CmzMEi3nMiCwibTTx
         RL5/V4poUfWLibc5wXNVjSkeN/2EgI3FT/do0AIXvCLnciKZtmszY9ltHD9KQenEUo61
         wdtucdGeagIlCjXCdJ9/amX7MLWlV5+uyMD2EdloR6MNDS344/0K6sGinjq0dhOMGmXp
         l72xeCbE30a2ER6fHh4xID05MtCy+sjZbDpn8rzmsXIcWwGzUvzkaxsyODs8GxI35ACA
         ykr6AiSHOnDAEDVQbNhuQdROexm3vOFwzrqKa0dNoBVuhuyinVU5ueBgFqDL3H8YNmUs
         gwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747572; x=1787352372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBoTsjAa4jJqVr0LfNKA/rWeEf43LKJObuGqgJZOsds=;
        b=CYz5o2dEIGXFrNTkLQLzvf07bFIn8dN2Wts2rGM2ze6QriOKHbG4F4q3u439suQB3A
         EH9En5ymJArtuKZ87uFtCXe1P+HxvxYD4Y4bxtk/4IBEQixppjKD4A3nJmxAjwI3J4bF
         KjCcn44v8LXiA18Xjn9nqYagEsQcE7f4YjdFWOSWTMfKx2gX2pHpG5jeJY/7LqRRvklP
         RWqN950KuqmCU3qZyrnwBd0CRVT+lx2bKCKxl//Qpo6T6Tc04JOSVGkbBLc8+N052Fgx
         N0wht5IQvO5x+N0M3WVP1W642dfLr/FV0hn7/qoif6OGQo4/2kK63M8DVudgv9BqNkOm
         7kzg==
X-Gm-Message-State: AOJu0YxHYHDil7ekVHID+0oFXsfg5G2gFzzWphiDrVJ5loC9+Xp4s68C
	YBVPLBnZgrDAAom2rwSxzaPGAlJVq67rRQfpge9wySKhxFNxVxb3Sz7+2PvN4ZBs
X-Gm-Gg: AR+sD10UnFNz/nFxJL7VRJzMVQhnMJwUPQ80ai25xMwJyYWJlXrxxfBwGTOVDCA0Vfr
	XR5r4bqUMQu/bBKtzuHYMxYLFFC5Rna4Z3BPkEOv1de63UYBFWq9ReHvjjk+R374h6vu4vhIGTP
	HAXvtyogdP57um+90d1vn3r5/YdwLvKEn9fz+BQVRI0v2WJLCAOuxuNA2PgPeKF0mMszRJu37sd
	4geIyV64PEbt1tRvMGkIKf7YolLKcCelGWFlUA4hDG+I5CPzQPZjnT6Xbt6TawDnntc8rknR5SL
	BkZcf5tALl6sAtxREzIgjCwSiHCWJjUHfvedtG9NH4pBjwfGnr+LKJ00f8Z3tWuDA7IJAQuLjbp
	K83auIfCxUIrjFbib0/dRVTjgcwYyjR8irFybEhNBKjpJftJx/VCRJYNv+zYuCnnub0NwKIXFSW
	sw61x6RcLTG+qJsiXWrTWmzy28dEK0OMGXxkcUpnTYZ22BtqrgG5v7lXqcxKhA2dPNZnl/28dzt
	d0E/9iV3VamEpCjkHx54oxYvuyaD0czuVvsrs3m8WW79S88Yi9zs+Bm/k6SzxINyJnQhh9DgA5f
	fRSzTZ/Gf7lCJfY5b8UhHrr0Mfb/09JMARXXvgqxSHdkZn9gOMUOXzQotVUBqIg+DS66s9X7UB4
	SSCyadqDEqfXIZg2c0X5kYcdX3/BbmuWlH4P/LJIP+SJW9Q==
X-Received: by 2002:a17:90b:1650:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3933b6f3882mr9638058a91.4.1786747572071;
        Fri, 14 Aug 2026 15:46:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 027/109] gtkmm4: upgrade 4.20.0 -> 4.22.0
Date: Fri, 14 Aug 2026 15:44:13 -0700
Message-ID: <20260814224539.1523174-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129091

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-gnome/gtk+/{gtkmm4_4.20.0.bb => gtkmm4_4.22.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.20.0.bb => gtkmm4_4.22.0.bb} (85%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb
similarity index 85%
rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb
index 4f1d30bcef..2f56d511a0 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833"
+SRC_URI[archive.sha256sum] = "2e8a21b4b0725f620e33aaee0cd343ed121b533275b632896619b1c89e96de67"
 
 EXTRA_OEMESON = "-Dbuild-demos=false"
 

