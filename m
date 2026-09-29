Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DD7CA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:43 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1481.1790722661982152438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i4kh0WNR;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso4691892eec.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722661; x=1791327461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pUlH6MigxuRrho1dJBcKtchFJUMsTHIf5H3cG9UiGU=;
        b=i4kh0WNRzyX6YJBTzVnrZfByNGZQKc73OL9sHRCXqW0Yv1uwEaL3O9feqHv1ZGKu5r
         9lrrfW3IYO9YQPwV2uVtELXz7Sh/GtHRogmVRAMEX9AaFqfu12WkroLgDN750Bsy4zQO
         z7/jr+EBdEFNqZDZ5iePEDgXPrVl1/mQCL587c2tjd33ZB3iwQRrVWMGiMDijZuAmcsE
         oXWz9AU9dJ3hSG9xVSprqXHHW+27hUiz/XgVq0n9JuSU5C3ArD8d+h5BnigR0ku2SLR5
         eELsUsVLGkS9KIHhSbFKsPea2BB4rMjvWCJALmLyIFkHC9u33Rhb/BqI5bUJWWh1NkuZ
         bqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722661; x=1791327461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pUlH6MigxuRrho1dJBcKtchFJUMsTHIf5H3cG9UiGU=;
        b=HWiHYc+QqGUmt5t1gtiJxbi4MRFcHEMGFwQo+G1w2XZ0ncBjaMPjQ75YAUWbxCeRX2
         AMACkG730r+6Vsr0lYKrpPMPxQr89URUObz5wzfxbmoinV7MU1koFbP4zkm0DT4+T+cK
         N9et8I0bhH0c8OJNffd4Y810KpvlkN/ptgXR+BFUZEqL5PvQifT1DOdMGcvnmo+/3vS9
         90u2MUAzrdT96qfGysA+UiuW3vN7o+o3YwEU3NbQSde5RuxAVb1MZkgUqJpNFeaU02B6
         TJYd2FVq2BKapRImJYOwDx/AkFJHHehTW5U5x3bfX2YwwOHfWLit6BjrhmRhqip585H2
         +qtQ==
X-Gm-Message-State: AFq9FYKw+8zRp+qDO4kAukGGWVgwfHT5TT8+cWvh3RAg2CTD1lmAPAi8
	x+04vsj8sO1K0PlJnKk82KeioClSKuNp7ODUvTA5fzor2WFDUuTKvv4tL13j37w0wTQ=
X-Gm-Gg: AYBFou21jV52FwJjC4D/sK+SxNJcWyCtY0hqTA8S4M5nfLdX+eRWd/XrPQ32TOa+/7m
	68TXkaH9PAvO7siLO/rC8ZQVDdYxCT8Pi6sOGdKSQTjftyC7yRNHxtHxGMpxU+s93nBLPXjxKNq
	4brZzm+X103BWzQgXgZk+v96c2jGTxyWDqJWL86k0zZIXmlHVDQekh1RbOctmwL1iNuEljxvD4/
	G341bPtRPVfuf5J5mxTSZMw2XoON2eaVlzp/8KtVSgESPL1d4CZvgCxA5Ym8QRPa88DZEsyJSGM
	SlsXIBSsS0vVRzr2Enanv97PIlHmg7GFUG7lxsk893HXUcwQvwIoyignMv3oI0CE7ReU7ri2Kiy
	EywQJkGO/vzXpz1tE5VHZhHaoYGDvl/YQSa6kk63rB/2rnl84pJfz3d9b+YXs1/HXQRu0+GTa9P
	FB69bMaH/IxKb7Y4/dmThQPJMX2VSCmMSBFe8eMGphs7nkelhuDIGQ8u8Km2A1vEhcyxBzI1xYn
	bNLIc2g6m/12U1lhAsQ8jwdu1duz726I+n8CdgFcc8jZ2G/DK/xxZewo6edBFW+CkUhNMCeeT9o
	8OYp4SepZXAESYZqGXmZk8kqX1p6ktMHKcqjg0mIu5/piz2oJIxI9rYw2w/NIAxY5yHBUf/0pb+
	IcWlJmm370abOQAmnb/OzLdjxhb4sG+mb9vrrTARuo+KhZ/JUpdIF5Ju6tSrZSpFF0zx78g1tBN
	F+j5yrzErxwV0pr8gu+Uym1DK/3wRA7GfL8Jicyg==
