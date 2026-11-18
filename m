Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5697.1794974925976771286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cRSl4utC;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so1560501eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974925; x=1795579725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfYe48n9Eih8kxqIC3o5XQ61NS6fHDbilu/RksTcarA=;
        b=cRSl4utCFKRCzEibrM2pfzugG/yjcudc0F6vPIn0c5mss4aj1ZUlojuLfZl9CIDxu4
         +Y66m8HwcjxxJ1yTG/lOuSIPQ4EdhuITEOOd4PoSDaTWM1AW1aG+B5Jwj07MlOrygLre
         HyaiAlGyZtl7o26p8J+nHeYRh88jB6xu9xWLqofsUDnxweSiepeyZ/x3g9LhVmmmKOes
         ZWYCuxSvPPG9lV4fw+mLmJbfD3WCl7Mi3AUs2WjHU9l+gYnD2uQphc7uGSgjNFHQiKJV
         cP2zrxfzMjvMLMo3u6nx1F7N6lXm1q0EYG4ggGGQQ/b1vm85awtRTMaJme41H05b6bh5
         TzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974925; x=1795579725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfYe48n9Eih8kxqIC3o5XQ61NS6fHDbilu/RksTcarA=;
        b=jHxb5xSkFzlney5JMYtqtTDUn1wVZTLoEaAf1ovFm5zE8UM04Bh4buXDSHYNSRFdCJ
         mRx9h8sZqQz6wEUGQZu0ktr6ptHTXcIvsKjGzqT1r2FBm9sdEKIsuhUWoyw7d/7IXVsf
         Jv1Ie/qv82qK86KibGMe01COTzvl1975Zg3o1eeHGUJswgPd90yWzV10w+wnlUCj+yrS
         JazGJ8hN2N5QexUhWRy8OL3hLJJLHX/9gbyKAHFdmKzqWBDvpYcW1KEeouYjpow3LoMr
         vkLED+Jzix/KdoweP3BH3vzNDkncssraMqZ8fXMYSElSuxUxYiHQWU3YJHkwQ1nQe+PF
         MCPg==
X-Gm-Message-State: APuU4Z8WrqU8ySJ9oyg5MdU9TPUvsLAEh1DKEHeJaUwsLOIZJNZDD1OS
	EgDFOKfo/HoTw7ffiZkcNDdt3DUcqM7KppVEvFON7+/itmjpU6Z+2964lb/aeeHm
X-Gm-Gg: AZFdTZcV+Br/EBMsXYrWRd5szKnGF1WNcRLiqBm/pMfKsYiNAZnS6T5GcJ5ACQ9shjN
	GhfPKBDtJOaxp0tIQLR1WI3o2nG4aQbAxoTTMRbpqV3PRt4EexIPzxn4v/kVSWi1E45YiFj0Ygb
	1RJK0/gt/KPim8now7MIZT6x+ou9UX5sm3MsnohyiIdxDhGFEQCBFjPKDIYUG+Nh2N0q6omOq6a
	hzisHjtGo9t1/RLYHjimMFCaNM2GGQ/OUHb/sD5zn+yD3M6XNE4X7yQ3naSwWIEDEPLVliC5vvX
	Z+ZVJsjnD21k3ooHPrCsKBgpiarxoasEEHB3ZzU/csrctYBDh6o4xfYCWweBVXEfdw2pp+B3pVv
	MauUMEHXdum31U32zSWhM37MP84TuV5XAJtOSWfQ0Knfe566YH6Vv12jCzKwVquwirIaPtN2LOl
	CywaMbLEqaQ7nuWqRlYZcoe1NHrHWuAqSu8gAuRA+U4IR9Qm4+LzKmRsW9NQF9OPd3uTTMHyiR2
	VTXewV6QiYlyZwVQiBtPXPLLBOdu+FfXMQqvfnuRYLiDOdafSr0rH1aipsZ7sGqztgxbOXY5waI
	+R6Rp4+MHYpDOOOPM74p2dNXA9NUxRhhA5hmkYjzAEIAkxr15hOXAIysPWczDLfxC/fFqqMM6CP
	hl0Pgr2cGtFnxCIeCTnbm53cxbnADV1nGWwDSXHJ4Aq+qjNIzCP5MN1Fdg+sYiNeujdr/3RBGmG
	U/r4Bxj5Pst75aAylxpOfzdGtX8Zx0f7qYNuyt6NFp6usa+3jPYrLV4LviOiLAczoU9tt90/f/n
	gJ9WVJ+haus8kIYYcZvJkeY55lIrHJlAnjXW//hbUylTHy3xSe2cpXk32uuErv6g4E7sau4Sgjj
	+/KM
