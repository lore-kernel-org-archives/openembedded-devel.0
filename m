Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A9CCAC5B5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.9542.1758603190457961813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 21:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVF5R1/l;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26987b80720so5735875ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758603189; x=1759207989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAIo/2xZlooycG5BqLwwwx4AtEGxNn22IOfCGPviD2c=;
        b=bVF5R1/l86G1i7bZZFKpE2cCObwhlMjH3qy9Xb5CfIj5kGxXxogdc9HrWtW2iagjzF
         G/vMANI/fZ8tL4Kg3eMSnNfUx8eOlzMb7OP67PSBkHKXOESalbZ45VGE0gyyGlpLDzCl
         DrZvfzhrL37N7Li+CxHp65UtiFomUit6qapigtM9ve9JJaIbEH6AeySXCeFHH0f8w6ev
         umcuOmY0es4PNf+fLjnSuFZza7yTNB5xVfX1RH509ihIyI88PUYvdfDZMLVfN1OykU4k
         ijDhmzqRMEfFhO+ky7lVgIo70pjZJaz62aVZOUOmeL0u9H1lP/yi2/OaX3TEH7hVNmXP
         prxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758603189; x=1759207989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAIo/2xZlooycG5BqLwwwx4AtEGxNn22IOfCGPviD2c=;
        b=Mm96lxkmbznlQM9grq6stO9omxysIVPn5zgBqMnQk0kie5ZgBAmjZcRYMDRD87je2F
         VJWEcTMA8WI43+CzRDdV8/9b5RoPhGGhsmVjVkCsV7maUNimb7DSDNcWnC+Xox0zPMNH
         YYdeFHG8TLo135VSJANDyC+FHzq3JTZxIo5FSh/VwROlpmusNMtnGNiM89hNuSM2NKuh
         SiFPjSiFp7LpwOUBr79qhcENyimblyzJgQRwAdwvEFLnMOceftELOhX+NrRMRiUcS4WV
         nRfkfLZ9xuvHJm5lUCkSikjfEav/35WSNRds9n3uI/v/OBoF7Scfw/zx2nIBHuj9GBJL
         wt1Q==
X-Gm-Message-State: AOJu0Yw1sYQzrJ93LFU/rSNFWMjzTjnt9ArQhw0pVxyapRGupQ6YkC3d
	QSCoN4CxV1nH+Nve+YP2IGrWsHPQEdnvGAuP2CbJoarWDIzufP17ShwFvuWiuQ==
X-Gm-Gg: ASbGnctDoWHkra31o4pLtXRKdRp3976/VhdLuf//i6U2bVPb2BnmbGzYu62btt32QWU
	5a3lZ37UktPHiULubDQCagouRoox/QupWh4xGMxOGqPlpMgUysDvLU/UT5CTs/0lH1IwluAgObe
	hcqKXVylVa41JJs0JXjtQNNMEvO5gx006O3zFZbGmxikfjP8VDDh4nrl0ZiZfLzWyyiMLXCunpm
	qj9M//gPe1cIdybdvZQFZ59Lrwq+J6lox33QO78eZRkrZfEkUngvTcs725MeVmJVUSKhap2BUAp
	tdKJmfP3FijaCdVEMZgoEYl8bfo1OX9t2K/PpwF5jZHFmrOt3MccmF3yl0Of2e41Y7JDoSnJ0C3
	U3o139gmegovzHc9WJCX6bKIdVZqvLsTfNUSuIw0C/o0=
X-Google-Smtp-Source: AGHT+IE6ypXPF4xMSY9cRiEjcdTRGlyKY3ygHMyhPtyBNj3jngNyfjAO+FvEqE6THQVMrgcPWAuFcg==
X-Received: by 2002:a17:902:d501:b0:277:c230:bfc7 with SMTP id d9443c01a7336-27cca146b92mr9924485ad.11.1758603189454;
        Mon, 22 Sep 2025 21:53:09 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:4aaf:f702:9ced:7f9b:68e6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df57asm149566215ad.67.2025.09.22.21.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 21:53:09 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [meta-oe][master][PATCH V2 2/2] iperf3: Fix CVE-2025-54350
Date: Tue, 23 Sep 2025 10:24:55 +0530
Message-Id: <20250923045455.2478307-2-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923045455.2478307-1-nitin.wankhade333@gmail.com>
References: <20250923045455.2478307-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119659

remove assert to prevent crash due to assertion failure
on malformed authentication attempt

Reference: https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..12ca38b830
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,24 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54350
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Comment: Patch is refreshed as per codebase of 3.18
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+--- a/src/iperf_auth.c	2025-09-12 10:21:48.186090000 +0530
++++ b/src/iperf_auth.c	2025-09-15 11:13:21.123222080 +0530
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index 265611e533..91d266a2d5 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://0001-fix-build-with-gcc-15.patch \
            file://CVE-2025-54349.patch \
+           file://CVE-2025-54350.patch \
           "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
-- 
2.34.1


