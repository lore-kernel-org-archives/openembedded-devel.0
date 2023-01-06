Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CD3C54EBD
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 19:38:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.2844.1673033937273460932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 11:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E5tbpuo/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso2773653pjo.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 11:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkFqZyP/xFNrZNH+PEvRF5pAs76YRP92XA3n4OXNbDE=;
        b=E5tbpuo/2y9y6Q0y/qD/dOA3E7eL5ivvQa/vefO/3GcR7YrsUb4I6zJx3usnqm6Avo
         cfQT3nYUpBmCyLNDrd5rxeS5aYu38CQzT0R96gXDj1ePqm49cHi3BrAg49PtL0xXNs0V
         Adz74aXvTDdho64GkRQ7IdYH6rjbxJk2ZHB2DfJxVJr8C4HXatdzDJF3lRSyTCMgjyPz
         M/FXVX6VtkjlQ+JfQhq4I5uGOM0+WtpgAiPuQqPYSQP4RduGLsJQQDS50P8O81CLyUfN
         GhGMd9ZiMx22IDUmj29TUQptdbp0WNV6lbroOuAc2VjSOQWApxboPJPbDvYSJ6LNbI+m
         XDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkFqZyP/xFNrZNH+PEvRF5pAs76YRP92XA3n4OXNbDE=;
        b=U5fI+iaBs10S0q+QzsYkKJEzncEz9/LHLpb+XGifr0KfPfneqKx+WxPY0Sri/aYj3h
         pAFJLrwNoSoq30pr1xL//m/IW5a/5fULyJ4s2WAGjg+JEoZBLyUX7GtDOqyRIQDRnmyi
         pZiETBeqBKWfC35T4YbQzdHbd4IAQ9R8TeDMCAw2ueJD9gSp2lsNDSMMuXdumVGeg7tU
         2AjVhV+19qerL8I9mgKCo+3YaYewKVQANy0x9nRa55WT3hnra/37hf6kRXo617NqlIbz
         B1XJ1fpbTPHwxvLXMrqzPgg+Rbq0ZruAYRWNbKWo/5eb5PGia8XJyf47DbnCfbDHfIVd
         BHgg==
X-Gm-Message-State: AFqh2kolA8Cdl/I+4ZWAFPVj1TFKISC642LOkC/2KaZW0MUxxijgkUqa
	8C4iLKgQxLf+VuWvoJsSTQBIkwlMFsSbxw==
X-Google-Smtp-Source: AMrXdXvCGpoQY9Z4j824vFGi4h+iBusExOMByfHAEkAaQdoOJGBTMwJMb4QfQcDwH/JLp19AyU7/XQ==
X-Received: by 2002:a05:6a20:4660:b0:ad:79bb:a417 with SMTP id eb32-20020a056a20466000b000ad79bba417mr59203296pzb.9.1673033936209;
        Fri, 06 Jan 2023 11:38:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id r1-20020a654981000000b004785c24ffb4sm1250029pgs.26.2023.01.06.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:38:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v2] open-vm-tools: Fix build with 64-bit time_t
Date: Fri,  6 Jan 2023 11:38:53 -0800
Message-Id: <20230106193853.2913922-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 19:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100426

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also fix slewLinux.c

 ...c-Portable-way-to-print-64bit-time_t.patch | 54 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.1.5.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
new file mode 100644
index 0000000000..4a4fae116a
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
@@ -0,0 +1,54 @@
+From dcb5d3e5d47b1e01fdcde575badc51825d4f4681 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Jan 2023 13:36:01 -0800
+Subject: [PATCH] timeSync: Portable way to print 64bit time_t
+
+This ensures when 64bit time_t is used on 32bit architectures (
+-D_TIME_BITS=64 ) then it can print it correctly as well.
+
+Fixes
+pllLinux.c:43:20: error: format specifies type 'long' but the argument has type 'long long' [-Werror,-Wformat]
+|            prefix, tx->offset, tx->freq, tx->maxerror, tx->esterror,
+|                    ^~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/631]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/services/plugins/timeSync/pllLinux.c  | 8 ++++----
+ open-vm-tools/services/plugins/timeSync/slewLinux.c | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/open-vm-tools/services/plugins/timeSync/pllLinux.c b/open-vm-tools/services/plugins/timeSync/pllLinux.c
+index e9c8e61de..90ba8c63f 100644
+--- a/open-vm-tools/services/plugins/timeSync/pllLinux.c
++++ b/open-vm-tools/services/plugins/timeSync/pllLinux.c
+@@ -38,10 +38,10 @@
+ static void
+ TimeSyncLogPLLState(const char *prefix, struct timex *tx)
+ {
+-   g_debug("%s : off %ld freq %ld maxerr %ld esterr %ld status %d "
+-           "const %ld precision %ld tolerance %ld tick %ld\n",
+-           prefix, tx->offset, tx->freq, tx->maxerror, tx->esterror, 
+-           tx->status, tx->constant, tx->precision, tx->tolerance, tx->tick);
++   g_debug("%s : off %jd freq %jd maxerr %jd esterr %jd status %d "
++           "const %jd precision %jd tolerance %jd tick %jd\n",
++           prefix, (intmax_t)tx->offset, (intmax_t)tx->freq, (intmax_t)tx->maxerror, (intmax_t)tx->esterror, 
++           tx->status, (intmax_t)tx->constant, (intmax_t)tx->precision, (intmax_t)tx->tolerance, (intmax_t)tx->tick);
+ }
+ 
+ /*
+diff --git a/open-vm-tools/services/plugins/timeSync/slewLinux.c b/open-vm-tools/services/plugins/timeSync/slewLinux.c
+index 1ab6e3584..0c304b5d7 100644
+--- a/open-vm-tools/services/plugins/timeSync/slewLinux.c
++++ b/open-vm-tools/services/plugins/timeSync/slewLinux.c
+@@ -156,6 +156,6 @@ TimeSync_Slew(int64 delta,
+       g_debug("adjtimex failed: %s\n", strerror(errno));
+       return FALSE;
+    }
+-   g_debug("time slew start: %ld\n", tx.tick);
++   g_debug("time slew start: %jd\n", (intmax_t)tx.tick);
+    return TRUE;
+ }
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
index 93d3d59eb2..d389d2450c 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0011-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
+           file://0001-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


