Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.13167.1604936075885609403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 07:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HhodbxaW;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: rosbrookn@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id g15so2493983qtq.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 07:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZiVMBiw0JvWrCPl2U2KFjfR2wuhTXooptGGnaJpgJUw=;
        b=HhodbxaWprzykICPExi+958NsWe1ClZasp4MS6+bM5cdMrmXfhxhRaYw0yxbyxSJtA
         ua5nof/ZpNB6ny2AY11i1+w2i8HtTJ6e6RLlTmuhSxWuhy7jG/thR5mR49H5r5VQE6Sj
         MONuWYCil/q0UtwKzlNucQ4pWQ4Rfb7Njed/xf6MECdChM385GHbWa2cHSxQi+SXRFT5
         7PjdXxpZXZZ08aL5j0+xVgiz4Nw8b612j3Dguh1Mw+03xgJTpWKOUsmrNPb+0GQFYqXn
         7RgXKD4ryMAFsO31/lUAFAdDyx9B0HgSdB+YhTbivlP73TERqnoX78hVAdGGpz7sZ/EQ
         ABkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZiVMBiw0JvWrCPl2U2KFjfR2wuhTXooptGGnaJpgJUw=;
        b=pT/Jiz/Z67f0XBUCyMYfe3EnhoLyBjE0lAuMZVw/vqm7MpQIk/YzZHuFmmaWIwuYyh
         KF8SlIlA0Bb5JpvuleDW3G8/r0OsKL/yRGYYbhYJ/JbLqWVP6TpZCBQ5OECHKpimYYuA
         2lXrbbAKQGEW8UWP3BGigfTS54MzTAyF0Zx55B2Si7X4nnzF3aEwjlq3IrgHyWRfdIY3
         GUGKD6lD8GPWCWGAVna/ehlzFMUIokEhQKF2IolMU53v56eSN0chtm56vehO2nlBc1q0
         B4+oiu8UzxjAv9ed813BS+WZsjLjGkUGoJXdT3DhDdlPm9IZpHXOZQpGHgbJNi2udYik
         zHxg==
X-Gm-Message-State: AOAM531gGRx/SmyfOtDypCmUhTA5O8PO3ZHEAiJWT1AlzMP4dcGHQeYR
	Tjyq2GILfwsZAiQ/MzaocxM1pEYqHe2vIA==
X-Google-Smtp-Source: ABdhPJxgN59VBI/F9fH/e2psqISJAhSl1jCH565I4rDZRcGvrdIs5zyuWKcQymNtuiTdvoTACoKMZw==
X-Received: by 2002:ac8:7604:: with SMTP id t4mr14019132qtq.366.1604936074707;
        Mon, 09 Nov 2020 07:34:34 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id b3sm5768656qte.85.2020.11.09.07.34.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 07:34:34 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v2 2/2] strongswan: remove ldap from default PACKAGECONFIG
Date: Mon,  9 Nov 2020 10:34:28 -0500
Message-Id: <068c310e6cc47b62f592d69ee1a0ae9589c84c5c.1604935361.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1604935361.git.rosbrookn@ainfosec.com>
References: <cover.1604935361.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since ldap is not a standard DISTRO_FEATURE, leave it disabled by default.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index abba86e39..8133b9943 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -27,7 +27,6 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 
 PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', '', d)} \
-        ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
-- 
2.17.1

