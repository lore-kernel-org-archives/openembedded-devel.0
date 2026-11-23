Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48034.1795411857250989969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CP0WlM5Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382f4710a17so4982202eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411857; x=1796016657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKb3+vEM6zTvlWOY+YZqE8OBAO9D4Jv5lhFYOJJdslo=;
        b=CP0WlM5YHsYLoRzgi5MLsHgroBATdU2gXZsRWDRk5JPnqTcLwitFkxm0ZRgwZX6eSQ
         MoPcmmziXt7Y7al+qa2BrKRtyO4v2wOYkTnu/zmEYrK/wyCAXp25fXxADFCpN5xpg/6x
         ormjgIkg95dyCL5C27dCXz+kDdFYmdFuB+xaus9UjPNBefEynZNIJwRhMmtPWL3Raf6L
         XudbyNn915mcA0VaaElsA9VwzVOY1k9DnA1g+MxmwGLYOb85n0tFUawF39NKYSP4HNGg
         ltMf9IThMmw0/jyzjfI+1fP9/nztyqMSrj9xUlWRbUlHiHyYitKkYjEVbnuZjwJm7eZ4
         CxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411857; x=1796016657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKb3+vEM6zTvlWOY+YZqE8OBAO9D4Jv5lhFYOJJdslo=;
        b=XCfM06mHiKX0SRdMTJ+cfLkC6H+BNkJgLrOMJbr3fQ/HzZSGdM7xQ3IaBBqR/OHEC6
         SHYEO99Qv55DECw5ah/CU/ANfnAOcmC+TNqtmyoL3rgvbwD8bRHCBPk4pxKN6cXp2Pa8
         328U6j6miaxseliQ/zUcIst01UoskBNNKFliVS7H6FdKjkHFbGSm4g7AFqIWZuyhonhd
         HKPu8jtXkDvPjigyGd25d5yFIpPPYG7bXX5X+LbDurj6T91Bi8mcjmrpm9M3Jl+p6G1I
         qlu1fzhw9YVFa/fMDSYGY7vW8Hyp7L96tWczrqRx4pl4NDPk0JakEMG31s9ebry88DLJ
         xSMw==
X-Gm-Message-State: APuU4Z8fIs1MF9DHpoGP5Hmdsf0wpOYhvoFAFiSRZMwYaRxg0vstyNp7
	stEDR/L8dzZM37eblrzEMomC/ch8r6A+q25wS4dLErR/IeEJXmkcS2kLLGDVHY9wlHQ=
X-Gm-Gg: AZFdTZcqePco0UBfz1TaxLSZ0gXZoHdGr+FEz/bsmBHPHu8EOjsK5G64MzPHYptftH0
	b5ZQRMmee0lTntKzP/6Z0yjxYrebIpP7+rcuKzphFSSF1vtbud148MdUBK4xiYloTNVGHd7ZidJ
	WUnD7pu5vidXbzg/3Ra3qF3BXQM67+qFNFNgwfQ8UpkSyhL9X9GWyYK98a9HtsZEFsUpiAfX/Bb
	oAemWqYaTyWrsrzIg6G50rT0TflwIZVsxOYSCsM/MII0wknLMyp2WRKhm5iQPJaynbkVmm/7VKx
	mMk34qfE5BpZaCDVUtJhwwFOCuIAtcP4y/ISf/+QJDVOvNPLKf5SDsO326EsEpPicCohywv8fcx
	BZ9cY624anHimaNFFrFtrOqNjbg4mdDurPH0xI/5+ffbc2r+UtUq17D2zM1ZSLfFZTphHIENq5t
	+NJMB0BiHuxu8L7aQbgFr8mSSex13dtDvU3xn3sasvH9ZPaRtM3VXe0QzFdmuCNd1XPCfOGeq1h
	8pqI3OXhhYr3+bJWt7s+x0msoSZ47x+XoZnZarJmwSTYUQTB4Yp1ARH48c9ALwNeJ328oMHKaL2
	BtvB8e/Jfcun8chSPeT/DO7GsMD9iJxmb/LUGwsEr/BI4qeP2xlCdcg19HNPzrE0ZPazX/l0zAf
	wyC7BR+nJKCJx3BCtWj4xWLEdbQuTisOCqMbg3Dmv5gCUkObRkpnzMg+7iemK8kdOuKHYBAqgmQ
	OzVRgvjaT4VnbwFi6rUTWL5VVIvq0E0zJ4ewecq03LMklDYTEwHNli4jF/hLt+1qDcWJcnlGbm3
	Tvn+owi8Lsg1fEmcskqA4z5mZ+i2Wd7ihaWQVLRmyi0um8AEech1NfPiF6sGK02BjM3LRvR7y/F
	+y/C
