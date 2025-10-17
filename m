Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46860CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 14:24:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.16676.1760711046781819566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 07:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cecEC3IM;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471076f819bso16337355e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760711045; x=1761315845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe/7TD948t/rv05j3Lb8LpbSJzKsosymxX+4MmT13KA=;
        b=cecEC3IMgqJxKm5u6v3NTu9gg2AVsPOW9Tm8/jm3cRmO5fRDoQvO/ULmwUp+Xsf9Ih
         85kVilCBCoRphT4bXWXn79/AA5qo7mc/RvaTHNzuMIz5aohIx5lsY+wTJoHsIEMjCQnY
         FGaU3nXxTsQRK3ELP+Scbh2IIo8iuCCEiZM+npdHUqPM2NG9a8r1JuTAbjqawTbGtHSQ
         hNfe65GDjTdL1Wn6fmYMIbi4nwjeJhpljWCsmlEa+Rn6kfMZJ5+cDmR+w5fbvlh2zhzb
         /6iacKbnzZETtBk8zkbFXlaPiY+gdqi7RFwASLcgDUx91NyiPQZOIkRn2NSmB2vvmexg
         QrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760711045; x=1761315845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe/7TD948t/rv05j3Lb8LpbSJzKsosymxX+4MmT13KA=;
        b=pGTY+BqSYfiAI8/H4Jes2ximgGKY2d5I3S0tz12SjcMRhdrT/ZgTzjQ9DpTCiyniPo
         9Te6/5BsFj2M1pX7UVD0sd6VinsUFurFBmE7nGpW+juKSx/a7VgRXHF3RtFdSt6rDOP8
         KOEYc1nrPWw/dfjZYzCNmHrTt8RiuBw3KZ8RogHM7hRJgiAwN2s7Ft8QGgjACcFJZysE
         q6Lk/42oFB1/UmzXnbPCzQVLWrC0RYfiN645fXfwwnCXSvVX+uOniCGMROyAzpDXhYll
         /MbJhMOKMiPDhGm5A/BjdqAH4juEwJW7GcBN1jgEXsCpTkuYf+p5QvBVEYAbmdyKO5BX
         PzaA==
X-Gm-Message-State: AOJu0YyU0kdhBm0pLg0lU7yfaV4ZFV1GyJvCW99hSLAqXpdVwtG189Xf
	k3kP3YP3WxieCsyz0UDkINyt0Ez5s4/snmMKHZ+9v7+EhNBlHMvSrWUYKLv4nA==
X-Gm-Gg: ASbGnct8aN+BgMs0tF3BnD/qIQULJdGwvUcG+v/1+ciaFGjg2JU/+8lzxFDVV3RyjRy
	+8RAmC3OLaQzN9xYHqYUmBACl/iS2kY43fTYzn6pBFz9Uo4EY818kpdUPWfOIN8o7oeE/uSpRua
	/xcmFddhDlUEVShzURCabZio/+RjSMUjYksU0Ggx3NzsGZudpX78btGLZbhE+u410KYMPUYwgXe
	42eOviC5tnnqM1cLdXc/DdMUOHk5KVa/iqtreF8JhmSroiirNeUsgQBFQit5RlL24fyQ0MpBmYu
	x4aF8dZ+dVDmqYVcj9w2mIC0MUWtymWZ1O7apD6B7whmlPRqFdJ/2paZ0eYlYxqKwheq6MP3Uzp
	gHUf7QAho3BgPn0Hpx15HIAsPgknk4C7zZwo62Hwg5pdTc8iy8fIH/90DSy17qYkZMjb9gSlg96
	ImXSUFuvbZ
X-Google-Smtp-Source: AGHT+IEXh2V6FoGp4HofbGCGKMVu9wY1/FtL2CL8h7XaQo7OMD28CLbbALKAvNs9WatNiiCq54jgSQ==
X-Received: by 2002:a05:6000:420f:b0:427:614:83ef with SMTP id ffacd0b85a97d-42706148516mr2383804f8f.25.1760711044991;
        Fri, 17 Oct 2025 07:24:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e50ef821sm26725714f8f.38.2025.10.17.07.24.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:24:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] kernel-selftest: fix ptest
Date: Fri, 17 Oct 2025 16:24:03 +0200
Message-ID: <20251017142403.2586968-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 14:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120763

The run-ptest script was trying to call test_align executable, which
doesn't exist (anymore?).

Instead align more to master branch, and execute the selftests themselves.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 .../kernel-selftest/kernel-selftest/run-ptest             | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3d97ea0967..73be432d2d 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -133,7 +133,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES:${PN} += "/usr/kernel-selftest"
 
-RDEPENDS:${PN} += "python3 perl"
+RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
 INSANE_SKIP:${PN} += "ldflags"
 
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
index d40b9576d8..d8c942a2ea 100755
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -1,11 +1,9 @@
 #!/bin/sh
 export PATH=$PATH:/usr/kernel-selftest/bpf
 
-# test_align
-test_align | grep "12 pass" &> /dev/null
+/usr/kernel-selftest/run_kselftest.sh -s
 if [ $? == 0 ]; then
-    echo "[PASS]: test_align"
+    echo "PASS: kernel-selftest"
 else
-    echo "[FAIL]: test_align"
+    echo "[FAIL]: kernel-selftest"
 fi
-

