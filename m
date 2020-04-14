Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.892.1586895479425918230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUbmOmad;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id g12so7964137wmh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=241e7jOgS7BCGDMzJq5UQ0fF0Yc1WrUAgeFpPSsJg4A=;
        b=lUbmOmadpCS5AzQNpaQmelk1aIi1KPwKzw5OZB8IQ6AmyHs8gmZbHpxITuDgawPA/m
         6g+3DHfgEoVOzQMwL3za0Gx+3PV8mAsNp6Y4K4HaxQsElIaQqQrCO13d9w4aOfc7vOA7
         /urN6+f3azYlYqWoQyyB6UsSN48BM8EvTwV8Gcfzh7aBcx03SMBa3ofESXeyW170W7un
         BaaP/nhOQ6e8wL/MoOechaZgfAipX+VGQkhJf4JwRItviqyKrPzXZd3WnvbzF2MfWVVa
         9bLPcoJNfXVSIlzPnKyvAb24KrF5+UwLRcaTeGTPdKGLAHbXIlu9Rmh+qOIheI2f/9gB
         hzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=241e7jOgS7BCGDMzJq5UQ0fF0Yc1WrUAgeFpPSsJg4A=;
        b=LeU1piMS9YRXwaXfw97GE9bwfx8AiSBPoH5JrHRy3C2VLi/6sLSgF2+gk2jxS1gIcM
         oMe0rfJafAiDs1VcR+mpO6kGKlyFpqfOjdpNZWjuV6M/HjmAw2lyvhicux6LUs92sOAh
         o9j0Vj1lCZNFss9L/d4KHdE0vLv+rKNjLC7MXHeE3NFLO6XhLnSJGzMfp8ctqHq/RZQg
         wmN1+VIxej1Maf5ueAQH0vtExwvL3kbx9JMGkp/B5JILoE8t4HNNVByt2jbrr2sZFl3i
         ail+Z5PKaU7SPWpsRBC2own9B+hrLHrTgaKBylnKQHUZGctGx2lLBz1au5F2ys6lKM4P
         snRg==
X-Gm-Message-State: AGi0PuafCq5kVc0PGirF+bgQy2UGHWD9X/TZmM0+gHYSNKF63T2Ee54K
	3bMd60EWgvba6RcPh3bnSyqWkNW1Wa8=
X-Google-Smtp-Source: APiQypLIeIVsX0MT08xAr66iDX2MabBaT0duP0Yzgu2gI/4RfcyaFQPblgjrBnNGL0iOLpJGbEVYeQ==
X-Received: by 2002:a1c:4989:: with SMTP id w131mr1604307wma.137.1586895477766;
        Tue, 14 Apr 2020 13:17:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0C2E51E8849BADA5B2D5E3.dip0.t-ipconnect.de. [2003:f0:7f0c:2e51:e884:9bad:a5b2:d5e3])
        by smtp.gmail.com with ESMTPSA id 145sm21115425wma.1.2020.04.14.13.17.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:17:57 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] xfce4-settings: upgrade 4.14.2 -> 4.14.3
Date: Tue, 14 Apr 2020 22:17:45 +0200
Message-Id: <20200414201745.19390-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414201745.19390-1-schnitzeltony@gmail.com>
References: <20200414201745.19390-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.3
========================
This is a bugfix release.

General:
- display: Allow resizing of minimal dialog (Bug #15450)
- display: Use proper fallback configuration on "apply" and "toggle off"
(Bug #16476)
- keyboard: Fix crash when editing shortcut (Bug #15958)
- keyboard: Fix log flood (bug #16521)
- settings-manager: Make sure content determines size
- xfsettingsd: Handle failure to get Xkl engine for display (Bug

Translation Updates:
Albanian, Asturian, Belarusian, Belarusian (Tarask), Catalan, Hebrew,
Kazakh, Malay, Portuguese, Swedish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-settings_4.14.2.bb => xfce4-settings_4.14.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.14.2.bb => xfce4-settings_4.14.3.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb
index 8013b929f..08c612aa7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.3.bb
@@ -11,8 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRC_URI[md5sum] = "c4816eeb518414255ead805fe220acf1"
-SRC_URI[sha256sum] = "ebf70ff83e4fd0cb33fa0c3e871ca4df5127a505b30b83a6f780cf3f181b0af5"
+SRC_URI[md5sum] = "fe8f7d4221be1467b85c8539344c3f07"
+SRC_URI[sha256sum] = "cab1a4d5351f9871533700523570f86f92bbe6e4055f44e5df950eb4b4f48bb3"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.21.1