X-Received: by 2002:a05:7301:fc18:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-38570f27031mr10888332eec.28.1795411856499;
        Sun, 22 Nov 2026 21:30:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/42] libmodplug: upgrade 0.8.9.0 -> 0.8.9.2
Date: Sun, 22 Nov 2026 21:29:06 -0800
Message-ID: <20261123052953.3658549-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132837
Content-Type: text/plain; charset="utf-8"

Security hardening release: adds bounds and overflow checks to
many module loaders (ABC, AMS, DBM, DMF, DSM, FAR, IT, MDL, MED, MMCMP,
PAT, UMX) and the MOD/XM save functions. This fixes several
out-of-bounds reads and writes and a memory leak in the IT loader.
CMake build support is also included.

Drop the register keyword patch; upstream guards the keyword for C++17
now.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Drop-register-storage-class-keyword.patch | 38 -------------------
 ...dplug_0.8.9.0.bb => libmodplug_0.8.9.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
 rename meta-oe/recipes-multimedia/libmodplug/{libmodplug_0.8.9.0.bb => libmodplug_0.8.9.2.bb} (81%)

diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch b/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
deleted file mode 100644
index dfdaf810d8..0000000000
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug/0001-fastmix-Drop-register-storage-class-keyword.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7a25d5def379db387de9237f0b03605b3ae277b6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Jan 2023 11:32:59 -0800
-Subject: [PATCH] fastmix: Drop 'register' storage class keyword
-
-It has been dropped from laters C/C++ standards ( c++17 and newer )
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/fastmix.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/fastmix.cpp b/src/fastmix.cpp
-index d693d20..aa51c4a 100644
---- a/src/fastmix.cpp
-+++ b/src/fastmix.cpp
-@@ -288,7 +288,7 @@ CzWINDOWEDFIR sfir;
- // MIXING MACROS
- // ----------------------------------------------------------------------------
- #define SNDMIX_BEGINSAMPLELOOP8\
--	register MODCHANNEL * const pChn = pChannel;\
-+	MODCHANNEL * const pChn = pChannel;\
- 	nPos = pChn->nPosLo;\
- 	const signed char *p = (signed char *)(pChn->pCurrentSample+pChn->nPos);\
- 	if (pChn->dwFlags & CHN_STEREO) p += pChn->nPos;\
-@@ -296,7 +296,7 @@ CzWINDOWEDFIR sfir;
- 	do {
- 
- #define SNDMIX_BEGINSAMPLELOOP16\
--	register MODCHANNEL * const pChn = pChannel;\
-+	MODCHANNEL * const pChn = pChannel;\
- 	nPos = pChn->nPosLo;\
- 	const signed short *p = (signed short *)(pChn->pCurrentSample+(pChn->nPos*2));\
- 	if (pChn->dwFlags & CHN_STEREO) p += pChn->nPos;\
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.2.bb
similarity index 81%
rename from meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
rename to meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.2.bb
index 13622407a5..0e46825842 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.2.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "http://modplug-xmms.sf.net"
 LICENSE = "LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9182faa1f7c316f7b97d404bcbe3685"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz \
-           file://0001-fastmix-Drop-register-storage-class-keyword.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de"
+SRC_URI[sha256sum] = "e4d9cb46da78a639d6eadb4ff3ab955f68c3099579b5310af64b37091e28957e"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/modplug-xmms/files/libmodplug/"
 UPSTREAM_CHECK_REGEX = "libmodplug-(?P<pver>\d+(\.\d+)+)\.tar"
 
