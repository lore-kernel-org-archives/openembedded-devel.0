Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1DAC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:51:09 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12870.1786600260971608425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z7B3noV3;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf318752so1296895a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786600260; x=1787205060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LoSLB9q4w6ux0Q552lt9KrkfNDbMAbfc7oaMfTMrsaI=;
        b=Z7B3noV37xO4Yp/PeZUJa5DFI5KMyItHXsXnIwOSMoVV67WIXEjB5Tf19nKxPPDLXe
         +/UfYDN+M/B5PBmoibMQBRGtZ7g0pCz/u86wXYiUaMCeLbtla/bJvsaCFV2dceg6YSTu
         VsWUiF4pB8sd2CiSM6hnF/rPjXZ1gK8RHqxEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600260; x=1787205060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoSLB9q4w6ux0Q552lt9KrkfNDbMAbfc7oaMfTMrsaI=;
        b=ow6AulOiWP5+3Rf20+tr4y5PxxJxhaaEdTNZ5165ie+6QLHymxucyppBQzcKGp1F+1
         u7FrTNnv2A2Gqi9ZhVtyh/tFQuepm8MOYVPS+drqj3acA6CQ8x+9FLhd01tFVznQRi+B
         bDvKfcZxf5Gb4p1XDN4tvPq6cXZFuvTKYhanEc8DO/8ppPPAsM4+X5V+ZaZRU8GRnSQr
         Gf3WCenih2jey/QZ8l38nyykIBM2xN+t4OCaH8NeKz/5IFXg8jmsqpnXmzQwNTRkBC3l
         bah8cQ9/EpEKg7EST98tCPR0yG1R7FkNmvR+0LSIwEewv/tjxj3ku7acmeYU8KwT+Yxr
         EzgQ==
X-Gm-Message-State: AOJu0YwtA5YTPUpNvnD6s4bOKeCEKp1iBNssVTFpsrP0Rm3Uoq+68yHn
	LIQTBMqUN2LC/S0AATNad7wLP2fXsX8hrjO5HpdYCDMUVPZ3rVsHN9AROqJyl2QU8mfKL9RkDZJ
	MAIoubhs=
X-Gm-Gg: AR+sD1231UoPnmxUguARn/08MzopEOXoJragSLlsxroeeKY0TXUq6SY5U4HBbm63NXP
	dC12JbiRnLkGkH7SeKOQg64AeglCu3cZplXK7tiyHikgjBwwfwzYpeHTSXhewURVKTm/4qWHbP4
	yaxGMZ5WqdGJtPXRc40jFBllWIK5OookMnbi/fd3VdxtuWoe74/mezrk6Pys4RDpH/mM5eNwzFT
	yWfJyj55H5pzKVHh1360wGAnVwmqhiLgYBOfXZITWXhtolzsB1WtjL9x5FE3wrI5qJ5VNyW7U5f
	Dd1Dxpnl3T4rigcMjy7rTUOBqoCsA75QleHOt5K9L4ZcLWpRTmb91RdRZUXVEtpxj4LUHya+Q9D
	xb7sGznaOlfbTdwZuvnQWdBGpBC/F2wnr2UQEUfCzoNl8PCupHsvxBr+5hKx1PnkgOiDjSaoVoq
	B3hW1rPRHqmxNDSxqgiVFHDjHydy+S75KrLakFCPx7Avl4Q4S35Ug/sqdqlCmHQJQmVzLDvy+Qd
	TLu2DA1LRqF
X-Received: by 2002:a05:6a20:d12e:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3cc5515541emr5271809637.13.1786600260206;
        Wed, 12 Aug 2026 22:51:00 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412da6a1aasm5876820c88.12.2026.08.12.22.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:50:59 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] libssh: set status for CVE-2026-15370
Date: Thu, 13 Aug 2026 11:20:41 +0530
Message-ID: <20260813055042.91413-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128934

Analysis:
  - CVE-2026-15370 affects stack buffer overflow in SFTP server longname construction.
  - This vulnerable code is not present in the current libssh 0.10.6.
  - Hence ignoring the CVE for this version.

Reference:
https://www.cve.org/CVERecord?id=CVE-2026-15370
https://www.libssh.org/security/advisories/CVE-2026-15370.txt

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta-oe/recipes-support/libssh/libssh_0.10.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 1e1b5fb0a5..13e01ff9fc 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -70,3 +70,5 @@ do_install_ptest () {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: only affects Windows due to loading configuration from C:\etc"
+#Reference: https://www.libssh.org/security/advisories/CVE-2026-15370.txt
+CVE_STATUS[CVE-2026-15370] = "fixed-version: vulnerable SFTP server longname construction handling was introduced in 0.11.0 and is not present in 0.10.6"
-- 
2.50.1


