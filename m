Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7337ECAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 17:54:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17242.1758290229494055559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Atma1qHG;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2697051902fso3876365ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290228; x=1758895028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iW9Qo8NF5IAaCUaDN97Nw+n7eoz96P6EvGJl8WOlc+A=;
        b=Atma1qHGuJmPqVm1PpMI6zq+WEjTbgAIkbRqlE+w5tq/2y5+sfiijwmqFRXkmibt3m
         3rIB7L/SAYJ4+1RJbQe+0r6X3zpFleEzzB9vGgpAA52rMA/ieuqWrtspHsYtEy9w0jkR
         dwJh+89NwMZhYNNnl+dgx0VK2O8Un7u037462sYc765YiyAaAodnRxWjNT2rxADi6CvV
         Wi/sybbJSJK3V9XHApteQSHunzJPBYbR5z/VqSbEV7x1/tHfLsYOWBHp48etgZS4wKpD
         m8dm4Ix7kZckg4VF8yXMGv2HJnmIcEaV8Y23hSBzhP1SieQfLlolExm/me4aHSBMBx9Y
         OGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290228; x=1758895028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW9Qo8NF5IAaCUaDN97Nw+n7eoz96P6EvGJl8WOlc+A=;
        b=rdRmqZT11qFoR1kEVy669AHBFJe564n4i/F+zTUWyJsdzMjNCQs1O9/z/eiUmFn53P
         Ls8mAZlT20l+Ang0eXZoLaGEpqpPKqkBbJjjIaqCfElOcl8lImg5OB5MCdAgguZn0+uO
         d1dO+c91C6b8WFaTu0DqMwDly+wFKb9V1Kxcsdkq8ZY0m10xF3jT8oFL/4chrTo+J28e
         gdCFhu5PmyZMzpcRIOG9yvyyRp+SXFlTjjQzyB0TLiiLMi1LAE8i4FtDVV9q0lb4NlzM
         jl15EGpN9szXA8DD96zk6+hTm1VDxJyPhCwD2fKruLfiCF09ScBV3aAoX4DVdvmuWm42
         OiIg==
X-Gm-Message-State: AOJu0YycUNWkTIAHVa+Fx6phWI3372xNIoFd2sQrAcYVBJoUbeP0MkDE
	pEy1R8dcaAz76o9nQr7wc5rJds6OTC6xkreZZrmEZadsPoZcsoCDNgPwGUh2uQ==
X-Gm-Gg: ASbGncvMpSXF+8xXfMgE64j7qhomolNx4NrI0BcoZuLkmJzIDHxp90/jxng/G4MOvRJ
	Xi25j8WmwzRD4lBNRjzeEjppUTXMdie3rp1/xEhP/+UKpWcwMa+gySCn57lYCPoHHunJbKu8MpN
	cm6G4R57cft86aDG43X4nzZnrvPe9MQgGjoG/yUUqtyapuM6ofZC2XVGTPyFU5WFxOzMxNW12hN
	3bWwphSigIK+uQ0wuZWV108qmg7iAqVFqBYponeIcQyKCWhwvlRiWqPOzhPadw80pXDXKPJNkLV
	LbwoOjU3neOK3O5D/2/HSLYG2eCVgDB8mcl1htetcAXDruHeux2NIIdfVwB6AoaS690XZPuT+TL
	NT32k67LKDEYf7fYKncA81fjCE7MZ6Jfp8Cu1GuEZ
X-Google-Smtp-Source: AGHT+IG0sMRDa97lynwbMHio1yEnLLK04wIgqjLc54BJwO/aF6crrYznlSMvwx1+c9x7lcv1WNalBw==
X-Received: by 2002:a17:903:187:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-269ba517782mr29889245ad.6.1758290228464;
        Fri, 19 Sep 2025 06:57:08 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.80.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802fe096sm56247555ad.104.2025.09.19.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:57:08 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [PATCH] iperf3: Fix CVE-2025-54350
Date: Fri, 19 Sep 2025 19:28:56 +0530
Message-Id: <20250919135856.2015585-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 17:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119610

From: Nitin Wankhade <nitin.wankhade@kpit.com>

remove assert to prevent crash due to assertion failure
on malformed authentication attempt

Reference: https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 25 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.14.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..c02d9ec0a3
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54350
+
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Comment: Patch is refreshed as per codebase of 3.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+--- a/src/iperf_auth.c	2025-08-19 12:02:47.706337000 +0530
++++ b/src/iperf_auth.c	2025-08-19 13:16:01.653471517 +0530
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -150,7 +149,6 @@
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index d181eb3b02..41f336a11f 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://CVE-2025-54350.patch \
            "
 
 SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
-- 
2.34.1


