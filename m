Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF18CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:16 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.6909.1758954792199133962
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/wYw1bO;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-42480cb4127so33430555ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954791; x=1759559591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUHxeebPL5D2UGsLqK5vH3RBdKex6TDf9Bhc7b8LJwc=;
        b=J/wYw1bOFTpPDPZ7vOpgCWCXDxCIpN8B73pKlwFoqyUTmIIkH4LOJ0O/I+B2WxmZBJ
         EDZVr8Q1R5QJqpq7gRUdusbGS6E/qbAIZ43hB1xEiqznj67FBCQcAxc6xZzav2kOTlKG
         n8dkY2EPTMIoF6DrKqgmYZEMNDdLCTaU3vYUJZzCs6huqvv88nKJPZu5MAvIxEOJ2Pxr
         jE47UYCkF7qX/53o+Mnd8CEwyai+mhW66Zu9wAlTtQUit1MuRdcwlwUvMOgOooUHSmd3
         gzoAkqugZK51gdOXF3CFqu1RxrM6RT1OopECRfDsLLUx+YksOg+BGbK9c1Z0S1DJSncW
         04rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954791; x=1759559591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUHxeebPL5D2UGsLqK5vH3RBdKex6TDf9Bhc7b8LJwc=;
        b=sVcedK0SblkJTR6xDOyuCm4ewmOTRVHgB9ur1SqVseVwa1c296u2qMEcWjDEvMP35O
         7xqxfcbO1Awm7L21RQ5bVYkxmWr2GH9KAo6CY0i+bDUZxd4eOpcq62L+I//ziNnYylUk
         stxZweeZUHLIruCSlQg2EB07KVKi819wopod7bAouletPKkJLyz+NvH79Fa5qytfH8CO
         gW62c7Zgiv5OGB5oD8Ho+4U4sICBx/aq+lylLkNiWWLMhYpvSrkHqYOEr9qnmsHC3jJM
         OOCBFf77CLVISq3A7xHjcn7ZbaC7I5Qlfkjtes7JcWXkmfcV4uZGx3PlBG0pfOfVpltY
         cWlA==
X-Gm-Message-State: AOJu0YwFQ0qs8Z0zuHCZeuiIwFP6hH/vdx4jLlWDsu7bv2M8oF9h1OlM
	j4ZoE8hJErV+qvj04cCtI5twwJ0RDY5Nn/OGk98MMaQwYN0sZj3XVc0O5pqz1bnX
X-Gm-Gg: ASbGncvU03YmMLMV2ShWi4zlGojzWisIg4IqfxO2OAnx3NTmC95ZfH6HD3TSc9czH9G
	/jCxHMOngkkiGQC8AWMZYLPD7Ipplq8uhk8pLemOYXIefWx8KijF+4mnEzsMKJdUbN3h0BjzuV2
	UdtUd1Nr5pfB8u4KSLZeNMuwPcRHTGLi65ERDwBsjv92sXzhiKPBD1IAvhDZ7Yn7ZcwJzvd3j3g
	VJ/A1diG5N+qVrxKCg6b1vLXfwGOaZQEvtloOsKvjIRYgoEIXHYXNb1RhLb63dU0Cq2W3YQ4HsS
	6PHTe8l411OLol/JVtVBroxygo4zK5UTKR6Pal7vMOnVhflkMHe7sChSsMkmkoa++CytgJj1s3d
	niNqkq2ZuEC/lc687ESTTmVE5Xp06QjTm/bqv0WuIjHaNZxTo454jF9Borowvcg==
X-Google-Smtp-Source: AGHT+IH3pwLzsTWkei0E28gvraRs23+f/kSq3eYuzcCy7s/2ZgceBvpxcTheQgeKW7dG6KbQNUrhkw==
X-Received: by 2002:a05:6e02:2141:b0:429:46ef:de49 with SMTP id e9e14a558f8ab-42946efdfb8mr890005ab.26.1758954791204;
        Fri, 26 Sep 2025 23:33:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:10 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin Wankhade <nitin.wankhade333@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 18/21] iperf3: Fix CVE-2025-54350
Date: Sat, 27 Sep 2025 18:32:13 +1200
Message-ID: <20250927063216.1865627-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119972

From: Nitin Wankhade <nitin.wankhade333@gmail.com>

remove assert to prevent crash due to assertion failure
on malformed authentication attempt

Reference: https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 959b07135cdf9d40ea1ee72b6e53b6076cf63ae2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
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
index 4e9f5f1f46..29d2cee676 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -17,7 +17,8 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://0001-fix-build-with-gcc-15.patch \
            file://CVE-2025-54349.patch \
-           "
+           file://CVE-2025-54350.patch \
+          "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
 

