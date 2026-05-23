Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A85CD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:32 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3039.1779512485266834019
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mD3dLPse;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-841513664bbso1437918b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512485; x=1780117285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijOzqq3KS7EZsxFwRwkVC7FPIwpFAOWsQY2JlR9JgEg=;
        b=mD3dLPseckMGy2CXyEdTBdciLBvJo4R2W1hK1tHZGALlZPsnJGs18Znin0W5bd51/5
         pw9hljzrdA43cQ46U6UdHeM5ZxXmFy51xnF0MBhrwZ8zFpuXjTkoV0Ddr5S4H+lAuu5t
         PqV10gUJ/klAMnQcuePq4g6m4ZqszEdg1nq5rsw3EedY4Z9SP2ZMk6PUJT5IwXIRRbSZ
         BXIJVpD/j4g2a23W1W9QIJhbgVQPJI4Z5HgWPmSwMLD8o561WI+lnayHQzQVLyp9hXIP
         3c31TGMLbkP+CX1+Q/8+HxgVyZJhgGfuPUSRJ6IyX5j8in6htfDFUmzbV6uJkocmhkBU
         5Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512485; x=1780117285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ijOzqq3KS7EZsxFwRwkVC7FPIwpFAOWsQY2JlR9JgEg=;
        b=YHcF4OKmywnBgaJiceStMMd9+yDn1VrwNuWSMFPWyYgW6DpB+MR2G1m+ALLHd2detT
         TyzseRtgqxtiM3LhRFvSdATeFgjLk33rN0b32j8a7WTch1uSSyGuZNgYF0MrbFVj+LuS
         vS1tYoNDkSAs60yCQLpyE0o6At+UXWWcbIqlwF4GcFZIQapLeg0doLWbqnG9WxtRxUqC
         ffWykDStMq8gg7voFpGQQM5pw3vz/YYQkh3bvsyx+5FPspuuimD0LeyTgyBmE0Jj4vkR
         jYfR6ZefcvZPX2eTtBgiRc5ncMQCHnoBIot29VP8rG0Uu1lXBK4bySHDwprDuRIOov+5
         6dng==
X-Gm-Message-State: AOJu0YxhjCZ9B1BXNuqboiA16VCEorC1VUE1W4yEEzBv6YJD4dwcILUj
	JOks9OirZN2XcLEZNLuYj2qilKrtbgvva9M8yyV2EakZr7wvVp3qtrtqrmTgmZS1
X-Gm-Gg: Acq92OGK67oX1ABC3aX6OeZwYi+rINlXPcZRfDesmLAhC6MUawepFBjnT3HRXWCaX/g
	39piT7sZQbKd9CMD+KJ4jEvCGvsHDSSsUdkal+RpLnHOL1U1Ew4KKTgIyz4UkdvpulaUVI35By8
	IrYs+7biNuTzGA+fYF2swaq6z3MR7P7ROolU3YRQpgAug84mzM/twtrh5i/WrJ8S53VC/NK9Nzy
	9mmupnY9Y1K8yfWaDMMctKTJ0pL4jtn1F/TD/BGw5fWLCXuAskT0glpIvvYUhuTtYTbvuaskskY
	TbZSgnhPNG2rBkmE6130RCcCuqMJPkfH0mEtNwt6iOLT1KRJqs1HTMQSVxJ3kXBVPjJRwio0BAq
	DAdZ0KqgpQo4dKP8oxvsN1Uuq0VM/Ao84nJ877qVRuzwfa191589EbahOy8zehzI+eS4BAA7ZbD
	1W2/ceqM4tNaOjr2WettDoOzzyE45FNLeE8fNe
X-Received: by 2002:a05:6a00:2d20:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-8416116fed6mr4692047b3a.18.1779512484669;
        Fri, 22 May 2026 22:01:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 16/25] lldpd: upgrade 1.0.21 -> 1.0.22
Date: Sat, 23 May 2026 17:00:18 +1200
Message-ID: <20260523050028.848327-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127166

From: Wang Mingyu <wangmy@fujitsu.com>

 * Fix:
   + Fix out-of-bound read access when removing VLAN tag (CVE-2026-46433, #787)
   + Reject 0-length management address in LLDP
   + Fix race condition when creating the control socket
   + Fix FDP MAC address
   + Fix memory leak in the BSD bridge query path
   + Fix duplicate management addresses when merging EDP VLAN frames

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 74cd808dbd01a5adf6d0c969fb024d8fda8fede2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.21.bb => lldpd_1.0.22.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.21.bb => lldpd_1.0.22.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
index 73f7ac68a3..635d54931d 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.21.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "5b1b0106079a0785b55e1be45cec40b66b41779f3ee6f1a8d2dbd75d389df091"
+SRC_URI[sha256sum] = "9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 

