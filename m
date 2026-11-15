Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10693.1794761999479776912
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 08:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xn3zVqLT;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so4150448c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794761999; x=1795366799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ak7S1vuqZH3NEJ7Qc/OjmdoAw0hkSHh9JZhD0F4CCOo=;
        b=xn3zVqLTpJ0VupPIrkQZakLUUvHbI/yREBMiESqn0e2mYpjGz+kHipn8gf0sFcehbR
         ooBFUkj9FqJPUsK19rjjX66amyfC4ELkwyI+yOTqd8CwAePiYGnqAgja3BWYgnQnpBF6
         Z82d7eeBRNNc/6Jvu3e6yrtsS/aWBast+WT645azkRtosflzhbVGAWT60Xb1LfLNIEAz
         PqjFnMO7vHajikgiWHHNoDHCIS7w5GDbLv1IveH7hLmOGa6r5AzIw23OSnHqF83A3PDV
         PC85N104+nEiOXA5f6PZ3IH2sXfGGi2HX3NkA5A3EjMqcsGz7KEoQYuAj0X++WCgeO3m
         f2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794761999; x=1795366799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak7S1vuqZH3NEJ7Qc/OjmdoAw0hkSHh9JZhD0F4CCOo=;
        b=ano+uHu4tSCu04Mf78sBpm3WfP9mAjfRQ7iN1bO7J4SdbOjPgNvH6ZD0s0snDwRxf4
         S0cTLcQZbgPWvJX8qIQylRZ3ymO3dHAvDXX9WO52soNZU5TsVllLlDJrXvhgnGKb8mVs
         y26tnKnbcq1L+sQ+yYF9ALeeLLrrle7pPqV8hR02eMKmHtwBW1dEI+Ez7054QitWS/jQ
         Vgau/ZF26LWSTh/jbSqeWG2CH2rwwoHlutZU7ieSLB7Raiv/OltN0eNDSRA46YTiP2IX
         85JmtLybO+B7K7yhXAIDrdyDaSA2Rso6Fanb80h4hRJ/QTn9Ggsrlk/2zjKSC3T5pO3c
         PuWg==
X-Gm-Message-State: APuU4Z/l3CY4eXO7wkbrwwy4dkPxjWjA0xeV2Er6OoF9Md1MvaCMZQgN
	zlbE3M66yH7R4DXJ/nbkztVuFe6c+czlurTd4Hks9hcpJLPOVD9c7WFKjASxb0AZ
X-Gm-Gg: AYBFou0H21Lu5VCr15d6vS/F1iMB/9qMIgmb7k+Zc1FcegBAFjGIt6Wq8ODlaUMcf8V
	hy3kqxJI3+h7P0sth0RHh+yOMDEj1gnAZLyBhImlxuHyF5rhcnTecmNU7yY1udUhuC1e8VU2Nla
	qyelPW5VyKS7zTmvGTNuqvd2k7vAtVlEKd04Emoqq5xkZ7/8OThjrI7lqjmgylayTFAf0JEdYs7
	ivjqp5zFjvi666jHxwjkjspXtI0XjIHqS8++K8gs7JXQ9IwPh4+WzU78gtuTIIFTdSLH3D3VBaW
	xpx0Uhpikev6knpHL3Ogd+jAVs8EDfG+3mLi2CBZS4SrvLLAjiEFoBkDmw6e8n0EhUZzA7XGVGT
	RI9PG1C+NX4xWC14Rs32LbsB39sTOtgCBllEL9JK3/quRoUs+Sgo6mjRBqIiISXsOgrQV0+l0gy
	SQX1EMce6X34OO3k/aS/cNNIkdXBa67WG4+bpfUL5k1SWEmsc5OtQi1WZlMFSKByWfxIiE+7UdD
	idjQOgiSyN8jX9VeJUs5E2vI2BnhKwQXsT3PkyWCoZiXD8TNgFPCie8qnW6ZcyJ5RzCdHCF9nr1
	Milb2AuYYiNapO8qeJVIzpWMuRqhATIPU4ovxixaqi9boGj6WXpdfr1AdF/Uhoy8dvLjA0QOu5V
	4bHFrDTcjNq2L3cEvOs1hlmothMZnAd+fT4QrDWt+yccYvqGg5Ux83ApkkOSeVq0D1D4ssxScuz
	9vqF/NawZzOJBLgdhdwFYzPnBQoQeLiI8ivlKfdHaxztqgR27ZKomjCMs8VgRZNSYzZ4MdE7jt/
	8AKT78dtRisyBIME00+bHpno1VP6T7cYs/wWVHXTZVVH4nsVxGORLC0I+OEICBrqLrwaQSj4XP2
	gFy+V8yTq05uAjugf8lALbv+Jg==
X-Received: by 2002:a05:7022:438e:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b503175d03mr13691132c88.35.1794761998511;
        Sun, 15 Nov 2026 08:59:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:59:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 01/15] aom: upgrade 3.15.1 -> 3.15.3
Date: Sun, 15 Nov 2026 08:59:40 -0800
Message-ID: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132367
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/aom/{aom_3.15.1.bb => aom_3.15.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.15.1.bb => aom_3.15.3.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.15.3.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.15.3.bb
index 6e82ab0f24..0c6977ae74 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.15.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause AND LicenseRef-AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "44d0a57786f432d933ff64b653347c66f4d0fa1d"
+SRCREV = "b141d9c45db236335351c8a4b2a14b3ade27c937"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV}"
 inherit cmake pkgconfig

