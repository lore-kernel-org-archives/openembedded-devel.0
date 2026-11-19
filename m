Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1842.1795113362062904631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o9deVFBh;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so85045b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113361; x=1795718161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cdOrp8amlIajMzWUTJUbMdUxLxDi+AagDj1ZIuURkM=;
        b=o9deVFBhFl5b98IrRvIVA8bxHtn4+GPGNdHWaegqnNCQM1ubi9kId2lHLq1RkbqGEz
         h5atbjqFYvcDNdRqnp5dNZikXxersaRx4+MYtYE1jf+Z2bUK0pjReJmiv/gxZC/Ky1sA
         tBVI8UWsrT0e4rUNKLEivEb2hD2xvyX9AVCNRJPpYRG7727iFDrqwdk3O+J8oB6rmfCB
         Q1OBUl3zi6esYdeq7QWA8VHB5Vfw23ZUR+zRPNXUuLtkIqMHFkwovIZ/nbRGsiASYfVV
         9Q10gTk6PtXtzMiJPMm9FpoaVhO7KBGhO64F/xihl+93qmxCPg07H3CaZ+kIcZXJGmkn
         B/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113361; x=1795718161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cdOrp8amlIajMzWUTJUbMdUxLxDi+AagDj1ZIuURkM=;
        b=1Q4L0pifronOAyJi+X29UD2Pu1+gfvpKSZS2FB82/WE3hdH34SUpI/7sdBu75dZx1s
         8baecQricBaU4mQbmeDZD5/voKpqXWRdiBAKMvq+apoEADy4tt6HSNAQbwTTvPp9hQL/
         eVqsCQ8z9i2VNC5ddU3NpCZwSMUZCW/J5AfMROJGmOGanUnfG8m+m4v9y5/DepT2q4lF
         6n+x4xlt2uN2Vr6mTbW8HHiytd8V4D8Jpb2UybwXRb4SlxRDHzcOl5PnEaK3/UGrvGz9
         RIt6YqavATgHx+g5MFUwsibeNQVTwkkSWN7WhaDMjysTWPTQOnf+EKnZeJfYrfY5REjz
         yWFw==
X-Gm-Message-State: APuU4Z/S8xzzEa3bopB25weFz/EObpoUDxqDSu0wl/+ESgoJwyvrr+CT
	NkWjPc9AQtHxhtOvlL2TgOl+xLydOzmrB0wUEF879Emc3n936D0KdazGvG2bng==
X-Gm-Gg: AYBFou1hfbZG4Qe64NM/6bavZhNHdZILL5bqNWI3WzzcqRt1xQjBce5awYfW45jf6QJ
	TWW7h1RPqSZ55ibc5wJIIRN0ZyhRXWW1dNTt39yqtdSGN6jvm566+1JBkjm2DAM1NMW2ozuvuqa
	qncJAiONYF/6Vf+/47g6aNvAhIbKEpdzklkParuIRpjQTmtVMtnde0iP+e6gRdoL3Rt8jO5bHf6
	IJM2R+zhz8fCl1xQ2MsWuxPpLAu65CbusNcQmGsXy8dmTW6PO93gqc57Qu1RKbkTQBNDOMXicvO
	K8cpuYsiUKPOoxqaonTPtk0bkWOFnJLPmhehdHcuMTd7ZWXCd10n23Fj88XjepqJq75Lpqiitw9
	Ocx463fXbRLIy7+a3LJDiPxsba7EDUr3gIn0IBOMDNcvtINpQmnq6PjerBHJYJqfUXltV61UHEm
	ZaLabXlTQeYwR0JdTdRrbbNHjTKiJpd5bIKtCCQtw8VqtHso8E2lw2C8e805O14w9FnYnLJ6Pqb
	swB7V3pjNjOG2pOrhOtb+gtmorW4xmV8ykpx6wRSmY8Uw6c0Jv2SBXyaNymW9caWqwCRK2UZ9yl
	vLEDUW2AwiSvk0qCvaS3Qz9j2YKkrreI6Xq57bScLSGWW0jNCIHDcPO3umQ8XA==
