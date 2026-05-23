Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B27CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:42 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3091.1779512502200727880
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gUhGOMCO;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83659d38e38so3252961b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512502; x=1780117302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cWA6r4DA3smYB6i6bQEd0p+ed93T0InZSkmOR0n0SA=;
        b=gUhGOMCOtgalwBrsKJPu+fUm1wmde41piZ9sRr61zEKcuKKU7rXmaE2M7Rve0fW1uw
         gujIvh/RdD8bg6dWMHMpMoYhroJyyr8VOGWleUEADW6wltu984w7/n79wsSQfm9PWZec
         2gs+gCQ6ZqEiWL0hEv4PtCSTL+O9zC8EviNH5rKFGLCLh+HCXs0wS0qgJL37tKJ4wARr
         lnQUCeVzSv3PDpynTtVfN7w9og67NDQFrMmBI578fMAZAO1D2xJYt0ryhEjxjkDjBRzu
         BA0GHzKUGCQVXS3dtCo2pmTVSrqsWSiHNBZSb4ThIm6IKtA/vqNcM0Spa7sjetkUcwHy
         whBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512502; x=1780117302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cWA6r4DA3smYB6i6bQEd0p+ed93T0InZSkmOR0n0SA=;
        b=b8HQpuXaPypbvPu+80i2ysUd2r9Xajq1K06H3jTki3CnHWKXqjgLM+wlmEBKsjvTzS
         xlNMhMGBxxUUqm5bx3xpkoIchYTkasYNv4WtDw22quhnHP3Oh1+whdCMRQP8cRTfrrve
         pvh7HBlgpq9iMZ0K0PVCVzzbKACH4kbrvk0zGycvsHpfxfnocP0mkbjhPSnHTd2OS2bR
         0O7/V4Ltco/HkB0jGLVqhxkUo3sABPjec7gkmzrtwY4ux6/N+jYlkzo7PL+Jz0odfm2b
         BlxSstS93DpoMRQFvwLwClavJzLm8zLnX5aQLGvtu3EozFZoQQ+rnTnmPEM6NBsDKXvn
         VYYQ==
X-Gm-Message-State: AOJu0YyD0xVZqU6PX+wz8dVYFGuE5Bv/0gg9op+VmKLVd3Rg62cuW/lw
	ZtBARucAZNFjvLoc5ubMYotcJlgtf39uZVXDzOoS7o1Ls8157K0iMaKNnzXlW6V2
X-Gm-Gg: Acq92OGWmet/v1XhhjOdij9xuHN9f13V9PdBmN25ZB5uRcBLMEl31yVHF+G+tnEbs89
	fvOznf7Ent60f98EUz197IYa/R4lebP8Sm668KP0Aokw0J1JcDMIprdndA2FNkKZkS9t+7Mb2cl
	omeGuh3cpLsPKAxOjAK2/2jh9dxiuHTDphV/lpxvnWUNvU98gm9AG79mqLJylU5F3/Q0bDVE6jQ
	VcVt1fLdVtWnMDBBy9tvxQXqWgH9DUxo3H4gu9yYn4Q9nLCfiCmhRDQP7py3xCnCuqCujT6+LQL
	3wtOTCVwQWSy1C1zRbBdiPEVh5nG6bBdL7y2ygLujXhu/1vlYYlUuUGtz7YG1cNmWRSrYA0pexl
	O2Q2Eot5kdFexSTb6AVPJcdG45HlYiLrcxfexxA15kEPQ2RkSJ07ED0DawHNnhz1isg14YH6aWm
	E0zq4xnDdbfllEaSTePAapWTApFh6+5vQW/Xoo
X-Received: by 2002:a05:6a00:4292:b0:83e:b125:ff30 with SMTP id d2e1a72fcca58-8415f2d6d66mr6384383b3a.7.1779512501592;
        Fri, 22 May 2026 22:01:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 21/25] dnsmasq: fix CVE-2026-4893
Date: Sat, 23 May 2026 17:00:23 +1200
Message-ID: <20260523050028.848327-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127171

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

An information disclosure vulnerability in dnsmasq allows remote
attackers to bypass source checks via a crafted DNS packet with
RFC 7871 client subnet information.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4893 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b4c48536242d9aa7d1eaf968152fc83edea41923)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index cf900328ed..4ae650f7e7 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
+           file://CVE-2026-4893.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
new file mode 100644
index 0000000000..af7e4119e1
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
@@ -0,0 +1,34 @@
+commit 434d68f2eb1a58744470698483a3ae09b5a9a870
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:22:37 2026 +0000
+
+Fix broken client subnet validation. CVE-2026-4893
+    
+Bug report from Royce M <royce@xchglabs.com>
+    
+Location: forward.c:713, edns0.c:421
+    
+With --add-subnet enabled, process_reply() passes the OPT record
+length (~23 bytes) instead of the packet length to check_source().
+All internal bounds checks fail, and the function always returns 1.
+ECS source validation per RFC 7871 Section 9.2 is completely bypassed.
+
+CVE: CVE-2026-4893
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=e3a26d092e47bf1d18aeadb758e4ca35c83b5f2d ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/forward.c b/src/forward.c
+index e2f64c0..208480d 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -724,7 +724,7 @@ static size_t process_reply(struct dns_header *header, time_t now, struct server
+       /* Get extended RCODE. */
+       rcode |= sizep[2] << 4;
+       
+-      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, plen, pheader, query_source))
++      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, n, pheader, query_source))
+ 	{
+ 	  my_syslog(LOG_WARNING, _("discarding DNS reply: subnet option mismatch"));
+ 	  return 0;

