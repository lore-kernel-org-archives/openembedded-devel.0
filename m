Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51F2CA5FA1
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:22 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34493.1790506219111731029
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qHWjAIjd;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so1564592b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506218; x=1791111018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=741oNl/tu2/Lk8wqns1wOTkPqrW2Bosgw1Tm/+VQPkY=;
        b=qHWjAIjdRBnE0HAzEH9jQO959fL/Z0uzejNiPD1iDyiqxkTZ8F4xSiL9jbEqUWRNnK
         5nzl+OJxlfmtFChaXE0NRSC1yuZaNCIKL/J1b9d5V1UU4QaOz2WLxfmHzbOszwtpb3rQ
         Ln+EpdCMmGerVIcHWq7vOOrHYUiW07X7SDQRL2nlnJwZb3k8cAh4h2fz5OgQdOa5gIOJ
         1Tpjw2vCPNDRqcPxlpBbIy0aIsAVCf1eVcug+h3qsrw/RB0NfDvn+Dm/8AFv/CIjIrBl
         auJ02gHhaoNTF46upi0cJk7EIgjJ0rhlekjZPmPgZls7mzmeucsIncHwDr7ntL/ZloIq
         PQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506218; x=1791111018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=741oNl/tu2/Lk8wqns1wOTkPqrW2Bosgw1Tm/+VQPkY=;
        b=MeEDzaKbgpkyrc8Pv3AAlrbPAaqyXEGtQbjUsKUDgl6KmfJReKsLbyjzDc8Glw5gp5
         ZdSiqnJnbKxC1sHYImQO6OFN4lvvV8RsPUqQDXnD6g26ibZf429o8sIqDsAiZPcYWxO2
         iT1bmb149lbnxaHF4WhCp/Onr0zKHYQZHKNWkhZNg+jo5VzfyPNkVFDwKJX17zVa3k88
         zTGURdqfgBajaw+yroT3LlKwC/wFwPBwYHL1wp3xqV3I4vFl5eWYbKEjElt/KlRqsnkd
         x9391dxmv/XWuEstmcJAITOFk8BDO85IPNBWqqsj3E8J5TFFeE4ULhYGrGKuWULA0Sqg
         Ga3A==
X-Gm-Message-State: AFuF++lSifqJl0ZpS/xk9y0UYwoJuB5r46Pxe7loMAIB5FXk8+yt7GyQ
	ceLCSK46KUBPgqfM3jeEhx6J2zRL4Z7uYr/W89WyMYUuB3V9jPIOGeTQbzLIoA==
X-Gm-Gg: AYBFou21nmk6FxT9meiYGhK5dILOquM72+cPb3LXAcmTyQU974QgA+1Vmu4SsdHjvXA
	22Avj46A4XvHk4iKXH8TpFilse01DZZApCEoqNcZw8bNNLPtYm8F+C/cNj+r6CsuG/VuRyB/PZB
	ArgeJI/lY0B2AjeNMEwca5qFfGVOeXbafJXqyg1lUZV4ZUEKz6x3t+hOF7T09mhiixwmSsQyWOn
	ffxeaci0GsHWXBA1cl2wLcmYPFU0289E2E0OK4CKbw8S8kx47p+gGw1ZeX1ESXzBEYWFVdCy0Zq
	5IzXtiYWz38qcWd+12wwZczNL4/5LEs0XK4bXNLQjEVjmrKwaOamy1OZX8Yz1jX8IRk/fcq1Cw6
	OiXv3o3cMecYmdH+2i1qXIYBCYtOcKDzhrMpaHq0MipS2y0rdQTO6cmbrlkOsE67d1mNBDyPvIo
	HzBBIVQJx1DEX09jLc6z0NTtnXt/PiUOM882cw6MkQ6AUEfhzeBvWVC34Gl3EsN0z01NN1RUA7m
	Gah0e+4gOgvXpEeguFUiTI=
X-Received: by 2002:a05:6a00:90a6:b0:87c:d00a:f351 with SMTP id d2e1a72fcca58-87e9c0699b4mr7927841b3a.47.1790506218492;
        Sun, 27 Sep 2026 03:50:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/35] libsrtp: upgrade 2.8.0 -> 2.8.1
Date: Sun, 27 Sep 2026 23:49:31 +1300
Message-ID: <20260927105002.1832451-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130338

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/cisco/libsrtp/releases/tag/v2.8.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsrtp/{libsrtp_2.8.0.bb => libsrtp_2.8.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.8.0.bb => libsrtp_2.8.1.bb} (84%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb
similarity index 84%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb
index c8db49c8b6..c364e095b8 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.8.1.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_x_dev;protocol=https;tag=v${PV}"
-SRCREV = "24b3bf8f19b6f5ab4cd2bcceb4f4064efca86fd5"
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_8_x_throttle;protocol=https;tag=v${PV}"
+SRCREV = "6ff02afa8d2dc3f2e8896af391d137c1c66ff6fa"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

