Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5642.1621325519058808093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gBTepmP/;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a4so9162969wrr.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y75U81p+z7lcivOPrAVZz0X/QLQyuWAgCaDYYV9Np3o=;
        b=gBTepmP/jgJyQ7KasNgZ1i7EyOQytYEr7CrsgjaC1rIdWEhWFmFFadJNDZWBriBbdm
         OYCshSmSgJNp0YKLrNDkKHG3d6FZ5WDCRzoy5y07ihEQmICN4qnlzviJs5REYAcRFb8B
         56wqbsyXAOykLYImkzbjnG1E6yVNvTBhAQwf5x3FHYhlbhGB6SacJx1VvUvCUOfcoobJ
         hGlYyXppX4qbn3GnSr/k9Ot1JcejawaDhOJWOBznwx1JYAtypT8w8xVL9bVdqlZtSeKE
         9jIyjFgo1X6XWYLAXRs+F4O8jxoFvTY4xMyEIiLW2vHlKIhgyvh6l2y5GAu6vibNuCbV
         qbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y75U81p+z7lcivOPrAVZz0X/QLQyuWAgCaDYYV9Np3o=;
        b=suhfdIAox00UHUoBzPPmcPq4eRn0zBamLXAw6IYDNvy+T82VNDnEQrdTwH/RH3sdyC
         EycMiZht0Vrppt3ZdD2nGxNRGemJ2JLie+osNY4VJu3ivvcVFdrcdvkexhr4n6wQhDh4
         wiL8ewctt4kiFDOyZN39hOqvMXTxJ/ibjAiBI2LeMx9zp+ulP8bfuQwMX1p04nyPaskX
         hFjZcdZSSOUPwjuRMmRWZrjFRgb01Am8J2L0DjK+ZOkHmn52KnwEPr3MZy5zmvW7snI+
         F4rxI1S9Qn1X8wk9z8v4r3G95n3Ov8eB48mwliGHRxss7E/ui5Qd9h9Py3pjnAmSk7Af
         pf+Q==
X-Gm-Message-State: AOAM533rrruXe7fepQ6mUPqlBEqiNAjFJPOrbviPFE8tPePujBnGcp4S
	f8vUG64pOam+7uCYTZaRBYfvmG8ntds=
X-Google-Smtp-Source: ABdhPJxiH7E/DQw7y/eWq9F0Jlm7dIOrmEAJ+zk6Dl3qnkjnoQ3+62/zCbvVZXQb4c4Sj0a6qI/6/Q==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr5059408wrs.276.1621325517696;
        Tue, 18 May 2021 01:11:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0ec830b81d2d73abc7bc58.dip0.t-ipconnect.de. [2003:f0:7f0e:c830:b81d:2d73:abc7:bc58])
        by smtp.gmail.com with ESMTPSA id v18sm24505319wro.18.2021.05.18.01.11.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:11:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] mousepad: upgrade 0.5.4 -> 0.5.5
Date: Tue, 18 May 2021 10:11:45 +0200
Message-Id: <20210518081147.1291254-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518081147.1291254-1-schnitzeltony@gmail.com>
References: <20210518081147.1291254-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add PACKAGECONFIG for gspell - disabled by default

Release notes for 0.5.5
=======================
- New Features:
  - Add a `.desktop` file to make Mousepad appear in Xfce settings
    (!94)
  - Add a command line option to open the prefs dialog (!94)
  - Plugin support (!92)
  - Add gspell plugin (#1, !92)
  - Disable and wipe recent history if recent-menu-items is set to 0
    (#112, !89)
  - Support -ve line and column values for "Go to" location
    (#113, !84)

- Appearance Changes:
  - Switch to client-side decorations (!97)

- Code Refactoring:
  - Remove Xfconf dependency (#60, #122, !98)
  - A general review of sanity checks
  - A review of window lifetime management
  - A review of document lifetime management
  - Automate and sanitize memory management of sources
  - A small review of GSettings use
  - Do not use `== (TRUE|FALSE)` for boolean conditions

- Bug Fixes:
  - Fix actions to show/hide bars in fullscreen mode (#129)
  - Fix broken "Revert" action
  - Fix and extend "Move Lines" action (#87, #116, !96)
  - Support for drag and drop of tabs when search is active
  - Do a silent search when changing tabs with the search bar enabled
  - Use get/set_real_line_offset () functions for "Paste as Column"
    (#114, !91)
  - Restore cursor position after transpose (#115, !88)
  - Fix "Delete Line" action (#117, !86)
  - Fix recent_sort function (!90)
  - Reset line and column number if not given on command line
    (#121, !87)
  - menu: "Spaces to Tabs" converter converts leading spaces
    (#118, !85)
  - Make window require attention when opening new tabs (2) (#119)

- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mousepad/{mousepad_0.5.4.bb => mousepad_0.5.5.bb}        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.4.bb => mousepad_0.5.5.bb} (66%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.5.bb
similarity index 66%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.5.bb
index 7a2f12b1e..830d86b8a 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.5.bb
@@ -7,7 +7,10 @@ DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "d90f492e5d0cba5f5b3b0c1eb7fd7c1701aef57e3fa244d2c457e7f9b0a42aa1"
+SRC_URI[sha256sum] = "40c35f00e0e10df50a59bd0dbba9007d2fb5574ed8a2aa73b0fc5ef40e64abe1"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[spell] = "--enable-plugin-gspell,--disable-plugin-gspell,gspell"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.31.1

