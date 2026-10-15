Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7841FCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:39:09 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32484.1792039143203019951
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RoOdDhNt;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5249931eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039142; x=1792643942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hQ4MXGRkkOJY7AQnTaEEH7HwO93KrpKqla+26QpNpbc=;
        b=RoOdDhNtLUal4pLNIOi3GwQEtxTfQUBYs7/7v7jNqRGzRkjm9A4pik5Z+Ar6PCmeki
         3GADip+zupophp/S8PlXm8qCwhKnBZbAWeiXk2NERJ5X8k2ILShYvXGg7cM3slja6yDW
         nWH9Y6SOQwiOpz+4EWzo0MkUsQTQy1otmYHoDrfgIz2OMUj+HvLpt/QYHuMiX9aPoYlx
         xvAH3r32IWODgdWa5JulqKkOlpoOqJmtWHDzh5Sx5HDVVq8dhpOcKcKSYtbfl7aAWp8d
         rxdttNV15pZBR/BYnSkeEoELCYfbsk0kRgOhulZatmu7n3vmoR8GU+Ae9yyw+7tKdwK5
         itaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039142; x=1792643942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ4MXGRkkOJY7AQnTaEEH7HwO93KrpKqla+26QpNpbc=;
        b=XX/3Qfh2vyCydGmWIPmuYNG54pp3dOQiHqRFbAaf9/6vUWKGvreztocEUYE+jfgYwk
         wHQyt8WFd2dwnx47SO8iwKwWhi3AZqEsOClAgCjNP+nF1ZX8XYtMGbkPZwI63FjLcLvI
         OPyWKh726qAK4RtZhFT7pMPXr8ohW6F3XrYd91NbFTh6gg/612Ze530jtuSPjefXlrkl
         HzAYSwTzXdi/vd8L+anZ9XullupPVgilnhVvRwXGSJwHPBF5zaheIv4xHOAHP6Vp7ZiO
         w5w00RZer2c5yTp4askL+zHgQJK6wWJZeO/3llSMzi8lpzlTPBTm5jpUiXtrsGnNiXuJ
         vynA==
X-Gm-Message-State: AFq9FYLSGrPVQBCE9gHHrGYTtk4K90Po7JAyL4dLnsZYoAae5MOxdrto
	XB4i45KzpBh1wJvIbRmWpk8LhvWxYxIwWNFHAAFlFEL/wklxSXxZXI2RqDedUVyLQLU=
X-Gm-Gg: AYBFou1K1I/T65X2Apopw0S+upCZOa/T4Hnqw1LKIFZWRjgGMuEzo74y3yU/Opyw5P0
	TWGRq5uNC/zDIvJpHq+N5bglRHUhQS2ylcx9KSIbdUflynFJTyQOVfsi66QVB+y+OqTl6orYAjd
	RHUTx8/cb1jy3cumj2eEZagw/CbRSgeE8vfBHaUIHRCKTUnRvBqEmpWIt6ZeMkC0EiIIMKTTKvK
	z+UhFTHdBq5oltDuWJ6KZEwauFbLf7vZcGuzKWt9E+7ZU+VarwneJQMpuFSXMwdErCRV7OkdNkO
	fh7R4Ukvy/BWUyTW5Rc10CRh7cJN1yIB/KVr7JzWFzPxRTc1EG9YveTH/iKFl7F3qaqVOf5lnLC
	ivFpT0O11F1e+eI61931V8vtDWRfy+U9krRUn5MHln7NTqJSbjHZD8CnugAkFinUM5NotQLur1Y
	GvQt0NLlGLgNIzJxUw/nywFGaa2qIR/RQ/0+2t42ZAjHwgdiM2LVaJ9tTtIdFNdLy9l0M+UTp3e
	BtJBH2gVGUGUDAGh0W3N46w9QSNu6QwbpKomPlSTaMAsSnZV3NJW1YhIeeQwyEpHWnIKiZPgNnA
	GfNSSIZmTQc7FnYLy4f2vo1GOscJTHiQVBVw5pmnFMeu/h6psFak+nfjk8bYVEyAAwk0chMikVI
	l1AjsByP+UlwkUN5VYrpmNHTYp0JbtqEqD7A+9iqLT8VPtPf75TvAN5jflkL/kKofMS0UMWShTp
	HnOQ19onZHOAYzZZ3OKP4tuourvK20fZOoTtA5C/BqDh3i4w==
X-Received: by 2002:a05:7300:22de:b0:351:595f:a941 with SMTP id 5a478bee46e88-3537df5139dmr26358112eec.8.1792039142263;
        Wed, 14 Oct 2026 21:39:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm49199424eec.15.2026.10.14.21.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:39:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 1/5] openl2tp: fix rpcbind status check in run-ptest
Date: Wed, 14 Oct 2026 21:38:55 -0700
Message-ID: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130908

The final rpcbind check chained 'which systemctl && systemctl status ||
service rpcbind status', so on sysvinit images without systemctl it fell
back to 'service', which may not exist, and the tests were skipped even
though rpcbind was running. Check the status with the same init system
that was used to start it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
index a40b6c4228..61158d4519 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
@@ -43,11 +43,11 @@ zcat /proc/config.gz | grep CONFIG_PPPOL2TP=m > /dev/null || exit_cus "Failed to
 SYSV_INIT="/etc/init.d/rpcbind"
 if [ -e ${SYSV_INIT} ]; then
 	${SYSV_INIT} status > /dev/null || ${SYSV_INIT} start > /dev/null
+	${SYSV_INIT} status > /dev/null
 else
 	systemctl status rpcbind > /dev/null || systemctl start rpcbind > /dev/null
+	systemctl status rpcbind > /dev/null
 fi
-
-which systemctl > /dev/null && systemctl status rpcbind > /dev/null || service rpcbind status > /dev/null
 [ $? -ne 0 ] && exit_cus "Failed to start rpcbind service, skip the tests." 1

 # backup the below files

