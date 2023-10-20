Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08BDCDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:55:25 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.47987.1697777718737045004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=d1inKJxJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.41, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ce2c5b2154so287743a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 21:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697777717; x=1698382517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gHnMbFrV3z9pABcDJl7DPQ2aAWdgYmO/TVYdfZ8/88=;
        b=d1inKJxJEgrXviCuSBy9PQIDTnKNepcAlf75tSapQhHmxz2ibttsAzm1QtKomTA5Kh
         Hi25165eaGcIl7CM/hHZW/kNiX/CFgtwYqOfKfSX05nBpadWz0BLSoJIqRqCIQy9uIiY
         thZTpZM8UUkxiQV4zWnbB3Gt5rIbY05RvC6fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697777717; x=1698382517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gHnMbFrV3z9pABcDJl7DPQ2aAWdgYmO/TVYdfZ8/88=;
        b=orLKQ6avfHwtBZ/k/L4ggy0ugCy6YWcPuLHDdVYFJFw8o/f13iCC4qcr9vwD/kHHc7
         ehay3vLLTZcKZuDwCTmFIo8vu+zzBGOzzcMqN/7QLO+o2ViqLBZbOqValtc211ctq10s
         r86cXLHsN6lRRZSJhSHmJPlcJiL+tZ8sVUIPgKeZcvVic/NvFu07dWqIaygak0nHkl0q
         BRgzMFEs2aM3L7XW7RT6Wn5HTI843QuI4VktQnWzJ/WG1B65L17iPAeMRFQBl/Qvyly7
         0dQJWfzlDWw/suGLNcZFXrx5F43dxhWUu47pjKw6NeRDd91XYbM7CDYOjD6n0gDpEuw2
         K1Qw==
X-Gm-Message-State: AOJu0YybkakPEqyr06JEOTofAl2g3oW5huJPN7U+E0M99HN3x/vIV1gq
	OS5kK7KA4/0+5sbAIObaTQdw1bOd5jGjPhHoWf0=
X-Google-Smtp-Source: AGHT+IHuTgcJI/IVawngZAbUpwDaHajlFnntVlCAhUYHgt2QAnMXupEJcVKC927bwyfBoGbsS4m/hg==
X-Received: by 2002:a05:6830:25c3:b0:6bd:7252:9db1 with SMTP id d3-20020a05683025c300b006bd72529db1mr1368570otu.11.1697777717592;
        Thu, 19 Oct 2023 21:55:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:87ab:e681:b5d1:6cd6])
        by smtp.gmail.com with ESMTPSA id t129-20020a625f87000000b0064d74808738sm634595pfb.214.2023.10.19.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 21:55:17 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] libssh2: Backport fix for CVE-2020-22218
Date: Fri, 20 Oct 2023 10:25:07 +0530
Message-Id: <20231020045507.25367-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 04:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105608

From: Vijay Anusuri <vanusuri@mvista.com>

Bug: https://github.com/libssh2/libssh2/pull/476

Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/642eec48ff3adfdb7a9e562b6d7fc865d1733f45
&
https://github.com/libssh2/libssh2/commit/0b44e558f311671f6e6d14c559bc1c9bda59b8df]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libssh2/files/CVE-2020-22218.patch        | 39 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.9.0.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch

diff --git a/meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch b/meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch
new file mode 100644
index 000000000..49dbde737
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/files/CVE-2020-22218.patch
@@ -0,0 +1,39 @@
+From 642eec48ff3adfdb7a9e562b6d7fc865d1733f45 Mon Sep 17 00:00:00 2001
+From: lutianxiong <lutianxiong@huawei.com>
+Date: Fri, 29 May 2020 01:25:40 +0800
+Subject: [PATCH] transport.c: fix use-of-uninitialized-value (#476)
+
+file:transport.c
+
+notes:
+return error if malloc(0)
+
+credit:
+lutianxiong
+
+Bug: https://github.com/libssh2/libssh2/pull/476
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/642eec48ff3adfdb7a9e562b6d7fc865d1733f45
+&
+https://github.com/libssh2/libssh2/commit/0b44e558f311671f6e6d14c559bc1c9bda59b8df]
+CVE: CVE-2020-22218
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/transport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 45e445c..35e7df3 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -465,7 +465,7 @@ int _libssh2_transport_read(LIBSSH2_SESSION * session)
+              * or less (including length, padding length, payload,
+              * padding, and MAC.)."
+              */
+-            if(total_num > LIBSSH2_PACKET_MAXPAYLOAD) {
++            if(total_num > LIBSSH2_PACKET_MAXPAYLOAD || total_num == 0) {
+                 return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
+             }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index c1f337a44..e11e66376 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
+           file://CVE-2020-22218.patch \
 "
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
-- 
2.25.1