X-Received: by 2002:a05:7300:c01b:20b0:348:201a:6c8b with SMTP id 5a478bee46e88-34c642e07d6mr1030875eec.38.1790722661086;
        Tue, 29 Sep 2026 15:57:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/26] ettercap: don't strip a pre-existing _GNU_SOURCE define in ec.h
Date: Tue, 29 Sep 2026 15:57:05 -0700
Message-ID: <20260929225723.1046705-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130495

ec.h unconditionally #defines _GNU_SOURCE without checking if it is
already defined, which trips -Werror on musl toolchains that predefine
it via the driver. Guard the define.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ettercap/ettercap_0.8.4.1.bb              |  1 +
 ...ip-a-pre-existing-_GNU_SOURCE-define.patch | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
index e8679bf463..9a2090719b 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
@@ -22,6 +22,7 @@ DEPENDS += "ethtool \
 RDEPENDS:${PN} += "bash ethtool libgcc"

 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV} \
+           file://0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch \
            "

 SRCREV = "0dc8409779f3a09cbfff4434b9a4d7b33480d88d"
diff --git a/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch b/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch
new file mode 100644
index 0000000000..126d37ff50
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/files/0001-ec.h-do-not-strip-a-pre-existing-_GNU_SOURCE-define.patch
@@ -0,0 +1,58 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:00:10 +0000
+Subject: [PATCH] ec.h: do not strip a pre-existing _GNU_SOURCE define
+
+ec.h temporarily defines __USE_GNU/_GNU_SOURCE around the <string.h>
+include (to pick up memmem()/strsignal() on musl) and then
+unconditionally #undefs them again afterwards. This recipe already
+passes -D_GNU_SOURCE on the command line (CFLAGS += "-D_GNU_SOURCE"),
+so the unconditional #undef strips it right back out for the rest of
+every translation unit that includes ec.h -- which is effectively all
+of them, since ec.h is the first header pulled in everywhere.
+
+On musl, many POSIX/BSD-ish declarations (struct ifreq and IFNAMSIZ in
+<net/if.h>, struct sigaction/sigfillset()/sigaction()/sigwait() in
+<signal.h>, pthread_kill()/pthread_sigmask() in <pthread.h>, isascii()
+in <ctype.h>, nanosleep() in <time.h>) are only exposed when
+_GNU_SOURCE (or an equivalent feature test macro) is defined at the
+point those headers are processed. Once ec.h undefines it, headers
+included later in the same file lose that exposure and fail to
+compile. glibc does not gate these declarations as strictly, so this
+was never observed there. Only undo the temporary define if ec.h
+itself introduced it, leaving an externally supplied -D_GNU_SOURCE
+intact for the remainder of the translation unit.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ include/ec.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+--- a/include/ec.h
++++ b/include/ec.h
+@@ -20,19 +20,23 @@
+
+ #if !defined (__USE_GNU)   /* for memmem(), strsignal(), etc etc... */
+    #define __USE_GNU
++   #define EC_UNDEF_USE_GNU
+ #endif
+ #if !defined (_GNU_SOURCE) /* for memmem(), strsignal(), etc etc... on musl */
+    #define _GNU_SOURCE
++   #define EC_UNDEF_GNU_SOURCE
+ #endif
+ #ifdef OS_SOLARIS
+    #define _REENTRANT      /* for strtok_r() */
+ #endif
+ #include <string.h>
+-#if defined (__USE_GNU)
++#if defined (EC_UNDEF_USE_GNU)
+    #undef __USE_GNU
++   #undef EC_UNDEF_USE_GNU
+ #endif
+-#if defined (_GNU_SOURCE)
++#if defined (EC_UNDEF_GNU_SOURCE)
+    #undef _GNU_SOURCE
++   #undef EC_UNDEF_GNU_SOURCE
+ #endif
+ #include <strings.h>
+ #include <unistd.h>