X-Received: by 2002:a05:7301:b02:b0:375:f846:5b50 with SMTP id 5a478bee46e88-38280a3d628mr1322619eec.26.1794974925248;
        Tue, 17 Nov 2026 20:08:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 6/8] ssmtp: Drop gcc-15 incompatible-pointer-types patch
Date: Tue, 17 Nov 2026 20:08:28 -0800
Message-ID: <20261118040831.2284885-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132621
Content-Type: text/plain; charset="utf-8"

ssmtp 2.66 already casts the handler passed to signal(), so it builds
without this patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ible-pointer-types-error-with-gcc-15.patch | 46 -------------------
 .../recipes-support/ssmtp/ssmtp_2.66.bb       |  1 -
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
deleted file mode 100644
index cde2ec4681..0000000000
--- a/meta-networking/recipes-support/ssmtp/ssmtp/0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7d3db0f63b9fa4a0deca486eccbe60c3cfa00750 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Wed, 16 Apr 2025 18:28:24 +0900
-Subject: [PATCH] Fix incompatible-pointer-types error with gcc 15
-
-../ssmtp-2.64/ssmtp.c:1454:31: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
- 1454 |         (void)signal(SIGALRM, (void(*)())handler);      /* Catch SIGALRM */
-      |                               ^~~~~~~~~~~~~~~~~~
-      |                               |
-      |                               void (*)(void)
-In file included from TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/sys/param.h:28,
-                 from ../ssmtp-2.64/ssmtp.c:18:
-TOPDIR/tmp/work/core2-64-oe-linux/ssmtp/2.64/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
-   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
-      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
-../ssmtp-2.64/ssmtp.c:1393:6: note: 'handler' declared here
- 1393 | void handler(void)
-      |      ^~~~~~~
-
-Note: as of ssmtp 2.66, the call site already reads
-"(void)signal(SIGALRM, (sighandler_t)handler);", so once handler()'s
-signature below is changed to take an int argument it matches
-sighandler_t (void (*)(int)) exactly and the incompatible-pointer-types
-warning/error is gone. Only the handler() signature hunk from the
-original patch is still needed; the call-site hunk has been dropped
-since it no longer applies and is unnecessary.
-
-Upstream-Status: Pending
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- ssmtp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ssmtp.c b/ssmtp.c
-index 4dedaf8..a938d14 100644
---- a/ssmtp.c
-+++ b/ssmtp.c
-@@ -1390,7 +1390,7 @@ handler() -- A "normal" non-portable version of an alarm handler
- 			like a socket. So we longjump instead, which is erronious on
- 			a small number of machines and ill-defined in the language
- */
--void handler(void)
-+void handler(__attribute__((unused)) int sig)
- {
- 	extern jmp_buf TimeoutJmpBuf;
-
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
index 67c335b7a0..714b8ce635 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.66.bb
@@ -7,7 +7,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://build-ouside_srcdir.patch \
            file://use-DESTDIR.patch \
            file://0001-include-libgen.h-for-basename.patch \
-           file://0001-Fix-incompatible-pointer-types-error-with-gcc-15.patch \
            "

 SRC_URI[md5sum] = "f9894703fcc559f63cffacfea08f9b75"
