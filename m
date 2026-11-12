Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7987.1794465759689789228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oRdGVlmG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso390286a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465759; x=1795070559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTW0EIxph2gX5KJle8Wf+OJUb+n4VBCQkMtNRfQLLO0=;
        b=oRdGVlmG8Wldy+gkiDY5YNdr3qpW9FUryRCT0yirZ3ASuE7DwpOD1LwVmeDYBn9l8B
         cqcCMx6K3v0ysOgYi8L5Tm/olhjexJ2UH2fHI5Xe//1CMiSp41KYjexpFsajH3E6hMXm
         vJnWQGy/0L0L/A5AC1PNrEaJc3qTC+K2zNC+otGOIWnVAZmBbgoSQ640wGDRugtJ8bw3
         3T6bhfRqKi2ermAlCGMCWUTodul1NWghV7NzxJkyRkra8QAtcaM9NhZMKHws6COZWKW4
         pFSyc2IPfQhYXnSskPF9FgjwnfD1tvw8r/YiaZLMl+ynCrIflYLMKQjg9XGz3Wfcmmjz
         F7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465759; x=1795070559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTW0EIxph2gX5KJle8Wf+OJUb+n4VBCQkMtNRfQLLO0=;
        b=WMCrLnNLOP+Sj7XvuAd3Pg3rTJTFqRSw65qdMQgyfPvDo3vPZaOs0gGz9FtTwv6scD
         eGZUrSm/1m2Fo0avBgGrcr/H+Hd8YAMOXX0r0abVL1Z/mvq1cDmzdEfghtYdWQFR9E+U
         7JNuzYPRJDiDdXuUxT0fkSrjv2Vc4zcYUBD7BAhQ10rM0nT9aO+caQgURhuufHXZiC3G
         +jEr1qnVAPzspWW6QOabf0hTP+UG1kdNqPz9H7DIKczFrx6RPI3kNqkNYLuVM0reM3VX
         n6sezYY+6KqsUQMg4HTDRuCcw8w+Qb6ZAQsl4OmqMVh13nQTusdNFgDi3U1OlPtebiIa
         ixsw==
X-Gm-Message-State: APuU4Z8HugGStP+2elvWIug2uHRJHdTuty/pTiACMc806vnFeI7VdaD3
	IFLool4RrMBpTVYNy8TB4ueKnm+0+GUGmY9NSA2j+dTp3ccMGfNVTQcN0+sJRw==
X-Gm-Gg: AYBFou0Hl9L3YnIesgt3OmU4qkjC3A0Yeb+3Npk8Xz970rlv1jgatRsEk4UlM66/Reh
	a3+/Pjam9kAN8CY+OV74Lg4b3/jqm1IK1/3nAE2FnzIvD2E705wsvw+Y7E4GAgVRWGouLDxM7XH
	CMDTYQzDZu4c8T4TOSsHt/pMixdQSJneI4HB77gQc28Jw9tG72CFQvv1UuR8ghBTcd4TIQ/fze+
	JjDqvuHeP6CAYNHbM53Fn/akQmObRqL5QMPob2sVNAhlsR6HwwdTYLZ7V4N3bpbs1CKNwaYENKr
	EefRSBBkF2PB4jg0Eh02VxrVPkWvLY8oP3Egi+l2YxnagkuozMg1VmiBQ4IlmmTRpGlF0VVtckW
	WkKBnlrHowXnPdGEG/vNcSQkeORuHiSo11NyFmFqjMv7pJEI2iLdo9y8JA09dOl8rZQh1arnsFZ
	D+Ri2yIecFan//yTq4OjC8e5ek4Gv9A+NkuxclH26Y3aF9htv5b3ncL29wQDiIS0gJhrDmAQPCj
	RNr0HlfYh39h/GBeTr0meEXdmfyn/czRvEGBRfNUIECJVviUxD5AFDlluH9fkVuEvei6LuAD1KZ
	PYJv0BEIxvKcy886mvww5ly3Z4RYQQZU2OUvFteEaJ7igxTOph5CesTrdcehTohc7d+D+cEvHsQ
	/sHL+vu0bFBAdyoCn5xCNKIntJB0KHPIM+31fr65ybAT5BVYm76M+K8TMS62exRD+YztGFA+cK3
	pHMMdyotGTe8jJFR9wAi4MtMetczo9403tv0WBCfZdtRT/+H7xtch9jg+QJr3BIDRO3Aftw/dbl
	hitAFo4BGD+3Qi6ED8LeKUkaaMct8Wh23T8+mLQIDPj6Bys9xhOSJiZrWkGIT3ANC06drLCdgeU
	X1H0jg==
X-Received: by 2002:a17:90b:50cc:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b197c93f2fmr1108242a91.17.1794465759023;
        Wed, 11 Nov 2026 22:42:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 09/24] ettercap: upgrade 0.8.4.1 -> 0.8.5.1
Date: Wed, 11 Nov 2026 22:42:09 -0800
Message-ID: <20261112064225.2410019-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132178
Content-Type: text/plain; charset="utf-8"

Refresh 0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ettercap/{ettercap_0.8.4.1.bb => ettercap_0.8.5.1.bb} | 2 +-
 ...h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ettercap/{ettercap_0.8.4.1.bb => ettercap_0.8.5.1.bb} (96%)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb
similarity index 96%
rename from meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
rename to meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb
index 9a2090719b..8ec930d39c 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.5.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag
            file://0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch \
            "
 
-SRCREV = "0dc8409779f3a09cbfff4434b9a4d7b33480d88d"
+SRCREV = "832524f3c4c215f1007fe9f190dbf052ee965b55"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
diff --git a/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch b/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch
index 126d37ff50..8beb540334 100644
--- a/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch
+++ b/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch
@@ -24,13 +24,16 @@ intact for the remainder of the translation unit.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+
 ---
  include/ec.h | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
+diff --git a/include/ec.h b/include/ec.h
+index 5536982..9723755 100644
 --- a/include/ec.h
 +++ b/include/ec.h
-@@ -20,19 +20,23 @@
+@@ -20,20 +20,24 @@
  
  #if !defined (__USE_GNU)   /* for memmem(), strsignal(), etc etc... */
     #define __USE_GNU
@@ -44,6 +47,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
     #define _REENTRANT      /* for strtok_r() */
  #endif
  #include <string.h>
+ #include <unistd.h>        /* for setresuid() and setresgid() */
 -#if defined (__USE_GNU)
 +#if defined (EC_UNDEF_USE_GNU)
     #undef __USE_GNU
@@ -55,4 +59,4 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 +   #undef EC_UNDEF_GNU_SOURCE
  #endif
  #include <strings.h>
- #include <unistd.h>
+ #include <time.h>
