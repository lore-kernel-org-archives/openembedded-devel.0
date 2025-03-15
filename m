Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D09C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 23:52:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.20717.1742082725417278510
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 16:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S4c5gbmV;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so5221835e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742082723; x=1742687523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3gLB9B4dhsBSa9RMHlQvKO3CDUqu5p8z8wWMlyZAtU=;
        b=S4c5gbmVM8BnMlEJ7WxhVzOSRUXarSADo0P4NEMwF3mTDGGm6FFTOzZ10zhby/Dguy
         LiHu0b9UA6kCY+E2EsyBrXt0jRirBVl+O6msk9rTjjo7xLldQW3PdlVNTJkDNFovxJnb
         /CrlDH9XJgyHid17liN+i13ZtAgBrYs1C+CWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742082723; x=1742687523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3gLB9B4dhsBSa9RMHlQvKO3CDUqu5p8z8wWMlyZAtU=;
        b=d6MKuiMrU0/pOId4VwaE3lxT+IMPF3SGm7/pFQctV4zASlnIGAzc632MTSGoFoVFFA
         uNqyta6Mfd4a2Q89+JAXms5WtMzNRYI0C8d6phsfDZ0rWhGkSSGcTtivllSjXoPOT2Zp
         IaZIFXP0hKGhIgiW8csOwTn3V+FK7ujy79k1f8HR8b8I4G8vKsL4iyOSUtsl+osPMjuL
         gWxce59rtjvhlvy3nOKOBTC8e/CBj6oPKQtUQuOdiCIyrkXm6GZ5WKc04jdtpoOKJ4jK
         dYwJ9MnL1nB7YNWn1KiuT6wr8BID/9XUuzkKT1HfKA1/cmmYZGQ1vQ28LT6GvPjKogEl
         XPPQ==
X-Gm-Message-State: AOJu0YwS1rk/TIHCSr1ujr77MMO/BQQL2pZEshXmEWMPOpx6gCMyXYhU
	zdQCrxLGBOX81FY2mUkA2Ep3zoOI4+AjkjLZZZ9j6iM3utWF4/KVIBvD+VYxnmRFYohU/Wa8LBX
	1
X-Gm-Gg: ASbGncsVoL0+u4B2P1DMB6KWSeT3QpAaGXN0ndtbmlo9i0TPGqUd2xe6Ylz0D3mkLU3
	2sot6SjR0U5JewTJ56n9SZ0xZKowaGUjhPIKZwbmK5tPsCXCilcn0eMDBnRQrowzarZExZvXnhF
	C4To0SmPY53Ty20wc8wDynjZ1/WurPduy3dMx/zphRfGmCFnJriw27c1KCbb809OIqOQqVOH9gm
	sOY+7+hc9givhgM00IzRdIYjDiGzyfDyeBwGnVVGTqQOU3aALCrX3vzsQgdvS6u7sN3lnySHGXG
	k/RbuIkN1kw+lAc6YVfAXeeXNXAQ+dHFfWwev9c5BmqMzN/jIqP/j6ipiEDWgh9rSe/PDRAgw3o
	js+Ii+/P9YLkVZsdab7DlfXHPxQd6XrTZymgGXpaedK7XDNf5nFI=
X-Google-Smtp-Source: AGHT+IEqI74edC1s/qL8M2pbZ05YsuAQKhciB/qO00qyc14Fd5Rs1ZNoB8eKOMBuSYhVQMFPqszyIQ==
X-Received: by 2002:a05:600c:1548:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43d2a2ececcmr15971295e9.5.1742082723102;
        Sat, 15 Mar 2025 16:52:03 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe152ffsm62464485e9.13.2025.03.15.16.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 16:52:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH v2] reproducibility: Mark phytool{,-dbg} as known non-reproducible
Date: Sun, 16 Mar 2025 00:51:39 +0100
Message-Id: <20250315235139.2875703-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 23:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116000

From: Yoann Congal <yoann.congal@smile.fr>

From AB run:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/steps/28/logs/stdio

Diffoscope output is at:
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-reproducible-20250315-xxydi74w/packages/diff-html/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: fixed typo in commit title
---
 meta-networking/conf/include/non-repro-meta-networking.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 139ff40b99..16240df059 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -28,6 +28,8 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     ntpsec-src \
     openl2tp \
     opensaf \
+    phytool \
+    phytool-dbg \
     postfix-cfg \
     rp-pppoe \
     traceroute \

