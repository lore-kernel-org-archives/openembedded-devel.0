Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3821.1794729026385931042
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XTEKneBy;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37071c0f42aso3570934eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729026; x=1795333826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJ3orIf1VYiNvjmRViRj5m1LSu8tqizlmnPhjGB8aeg=;
        b=XTEKneBygpcxd0udkXIzgCtG+lrxpzyi+auLOwlFMkjXkK1vunNF7j8kNM5ApROsuG
         rO8n7MxW/L4njRZ7bKVi1Pz79NWC8w14iA/sDbsi46r0M2yaHf2N8HkJHPjON9TLoA6s
         5FRetKSeb1jNTpeOjMGc4tyBelQNUYK7f17dSEpEbc8ceFP+CzR9Jj/A/sibRC8przGf
         TKnOljFuTTV/8NPv++DSUZtRSpwoniCsPwAWRVVmqE19cQUHq/ugEguZQzJQJ+cpjRV0
         /HxAfZ6k8B1YHd6l5MOfzJsMIlXp3geJvQPp0aPgyA6LgJ5RJBHNLummfNMpac0fF/US
         0awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729026; x=1795333826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJ3orIf1VYiNvjmRViRj5m1LSu8tqizlmnPhjGB8aeg=;
        b=YuURvC5LS1vzOg/lKFzTuErHqrIuHm5EOudM3pTQkwzmdLnBqr5DKyIobFD4topOLh
         nfgIjLYoo1xxo/rkAAcSNRBRB/CXGcC5MceKEXsPMpv2Jo8k/07kEHtx7kO7TI/qzbcp
         zIFg8evkqa7E/3pxMOjrOwwqY/JdAwn8VTYi9SHMfRY6s56Auu/RkwpuLZjbx26JPMli
         uyIczX1Sqq8j1mbP2+lHXZG4b+X+jcDx67/9LRIZnQHOupIfgpZ5Q34ur/kC3mPhvbqS
         fgxLYYFx/aM0dYC8phinZjQvDLpRF4Gx+B21mcLaEMRs1NkvdAnReWXq/+YV2LdPoAhw
         auow==
X-Gm-Message-State: APuU4Z8rjSb18JQFZn5kZegTl8kVsd4HK2fpkyrF/7PPXgZBHKTHnRN0
	9luZNIdh+G+GHrzWBCP6HcMyCMCPd4FNuBIa8e4Pa0oU/JXHzvU66Jh7yg0IHHz0
X-Gm-Gg: AYBFou1vxSKEEWLS+0vmrJRucbbJlzdfYfx3iw+MwmshaZajoW+pGsaQSTZiij5ZxzX
	Od16Q2Bys36kR8jcLkMePqMiBmTIHJoJbdV1cO9xPoXbWpl9BRyZqLCbosNrJjDR84NUvzS074T
	c3fIoZ/8fomB8Vko6nOotx6kBpzAb7bRgVWPPGr97UWKBeiYm55bMAc7kuUIb1bLPIh5GzGHtPt
	Gog5px1+FUtu+A6jsHLL3rZsxz58O6VR6GqRYPab8dw0VRO6SaDKh+aAhftsohCOu0t56I5+FeS
	5Bt6iTG/HNtf5hmjc4/dZNSp3LZkrIhJpS+8n6ciK/eb8vBR1boTjte7vyOew63qfvFv7LB9jRr
	V9vc3Z2belYzWwk6+PX8ZOofpQNFpYwc7Qf9rUqdewRM1Bh/vAslCcFSpnePGOu7rAi2/28+7TX
	Fm7fdzr6M5A2qJSW1CDEYZqgvkuT5NEya3haOqwvKuQyKrFTriYByGz6o8/EgVCMX6ElMniM8Ly
	g9FZBfh5ypyQaTeHtkdHh18UXuCaXbypHmQlA4hrCZ2XBhozvE3ORxje3vvO6JB3qstj6yRqII0
	yXH/RxmErQqjObIYtBUYtd8hIes68DwDUkWC8xL67HugyDYz2JK4bc7IzBVk+hAIg1dRr48zQr4
	QEbAQKWOASuP8Qxra6tkUKwIiNpDxYmawb6eh/Zj/KJBBOp1AKYMErrSqhR5Jvv1GIze1b0oNSI
	unwIVCzkW9dVIHmJ0aSC28lT3cfpA7cVdKyS80J7M5CVTOYmUkREOeKvhmV3Vw1LT6kuye4LLcL
	xP9xw+jYtjAQ6SsyjGLwmq+NSJLoSO0cW9Zwadms7ZAYJx2cj/jpYcXOmMWynbs5DG5iHA4e78D
	PU6P
X-Received: by 2002:a05:7300:f544:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-3796879f0bemr7639158eec.34.1794729025676;
        Sat, 14 Nov 2026 23:50:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 40/96] opentelemetry-cpp: upgrade 1.28.0 -> 1.30.0
Date: Sat, 14 Nov 2026 23:48:18 -0800
Message-ID: <20261115074918.2932593-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132310
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{opentelemetry-cpp_1.28.0.bb => opentelemetry-cpp_1.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.28.0.bb => opentelemetry-cpp_1.30.0.bb} (96%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.30.0.bb
similarity index 96%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.30.0.bb
index a07da1c2e5..5f62cae2c1 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.28.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.30.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
 SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "6f65c3eded2bb4656c8d675cad43bbe694c531c7"
+SRCREV = "c7b64ec660c1b6c65dff0932b3d1c3483bc6db64"
 
 inherit cmake pkgconfig lib_package
 
