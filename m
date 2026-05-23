Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B45CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:22 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3081.1779512475392677448
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNxoDnsn;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-837dfccd950so3831407b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512475; x=1780117275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cawJUbhc4OK+2s27V4gUbKK9WZOnaGgBal6i0bM8UT8=;
        b=NNxoDnsnRFGvyP2/6HZgIfCXujbDOuiGUpUbKxHjQxJMuZ/wmzpSJNCGV2UcTB0R4b
         l/uvhZYU20omtWdl3s2VtikkRCmEZSdXla8FF1Xwhi15J6nmmHA/w38D+UXzSdBLATO1
         nX6F16R26TJWxUIv1qhRsw2JqNRKdZD9MbM5tvI+eIaT9MRTzyBm1VcxYoikg4RlWTv3
         k+xluKji1R9gOf+ZaXwqRcLwAeCug6SLk1BRC5E+D5oWEdEK6pFVHjce5atxAvjnC1Gn
         LEE9m+XJInFX59gJp1LSaTLEYymVXWskrsZmCmKZRFD/HhIcFJw7b7Op6YmPehDafEVV
         FdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512475; x=1780117275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cawJUbhc4OK+2s27V4gUbKK9WZOnaGgBal6i0bM8UT8=;
        b=o5ciI09eomIHoxG3Xm6rBSr6WqOWVhWWfpRlyD+nvuzmCstuZiaqsJpgME6AhJEAng
         o/PlC3fvHJG0vUTmEa9mC94mfoNL1Q8j054kEA7eTlB7kntiUigMjBn+B0CWL885jGcM
         /G6hC7mWPqXMiLuMfytYmUaWIofZJlUBuzWN11bCWpN9Zebu/3E+LU3O0aUVluhX7FXK
         dl4AOzaGDyTB1t3dPaaVP0jzo8SVCCa2rBAebZdIhDykCN3FBAfKs6G0foeZePzeCi6f
         SKDfPu9GFugiTEcpAIbRnBemfrtSQYhxGmH+CKijmL0n355AdN9/P2rPJ2DAyeo3d/4Q
         QGjw==
X-Gm-Message-State: AOJu0YwKZA7qZxFDr/UUoKHJwJ8rLOnmNUPu90nDc6QLsVe16w3Hzy3p
	ZrPecxspNOhVBDF56ftaAB3EqbvyovnLFuGA2KgBIOWZ8yb2RHrrsLO0VnuSiN07
X-Gm-Gg: Acq92OEDOYF2UOieIXlgc+l/hvws8sP7I1zyVDh4IpHv6I0MnCGrp4MWZaPYyG7TLbc
	uC/LlcF2jE0Kuga0CSWX99/zZ7ePb3LdpGAHXTfFI9mkXQDTDdJJgY7iS0veGxFerUbwzxgseP9
	yycN6GLeuLu6kWZ/hObEOVVIZf2gjlAbZNMgg3WidjR+HtJOIWTX0LRT55+LP87gaaH1PMF6UWU
	5nUHTRDUvq9fqG9nQgaMjdyFKb13jKhNrRQdUlfKoOOKTWx6JTqgs+pA9SxJEXdP2MDusIht1N0
	4evvCSpihZ1+Tv23IKO1C6no5durUgz4rzTp/0IiMd0BIkt+JymxSCsYF1P4XLoxjtshX9C5EKL
	pnGhjmnjB9F/GB7d4tEEcRG8xuryTf6dtC7/c3R0odTlg3fzXwS9/Ufq/8z7JuMqHOe2im54l/Q
	C7umlXlumM4H8Ud7FnKw9joYBCK+GE/iPnS1DEJiuckggvJOY=
X-Received: by 2002:a05:6a00:ad8a:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-8415f1a06fdmr6092524b3a.21.1779512474720;
        Fri, 22 May 2026 22:01:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/25] uriparser: upgrade 1.0.0 -> 1.0.1
Date: Sat, 23 May 2026 17:00:15 +1200
Message-ID: <20260523050028.848327-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127163

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 03255a83e3cfff9c295a03636e0ca09cd3b024b0)

https://github.com/uriparser/uriparser/blob/uriparser-1.0.1/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.0.bb => uriparser_1.0.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.0.bb => uriparser_1.0.1.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
index b9c5100803..987c28744b 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "291f25264a5c025005b1bc39de3c029e6a6ca0a8d6cfa5e61cb5b03702c0884d"
+SRC_URI[sha256sum] = "5a3b7c491a1e9033d86b9c00a947bafc46407187938578daf799a4155cb7c88a"
 
 inherit cmake github-releases ptest
 

