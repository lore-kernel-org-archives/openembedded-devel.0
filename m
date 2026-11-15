Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3869.1794729024787977195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B1XJgr9A;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3168032eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729024; x=1795333824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXP0unqAJoDXtsr0DBd4FNvqhivVGE9NgrI6X/N2xPo=;
        b=B1XJgr9Aw5q3X8XeAr/Y6LcVOAAmBNdEL4WVcgIXKUEHiRQwbeRPs2U4IlzTjf5HLo
         USdWJyj+63i8gUkqRai9mls1RZkINwOpTyLhprYcNEzlLZKeJtBdpxdc4iBnAvjkThJP
         RkdzNrVAy1rJ8OyKMf66dw6iuC4N49kMScN4yDFLJc/rAvCZSFuna5T/2JRbfiOMfXlM
         1I4SFtpG/dsN4gu1BXeNbq9P/QNMIJ+btIr64H2oqrgBbwpmsMwax87G6e7fsVR0D4Uw
         Iz2xEndNs8uirDrnljjozvTMkYzpbHUlUld6Vp3yGtBpU6unjJdNAc46OXhSqlvN0i16
         4XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729024; x=1795333824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXP0unqAJoDXtsr0DBd4FNvqhivVGE9NgrI6X/N2xPo=;
        b=KgAumojFfEP8zPXHKNmSLBdKJTbYD71v+PnABkNhINfYZ/T8bydsbNIQjcDdjC/Ete
         R+/D5RFgxqNesiRsxMzJnQdHYbGMahZHf0VkpzZX3D+s/RG+r7zG26IhCC96wiqYVZI6
         pVLz+dpe8PjzpOoeHxgIcJzIGJ9uX2Dc89+0FRm6O2S5JmhyAO3xcuDVXWvX55bbS76k
         jtRD/STu4Y1W3Wpq222Z593Pqt8WpLrDDUZXNhVeLXbhfE4GIhE/DdiFtKMa/TU8s0fA
         1ahiXz6zLkJBdlQNN7WoNfFTFToAhNseajk8wI4SFR9gmsjwe7sF+H+dMb8IJalt0bji
         a3oQ==
X-Gm-Message-State: APuU4Z+dp5csD9TYznBMbA5bbZgT7v866VIXZCazuCvcJHtgG/hxY+FA
	+pY0c+bkN0bFrRGQWoMJfRTw1Ey0gGJN3f7dxYBRoKM+9wTHC4T5+qOGCsuYlc2Q
X-Gm-Gg: AYBFou09NIxhDSrDAlo9b6jMR9a1F9fVtz6/a31H7sbyEF6w87Gm5Zulqvc5uWQxGNa
	YfCClU909L3GdodCwjJZI9mRYhoSvqWCchzyj33NjwZAnVguiR2N/C/nP9lhoeWt9TTNnC0aiKh
	oA8pA6nPdiudayPA8gKe1WuC5j7CzDVQ1j83B9N8ccxSyhGmfNhyqBx7p7zUgndfz/hZhX0EZYQ
	7QBNaUKwuChnHdL2N2sNxziJVVruf0yL2bqx/Y6j3T0/YR94a9usUFtjO6+os0WUW+3vD/uyt0S
	czfTKNYV7e9h1jbo9JYplDl+rMaFb2dEm4zdFxWX+FeOsLMxe5iRG0lh4uws+/ReWlfPyJ/D9Dt
	AklqS/jU1txiMZBWBC0gZXy2fig+t/d3YhuSqJ0zLnZbvqIvVEowSHMWMRbrH7Q3XhQcqHzaN4+
	87QbXcYkfPMCI1Mqj7zKVIqj6h23TVUqU0y3EhQlyznqdxJn6551XhO/wlStVTS4v+6ka3LfE16
	AIuq32toZv8UuO1kQuXjm/dm2PJXZQ/9zy8lyjLnLZRzMf/U9fdALnhWyq/H3E0mtW4Fyvq7Lwo
	ccg0d6XHgk++CFKsHOxcXHAPXHxc8Y1R4wv6aUE6e/RkT82vC8Z4vbVkAO5xO0sy9JWaimCv2cq
	P7uxxco0j75FWLw45m2eEvoZeTAV2Fihko2sOekmcVj6L6n6QaNflu4m18jAsPtMdPEpW6klKsx
	ZViKysVYQn5vFibsKHvk1acivge0GFqzdjam3uJvDOe2QiBqotxdbmwTPT9xoiz/TUf6cnrJxOu
	DXu8ZzkaA6PZ+0UaxAnFVVA4ckMOv8Mo+xLweA4cDR23HclEYsqV9sZ0sU6NVhAfaIHa2QnAVO8
	CK9A
