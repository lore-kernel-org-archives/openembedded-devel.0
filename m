Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1456AC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 09:08:30 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.41932.1671700109745292274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 01:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XKnzKUMn;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 79so907731pgf.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 01:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gi4m8FQH+5ngNBVqV1+djOqT/lOzd2riBWopgcfUXw=;
        b=XKnzKUMnKvCO5vcqbjInuwOQ/LQNM2/U+47N/gjmaTyUjpmxCWi0skkxmR/c8il5eX
         hgstQiCt0DKU5R1mqxtWL1vhMFTK/Tk1qh0ClGxPWmWB+X8JEfuNrO9lTPPj2+AZe7V0
         8s3/TWPukOjaCdE6tOvQ8mowGvP+fJ+Tpc/C9Ea2G9RBFS83uUyEQXTmDvTzL5hPvZpe
         THSGeTYUjKhOpwnhmV2UgZqV2TttZlAeWl1HwRUFT4031VY6asKI6y6ZAZxldSeur24+
         BPLqmqM5WM1jnAPfIDC945cyY+TdkYBArQjSpEKYQDsDoM92puoMVP+rUZGGP5UIUuJj
         zYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gi4m8FQH+5ngNBVqV1+djOqT/lOzd2riBWopgcfUXw=;
        b=kPB64bQEs4PgociPeHnC2zFuiSfDheMVT6xtj2xgbuGeP2npiYXpiinqTMVqFsNi1U
         x4IAQpLZ4AZ5kuZ8LyQAHeReLxjiRyMKLguHG+jkQEDH2BdVQNJCxgEV/RW24Xej6m5K
         Yx3OxjS61S7CSRAYbXTv4W5Jc+i4J+cgNJnwNLzbbRH3wzkW/jPXljjM9Kbliiv16qGG
         GzM22NUfmYIGuImdWaQwevRfK6vs0Jym7EOgGWMFewwKEOLKTZLY/68aFm6emd8vBqCf
         Au6ODPSsgpb7ST0sF8vP8cEera4SO4406Mblw2U4EoPre1LKjinQ307SJ1UzNYuzEU+H
         FNpQ==
X-Gm-Message-State: AFqh2krdLmyQq+JreBtfjTMbZBdr5U4+Sn7lcEu1avknFm+NeofRVg2V
	qHztgNvkj3+NJW8zC7iiZ4LA7oPcJyY=
X-Google-Smtp-Source: AMrXdXtiMDI1klOiwoN//L1sRMgehxa/Xa8FKjBtH5UA2BFRgHX2hU5xuy+L0TTRH3iBxfufMxL+BQ==
X-Received: by 2002:a62:65c3:0:b0:566:900d:6073 with SMTP id z186-20020a6265c3000000b00566900d6073mr5262033pfb.24.1671700108798;
        Thu, 22 Dec 2022 01:08:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id v29-20020aa799dd000000b00575bab45644sm200974pfi.61.2022.12.22.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 01:08:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libtraceevent: Add recipe
Date: Thu, 22 Dec 2022 01:08:23 -0800
Message-Id: <20221222090825.176892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 09:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100188

Its needed by trace-cmd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtraceevent/libtraceevent_1.7.0.bb      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb

diff --git a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
new file mode 100644
index 0000000000..cbd107a4b4
--- /dev/null
+++ b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "API to access the kernel tracefs directory"
+HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
+SECTION = "libs"
+
+SRCREV = "826b06bb2484a53fdae196e12ec507a67ec87055"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+do_install() {
+    oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
+}
+
+FILES:${PN} += "${libdir}/traceevent"
-- 
2.39.0


