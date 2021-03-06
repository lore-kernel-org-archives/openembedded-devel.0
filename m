Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.10062.1615049844601728098
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 08:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9s+BmEt;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id d14-20020a17090ab30eb02900caa8f10060so798355pjr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 08:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4InQq55O359UBHtWUX8nM8fUw4qCMdEcBWpTrMvDILQ=;
        b=V9s+BmEt0zkzLg9PL0ix/FdRdxl8NJeFaStfIGbm/EHOLWL0bAmoaBR7XBqcgpwGVs
         9DcQHpNT/h3rZZXkXoqNyArtqvg/nn16a+3rXyCDro2XsUdMJzn5jYHPst+6HX3IVdU4
         9vwgUkkollgDA0SnX0i25kCw4M1QcODuKJkWt1W7gUnm4kNWEQpuZmRnwQ3l4ooSYcJf
         bgChtRKXwrbjkinWLXBc2hvv7FSoP3X7FNfXEbLVoSm28eIpnqgwHUlct/uk7uiAgScE
         +uIZWEAbt89pKHpgqzx5MmVRF6EDKZObakVKFzufQq8Hp1I58SXf9UVPLqRGZdrnc8hz
         fBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4InQq55O359UBHtWUX8nM8fUw4qCMdEcBWpTrMvDILQ=;
        b=eReLi8OA92+pFDEmDR400BPgUazB4p3qMrMaNVMGfK9X0Q4vza+EsqBfDtN9xDFBn7
         rKHprN6gmwBw0Nc4mXTy4MZVPpmQO4d3wLRqWAXBhrktiGNCk0zY+WHtCu1ChckfaRqp
         DqqF3167M4gHmGTy3x+H0x2k3SLOtJ/+40uJfbYts/BwVzsChCbWZ1tFwkkDka0Rk5i2
         MNND+bP5MPm1TY1vqrMff0ituFeAigucoTN8aROlQRme0BqzzpayMPCPshY2bxBexsqa
         Gk9HQkNVEoL7o2G3Ko/7z3VFAlxSUmVIhYt1FcG+/X8mSwp3jvFUcT2lWhAYNGYxbxvw
         vNEA==
X-Gm-Message-State: AOAM532lioH6jzS3ivw26X6v6ymktqXT9QKipFwk7eavMen48vBq88kG
	S7zKAlyxq8Yu1Y6WdNfZZ6OnICfa4phSpA==
X-Google-Smtp-Source: ABdhPJypTSsJI8HjmIfj4NORIEXiI8KpgapCj/u9Skm4UMERdx06C8nRQ2y/DQFlhJx0CTOphBfwNQ==
X-Received: by 2002:a17:902:9894:b029:e5:ce48:5808 with SMTP id s20-20020a1709029894b02900e5ce485808mr13406067plp.31.1615049843904;
        Sat, 06 Mar 2021 08:57:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id p26sm5724132pfn.127.2021.03.06.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 08:57:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libbacktrace: Add recipe
Date: Sat,  6 Mar 2021 08:57:20 -0800
Message-Id: <20210306165721.863371-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libbacktrace/libbacktrace_git.bb          | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb

diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
new file mode 100644
index 0000000000..2ee017cb0c
--- /dev/null
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -0,0 +1,24 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A C library that may be linked into a C/C++ program to produce symbolic backtraces"
+HOMEPAGE = "https://github.com/ianlancetaylor/libbacktrace"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=24b5b3feec63c4be0975e1fea5100440"
+
+DEPENDS += "libunwind"
+
+SRC_URI = "git://github.com/ianlancetaylor/libbacktrace;protocol=https"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "4f57c999716847e45505b3df170150876b545088"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTR_OECONF += "--with-system-libunwind"
+
+do_configure() {
+    oe_runconf
+}
-- 
2.30.1

