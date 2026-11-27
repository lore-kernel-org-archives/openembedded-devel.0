Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10303.1795753119050627406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YT1aTjb6;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385c497bf94so7004920eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753118; x=1796357918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1rzdd2nPWcEATu3mnkPAsf5GYwrSlPGj0nFRJHiy4w=;
        b=YT1aTjb6GawKzQwV0x1RQXRj7hn9gYm2BS/BmNEz94SjMQf/fGYbAd9DcnUNbVP96k
         SBlxuezLoDwqHveWykebv0Df21tS2QfejU50noBOvQDmcbe9NgC2dUzSdSL/fDZXPvxf
         gYLuSv1vYGNr3peD1Q/uyHTcQRDgOgPp7OyOHRE843dr2C1LQ8vppQhrce93mrJKQlZD
         2LSVhsF87DuboZz1Y0i/yiRqjSsa4IhWDwu/F3CO8hp9NCv3TJwPDOSZFarbXilmtaNs
         Y5w240+ZXHvHrOzyE5/Npb6tnDs81QaeGjY18EEvlXldJltJDaRXZdkPvJHF0B3Q8qZM
         f/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753118; x=1796357918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1rzdd2nPWcEATu3mnkPAsf5GYwrSlPGj0nFRJHiy4w=;
        b=BD4Sh1Gx+k7nkRofODblrF63hwNSBAFqDKSIsBqsZPmXn8XNObgMqdJY0Qnwk+ee3n
         bOtcTkUhKbReVAXV0DpTZ3kfoRcqkaZBk2yePElUtOI4dPo/kMRPm7Bi5X2vW3E9CZrW
         KRVnOAEu2pLaA1STDHqRj7q/9vuM65jZWCle4s52IL6s2cw6yiobPTwlmMK6BTWzvO/6
         FjubiQwtHR/c1Tvn6YliNnibCIhzBh4zgkDJwPgfkf4hbb0PJIlQwdnZhKqJxC8Bz669
         ks2I5ArP6C23FcURAijvZXLckN4u9BbeqHc8SlWW4HTmd7mS3d93cOOI9QoXfLmeNcHw
         MgRw==
X-Gm-Message-State: APuU4Z+/uE1QQq9ON/DAVtRgeiz1mNsoK/VVf3gAO1WNtU/N6BoQTuzn
	gQ/AoxrzSIPFxZNfyUHk3FdIJ077fuK/sF1daPPtxBzTDtB94svN8faaXXA+oPZf
X-Gm-Gg: AZFdTZeOMsdROrhTk9saUZ6wgTs8PlmtZ3MF5zdMmIG7REBOwRHaYTDhwgeSdWSliLv
	C+IBo6xtYKhYpExjuocmvoH+rokngFkMKqXHqVWpXrjGORpruDWTPMnZIeTan27Ad1xuK3/tpCq
	vbYKyv/JGEI8VcNMVcn8cOZKHSg1DlNKcweSGWu62y6UcaUVIAsrV22fYynWwa6WD2j6as3i0AY
	Z7tvjnBKst91Yv2JjDrUbEz9DKFw3yqEwkF+vJDwdjJabv+Dv11bmYPTAxol1ZNJxo9paQyxFwj
	bFSCEVL8mL8T9LA+zIUhQsOniquNGgMBtYI5Ba876BuPFAXo5vZ46TvzYCmAPj3E3VG+QNIi1/m
	ai5BX5bTNHwsS2Vz1JFmX8jxTDcCROrH5z8wCAUwctzRJsLEyba1489wPEp8HQltZsQo502wlA1
	cyGeOBBio/TYoJGfIm20AIggdzbiI3wIREJ6TUr+M3y0c+JJIuYv++9SIvLgZjTAJ/v5YbCo5PP
	9ygnwNWpcuBOOtbout9bARzjggYZig1B1W/YTICRjOiyTeh1hwoGjou9iuI3PK9sRXVn9XFbNzR
	h2w/dfBF6ctmONBsFovQu9bTAI7Mz0ws/yFL1M8zkrDk9hKvj7mAaQVLigm+XVMK0lWjy2Y2fmC
	crqmD9cfJzRp7ktYcZ69hbe4iJZ6vtbxg6WHIJi20ix9Sjj7HBPB5rJsaC7/+WdMrV5tbGWFRtl
	kfd67myWKaV6t/VrasDyw2wXv8yCB+t7e1f6huXLp1l/zI0IIkE002/QeXTDWmvkbrNr/9xwcQb
	/PnW2RUPk/7nfgZQ+5fTgMRF9Ez2E5pIeYyilUoE30c9hAEDC2/2Ii4fkuwFArzc7+E5IguTg+P
	/7t8
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr24733498eec.6.1795753118370;
        Thu, 26 Nov 2026 20:18:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/15] xl2tpd: upgrade 1.3.16 -> 1.3.20
