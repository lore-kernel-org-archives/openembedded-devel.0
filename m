Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7160EE57F7
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81801.1767167684687887527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CDwEXtfA;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632b0621so65886855e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167683; x=1767772483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFvnhoiDq02ErW2BojiPcDu59WqRTKQtxFWcMtO8lfI=;
        b=CDwEXtfAqAjSGvcXWlU30mUYvnnx+VLVw6DG+utHYUkkxQueXfBGS4bScYejaurVME
         Crne4cw30wnhq5T8GLCJOGBDKJdgkPI28ESIj/+g8NBG+Fkgha7kLcjvPSHgiHb96LR2
         SFvD0BNw75D6F0k/XARcv1+HIgRJNg8mFcFrldu0z4ZvLycfHUcasOigXaCkX6k2zBRF
         Jn1Vhbc8T+Ar2496NUv4f9ndgIOzuhsvA3vv4pspgCe08qQaqWebTjK0Gl0BnFXvP40y
         XJIdF/RENSo7onQzlUY8rrYVatAeGGixVkiSLmESRd7C1pMcG9iu/xJ9sBkhB3GOicyK
         1QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167683; x=1767772483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFvnhoiDq02ErW2BojiPcDu59WqRTKQtxFWcMtO8lfI=;
        b=KzYgtTXxPrEW6QNozR4H3vkBwTJESCak8h0+UwsEwqk/aiDf9H3Rprh4cn9KNOOROI
         ERE4DbgnbfZBJGx/CW/Lp5Y5rl4tVmnVzpRBhNpp76Ehi1dXRpAYp0NDrISP7diJC3Mg
         tgkOnhb0WTEbmDAE4vBWrraEmuCpNVrE5aiCS3sr1cZZOgVUXRZm2SPF1vEWQn6auuCv
         S/Vm3l+/3cG2AO4STy3ezHJHUI4eQVqP6j507wuoxMSx2XmNt1OehpqMpvAVK1pK4ULr
         ndib92GWyMu+wWqmiMjf+93kpwlM/QZ83AxN+0NexxU08oH+feHgxKTcuCX8AqkdM18c
         2TNg==
X-Gm-Message-State: AOJu0Yy+qPLqb9idITrgDnVbBtLTINxBx1IWQVtfJ3TkUFXkXMbdR9in
	PRp9Ft4kmm86gVNwgQW+/UvdcacmPBnzjqyBpEb/7rSyK+R0F1kV/MDGEu5s3w==
X-Gm-Gg: AY/fxX63gSF/zeuCOlxMAiTBl30Ec7PuDnhfhd8Le9sV5dItEguvO1BGyWguHZRD4pn
	hCi0/AQooOj4mYJ3w9N0Z/qYGaYLPsbXbzzf161xEsw1Rhod09WbU4UDw3q4jrCRLEmY+JzWs5m
	DMD3O62a36Oa8olB89dAb993yGC1RDEN+Wf4IcfWhxaIq5D0TRMiPH85BRMlOdcX6qRkBScOu4M
	dxRclKjV6J+yj5d1TOYzpUtTlYr/1ZyAE8FZudyXVG2ejDVZg49cfqRqN+ljVDaAES0aQTNjb/1
	Ec/BjpbYmiEgLfb7N59GyJpF3rNO2dCfqDGWD7BSDNYtvoR84Z5FmuN1/YLFiLvkLQjc/3u1avQ
	+5cAyFw8yDE7N2WkAiE2vPwgCM5blROSFxXUefnHnoxD+hVfWYmQ62KhbS56a04p6dKjVC+cncB
	33Hx71N1eP
X-Google-Smtp-Source: AGHT+IHH8AfV7GxC4wPQp6ai6AQ43iy+9a1lRgaJz6FgCsJXVcaIQYWZmaCGbamrt5EuNTgl0VDCUQ==
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d195780eemr472522775e9.11.1767167683006;
        Tue, 30 Dec 2025 23:54:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/34] python3-eventlet: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:10 +0100
Message-ID: <20251231075436.771395-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123048

The relevant CVEs are tracked using eventlet:eventlet CPE, and the default
python:eventlet CPE doesn't match relevant CVEs.

Set the correct CVE_PRODUCT.

See CVE db query:
sqlite> select * from products where product like 'eventlet';
CVE-2021-21419|eventlet|eventlet|0.10|>=|0.31.0|<
CVE-2023-29483|eventlet|eventlet|||0.35.2|<
CVE-2025-58068|eventlet|eventlet|||0.40.3|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
index 21b1e095eb..213460dc70 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
 SRC_URI[sha256sum] = "69bef712b1be18b4930df6f0c495d2a882bf7b63aa111e7b6eeff461cfcaf26f"
 
+CVE_PRODUCT = "eventlet"
+
 inherit pypi python_hatchling
 
 DEPENDS += "python3-hatch-vcs-native"

