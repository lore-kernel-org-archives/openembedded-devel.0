Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.899.1793316680724313069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VHkTE8C3;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so193809c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316680; x=1793921480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBAvr/N4Q/Y+1fvWfVAKLpSLa0lNOG6y4g1D3O5L4RY=;
        b=VHkTE8C3AgDweIAnp7h56KGl28xzd8TbCgmwE/kvM9n+2x9usjuekkFKust/5ExNOx
         8ZRrFNR5Z1luljQwzX9azTPpTubC9hDqF5P6zkRqu+pjIqGedzWAhQl3S5NjLAx68XEj
         sp7OQtaQbkIXFXHrN+3JBgWMFXQwKiIYURXFzJ3ExwdHyrOwheBIfxhQ3depaYYX2L65
         Hz5q8eP1tPbnzkRt7vChE21WlEqqtC8FuJaA1dGSsx43zH7MUGHKvqbgBvLfn5nOPmS/
         JFOz3Y3EkWWwjjulzeyAshtCvQ6aRO1LBi7OL/hOSA4ly1A+BOUdg8FjRiGzJzeMdajH
         2U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316680; x=1793921480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBAvr/N4Q/Y+1fvWfVAKLpSLa0lNOG6y4g1D3O5L4RY=;
        b=JkSkPFZOlft58+7fOA7O5S71tD/gwLGtKDwDq83qL2GzjtHkeNVQkz5+pp5LEncm8g
         F3fnGdu1yv9feNOrmc1q/OWOH0IsWMMHZSShz0GQhyik75+kXN5ednpS+iMfGxZV4aff
         WLH8wUmqLfwwj7RBRfREmoqF6b1x/lJvfjWPaZKQTITox6tzZnY5hHV1uqTnb+Zr+RHY
         E3/9mSBUuMTWP+/txvgHbsf8ZtttM4vPhpWl9K2hJHSkKbran8M74yL502v6rra0Uktu
         hcNUx+KCNJHNA5KLtWXelRXDZgnEFnmiWqZ5q0xBhATHofv7Cq2iXz+i4X+ZrgZ+1cnl
         Jw5g==
X-Gm-Message-State: AFq9FYLM+1zPUyT/7GeeZWns0qMN4hsOBiaYQdvGNyZdhXhGEa1Wesr9
	SBrTcPG7T/PCixv7yneRYYY91CNerSMTZ1vDRxg4QkNrmPZUXNA1c6Uf9+FtZQ==
X-Gm-Gg: AYBFou1amj4tqusFZ/0P6RzyZ053Z/qJw8w1QmKpoIDBttB7YaznA8GII3KsuRj1gXl
	onMiajsVviSz5sB27TneDasJWCi+q2ekTGNwA5lTstF9KRycOQivxkOa1RwHbu39mfgW2WRlh5s
	j/b0OeN+OTiwy6dNxIVPY6FRW4nNxXa/tLM0+FJ8B80wgoSYwvI9ff8LPO544S4irrT7fznXU+S
	pFFfHk94DoJT/zDROU8qJI4sq7AIojsEVqfh4x+UvR/ppGfTZt0iQoWTYZPBo3fbY7/p3P7+449
	IxxASW3m94XaY9/112wpR+7WlbAssFisJrMKUQ7pQe/huGX/pj5aAkWcUf8nYyvvPJShpnIizM/
	lPmxrfaba9dPM2E0viGafLtLRyhAzc/pmIzDtEokrbVUClmHWZXGdkDvfTaI0lQyzkbnxgXhZOV
	/cwdSPOUOamgpmVOJV+NjsJ8IzgsMH3ThMAuH4e94TziFyLJEhMAmThiBVQdfdds2BBMm/NU3iH
	21PjGhxl2m4+9qfPIP0mBR1myBv8g9mH9IQfdWuyxmzO54Yk4mha/7imUDqsprmf7rylmlHyzAs
	KoXD8bk0neAWbseFTONTsmrXN+O9L2btklMlxYxaXa3Nd8FfjYUyEydI3amzsZ2W
X-Received: by 2002:a05:7022:170c:b0:145:287:ce91 with SMTP id a92af1059eb24-1ac59dd30ebmr726176c88.14.1793316679904;
        Thu, 29 Oct 2026 16:31:19 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 6/8] tcpreplay: upgrade 4.6.1 -> 4.6.2
Date: Fri, 30 Oct 2026 12:31:00 +1300
Message-ID: <20261029233102.1177876-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131675
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: file moved to repo root and removed custom preamble[1]

Dropped patch that is now resolved in the upstream version.
Builds successfully with glibc and musl.

Changelog:
https://github.com/appneta/tcpreplay/releases/tag/v4.6.2

[1]https://github.com/appneta/tcpreplay/commit/8f93af9909025eca257b550df9eafd0bfb3bfab2

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
