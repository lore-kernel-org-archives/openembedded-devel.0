Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7760.1793057194818817879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=npKuWc3S;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-157fe9d771bso4264110c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057194; x=1793661994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiZP0fwEZRXNr6XaYFEHIa65aBkdznksx6GVO/mA6LA=;
        b=npKuWc3SZCNDWp8PSednBCXIR8NENVerzTe4UcBsCqoyES0TpxN+txhtGOYwhITNC0
         yEMaBX1ryGzROtS3SN0nMYDXGY9oIkQg33pLP/SZnCjGwA8A4PNcRtKz40fBiHCFwmwW
         IvI3iVRcLpgOiOZFdkjXA+EcDXPLj6Bdy9f5buW16Mzxd6ItMEtgB7SJNwW72/pG5p1j
         FXDVHyIyY306GtwalG3N+HKSSaZMd61VSO9/j306TINQDq1oB1rXMhW9Qc3suOXl+rIr
         YA08P4RXrcyBu2tpK91VR2sK39glgxAzIu6I8DJEDFo1cbOULgJ1ObSrFw/fqxGx/clc
         OCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057194; x=1793661994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiZP0fwEZRXNr6XaYFEHIa65aBkdznksx6GVO/mA6LA=;
        b=oWeHotCSWV0H6RYxkP/7nmxZI6tZHHDkLBAjNtDs4BBFILfxiU5xA7BeLVPJSJBgOZ
         1uuKEUyn0v7Lz1Pd0yyg6XaGrRgNdMPkWFEg6mFv3ceFAPEnlO6VGguVxTd9fHzv/NXU
         7DlvtZjXOiXAuYloLq57OhNlCnjrNdtYleTNIgowQD34oafguZjxOZNXk4HS+c5uGY/9
         8qO2gWm7smNBz8AAuNV4+jcGCVOaJwVnczwotuDChqKTray1p/HELGI6VnFOoVY8Qulj
         stGQsKgm7+u9yQ9zGaRkgSqZ4/t5Zh14eAvdINd8LrDFJ0AfysPZlf/eLVopSyMWctM0
         QSzg==
X-Gm-Message-State: AFq9FYI1W7fpj8UdPXJA12A7Kom8v5juHdL4Qd9qP5QBu7Wsl/H27DmT
	UxZkDl62cVUFuyJWPddar83nEEAN607fazb1MnypQDa9MTFcJRtnyXk0K6Ovyg==
X-Gm-Gg: AYBFou1N/cIKNMKX5Vr0xK7JnD9PoVAhFDj2dTAB2EUNkB8vrwwEYbBuiroSL2/vzbg
	7e1bHe5eEpjKoM1+wdSwWW/WGoE5zWYSwRnoIGSykX+HjKjacFc0KjFgtcps+Wft67QpiuQkCuR
	W2JkbkA8QMXnTvzpNncQiOajyc3Dti48UExtZDticmspYGfyOXmH9CyLXudWzaPXxTx8yLCpKZG
	zbK9cHvspA/VcxgzitIwVWStI5UgFbYzgyeg3CVi/r+hYQT2ubN8Lvxn/qfQubBhERErcLO+LBr
	sdRWof7Oytw7mcDiOmYF9LOc9GDcOukN0Li2sQUfCXMp2evzx3PFpqxjygaH90jyZZBcfQO3Vma
	1ELcaedxESRz+K194Lq8eEA+09Xao3OgXTycbmBgYDT6x9SvcLM9AIDRbke45bgN7yvi/YntGY8
	xU/scM9X2WEy2FBAe3RPEmw58DOqDXfH0NVsi7MFmFzZaS6I195cuO/NhHEcCNwEtQ9ddMjk8l5
	/DE89UIoKoHcsT6fDjvhjeWzjbccdjtuUlZHoJeGrbPyr+n8Wx2vw0lcnojlo4ydzciH3wQmIFE
	5mSwSdy3UhSkyRpm/TSa7OK2oA1a7oRuYDn/
X-Received: by 2002:a05:701b:271a:b0:1a3:dfb6:e593 with SMTP id a92af1059eb24-1a3dfb6e661mr1118380c88.27.1793057194020;
        Mon, 26 Oct 2026 16:26:34 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/13] python3-tzlocal: upgrade 5.4.4 -> 5.4.5
Date: Tue, 27 Oct 2026 12:26:14 +1300
Message-ID: <20261026232625.1275411-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131442
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Recognize timezone file names with multiple slashes in the TZ environment
  variable.
- Use HTTPS in place of FTP to retrieve tzdata archive.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzlocal_5.4.4.bb => python3-tzlocal_5.4.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.4.4.bb => python3-tzlocal_5.4.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.4.5.bb
index dd9b6ec93e..d55e5ce9e0 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.4.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "8dbb8660838688a7b6ba4fed31d18dedf842afb4d47ca050d6d891c2c15f3be4"
+SRC_URI[sha256sum] = "ba976898bad27945178c9ca25c222c19e322b30c10342b9f40b46714f70d2d5f"
 
 inherit pypi python_setuptools_build_meta
 
