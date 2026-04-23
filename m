Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70451FC0342
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 14:55:37 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21806.1776956127224952830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 07:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ra6ACJdU;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2d891442388so10706276eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776956126; x=1777560926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ0kBIVOFwoNEPSKB0xdTxAASaT8maqr21yLU/yVzx4=;
        b=ra6ACJdUYSTizYgBjUj566Ac9CZTcoJ2+saY/uQdKG398dOAv+T5Kph7Tv1Ck73/Bq
         kGDbDQdHR0Hzij4UkjaHckvHqj23HNVH2pFhOOMwn9351wM1utMIrLJifTk9o22yOaLg
         0JzfnJyzwV3Ps2eakdlI2ClFWyyjqesy6bT4RHe6l8+nb+FgyGYuwRcTo+cZPWSqKdnO
         V09lksEQSORgpl2T+RZTDmLZ2KNxq4/Tkp3F3UJOQ+o+Hjq5oJzxubEWHeZqME0j4VM9
         TR01/L9vyLE3bR3tgJekxRELHFoa9PKsoiYkpYwWRfCbcrvFmsRSIXCFDqpjkEDdOuxO
         wzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776956126; x=1777560926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ0kBIVOFwoNEPSKB0xdTxAASaT8maqr21yLU/yVzx4=;
        b=TjMjbj7oJa08/1LB+iUWRqiO1eOOpmf29xDSFqFdzWuSMW3W+euPiCpesL9HwHEH3s
         wm44bAa+WefRjlTTeN+2LSszu6xiUqQ+97cYGfhcQGmRHwtffCqKrfenBNJE5hDXOJFM
         sDRvhP8g1HX8lCwFaiJ5qKU/qFJC2/6eL0IF2a8O61wmEMQpPpH04D9+huLpCiF2w7Q4
         qn0JKAvuG6/MfeIPOa+1DorxqQmniUzPt2EYKu8nl9I+8UGSWjb/3G8cFgo6K49eYwEE
         7Ek6sTEL0h8EBjftaFXhTIoPce+2hRXpaWomkXUb5CwIf89LhGAHL+qLd0MPKpgWpVYv
         m5DA==
X-Gm-Message-State: AOJu0YwK0/4qcWU/rCQ+xdJSU2IwjavI1H7bE1fC81bAa+jNxot10f1o
	sSTheBs3BjqteKIZ56KDJjMnFFhi6w6FyNjnoGlySyD/8CMf9mMxDq4DqGEeKg==
X-Gm-Gg: AeBDievOcSPUrM+gkb8WzTp4vhQD4ip4hkSZNB76oQEkHJsudImCMyi8QbRNWdARoet
	kk0wuWAU2Ci2/kAyt8uUyGvQ5yIkrI9wEjmdNLoH5ciwistl5ScUu3x1UbQKme8kwcaFsEM3xAf
	u7LZneReOKZ9Kyz+BsmgtUWKbu1aQjzuvrZCNCzUO7fRNkdWG4jPb6ea5YMDKWMrP/zv38yfOO2
	CtJI4PfbCKrDZcHN2Hu1VCkbCnUa8qoLy+giUwAhDYd4M5YMbKxHZwPl0F99uDEd/mQbIlT/E7t
	cM/tjqZ5kVj+ocD9RUhHFvZo/kp+2aJkDNJhCU17FX+iMWnQAESwOix4Rd/EArAkVpnSdPKt4XA
	DTWKfko1bbElqVsAPUOXLgjliUoTbMKZ1DiBT7r35lebpeqt0S95aFTZC4sdm2Gb5hUazA9tPao
	LFkusiz8IimSzRGMODxCg+65SD2XcuEM1h2OmbjhCWya5KbgpvRskr9/a5eGCSMzpkXmEycz8UK
	exTHbwZpYvJF9T4YMI91urvpPCQv4O8u84YqO1HmxHVFauXY5KOuqtMaBkvhuDiRTCE4IgLcza+
	jxLIN8pyNLNsbpiSopGqXEK1gZo3KjtSgSPFD4WA4uzCilVMJLI=
X-Received: by 2002:a05:7300:f14d:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-2eab7a9593emr4120045eec.9.1776956125894;
        Thu, 23 Apr 2026 07:55:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ea8e4b373dsm11003220eec.6.2026.04.23.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:55:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] ebtables: Fix update-alternatives by setting ALTERNATIVE_TARGET
Date: Thu, 23 Apr 2026 07:55:23 -0700
Message-ID: <20260423145523.3165168-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 14:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126596

The commit adding update-alternatives support omitted
ALTERNATIVE_TARGET[ebtables], causing the bbclass to fall back to
constructing the target as ${sbindir}/ebtables.ebtables which does
not exist. The binary is installed as ebtables-legacy, so set
ALTERNATIVE_TARGET accordingly.

fixes QA warnings:

  ebtables: alternative target does not exist, skipping
  ebtables: NOT adding alternative provide /usr/sbin/ebtables
  ebtables: alt_link == alt_target: /usr/sbin/ebtables == /usr/sbin/ebtables

Fixes: 584fec0f74ad ("ebtables: Use update alternatives for "ebtables"")

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 5ae30e440c..5e9f9ce070 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -52,4 +52,5 @@ SYSTEMD_SERVICE:${PN} = "ebtables.service"

 ALTERNATIVE:${PN} = "ebtables"
 ALTERNATIVE_LINK_NAME[ebtables] = "${sbindir}/ebtables"
+ALTERNATIVE_TARGET[ebtables] = "${sbindir}/ebtables-legacy"
 ALTERNATIVE_PRIORITY[ebtables] = "90"

