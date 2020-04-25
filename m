Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.636.1587832017340448458
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R3ssLVnP;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id g13so15258539wrb.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DWf3Gs3lCx5HdeYeOzaMoYxTGNhQ4mE6spsq+yk4sw=;
        b=R3ssLVnPXO094kDTNAaFWNUYN+Qzu21ONlylCqY1jjaYTy7CHmKBrZnQsaTB+X18RK
         crp0GiND1+tpqiz9i+8aW1jDFsW7uUnFv2PvUhJaKkAkwzn394EZiz6lwCUIiWGFlg4+
         /g66IfXoZSlSwRKiFJLgsJqwVhfVT9hDK+8PJsvoRgR8xe4PgNLW7or5pg3HckKGN5U7
         Qbh0ah9pMb0Fs+1MFQX3JUuQcvTTgKzBQZHhrQCork9QiZtX4dWbTx5qhRt/yYaW3Y8O
         zNlH0RNQlr+kiJGa/BgrWPJYrUisWFyzVvwpuwz/jHpC+s8Ibl+fKtzc5bN25iBkBJ8N
         jB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DWf3Gs3lCx5HdeYeOzaMoYxTGNhQ4mE6spsq+yk4sw=;
        b=jrGgeyH2nSJEn9dI9kKbrCD9HepcQsyAM0yT/GcvBzK/aRJHN3KD2cFQOZKbCaOWMA
         VxGNNr10poDVKwLyOtkqpIyPBI/3/MbmQZOrIW3ezGzcqrLItmpi2PU/9AEOkJILCdVW
         XMXiz1tkfTzEX3ydwCRori2T0YgCOSPnwUXIzEqKwirE7J3hnuf6nub/FodBcy+S9RnS
         cQ6OgL9MAGY1Err3x9opUg7TEY0UE517wMJtJShoLflvqpZyld8JfApcnm3WgIdIZQ90
         FHJlKd57IW6WtoopDrqz6uGM7OJJsHnaDa5TZFo5iDpxSToTbW/tvSzZdzYE2tueIGIr
         DOlQ==
X-Gm-Message-State: AGi0PuZz4JPOgCmJqc2dSV1r4YOOjjVDEYthu71U95nvGwCkWQSPL7hD
	aBC3u4P4HbULc/JFRVGGFADLpGp8
X-Google-Smtp-Source: APiQypKQaTwvckAyllP1pnmIWzPU/TT1GAxquUxH15KEuqsoNa/rZhAHlME37VjMEEStewJiv32Eqg==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr18299340wrr.96.1587832015714;
        Sat, 25 Apr 2020 09:26:55 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id y9sm7396507wmm.26.2020.04.25.09.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 09:26:55 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 2/2] freerdp: update to 2.0.0 release
Date: Sat, 25 Apr 2020 18:25:42 +0200
Message-Id: <20200425162542.3247-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200425162542.3247-1-max.krummenacher@toradex.com>
References: <20200425162542.3247-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump PE to prevent 'version-going-backwards (from 0:2.0.0-rc4-r0 to 0:2.0.0-r0)'

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 6fb9a738a..7cafbb799 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pkgconfig cmake gitpkgv
 
+PE = "1"
 PV = "2.0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-# 2.0.0-rc4
-SRCREV = "e21b72c95f857817b4b32b5ef5406355c005a9e8"
+# 2.0.0 release
+SRCREV = "5ab2bed8749747b8e4b2ed431fd102bc726be684"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.20.1