X-Received: by 2002:aa7:88cf:0:b0:8b6:594d:7030 with SMTP id d2e1a72fcca58-8c87ca51fe7mr446173b3a.42.1795113361373;
        Thu, 19 Nov 2026 10:36:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 03/64] tcpreplay: upgrade 4.6.1 -> 4.6.2
Date: Fri, 20 Nov 2026 07:32:31 +1300
Message-ID: <ae1a3280adfd931e4bf20532ff7ed71156998d68.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132693
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: file moved to repo root and removed custom preamble[1]

Dropped patch that is now resolved in the upstream version.
Builds successfully with glibc and musl.

Changelog:
https://github.com/appneta/tcpreplay/releases/tag/v4.6.2

[1]https://github.com/appneta/tcpreplay/commit/8f93af9909025eca257b550df9eafd0bfb3bfab2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c29f3e598a674c687bb48766e4940da1a85dca5f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ix-struct-ethhdr-redefinition-on-mus.patch | 43 -------------------
 ...{tcpreplay_4.6.1.bb => tcpreplay_4.6.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.6.1.bb => tcpreplay_4.6.2.bb} (82%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
deleted file mode 100644
index 827b083712..0000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 29 Sep 2026 02:14:39 +0000
-Subject: [PATCH] common/txring: fix struct ethhdr redefinition on musl
-
-This #if was gated on "__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1", which is
-false (and always has been) for any non-glibc libc, so musl always took
-the #else branch and included the raw kernel <linux/if_ether.h> uapi
-header. sendpacket.h already brings in musl's own <netinet/if_ether.h>
-earlier in the translation unit; musl's header defines struct ethhdr
-itself and only then defines __UAPI_DEF_ETHHDR as 0, so the *following*
-<linux/if_ether.h> checks that guard and skips its own definition. With
-the #else branch taken, <linux/if_ether.h> is included via this file
-without musl's guard ever being set, so struct ethhdr is defined twice
-and the build fails with a hard redefinition error.
-
-Widen the condition so any libc other than a pre-2.1 glibc uses the
-portable <net/ethernet.h> path (which both glibc and musl have always
-provided) instead of falling through to the raw uapi header.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
---- a/src/common/txring.h
-+++ b/src/common/txring.h
-@@ -38,7 +38,17 @@
-
- #ifdef HAVE_TX_RING
-
--#if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
-+/* This block used to be conditioned on plain "__GLIBC__ >= 2 &&
-+ * __GLIBC_MINOR__ >= 1" i.e. it always took the #else branch on non-glibc
-+ * libcs such as musl. That branch's <linux/if_ether.h> then races with
-+ * sendpacket.h's earlier <netinet/if_ether.h>: whichever of the two struct
-+ * ethhdr definitions is seen first "wins" and the second is a hard error
-+ * (musl's <netinet/if_ether.h> defines struct ethhdr unconditionally and
-+ * only afterwards sets __UAPI_DEF_ETHHDR=0, so <linux/if_ether.h> must be
-+ * included after it, not before). <net/ethernet.h> is the safe, universal
-+ * choice here (glibc has always had it too) and avoids the raw uapi header
-+ * entirely. */
-+#if !defined(__GLIBC__) || (__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1)
- #include <net/ethernet.h> /* the L2 protocols */
- #include <linux/if_packet.h>
- #else
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb
similarity index 82%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb
index 5234da282a..6896a2b6da 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.2.bb
@@ -5,14 +5,13 @@ HOMEPAGE = "https://tcpreplay.appneta.com/"
 SECTION = "net"
 
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
-    file://0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch \
 "
 
-SRC_URI[sha256sum] = "cc3642816073fb1d96b3af36df4fb66c11f523da427f95b7b0c4c99deaa53afb"
+SRC_URI[sha256sum] = "ac4cbc58b4121edb273bc7d4603dfd6a762e7d344981233c8a253425d9dddd8f"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
