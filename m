Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFB5C54EE9
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.8678.1661843666714321084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HptGnhjE;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id jm11so10228721plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gMD+TKpJiIfT1RZWaPH6+zUFDUtg8akPy9ikp6tsXWk=;
        b=HptGnhjEFbUaD9nDt5LpQYc0gkWTIzUCFqjXC9diuYEI+dGWdz77VVAp7GIIW3HsYq
         4Zp+8SiHS57QtK9Xw5VHAtvNz1SOu4hhKSECjkJdf12Tw15CCS/nGCuPD5XpRZUVu3BU
         xV8A0oNudAyXmBZYuilXOZ2jrVgC5h9mHMI2wWLYFAOEdSXtKg4Enkli9/LGHMNQGXlT
         hSLCCVH4D1MDH2iu3SC2+/xshv920JEF/K5ylUXMUIbvArYnEMzd7+bDZObxAyuWCRXy
         3pm+L3KPam16rVKamY9NYO5Jrah69clxAAt/5AWtP4lzugm7OSNRHujSV6PEe2F7eUWI
         5u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gMD+TKpJiIfT1RZWaPH6+zUFDUtg8akPy9ikp6tsXWk=;
        b=t0cFmdiqy6SGHChzJZ5rc9YM1jydWerEwFPG5gHPE2Npov/vcZBFXI73KJ6Fad+GKN
         ZtSZi9NV3LQYAeEj21oJrSVu0PYMqvznFkLnNyaq18aU3mY9EOfdMZJp0RTo3dPVLz0Q
         PkoQn0VHNVTh3zFIzoiAP+PYyMvO9ysJr8c2b2gwIqwPIBdecfqrKlyU9n805v9zwlOo
         DhK8w7jD/vjzeGEPcG1quIKbzB94rLpdYPvD9XR3FVKPHwNK6eQhs7Jdp1YzYghoawVW
         eCxFnxw2Tr7qRmxQUpbghjR4awcj0qIMMxLaOtm4PBJUdsECxhgg/ISAY4xrRjOv2mu1
         2/+A==
X-Gm-Message-State: ACgBeo3g2NKlVSzuI/Jw/fjzrpzWwtL7GekBfo4A/wG7Un6jeadh3q/O
	VF2BCT0NVxC/RVRYHoblMuTeSU1so+a4yA==
X-Google-Smtp-Source: 
 AA6agR5IpYKxRD+PlbyeotyAt7Jr+vngPkksUmm1QlO9rSM9ZKF0AqZTPU6w7lThS0cjCmIJLgXoQg==
X-Received: by 2002:a17:90b:3b46:b0:1fb:57fc:d0bc with SMTP id
 ot6-20020a17090b3b4600b001fb57fcd0bcmr22869845pjb.71.1661843665906;
        Tue, 30 Aug 2022 00:14:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/21] fping: Fix build with musl
Date: Tue, 30 Aug 2022 00:14:04 -0700
Message-Id: <20220830071413.3887189-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98549

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lize-msghdr-struct-in-a-portable-way.patch | 42 +++++++++++++++++++
 .../recipes-support/fping/fping_5.1.bb        |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch

diff --git a/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch b/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
new file mode 100644
index 0000000000..2a5b3e6193
--- /dev/null
+++ b/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
@@ -0,0 +1,42 @@
+From c3f476a763412be51b4df0e748af04d4150a2c71 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 15:41:51 -0700
+Subject: [PATCH] fping: Initialize msghdr struct in a portable way
+
+Initializing the structure assuming glibc layout results in
+compile errors on musl, therefore do partial intialization and then
+assigning the members individually.
+
+Upstream-status: Submitted [https://github.com/schweikert/fping/pull/263]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/fping.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/src/fping.c b/src/fping.c
+index e26b216..81a61d9 100644
+--- a/src/fping.c
++++ b/src/fping.c
+@@ -1951,15 +1951,13 @@ int receive_packet(int64_t wait_time,
+         reply_buf,
+         reply_buf_len
+     };
+-    struct msghdr recv_msghdr = {
+-        reply_src_addr,
+-        reply_src_addr_len,
+-        &msg_iov,
+-        1,
+-        &msg_control,
+-        sizeof(msg_control),
+-        0
+-    };
++    struct msghdr recv_msghdr = {0};
++    recv_msghdr.msg_name = reply_src_addr;
++    recv_msghdr.msg_namelen = reply_src_addr_len;
++    recv_msghdr.msg_iov = &msg_iov;
++    recv_msghdr.msg_iovlen = 1;
++    recv_msghdr.msg_control = &msg_control;
++    recv_msghdr.msg_controllen = sizeof(msg_control);
+ #if HAVE_SO_TIMESTAMPNS
+     struct cmsghdr* cmsg;
+ #endif
diff --git a/meta-networking/recipes-support/fping/fping_5.1.bb b/meta-networking/recipes-support/fping/fping_5.1.bb
index f2dd897561..0682eafa09 100644
--- a/meta-networking/recipes-support/fping/fping_5.1.bb
+++ b/meta-networking/recipes-support/fping/fping_5.1.bb
@@ -14,7 +14,9 @@ LICENSE = "fping"
 NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
-SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
+SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz \
+           file://0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch \
+           "
 SRC_URI[sha256sum] = "1ee5268c063d76646af2b4426052e7d81a42b657e6a77d8e7d3d2e60fd7409fe"
 
 S = "${WORKDIR}/fping-${PV}"
-- 
2.37.2


