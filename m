Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C205C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.11490.1662276872161910657
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2rQESQ7;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z187so5852144pfb.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LpbhaQoi14dAldBoa6EDet+2pX82den8Rt5yGZ10n+8=;
        b=O2rQESQ7MIVFXe/zVSS/9JFDAKhIOX1DU2GtI0rb5mfTvj9HajBhU9PrtglWSUdCOL
         0epSx4rBEglWf4nLevG1LkE+DSeOoCgV5ncixHWyWId8ROOJvOR4VqgdxQyfzLm14jl8
         b6KNXH1AzIDQegHabc51vPFDLSXyb8rqNMII/86eI9//ye5/T6T696Ox2SYbSbNX73a7
         PBRjIq1tDP1crPHhSb5kWi+iuhETMFPsp5ZzsA/GmYgvEoY+P+AZdYeGy5wA+3RfCJda
         yWD6CpFO1G4LjZ7QwFhu86gUQoT1wl2bg1zKfDga/ZXHvxKRr1lDyd9I34MRQP+6Wg+j
         NfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LpbhaQoi14dAldBoa6EDet+2pX82den8Rt5yGZ10n+8=;
        b=AolOz5NmXLfSmeXeIhO2mhnEL2LVtFcg4n6JUayzNDqEQq3GuhDuoCm/jDB5P1zngd
         ad25rPrX5EVJKLcwqlSL9fCL8j5ldFIfomRYbZCA8WO6y/HJknSvop+6xNaAwmzVpxlO
         kKndRQqYW2OQJNW1HxTPWBOfgBxRes8dmjk3uUTqcyAwJuSARr7kuH/Wo410/wKsVx0P
         nFTX/AVSoIa0TYmWLGrAJ+UiBU6S+KGR/CdBulpC9l+Mk0JVZpL6koZrzfoE4SSOA1dJ
         IrEOzW2l5cVkjFgmRCnxOI3ZrxzsdHWYfBpqJ8+Hv1rRAusuQ5NC8NxhmdL0x7m6hPEx
         cdqw==
X-Gm-Message-State: ACgBeo3H2ckwhLXhwXGmHg/OOL525ftTruMQAjZxLQi3kOoOV9MG29vi
	iVjDn2BDPnI8vuWUnYh1Ae9CkeSyXC9ckQ==
X-Google-Smtp-Source: 
 AA6agR4+Ih/sXvoRr8fLTV9AqWG3mcs8k18RTSMO3RY9vbzhFqSL6KRVwt0zYG2xci+XPB6IhbDxTQ==
X-Received: by 2002:a05:6a00:cc7:b0:52f:2ada:11c5 with SMTP id
 b7-20020a056a000cc700b0052f2ada11c5mr44060608pfv.19.1662276871278;
        Sun, 04 Sep 2022 00:34:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/63] linuxptp: Include string.h for strncpy()
Date: Sun,  4 Sep 2022 00:33:24 -0700
Message-Id: <20220904073417.3251865-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98604

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-string.h-for-strncpy.patch   | 27 +++++++++++++++++++
 .../linuxptp/linuxptp_3.1.1.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch
new file mode 100644
index 0000000000..60f2079d37
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.h-for-strncpy.patch
@@ -0,0 +1,27 @@
+From d49b4fb8063ecd89617587e5ea566cc9da9393ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 19:09:18 -0700
+Subject: [PATCH] include string.h for strncpy()
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ interface.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/interface.c b/interface.c
+index 65bdff0..5228db9 100644
+--- a/interface.c
++++ b/interface.c
+@@ -5,6 +5,7 @@
+  * @note SPDX-License-Identifier: GPL-2.0+
+  */
+ #include <stdlib.h>
++#include <string.h>
+ #include "interface.h"
+ 
+ struct interface {
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
index 9c0f56e736..bb4871e14f 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v3.1/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
+           file://0001-include-string.h-for-strncpy.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxptp/files/"
-- 
2.37.3


