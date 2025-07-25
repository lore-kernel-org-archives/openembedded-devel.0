Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F52C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 19:18:47 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.27400.1753471122610048256
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 12:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uLsz+Ovm;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so14122475e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753471121; x=1754075921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2S8VqGSPIMqwyNiGodTNNkZ8n1Rz8wbQqmoSrUgjrs=;
        b=uLsz+OvmfjQx2O0qHKFAjhudurIMMsTTGevUiuHDKGNES0EuYUT/HGcAbkIV4hkzvS
         pSbqTpaztPZDi0TBBqPyhH+41YBRNFt5MQHJk4CUELC1JpFRqgq2K5opRcOaXET+4Er1
         opc9zsIpMp4hY4lhmOhbBXD/0RFFW/uwoyspI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753471121; x=1754075921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2S8VqGSPIMqwyNiGodTNNkZ8n1Rz8wbQqmoSrUgjrs=;
        b=N+9QId5/J4IXzGg2yd1qbqVEasevNGpID7NK1QZg3P+qhjItzqJZqqcrhwCqKAUAzx
         eVLoAlhYtPf4zKnNUy7ghdeivfGNRCzb33gjavXJyHh0PwTQe3rCe8t56PfASKynZeAd
         iR48YQqkoUHjCUflIFchtuZNOBuLfgfX/v+Q4UptJkuwg8hEpCbI1JUXomWJp2v3vLH3
         fVeuMAQtlobsc1Jg0ym4TCuhjIcd8BYQfS2n0gHydqsCbRxb+OWBM89Tco6x0Ek+LJlm
         r1M0XRWRPwqS7YwdVANOI20IpUZHTP4lC4cb4ZNPb3Ob1vT5Y3Lb29py3TwWOE/wpJqi
         v5Yg==
X-Gm-Message-State: AOJu0YzAcoJes/B6+JuFbvUW+qk0ccnZj7Fyge/3y2PsghbeF7j0tVsi
	l8c5oUNZclFs/C4ygrAFvGMNEdAbuguSfms8ocIP7S029ptTdIO7UbelP+v7iPz8VmSjfF2VyNB
	RZAbUTH8EqR1C
X-Gm-Gg: ASbGnctgy99esiazB3/nGukmFDPHShlXpLqQYgpA/lyciEWlIzfVYfw/Tvz1rwx4DoI
	H180UBn0qriVZwlD8njux0oSbQRb3zfZe4ysa6rqdHr5Nzka5kqW1VKPUVv4KZgsWbM0TJFm3e9
	ilmwuaYK430cfzIkR40MY8EnU6S8ylU1TvXuc+5U2V11O5BGA/uZ6HYPkDXBViKPWtSO1/kQTwu
	yF8vBqc8O6a/mHXPpxYruzqY8mVrQNe8hDLNvmoXGtUX/PM+xc5xmVqVKJevFwer80hGEoqw5Vc
	ibsTBVkQ9m1IVaY03DHmsxZIkIG02hATyy2GnDDHCohfPKEc+FQJ0s2OubkgQkHdEm++HjrDSq0
	MkQ8XSMxrTIv25LwWy70iUH7Nr1LD8bR7mAvdzVkWVg==
X-Google-Smtp-Source: AGHT+IGCGcdk5/ir5xBWS5nXRW9niMa5aYnWVjsBxXlBZFoSIJYEdaGC9ma5v6O9fmTuVIKStPcfsg==
X-Received: by 2002:a05:600c:46ce:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-45876438d2emr22987585e9.22.1753471120681;
        Fri, 25 Jul 2025 12:18:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.207.175.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054f27dsm62644445e9.11.2025.07.25.12.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 12:18:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] ptest-packagelists-meta-python: remove tftpy
Date: Fri, 25 Jul 2025 21:17:56 +0200
Message-Id: <20250725191756.1692553-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 19:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118732

From: Yoann Congal <yoann.congal@smile.fr>

tftpy does not currently support ptests so remove it from any PTESTS_*
list to avoid AB mirroring warnings[0]:
WARNING: Nothing RPROVIDES 'tftpy-ptest' (but virtual:mcextend:tftpy:[...]/meta-openembedded/meta-python/recipes-core/images/meta-python-image-ptest.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'meta-python-image-ptest-tftpy'

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index c62bfab034..0f56c3e300 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -129,5 +129,4 @@ PTESTS_SLOW_META_PYTHON = "\
 
 PTESTS_PROBLEMS_META_PYTHON = "\
     python3-pyasyncore \
-    tftpy \
 "

