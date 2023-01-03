Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBECC4708E
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 21:44:02 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.132.1672782242404874268
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 13:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMrkWOse;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c2so6486841plc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 13:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KcjKUUWV8901xoJmzpMVl8vjQUvuCv+WbXVnmKMpQE=;
        b=hMrkWOsepfFXMOkjA+bMhN60zlRv3/yE4UiSZ3C7zPDlIkm9xU2jNyPLT9QN69ooe8
         pjwGw8IZf14wy7eRC29Gw8othEJxfAhrDbPjVeTFedOq+lic7C3mUQBZQYa+DdMqEVvi
         LxqQsm4Q8nCrOr2A6JXOwrn2KMjAmtgHRELBQQoFq9MEpclL9hdZ4uRmScUrrnrPSHTb
         IFnNZbtu9wwQepWehiG1uZSMISPX81d4jTdGyXE0jwvwf+XeOopMYZziaNyfcGTy/8iF
         12KZeaLs54fm6fsQbJcEvc2GPwiSuew1ti9wX7ubjOT860QdhaYsNXqSWpgh1PgPkQgx
         kcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KcjKUUWV8901xoJmzpMVl8vjQUvuCv+WbXVnmKMpQE=;
        b=PSqXEtbSwF+grDnraKswUmES6yCi/n5w5VxJX+uex9nKrCqkSHyT1/VL5sPHRcesFV
         KTMnHHi/IMrwx+k2ek4f/ttNGEvZgfqxntOpSyh+id3AsS3v+Ujd4jb39kR4hzyuGH1o
         LcgCPVU5KU/prWrVMOcncnKfGmgCZ5a5GXwSzVRv435Q5/1AtmwkAtpHZ+Ky3+j6Fm1u
         5NroAPU6fO1yiIBykCb4woLx4Pw+SZ9gg3T/BbhvLIMNygTyH8WnpsMR+H44/HkjkcCx
         Oy76MjnWspySuFvCSM0rMArO2fi5imuHBY/+WGPY+bbB5SrPf7S92yln763N4vqZOSfz
         8g0g==
X-Gm-Message-State: AFqh2kpLSSloviD6XHVMwpVJWMST+3+/0ZlIhfHgh3RfuR5NZgOOxYlE
	C94GRYyNqq5vb6AkX1mXlMfG5VyFp6o=
X-Google-Smtp-Source: AMrXdXvob7TaFgCv/o4JabxnSsqX7oa5V2ihyEeWmBMGjawLn5qBeaJzYG5mpcqAS9TCJfPZuHZ6qQ==
X-Received: by 2002:a05:6a20:d817:b0:af:745f:7838 with SMTP id iv23-20020a056a20d81700b000af745f7838mr65517048pzb.30.1672782241613;
        Tue, 03 Jan 2023 13:44:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm4140292pfb.22.2023.01.03.13.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 13:44:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] open-vm-tools: Fix build with 64-bit time_t
Date: Tue,  3 Jan 2023 13:43:58 -0800
Message-Id: <20230103214358.110410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 21:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100370

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...c-Portable-way-to-print-64bit-time_t.patch | 41 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.1.5.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
new file mode 100644
index 0000000000..1b6f8d707e
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-timeSync-Portable-way-to-print-64bit-time_t.patch
@@ -0,0 +1,41 @@
+From 5ff35f0093133cfe33747995f9a4a09090eee171 Mon Sep 17 00:00:00 2001
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
+ open-vm-tools/services/plugins/timeSync/pllLinux.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
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