Date: Thu, 26 Nov 2026 20:18:20 -0800
Message-ID: <20261127041827.1778052-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133296
Content-Type: text/plain; charset="utf-8"

- Fix compiling with C23 (control_handle_lac_status prototype)
- Close calls when the underlying pppd terminates, and avoid killing a
  stale pppd pid later
- Fix redial not being rescheduled in some failure cases
- Only force userspace when ipsec saref is enabled
- Fix an unaligned packed struct access warning in control.c
- Add macOS support

Drop 0001-Fix-build-with-GCC-15.patch, upstream fixed the same
prototype in "Fix compiling with C23". Fetch by tag (v${PV}) now; the
tag is annotated, SRCREV is the peeled commit on master.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xl2tpd/0001-Fix-build-with-GCC-15.patch   | 39 -------------------
 .../{xl2tpd_1.3.16.bb => xl2tpd_1.3.20.bb}    |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_1.3.16.bb => xl2tpd_1.3.20.bb} (92%)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
deleted file mode 100644
index 2ba927bf0e..0000000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 754b0ca247b2d789f9f613f8757b9732494e9489 Mon Sep 17 00:00:00 2001
-From: Yaakov Selkowitz <yselkowi@redhat.com>
-Date: Thu, 6 Mar 2025 21:03:28 -0500
-Subject: [PATCH] Fix build with GCC 15
-
-GCC 15 defaults to C23, in which the interpretation of function
-declarations without parameters changed from unspecified to `void`.  This
-results in `control_handle_lac_status` not being compatible with the
-expected callback function type.  Adding the expected type parameters,
-albeit unused, fixes the compatibility.
-
-Upstream-Status: Submitted [https://github.com/xelerance/xl2tpd/pull/272]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- xl2tpd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xl2tpd.c b/xl2tpd.c
-index 3195988..0d148e9 100644
---- a/xl2tpd.c
-+++ b/xl2tpd.c
-@@ -74,7 +74,7 @@ static int control_handle_lac_hangup(FILE* resf, char* bufp);
- static int control_handle_lac_disconnect(FILE* resf, char* bufp);
- static int control_handle_lac_add_modify(FILE* resf, char* bufp);
- static int control_handle_lac_remove(FILE* resf, char* bufp);
--static int control_handle_lac_status();
-+static int control_handle_lac_status(FILE*, char*);
- static int control_handle_lns_remove(FILE* resf, char* bufp);
- 
- static struct control_requests_handler control_handlers[] = {
-@@ -1541,7 +1541,7 @@ static int control_handle_lac_remove(FILE* resf, char* bufp){
-     return 1;
- }
- 
--static int control_handle_lac_status(){
-+static int control_handle_lac_status(FILE*, char*){
-     show_status ();
-     return 1;
- }
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.20.bb
similarity index 92%
rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.20.bb
index a1723124d8..20e658ca1f 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.20.bb
@@ -8,10 +8,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https \
-    file://0001-Fix-build-with-GCC-15.patch \
-"
-SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
+SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "07b3063e2b6870fad16366bc8d7c52a6f2a4292f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+\.\d+)$"
 
