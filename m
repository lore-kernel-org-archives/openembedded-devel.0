Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABDCE69160
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 19:50:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87425.1766433002541395659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 11:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLXXZfex;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso16456135e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766433001; x=1767037801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXTbXWtyf2Jj1itcURN16C84A0zg58QWmRmYzaJCzVY=;
        b=PLXXZfexZKA4mWAwloAslmHXtF6fmDsHftpnYaDTN9nwV3PQJK1PXw15NNCYsyznS4
         dyco+J9RMvmxtpuZlzF335Ji9T7P8tZrF9IgHmhbXfcs35EakK/VVQaDzHQtsfI8pm8S
         +bn0sqtVRTaHEC59jJaiH+tDzmCJKZAcpSkjUlDYQvVWtcc7KJsarfHBayf6+hznEOeX
         SAhqTfAGRM1O0xwoDbI/BUroMHfT4b/3b0KUit1SNOxfVAJ8jUN54Yc7zktLMIQAE+yV
         flQs6z5pjPD4Omujb12ne4Itp+xxo186fudf0hAwHpO0JcuMYSv9VC6APeymGK/MCw+L
         +RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766433001; x=1767037801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXTbXWtyf2Jj1itcURN16C84A0zg58QWmRmYzaJCzVY=;
        b=thyvA4i1ZraxbctuONEFRNjdS908+N7TPhy98+bQzEoDQE1Cig5jZTBGeWAALMUV4d
         Xfs+C4K119y7KGsYfou7FdMY9Z1fBvgLDYhLQ0v5Qfo+vvgHphO3C0AKdnGw0lc08uB6
         A5JrmPRfC/BUn5aF9hkuM2O/NNOvGCHwGwzheR35DWxk0kMA1OgnleoTEswRO8i8C5bq
         /mE8sQprXdnYMC9ZndSMR5by0qYfTcw8zIopm4jcR0PTssv5QjNTclyQK3vw07R/xnm4
         cvAlK9jJFTH+xU+QNStV5RUfYDrm5qpQDVqtXbR6Pa3zOW5yHC8qnpVB5Yj7D2w+fw11
         Wv1w==
X-Gm-Message-State: AOJu0Yxc1spSrieSpdO9usjoTwxDi7CD3VG5NpJaABy03vR8L0yM1ANG
	U81UIXBbhQiXl/Gx20EPx4IzX6iHQlqcznlZCV94jmFdYaHXn+QmTZ3DrB9dhA==
X-Gm-Gg: AY/fxX4KfnjKjJUfdJRCjmgmuy/8F4K/Qsq0vfjIEenRWhz5u108UcnWx4CWsn6iC3U
	AQyyHnekoEoNCW/MOjOCII/NexduPs6IDenKyjwxS7PODLnFKxIlvoF9qmP/oRuTGJpYlHNip8/
	DpXiy6XjNpUVPPACb8khoCRXEm7hMrXIQihtmteUIfFtoBAQbjoiDuXujYbQYj/GooqabyW0iwc
	cQhdgkgdeJTB0yRfhjRNUM6TR10KOnz/doPOpZCVNJIt+Ye6dMBPX77L0takqjgQOU3wuQRj1ax
	eFtRYPczWrCdKVotNUt2eagTy+o2AUj29R5KvTshHudaXITnuxti07u4YUKTLW7f7rDNftV7CvF
	tA7Tc27aqL4NMjQnkg7DgLJdi3LzvWOjvejgrE4o0D/6xhQ487btBgJYXwviyUSAw3LPNlqAFbR
	LEkw37dPjPOLwv4tUzb8o=
X-Google-Smtp-Source: AGHT+IHnc2ju//VipgLSE+6f9lx2lfz4qAcFPkUWg6Iy/fnyBsfVaHbwu1VKCPfAZv4Wp7AZHXcmJw==
X-Received: by 2002:a05:600c:4e90:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47d19557183mr136453875e9.15.1766433000604;
        Mon, 22 Dec 2025 11:50:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c9d4sm104078035e9.3.2025.12.22.11.50.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 11:50:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] fex: ignore unrelated CVEs
Date: Mon, 22 Dec 2025 20:49:57 +0100
Message-ID: <20251222194959.1725672-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 19:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122804

These CVEs were filed for "Fram's Fast File Exchange" application, which
has the same abbreviated name as fex. Currently this recipe has no historical
CVEs associated, so I couldn't set the correct CVE_PRODUCT. Rather ignore
these irrelevant CVEs explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b990486203b8eca688cfb6fc9bebf8b138e0b334)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/fex/fex_2511.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb b/meta-oe/recipes-devtools/fex/fex_2511.bb
index 9c0748ac63..88dd48f953 100644
--- a/meta-oe/recipes-devtools/fex/fex_2511.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2511.bb
@@ -54,3 +54,9 @@ LDFLAGS += "-fuse-ld=lld"
 
 FILES:${PN} += "${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.so"
 FILES:${PN}-dev = "${includedir}"
+
+# At the time of writing this, this recipe has no historical CVEs associated, and couldn't
+# find a CPE to set. So ignore these unrelated vulnerabilities.
+CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: These vulnerabilities are for unrelated Fram's Fast File-EXchange application"
+CVE_STATUS_WRONG_CPE = "CVE-2012-0869 CVE-2012-1293 CVE-2014-3875 CVE-2014-3876 CVE-2014-3877"

