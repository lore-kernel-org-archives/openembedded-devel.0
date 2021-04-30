Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.232.1619821057313089368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Apr 2021 15:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mf/KHedi;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g14so24651719edy.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Apr 2021 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BrZAnjTjBE9uk3xVbgH5602cU+0nRzFUR/EAU8o9VP0=;
        b=mf/KHedixAFtVV8iOzO8yjsZVXviKE+3qUKHcntdLoXZ6khi7FQWtDzOzqBtIJdRiV
         /7had9R3r9YSKY79gE9eHaHOqDK25PCS9gWkdNEcWT/kX5l22EP3zTqvKT87ke3xL2F4
         otmOnf3DGzIgqetrRpHr2CCTszBhQiVQ8pjipRcU/FSDVV8nAbA4abrQ12cs7Y0YCmMu
         t2VUh106toBOZpogi2zMv94UFHoVOE3gpS7PDL8eKoCauEdMMSaXVq3N4Rqx510ACEoa
         bq09MVH35II4tdvmJzgTAALFOo+ZBEqgBCcf82/Ss2wtchyHVlim7PHTX64ICwUs5qod
         qoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrZAnjTjBE9uk3xVbgH5602cU+0nRzFUR/EAU8o9VP0=;
        b=jc2QoPfHoBv2P839icjf29an9QcvRH5TaRqgLZMrscbXHqftmpbXekMWSN3AWqamzg
         /On6o0BWY9NXMLkoqnnpPoZbN5vxyWffFILPEFxfP7niD9VCLRlwkZF7eo5pbLv6zyeQ
         RbCxUCh9vt4FXu/vTWmr4P0bbycQVIhy0IlWEbUWeiMNMsefG2deVlc3U/Nv8kez2qZ6
         DSsskryWdRWUTPEBhdIYW8xe4rxG9RyLejb+vqMNNHWM7bJdnuF3Lj30opAyXjimaMzh
         tEEMRIG1mDG3ovwvGq08K07ovyV4RwLwHorH8woP6IqG52kUOIDHrLTVKMFmAuPX2Xp+
         8gwg==
X-Gm-Message-State: AOAM5309++ckcXo85rQ+jWojtsLXd+VBnCYWt1Ql3m3wpKoY7qM8UPRP
	AsI6TJAuqtvW7IK3VevEQieYEJC5yJs=
X-Google-Smtp-Source: ABdhPJxZ2A9whme145G/xUcJZPNePfu0mP2qoZ+zFJSoqL1niBd1QZHCgNJeucyDUhl0G0TAPCFxPQ==
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr8810569edv.246.1619821055751;
        Fri, 30 Apr 2021 15:17:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f15f5094da33e6dbc0cf84f.dip0.t-ipconnect.de. [2003:f0:7f15:f509:4da3:3e6d:bc0c:f84f])
        by smtp.gmail.com with ESMTPSA id h11sm2817669eds.15.2021.04.30.15.17.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 15:17:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] xfce4-settings: upgrade 4.16.0 -> 4.16.1
Date: Sat,  1 May 2021 00:17:13 +0200
Message-Id: <20210430221713.2128361-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430221713.2128361-1-schnitzeltony@gmail.com>
References: <20210430221713.2128361-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.1
========================
- display: Fix scale by rounding (Fixes #258)
- Drop preferences-desktop-default-applications icon name
- Also allocate terminating element
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
index 47de8c571..ccd55723a 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.1.bb
@@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] = "67a1404fc754c675c6431e22a8fe0e5d79644fdfadbfe25a4523d68e1442ddc2"
+SRC_URI[sha256sum] = "bb28e1be7aa34d0edb1cfbaacc509a4267db56828b36cd6be312a202973635c6"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.30.2

