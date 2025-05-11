Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25146C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 00:38:42 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.21485.1746923920178687288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 May 2025 17:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMPm10oF;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e78f44034ffso2809931276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 17:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746923919; x=1747528719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECMfhkEKghgzbAjmXd8JW7N5t503JC0zLd0Ozh2nRL0=;
        b=FMPm10oFv9OhHhciGFmk4xc7QQzPl0NTekotJs4wwLxmgIruOgNPoMEoZdbUHChmeA
         niD9ogTJgPhMerVd0FhSNLLAAR3V5o5ZzmfgUNTRAOnQskvSoDmMBE59MEVhzUIxcuD9
         lYxdUJhSwU+1bzu/a2/7Gq5ZKz1frqARnndLYOIUlDWqh/pQuUY2mRf0VM5WIWkQggwP
         byL2KhiN6m/Gy0sAZOT44WO33LpN/XCAP/5ACFFpFw6mD3QaUdV3SlnrTsXlIFs6K6WX
         t38k2CI2B4bN4WZITGOMqYSnkHFUYfkdv69+ZGDmN6d89TREMKMbmvxESHLW+CS7JcHJ
         tHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746923919; x=1747528719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECMfhkEKghgzbAjmXd8JW7N5t503JC0zLd0Ozh2nRL0=;
        b=UxsfQjo5T1bqa2k00KG5v5S61pH6viZ23qtCiAwGW7FltGipTsN2t7z58RgFsEIc63
         gQUoXobRFHm3djNKoMdLRD0bz4nLHdjjQ5NmWlhcAlJ9AOE5+F8Rsv5GgsjyOLPGEjRz
         q/ApeGCCS1on6DvrELv0vI1fW5V7xLg31XDy8ZI/jwHDeN2uQrmuXUF1VYOew76fTC1U
         zpOl3My4c+00xyB2kExs+9wpX3AaAe7LmvsOetYxkGkdU2tNEechmMXB8oPW+Ink30Vc
         4v8EJXtDNI4Mq3RHcXTEMkvwsoqLmah9EDPcsuH6BH14DxGOjcAnYL02a/dcCcljSK/A
         IYdw==
X-Gm-Message-State: AOJu0YyGhGn+ft5bSoNbKuQlvCkor2vHY9rJHh3fr+pv670CXch0wEiI
	VNwp9xBltz8HYqzVJ8vXM+HTi3+/Qn499cBkduyZIzcNIf1kwPMdxm+tOTa+
X-Gm-Gg: ASbGncuwEM4Vvmi95niWvsuE28S8rSzPBFW0YL9FKEZ0VGfJSCxvqBbXyZpubnMziic
	FrYhe691XNhGqgA6q9u1cnL4NcOPvWhaMpxgzlknfoFAh8Hrzrsh5wSkb/PvqlqEqeBEZQVenf/
	3x/wCcSozLvR+uNZ3w2UD2jxVviVpddutyxBKE4yAEBAR3ELGtqemyoslK4z2SEOLWdh+mCVPOz
	+6zYUIBd3/pYhwzgZ0DYz215/uKNLL40+KzBU1nOnkvZ07R5ZyCnwWLnHly3Bb9yRknxf/UbwjQ
	UMuWoEkvjCxPIN8uChG4301AiKCSttOxCvVO2fnWRzNsC7i6ct0XaHnv
X-Google-Smtp-Source: AGHT+IGZOdVGhvLJWkNwYVnDzeyRcN1YkITO4cwEzQkGlRlG2v3jelD0A/RKbC7ajBlv2OT2NAufPw==
X-Received: by 2002:a05:6902:2192:b0:e78:eb00:babc with SMTP id 3f1490d57ef6-e78fdc65792mr10019747276.26.1746923918552;
        Sat, 10 May 2025 17:38:38 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e78fd4fd16fsm1350652276.28.2025.05.10.17.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 17:38:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-settings: upgrade 4.20.0 -> 4.20.1
Date: Sat, 10 May 2025 20:38:18 -0400
Message-ID: <20250511003819.3128-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 00:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117381

Drop unnecessary CFLAGS.

Changelog: https://gitlab.xfce.org/xfce/xfce4-settings/-/tags/xfce4-settings-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-settings_4.20.0.bb => xfce4-settings_4.20.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.0.bb => xfce4-settings_4.20.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
index 76ce27cc96..353ea9ed81 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
@@ -8,9 +8,8 @@ inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "23548da3429a296501fbfdbc98a861ee241b9fdd47e8d5de1781f57c6bbce5a9"
+SRC_URI[sha256sum] = "fd0d602853ea75d94024e5baae2d2bf5ca8f8aa4dad7bfd5d08f9ff8afee77b2"
 
-CFLAGS += " -Wno-deprecated-declarations -Wno-implicit-function-declaration"
 EXTRA_OECONF += " \
     GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
     --enable-maintainer-mode --disable-debug \
-- 
2.43.0


