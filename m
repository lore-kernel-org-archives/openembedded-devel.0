Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1DBFA0C3A
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 06:51:15 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13010.1776235874134951946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 23:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hs422wAZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c287eb77fso10164141c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776235873; x=1776840673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFNq2egMJeDTVrlGeVFDto7mGL36hAOdLjmQz6oPo8Y=;
        b=Hs422wAZ/mC/Khi9fHswUUcLozFHZRT48AmECDOo4Ref2BXf7Zw6IGaPOGx717Nx2c
         66OnuQ7sgJ4GobVHehdCk8nT2ClEHK+9v5rIhTKQm+SGzKK0kSvVy6WKg/01MXrnYlwh
         eHjGXfnJJUbIZ5XVvftJLJttSIxLx43ZqEwB3Pej9dESSJm6ACPTm9DawdJ0+wkEwZnM
         lPLkpjZ5CRMM7n+BaBg4OyiLjqRGgjiAbse9x0oeRE8Ce68cGxLKB1aL76iqL6hsePvQ
         3rvNUykI+u2IdDDX2vThdYBlHqtLFueCiQD4zxkY3xFDUxenzK5y4jRWbWGtlP6N8Kph
         cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776235873; x=1776840673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFNq2egMJeDTVrlGeVFDto7mGL36hAOdLjmQz6oPo8Y=;
        b=qMb6VR793IomjhZyyGJsJXSD74205elw+dqKzop8DS132mvIvRJPwS0Zurz7727g0d
         iKCwgXBlpigtgvfSJemJ/NAKoB/awXBOyASxRy2ASLSjM3a7n6VwzBaWxL81IVpqe3ei
         Xad6qbUT+hKn9tDvs4NLBOHzcT8gi1JSqdqwGtwkoQm0O8h1a9vdJ+sqnRScFAWPGSjt
         ioU8e0Da8Zql4jQOed0b3QHe3nghH1xXsQz1CPnJeb/6iQPnQJrqA7/XA9W0TBYp9oM1
         sFkrzT1scCX39XNYflApnfYhpgYpH9Dw7/JLpxUbCAErFbpSSzfik863qUeA5RJHeZwP
         sFbA==
X-Gm-Message-State: AOJu0YyPSi2U8ZpaIibYiY0gpS7MII3pg7akcGsak9DIkwRrl4HuW3ay
	TvIFfKcXveZQAB71eEp6bWwCjRIQPKCLKKTmy6yYrEj+MYTpIvYmURZfM+ARZp4x
X-Gm-Gg: AeBDieuCPE9qwJcjYKuN2RxP5/NIRYmbJoGvm0+atiJEpx0kzkwY/1nD/2/6XATNxOX
	sa6l4j5cDPGGtQ0mBG/nNke7UH4T6MAEDSayGDhTTW2YW7L9X4OjeaFxrpufHDkF60nkUrg1pia
	XdWhqZpRTCGW9F2NvoRMJ/8yJuDcwjZLqA/+xvqGFU+5rKHokp2Kedl3urEYhnWo1cBcjSHqHmd
	dBjz8KhzW+Y6J36ZhQNRKej5jkI6HFDoDCEibaR01z5JRLgi8RquIAbMsf2kojYVaU1RgkS4caT
	AHiDKi49+tiLeI6iGpkZaBc+tfuAdTS89B4La0NM2cubMmLDpfiYQxp7FAAC5er0XUWg6ydobn0
	BURCNoQna1mLbJKQmJmkJIrrkhh3luBNhRy0xDbV5SEnpB5Hbs6P0UP2AcV2Bhb83Bo1OL7GYAS
	kjAV0Ia43bhV7tOvGOl91dKBKWMAbDSg2gipwFrx0j7U1ldY/MhGGeqLNjmAEewFl4j6S68G02D
	6yKTUDmZeCTGEoH4+ZdGhY9HJlybsA8oxwA6LOatMBwikf55r5qmiw5ctPm809nQ+PZ3yaUeUSH
	bp+3JmpYj2MwMfFoRlcIH1oAuOBQEhwqzA9OHQz3L7pxVL3bHGo=
X-Received: by 2002:a05:7022:faa:b0:127:3915:76b2 with SMTP id a92af1059eb24-12c34f07f1fmr11654395c88.27.1776235873080;
        Tue, 14 Apr 2026 23:51:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a860fsm870453c88.11.2026.04.14.23.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 23:51:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH] gthumb: Upgrade to 3.12.10
Date: Tue, 14 Apr 2026 23:51:10 -0700
Message-ID: <20260415065110.1096804-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 06:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126343

exiv2 is hard dependency now.
webservices option and hence soup2 dependency is removed

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gthumb/{gthumb_3.12.7.bb => gthumb_3.12.10.bb}  | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_3.12.7.bb => gthumb_3.12.10.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb
index 8e82b86285..58aefbff2e 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.10.bb
@@ -6,6 +6,8 @@ DEPENDS = " \
     glib-2.0 \
     glib-2.0-native \
     bison-native \
+    desktop-file-utils-native \
+    exiv2 \
     gtk+3 \
     gsettings-desktop-schemas \
     zlib \
@@ -13,21 +15,16 @@ DEPENDS = " \
     json-glib \
 "

-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'colord', '', d)} exiv2 gstreamer lcms libjxl libraw librsvg libwebp"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'colord', '', d)} gstreamer lcms libjxl libraw librsvg libwebp"
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[libwebp] = "-Dlibwebp=true,-Dlibwebp=false,libwebp"
 PACKAGECONFIG[libjxl] = "-Dlibjxl=true,-Dlibjxl=false,libjxl"
 PACKAGECONFIG[lcms] = "-Dlcms2=true,-Dlcms2=false,lcms"
 PACKAGECONFIG[colord] = "-Dcolord=true,-Dcolord=false,colord"
-PACKAGECONFIG[exiv2] = "-Dexiv2=true,-Dexiv2=false,exiv2"
 PACKAGECONFIG[librsvg] = "-Dlibrsvg=true,-Dlibrsvg=false,librsvg"
 PACKAGECONFIG[libraw] = "-Dlibraw=true,-Dlibraw=false,libraw"

-# webservices would require libsecret and webkitgtk3 built with deprecated libsoup2
-EXTRA_OEMESON += "-Dwebservices=false -Dlibsecret=false"
-
-inherit gnomebase gnome-help gsettings itstool mime-xdg
-
-SRC_URI[archive.sha256sum] = "ee12d24cf231010241f758d6c95b9d53a7381278fa76b6a518b3d09b371efaec"
+inherit gnomebase gnome-help gsettings itstool gtk-icon-cache mime-xdg
+SRC_URI[archive.sha256sum] = "3222344653cd6fb5d7981b73951ae3d90c414f74220a8b1c8665b25574284c75"

 FILES:${PN} += "${datadir}/metainfo"

