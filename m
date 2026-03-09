Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2BBEFCD76
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:51:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10336.1773049905026403904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmG02t/s;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so136008055e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773049903; x=1773654703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWGpv50E7YQc5xMjXd85ENz6ZMCtEZbLr1DUfjJFvYw=;
        b=MmG02t/s59rhrql69KCRbfF16s3VOPPef14AD2YI6C7bcKSyZnR9QQu3YMMRsEFyaj
         uqy7SbQ17fhQSVcs/ptYXFHR4h1/FJN/4wcVZugnKFkNWrnltKPmTSB7ChMFWx8hw3eb
         QYT4xQ4gqKpX1xVLcLO6hgkbnq1Id/Pag13GSOgasppnMDxyNCIWFapcs1qiNGE1pfw3
         DRH96kxEzB7yrwN+4vPoEF+e9azXEuW/ooRBSIfQ7Ng5G1b2ulNifbdWtJeDGv8DwIzy
         sb7RVcCcCAWsSstTeAL2BdDmXTBIgq9Lo1MMyzoFt3p8i/4zVfGR1GdUcj1RDnDNRenL
         y7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049903; x=1773654703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWGpv50E7YQc5xMjXd85ENz6ZMCtEZbLr1DUfjJFvYw=;
        b=PQFmoqTib9c4mocdlPKGCohCxsoojAmsSIjVSyxI1uj6N4HuO90qO3W2ZcUfWYOHAj
         Kh5iYmvZBkvVazpBTXE99laPBoeQx3t6HJNAnenV6FphQBRZ/UZZ1GMEE1Kn+dqsxIyQ
         ojR3orm760x0Hql9ecyuzXCbv9gP09T0ZbGPaP/bgNNq8o+SzxYVhP2xfH1K8l1HMx4l
         NrVX7lWUJ+U2BZ3zHlhkFVKygWW/s8dokqWk8zHElXwgjewCgxGLB6Qm+HU8j4yG3hBE
         bcKauDMM2gyUe3zR0O7bULZX8Mxh3fjQbohqNjH8HAIT3trqHD08QkEhNliCyj56pH/K
         UxcA==
X-Gm-Message-State: AOJu0YwCcDL1T+HDNPqaoB/bX1yHH9r12/7F+d9OV3TGD8YReze0p8jv
	0lIgSS3Y8U1TflASMEHCS/8f2uoSDVzJHFqG37el0idNp5up4oZA8dKfVuAfHw==
X-Gm-Gg: ATEYQzyUs5yenBgze0n3P1GvYltsC+WnZh8WZ88YOXjejh4JXrivb6R50XMec1g0Z/N
	0EMkP+ZI2WVHPNi806LSobpv+OmYLoZEJ24fBZV1EjwaGNYtfSvJq15LR7Si+M/x5TBT8syLL4i
	MLFL9ecMwnL5TWWEf4oxRp61uIswCy643RLYDLexs6nhc1BsZu6P2wHuZbOZzLi1Vgnr9Fd69IB
	MmHMhrvxrmRQ+kKs/ZBajWiWmEggemr2JMdmRbaiqniH0q4n1Ty22c/YExQDbEDTN0mzu4FhqfW
	C9AAKiiCnfsNftyYfVRGa715q8q723stJOU13smtoaJ6ryxb8sz987c/TAr0b9zIg9ynIJlkn/P
	DJJ0d4D3TMxLHTgvHM8Sco56s3jrKTXE2IEAQsYGpIHk0yDgM6batDDyHjvUyjlYEFBJY7FWnV0
	YIwSzIxG5UyEPS2vXFlkJr
X-Received: by 2002:a05:6000:2c10:b0:439:ab3d:1c27 with SMTP id ffacd0b85a97d-439da354a23mr16646233f8f.2.1773049903078;
        Mon, 09 Mar 2026 02:51:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8dbb3sm22720730f8f.4.2026.03.09.02.51.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:51:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH v2] zabbix: mark CVE-2026-23925 as patched
Date: Mon,  9 Mar 2026 10:51:41 +0100
Message-ID: <20260309095141.276490-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124970

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

The vulnerability has been fixed since 7.0.18[1], however NVD
tracks this CVE without version information.

[1]: https://github.com/zabbix/zabbix/commit/89dec866ec7f8230b25f06ac000575e3b7bd4025

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: this time I even included closing quotes, not only opening ones

 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
index 28e4cc4eb0..141342c45b 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
@@ -75,3 +75,5 @@ do_install:append() {
 FILES:${PN} += "${libdir}"
 
 RDEPENDS:${PN} = "logrotate"
+
+CVE_STATUS[CVE-2026-23925] = "fixed-version: fixed since 7.0.18"

