Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.593.1621121954452435054
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=okwddrLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id h16so2625478edr.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LMD2CYzBVm3UoW2YBdwREsjeMZdd7HcmxMtTjOndbRg=;
        b=okwddrLohIj2EGk76OxdBxd6OXObX8wgtLLETx4Hyd3b2+M7un1NO4OC+oxYe+KZPR
         /B+COStagxFThjHHb6oDOxNNtV5sQ5g6+/YPx18WABStusSbCKDzJU+LuQ5BsfJt3eOG
         GOFU62a/Uxt9boiFzF+p/UACObVKojHsEHe3W6NtXtQOIJiYVQ5fTDyzG0IE8wdiXAGf
         T7FVpyly2tTGIWZP/O+CFfmb9EsZ5NTMRaJBOrwaADMNIQhNNL91div/UV5colAqGtlc
         ShVVlSlb2pP1ewpNVjcbr8HwVnxJwjZeZwXkZqIUjeD9wmgWVkqaFmU0plIQfCDbyyt5
         8sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMD2CYzBVm3UoW2YBdwREsjeMZdd7HcmxMtTjOndbRg=;
        b=ZIkGmCLpVCAdmLZWPh0K89PKs53jwQhaAu1pJJ+iNHJ+xOKQyU2mzJMSXmsEyqov5z
         yvIRgTngW/ByMJWAwvax8gzgLD2Ht+hP/VyGgHjMlT9Jjf9YiWKeB7gpub4uVWcef9wt
         FC1vr6nNRHugsAQCVbpnL1AJ/lItQxtEv7c7HS2Wqhrinxqgr8Ecg2DsKjw8dLO1w5Wv
         /Ci11xkeqWmHU3+mpRVHtitLdRc6cOd4q30CHDqp9YZIOskDx/lBTshEXeTX1ylU4zVl
         y56V8nZjYLwbnlCR5BIM8AEzeVwRdY7gHfo52k5frGbsODUCybzfve9CGx5fxUYiBpWq
         5N0A==
X-Gm-Message-State: AOAM531U33BT3D91HQYjsrxXlb6RxufvuCIJQBdmmaxp5Q/7NoPIXvei
	zDZkJqaS2rOa5bV3ND5lk91PR33dO24=
X-Google-Smtp-Source: ABdhPJxKTkB3wqZwluU1x2XdmOqq7Lmb1thtsEhoFPY+Z8n+X93aMq+0x1ShVDRREKA4hfPWO2Octw==
X-Received: by 2002:aa7:d890:: with SMTP id u16mr23967176edq.49.1621121953126;
        Sat, 15 May 2021 16:39:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/20] gnome-system-monitor: upgrade 3.36.1 -> 40.1
Date: Sun, 16 May 2021 01:38:43 +0200
Message-Id: <20210515233853.583490-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...stem-monitor_3.36.1.bb => gnome-system-monitor_40.1.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.36.1.bb => gnome-system-monitor_40.1.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
index ddd11201b..7b80c74a2 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
@@ -10,6 +10,7 @@ DEPENDS = " \
     libgtop \
     librsvg \
     polkit \
+    libhandy \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -18,8 +19,10 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
-SRC_URI[archive.md5sum] = "b1443ab12c3b7bcca940d28754e5b948"
-SRC_URI[archive.sha256sum] = "866b47ab0f4c75b0ec57d6300337a7373463aaad5df95eddfe5354c22be7bca1"
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
+SRC_URI[archive.sha256sum] = "fdb30f4367907aab86d7c2bb76a7b773ba850b765c9666a39f42abfe22691d1a"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.31.1