X-Received: by 2002:a05:693c:811b:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-37964b0992emr7968971eec.5.1794729023990;
        Sat, 14 Nov 2026 23:50:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 39/96] nspr: upgrade 4.39 -> 4.40
Date: Sat, 14 Nov 2026 23:48:17 -0800
Message-ID: <20261115074918.2932593-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132309
Content-Type: text/plain; charset="utf-8"

Refresh 0003-Add-nios2-support.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nspr/nspr/0003-Add-nios2-support.patch    | 19 ++++++-------------
 .../nspr/{nspr_4.39.bb => nspr_4.40.bb}       |  2 +-
 2 files changed, 7 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.39.bb => nspr_4.40.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch b/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
index 3d1bbd31a7..c9546321bc 100644
--- a/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
+++ b/meta-oe/recipes-support/nspr/nspr/0003-Add-nios2-support.patch
@@ -9,15 +9,13 @@ Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=124442
 
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
- pr/include/md/_linux.cfg | 45 ++++++++++++++++++++++++++++++++++++++++
- pr/include/md/_linux.h   |  4 +++-
+ pr/include/md/_linux.cfg |   45 +++++++++++++++++++++++++++++++++++++++++++++
+ pr/include/md/_linux.h   |    4 +++-
  2 files changed, 48 insertions(+), 1 deletion(-)
 
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index 009d5e5..77c13df 100644
 --- a/pr/include/md/_linux.cfg
 +++ b/pr/include/md/_linux.cfg
-@@ -979,6 +979,51 @@
+@@ -978,6 +978,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
@@ -69,11 +67,9 @@ index 009d5e5..77c13df 100644
  #elif defined(__or1k__)
  
  #undef  IS_LITTLE_ENDIAN
-diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
-index ad57d08..45a2231 100644
 --- a/pr/include/md/_linux.h
 +++ b/pr/include/md/_linux.h
-@@ -55,6 +55,8 @@
+@@ -54,6 +54,8 @@
  #define _PR_SI_ARCHITECTURE "avr32"
  #elif defined(__m32r__)
  #define _PR_SI_ARCHITECTURE "m32r"
@@ -82,8 +78,8 @@ index ad57d08..45a2231 100644
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
  #elif defined(__riscv) && (__riscv_xlen == 32)
-@@ -143,7 +145,7 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
- #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
+@@ -142,7 +144,7 @@
+ #define _MD_ATOMIC_SET _PR_x86_64_AtomicSet
  #endif
  
 -#if defined(__loongarch__)
@@ -91,6 +87,3 @@ index ad57d08..45a2231 100644
  #if defined(__GNUC__)
  /* Use GCC built-in functions */
  #define _PR_HAVE_ATOMIC_OPS
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/nspr/nspr_4.39.bb b/meta-oe/recipes-support/nspr/nspr_4.40.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.39.bb
rename to meta-oe/recipes-support/nspr/nspr_4.40.bb
index 39083c2f66..c962c779e3 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.39.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.40.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e"
+SRC_URI[sha256sum] = "c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
