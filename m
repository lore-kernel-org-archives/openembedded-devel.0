Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14835.1793092842396514188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KxvOeHW+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so10276455e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092841; x=1793697641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfhHdx67jTOM8sL9foK4QnAo5crchpoBM5sZwtz6YwA=;
        b=KxvOeHW+JkAzcGVgfAX+K1Ypkq1Z+E3mtD9UChSHBmbJ12mPZCduyDTzuJ/qyMDthg
         8MhyNcLVsOoSq4LW100xrQDGI9gQrfxdCu4Qy0nkavonvoKVWY1YfhgGSKDJcpzi7Mc3
         VpHysRP1nrgTWTSh2J8NABDINMn8CJbfOG7V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092841; x=1793697641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfhHdx67jTOM8sL9foK4QnAo5crchpoBM5sZwtz6YwA=;
        b=KyGVjQsqWK7/cIPqf9C+PY7XSfaXOGymBqAOcJFmnYDFWgW5cSUJbLsNa8mUyPsYpv
         yqOQRPeHUVRh190XSvZFBHSl35mvkmCPfAA6ZNDoADT2MdFlYQX88Hpn6vYeaSg/YG9O
         wEDEkbEy9FS1GJkYWviP7QLeD9xSDLepWdM7iDqzXxUb1yWQRCgjD8/FBDBMCSXx/CK+
         J7ybgXi9r35HkTqllEPmodKfb1oiwLrq/9cOpWXPqs5CggKFbpAuUsnvfbkZlHcJ86ED
         OBSkB4+LGPZVwZMrigWB6ow5ADDKTGEMww4iRlM6pTfyc4WUm94K0JIy0MWvHzlAQT5o
         rXIQ==
X-Gm-Message-State: AFq9FYLfeuJxWVSUXbl8F1WgvfqA50um9nxWrTwJhNWkuH6wUg7HZxqG
	zoQvOw6AYV786/dh8wGhwGUftYpCNFC2sMMy/fh3gDCw4GZ6RH/oyIxHhX2mpSQQDbs4adgfsYe
	BNc6a
X-Gm-Gg: AYBFou3HPSIXT7jTdihGv1d/lsuXwMgYgoOMs1mJ7Cf8xvY1aoBOj+D38ymFWtCEP2y
	KDfsRrXeSz32FCaxXkpTq2s7Qju1mjrDPlI9A6NsP5yTicULFRnCFdU9VqnVUORG4+azVY7IHo8
	vBk70LbdvwHAnHhYSm2B8IKaVCha+ZVsL9/864p6htuvBsldH6CLu/bFRs/ExK/CRPWUVpe5iz1
	E54PaTXEdFCg1SX2Iwn1/xXd+wztEVx1pcbpEtiMsM6yWmEe4rM9MPsMKgEXF/uB2e8/pmd0lx1
	e2YqMnLz7mDmKlIysjS7Fu5ndL6Xt1bGn5/pblNwiyCc50A0uLhIFyRQKhyXR25GPQbcD2Jha9F
	zkAqidWyP3naXiLZlQDQNIOqbZSTo4+t5WEiERl7m/ng71gp8C3Qw54S3XpAM+lBBRGzJEe/DPS
	yLSOUn4spV0XNwgWUeaTrBgO4aUTJBGRLYGkF3psF8JSckGmx+FEoZ2wEo5UJKVygZ5UUiSooXr
	EeZ/s3iNPUlsDZOVztluc36WoXclZwZ7UaqSB2cmPYjrGDoffOKN0F2zCu9H1ats8xWR4WZTDhS
	odNdJjZ4gEUpmCO187CYJI7xE7gO1cr60MN0BG9rFAm66dhPDhKJoRzX0haqRWJm3IlUF7fC8Xw
	syrgF
X-Received: by 2002:a05:600c:3d8f:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a35ac48640mr152397485e9.4.1793092840312;
        Tue, 27 Oct 2026 02:20:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/61] python3-icu: Upgrade 2.16.2 -> 2.17
Date: Tue, 27 Oct 2026 11:19:35 +0200
Message-ID: <20261027092028.782979-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131472
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.17:

- Added support for DateTimePatternGenerator.getDefaultHourCycle()
  and enums
- Added missing wrappers for UDateFormatField
- Added support for ICU 79.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-Fix-host-contamination-of-include-files.patch        | 4 ++--
 .../python/{python3-icu_2.16.2.bb => python3-icu_2.17.bb}     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.16.2.bb => python3-icu_2.17.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
index d3a05972c3..b159d24a17 100644
--- a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
@@ -1,4 +1,4 @@
-From 5648531ec5f77f5270ddf5c7e49ade5c160669bc Mon Sep 17 00:00:00 2001
+From 2fe99147f24049694c02f857c9bcc900575d8de1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Apr 2021 10:48:36 -0700
 Subject: [PATCH] Fix host contamination of include files
@@ -16,7 +16,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 8a975e5..e85fdd3 100644
+index b87ae66..4c81aa0 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -68,7 +68,7 @@ elif platform.startswith('freebsd'):
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.17.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.17.bb
index f700aafbb8..5ebde78dd6 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.17.bb
@@ -9,7 +9,7 @@ DEPENDS += "icu"
 
 PYPI_PACKAGE = "pyicu"
 
-SRC_URI[sha256sum] = "006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d45a427dde0d10aa52"
+SRC_URI[sha256sum] = "6138b95ac9592fa3983bf489e0c625e8fcfffd0c562a36a08269cecc4ffb48be"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.47.3

