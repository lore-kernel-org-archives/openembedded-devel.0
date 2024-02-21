Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E67C48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 16:21:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.17342.1708532460878605900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 08:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lh84HkId;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29a2fd8007bso303045a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532460; x=1709137260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twTUj+6CD+He0xW3OhsIlycKL0gbQ4nxu+DpsUW/rfc=;
        b=Lh84HkIdkakx+Y/ozqmPEIwAMtzE0dFL9Q/a/OJJFQWipSYURySOJpIaSlkfXNi9hT
         96Swc0DuAPa2LNUtirVeZ2HOz/n0c9xuJJhJVWQYrDQPAC4M2siTrUygRU1rEJH5yczC
         nGl1GexG0t2lbANm31lOcV41NynejvB6HhqCZPfrOtXlhM0oB+8sM0k+Hum7ySABToQu
         BsmNddsuatH5XX7Kc5TglSZsgNlR709tGF6Us+t1ISG7Y4RDqcjvoF7BOQjiHWay4/zN
         Ik/bMOKCM/0nc3h0ITRrf7x2h+iVu85bVegMcWF1lFdNq/TNgtqHKgwLRj7ThYjv7ybd
         pTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532460; x=1709137260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twTUj+6CD+He0xW3OhsIlycKL0gbQ4nxu+DpsUW/rfc=;
        b=U8ZrZ/q4QPD7+kxiWbahJscTYtuc8yfrUuOZA2SpLr4+/PLlZb+MNX2GsD7/NY1Ys7
         TdoxQGQ5CFkBJQgrNTT83X0jnxpCp0pTaVFuKVB9bNECJhOGetKzeV3xejjqgtKeY16p
         +r23UZjUKO1jgOktIjQKWIB3L/hWwM7mf+KAc01kf2JWOlN0YOhze/U63dvwHvLtuCuP
         HIFeexC/tjF3VIjCso8MzeJcNPYp62F+N3ExBHfz+Tw0tzXTdBzUOUQApHQDOGu/P4Xb
         /waWnSYCA5ryLlCn4WLzNjJnjo110X8x3C4bPtJ1BXoRei1/uVv8s2BKBi2STSFgkgL9
         acbA==
X-Gm-Message-State: AOJu0Yxqx+vSe0BorXCV316srUn3FP+xflSrSsx5dNjGIyq2W4i1Uw5P
	KjwRCoMH17MDg0Zr3zGS0BKVs4JznNoSxjGi7u/JNT00M0eb4DiQSp5GugfWp/U=
X-Google-Smtp-Source: AGHT+IG4qJNhnYpiN5zI5NTg5MIFfwHtdXh2atv5Gf7Vptx1GQyKTgl6lLArdVJHWKlcE7GKldD9Xg==
X-Received: by 2002:a17:90a:fa0c:b0:299:2ed1:d462 with SMTP id cm12-20020a17090afa0c00b002992ed1d462mr12726551pjb.6.1708532459792;
        Wed, 21 Feb 2024 08:20:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id nv13-20020a17090b1b4d00b00298e639d17esm9753550pjb.22.2024.02.21.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:20:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khawaja Shaheryar <behzadshaheryar@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] snort: add snort3 initial recipe
Date: Wed, 21 Feb 2024 08:20:55 -0800
Message-ID: <20240221162057.4154660-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221162057.4154660-1-raj.khem@gmail.com>
References: <20240221162057.4154660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 16:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108965

From: Khawaja Shaheryar <behzadshaheryar@gmail.com>

I am adding this recipe as snort2 is legacy now.
See more: https://github.com/snort3/snort3

Signed-off-by: Khawaja Shaheryar <behzadshaheryar@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/snort/snort3_git.bb  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3_git.bb

diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_git.bb
new file mode 100644
index 0000000000..f40a1d7d6f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "snort3"
+DESCRIPTION = "snort3 - a free lightweight network intrusion detection system for UNIX and Windows."
+HOMEPAGE = "http://www.snort.org/"
+SECTION = "net"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
+
+PV = "3+git${SRCPV}"
+
+DEPENDS = "flex hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
+
+SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master"
+SRCREV = "e1760a8dbb829bb3fcf1a340ab6cc4bb80a47ecd"
+
+S = "${WORKDIR}/git"
+
+PACKAGES =+ "${PN}-scripts"
+
+inherit cmake pkgconfig
+
+FILES:${PN} += "${libdir}/snort/daq/*.so"
+
+FILES:${PN}-scripts = "${bindir}/appid_detector_builder.sh"
+
+RDEPENDS:${PN}-scripts += "bash"
+
+# mips64/ppc/ppc64/riscv64/riscv32 is not supported in this release
+COMPATIBLE_HOST:mipsarchn32 = "null"
+COMPATIBLE_HOST:mipsarchn64 = "null"
+COMPATIBLE_HOST:powerpc = "null"
+COMPATIBLE_HOST:powerpc64 = "null"
+COMPATIBLE_HOST:powerpc64le = "null"
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.2


