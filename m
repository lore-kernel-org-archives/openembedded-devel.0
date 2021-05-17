Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.19749.1621261518452348308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bWIaNdUm;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id b13so1317168pfv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/4jxMolEMgWH2UaLzTwX0/DhwV+TdK421Ylr4zt3aO4=;
        b=bWIaNdUmhGuDhZThSvvqeHhqyI6stHTZAinw+3Tbaan/Q5Yg41XWKgwPlstUAPfXxR
         5BsbwGTJmOlC8YJg90iQ0pZZVcfx9lPdPDDGNjSBXlzoHCUew+aUJix0KP3lO4mciDds
         SChshwEXfgDdP7a4ppQ1RsnBPegxDHVWpb7gher58TeE64AeCkvb2JQZZ93LQJCU9Y/8
         wBFmJmjVaui3UxMt+80zmwhTnL8kk8ZQon14b/025ap72cvNmjXRhzzvqOerzf4TzlNL
         4omp+sXHX+I95l52bbwo4+UfKtLlFr2d5G99pD8KQsQysznKW1hfJC41Toj7irdC2+D/
         Bl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4jxMolEMgWH2UaLzTwX0/DhwV+TdK421Ylr4zt3aO4=;
        b=JhLRLPsx/K5OkKoIzfUQRrDOKXXWFbXi6grwOEnAeE51vCFZzep0u1r0X7hWJ5HIW/
         GJFJDuAOm0NW2vE55jPe2WWcZE9obSsIy9AtkQrD0HXDDBSBsDn9qwepqBjdOFbBit5K
         2KEsk2AFaytgNRXZaf5b9BHqKMy75WcI2vnxCSnZb8BC08FWWMahk7mJe04ldpiiRFWl
         8IrZwomV9YFPbPOBrr4Uwbw30qkUfnoYHpTde/MJGqcC/53fLffRc4SrqUZcYwRWWQWQ
         zoYNVa14uLNfrq53NXebJBH79btu+Lp+QWTG+c8qK0DUqXuyWndvFcxhsEgPUp4iJHmM
         GqZg==
X-Gm-Message-State: AOAM533XyS9RJbw8RnRxQoMXFM35hLKStwMACRD97lx2xycmHmLzN7IJ
	KLbbZsV1zot3o3gPx/0sC4DS1NML8uw=
X-Google-Smtp-Source: ABdhPJxVb2NqwLoO0lUS0fUy+k5iVh7xCzUGWan4LYb0auHi0PGVtuYWWqryv/V9NycOZvh74OO/Wg==
X-Received: by 2002:a63:7c57:: with SMTP id l23mr9202429pgn.429.1621261517878;
        Mon, 17 May 2021 07:25:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:17 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/11] xfce4-settings: upgrade 4.16.0 -> 4.16.1
Date: Mon, 17 May 2021 07:25:04 -0700
Message-Id: <cf5bd6a8308108b4313a1e45ce8aa87e73125bf9.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 4.16.1
========================
- display: Fix scale by rounding (Fixes #258)
- Drop preferences-desktop-default-applications icon name
- Also allocate terminating element
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eb5d3362d99f64d1dd006422b819b7f646254d20)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
index 47de8c571e..ccd55723ab 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "67a1404fc754c675c6431e22a8fe0e5d79644fdfadbfe25a4523d68e1442ddc2"
+SRC_URI[sha256sum] = "bb28e1be7aa34d0edb1cfbaacc509a4267db56828b36cd6be312a202973635c6"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.17.1

