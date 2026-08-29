Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F774C61DDA
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:22 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.250.1787962279023013280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aPaNEOtf;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1307184a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962278; x=1788567078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27tAB5g3FvjTUoR7akiaXfuFgB8hLUNR/ATKcXUrVoo=;
        b=aPaNEOtfKDjBlPxS7TKSPiuOCsIM1jEimgPpyrptKRkLriNdpUa8nuN8AOnzwcepb3
         LCSVlkNd1VylHbwk7zs5pjOu7K/yJnMM5p9NZrad2SSlCMFs9wC/PhFRChj5Kgkynwxp
         mu1coCByLREP3b3k7I5GxYuc67v6EonyiSbhmRohJyUnBZsOcws4D13O60s7I2794kw9
         VSI4JziA547i1Io/ZxWKuCgYiPj8TgVJ3sJ83TT/Shk7zMQ9O78dBTiWR6mvr4ha9PkG
         l7tVA0rV7MlGYm4r9xSS2mZFDNUYvFvLScjy4i4PU5GCnGxu3XGo3K7WdCZYBa3T94ut
         W55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962278; x=1788567078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27tAB5g3FvjTUoR7akiaXfuFgB8hLUNR/ATKcXUrVoo=;
        b=F6YhMxLCx7PiOVihN2L18pVCcjOTOCprd4BTUPnpXHJPC1K09Ss7SOnys80igm3T2i
         g7gxNB1b1T3iRLImBXtw2eBRMEt4+mUXtU2BB456Dy333JBisVjgpYC5WS9H1fGESo01
         bLr5taMVTTZLQVvx8zwln5/fJqiKDELW07t4OrJaKU2FacbydpJtnjD67Z/3sa64Iydu
         ja8cgWZJIpHJvfz/r69Y9VDdm1GNqHKPHdizw3WMHVytytLucP/bdr1HgtTRQR/sogYY
         hF3zMoeiJSu2se7FwFdWCFAsnZPfiofR17SDR5/pgA1PKVJh34ovPh5LuGE0xMZHldci
         +YAA==
X-Gm-Message-State: AFuF++lJIfG0fjnn/gC1eTAt6yBOL2V4A+bslejGy3ponIMgzqI5Afam
	PskQ5qGncqyi+hejcq12ShNcBuuD2xwJrs+2FdoLYE+exfLikGyUEvDzqIdBGQ==
X-Gm-Gg: AYBFou054UEgR4AJeRmxeqtGIZBfK1bh9131nx82H9IFmlfiV7gHtf1KhR46Q2BQBs9
	8OTj+YN7kXD1DaMihrJ8bREqPHiFm0Bb6kGpCLt7yvFsDZfphANoKcxusKFOgybS3iWovfST2Nu
	PNHZlTl1sRFPVk4H71LNFG3AiRkY5Hk5xI0PsGNWLx4Wqei0tWY3rgofOmNeYVTTK9+jwVhDdyr
	4G6fmrm3sZ/E///qcgXop+xYDXbSvZ/D7jTioiU/nuL9LJnU/ecSM/03HGI7qYGgW/EKrh02Qk8
	dYZXg/jInYsD3YazTOuq4PnPf0rZfC9+ElqzPYYxMgGi8na7YMv7uz+ZiXAAjdFMymwdDms8i8X
	Myge4u+o5owO2rMX3uaQQdrXxdxErL+mIx11nChxQ14ulHgKKma++dtTtk+TOg0T65bGmH4RKm+
	5D/I/tPnHVQrzx6SWhV75u23EZGmIguPN2OkT5XzzDKMHt1BJq1enyhHxXzB0PQvjXkt6r/YKPI
	HmiBypRfqtQx43taMh5CdiqjY/TIUyfhYzw4jdcZcqHPxbAvrWwpdzDWy7z6Mm4UedFfyDgZvob
	g3mxaco0YQ0x+LaSMcxEgRaweeRm0X3Ayc8Y2ZAdSvMl+BTuFvb/X7qj8C37mUFERv95xTHcrTU
	tfAh2kzOv1zyxsowWFJxAb1Ue3gTxEXpy/1r93EYXKRNw9w==
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr17264026a91.15.1787962278398;
        Fri, 28 Aug 2026 17:11:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/16] python3-pydbus: skip ptest cases gracefully when dbus-launch is missing
Date: Fri, 28 Aug 2026 17:10:57 -0700
Message-ID: <20260829001108.559544-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129565

From: Khem Raj <raj.khem@gmail.com>

Guard each shell test case with a dbus-launch availability check and
emit SKIP instead of hard-failing when it isn't installed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydbus/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
index 782ceed3bb..51e5a958da 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pydbus/run-ptest
@@ -1,6 +1,10 @@
 #!/bin/sh
 
 for case in `find tests -type f -name '*.sh'`; do
+    if ! command -v dbus-launch >/dev/null 2>&1; then
+        echo "SKIP: ${case} (dbus-launch not installed)"
+        continue
+    fi
     bash $case python3 >$case.output 2>&1
     ret=$?
     if [ $ret -ne 0 ]; then

