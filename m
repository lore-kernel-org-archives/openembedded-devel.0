Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D4FC6FA91
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.2738.1662594069120675124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hWG5fZnC;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id x1so11760119plv.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZqBMUYp5x5r9yQnu7SWbd97UWpptZCjzqEs7CUZHpCA=;
        b=hWG5fZnCG+yQlB8FFZignwqYE//Y5+VRw05jnIchK7rGv8cbtWV17m8fUyD+0YOxS0
         Ce18n1rC/OLMCdHBAgMEKtqHM589ob2FKS+vDmLuf3bCaZdWP7QQwrJ0sP+o37UvMo68
         fW9hHXrmnaL38G/yXCxx76pHE77/qsP9Oi69PIDXtegKb7NX1ozEc2OFYCbNrmXfUzYJ
         MAZwsvHLZH2npJRkDDuoX3vta9DblhaL83+9mWNVmrArpkZiYyXIuJv0B/OcvWFhLFHX
         Q/BzvARWH4XTg0nhhs2dYU+cy077sY4Nq7QkOmcHnQPKCpVLyHb8HL1XypqKCmENUUmG
         ZpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZqBMUYp5x5r9yQnu7SWbd97UWpptZCjzqEs7CUZHpCA=;
        b=IJ5V0cSnzj/0ZT3EyO02ZMLrVQHsOSev5wqwyk8KmU9f9e2TIrO7JzsF5a6Y/BIVt5
         ta8qxkqRGtcq2bTySOASyGm0RUmRtVVNo/VaBhJfOyMtOPFz8fNzY0B4M1b7FlGbg7TZ
         hZgBd8Qp4iPwJ8sxjyUihNUDmrWfKUX8VzEkqmze0gRYrzQ2gN/Ag3AWTxzjS0k+yB4n
         WBFSYQuQFQj/lROSy5Ics69tHdR7KhbxLnEQf9Dxs2SXyiGY/FEVnhsmdlagpIXzbxtY
         iJFqje0+GAHgdDAHnEqyM/maPskiAWjaSHz2qpZPSVeDCunWLr3+2q/d3Bna04EzeClT
         DFTg==
X-Gm-Message-State: ACgBeo3PYGsA8smbMZCtRB0sxQhM5CORaOGTzoRthQ1bbINwbBjtSON8
	3+k9bhqWsdP+pr+G5ym3uYbPBkByNI9dWQ==
X-Google-Smtp-Source: 
 AA6agR6RcIJMM8ig6iHG5moQrgdRQMXmZs+5m1Vdg8hrSd+JrevRZN2BvroFVbq3grZUkeGt7kBBHQ==
X-Received: by 2002:a17:902:f650:b0:172:8ee1:7f40 with SMTP id
 m16-20020a170902f65000b001728ee17f40mr6368106plg.101.1662594068384;
        Wed, 07 Sep 2022 16:41:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/22] libsmi: Define _DEFAULT_SOURCE for timegm API
Date: Wed,  7 Sep 2022 16:40:45 -0700
Message-Id: <20220907234102.3312797-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98695

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-parser-yang-Define-_DEFAULT_SOURCE.patch | 28 +++++++++++++++++++
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch

diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
new file mode 100644
index 0000000000..9354a889a0
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
@@ -0,0 +1,28 @@
+From 86b706f694b822d8028fd36320147767056d2ffa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 12:09:00 -0700
+Subject: [PATCH] parser-yang: Define _DEFAULT_SOURCE
+
+This is needed for timegm API
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/parser-yang.y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/parser-yang.y b/lib/parser-yang.y
+index b111607..0ded9d2 100644
+--- a/lib/parser-yang.y
++++ b/lib/parser-yang.y
+@@ -21,6 +21,7 @@
+ #ifdef BACKEND_YANG
+ 
+ #define _ISOC99_SOURCE
++#define _DEFAULT_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 53c59de78a..33e1b6fabd 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://smi.conf \
            file://libsmi-fix-the-test-dump-files.patch \
            file://0001-Define-createIdentifierRef-prototype-in-yang-complex.patch \
+           file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
           "
 
 SRC_URI[md5sum] = "4bf47483c06c9f07d1b10fbc74eddf11"
-- 
2.37.3


