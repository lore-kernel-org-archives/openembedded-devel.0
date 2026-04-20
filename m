Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19824F36C3D
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13774.1776666485315477370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OtpNWF1w;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891b0786beso5799095e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666484; x=1777271284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1B6T9c12VXYW2OFAPQp8c7CAgQohMQQkInOekUN3TI=;
        b=OtpNWF1wIa3TKUvyn1BZ2zruDDZCiQlI0v6E3jYmbRTRHDKLOPqlgCxdD0BfPFNqdj
         5DrH/tAVBc6VHoBcbDkzxHdIqJxaxqwLCwznRBtFke0DeaeaKOhxDLr3IdUshRrceTRP
         DR7ZZbDR9A/NGbZfvSC1FK5RCKFEPokyN/UqhsMYKS59YXuzNclH0asyi7yBgOlLh3eM
         otrjpn4A0GmoF6u8HmvWs4Xi6u85GR6NkVt9gADNfphud4n/CcLyn0vdh0IGnfzt0pzD
         0HrkX43JOD41BfKy71Yqoes4vQtrr1M8AhZ1SPFOJgk8ARjzW+5ruGPCuxeweELmxSEi
         lNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666484; x=1777271284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a1B6T9c12VXYW2OFAPQp8c7CAgQohMQQkInOekUN3TI=;
        b=liKntB376XTCJZdiPyEb/8FlWURh1bplHCZm4aj5n6eyFWiFPDXOoACdbOlic8LFz+
         Gk85yRp+os8EG/F+y2Dwzb1juyWHdqD89p6ll4R0D6if6J+REPjn0WFMfI+Vo8Wp70gU
         lzLU59Fu8a8cO1x9Ynl+BzbU4aueIH1uNs53XbREJrf1BBAXEIdmxXaAvVrg+K60tH1U
         UCz6jomRPIL+R78w/HcDOHfWPkb4QV8CP3zPWBJoBxn1CTQ3wDiDOJB0wJvzWEwwEZYx
         QWtekRx8iKsYDI/psSocmYMVJUKPP/mnpu9Ik04qW5wqBqDnGdqnHFILBu7NrbF7Aq6t
         PTow==
X-Gm-Message-State: AOJu0YzvXsATaWMsXu00gWCj6+iiTR5HC+ZEePs7AXhXBSJS5YJOkZGf
	DwwhlJOE23antLS2g3/a96TWB0bjrLJuQsxLMDz04QkiSOAURFbqDRzRSoTiYA==
X-Gm-Gg: AeBDietxYVqxVPvOb7xcw6zV6G3vMZT/2oPPIUp1x0v3CeqOi+zlOYecY+WpRdCTgea
	aoWRvePgvu0xsOzBwTntsGru44047WwvQKn+dTaXSfTorHiimnV8I8mYfIG2icceKO6ovmfoNsG
	5GH4X4etPQWD1piADTU/vj1I87B9JMLA/Xzjfu5yCU9eAFK1pX1QsH56UZjTw/6/wUNIiOqt/Ik
	N/F5GuJEqxAlk2JmDG0fS91ZnpqGXAlRZLJtCcTOhqnDdYQtAT+/NkrwYhrZ8mOXr+ETHp0qzUX
	c8q5+pys6ZKDQnp1RquXrVxcjNjgqD75F14EyR0AFEVh6jxFR7ow9o/+E9TnipjJu+iqzkKOKrF
	BjiZTRVFjaI3iqpqjgDmBydGplvDx4FMAk0Z6d+lvWQTOIziDsNF44MB9pVquWMFuxgE1fgb3bG
	Heuj9g0mlN3SxS7KNXsNB4YPzGyrj4Jno=
X-Received: by 2002:a05:600c:c05a:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-488fb771be4mr133789475e9.21.1776666483486;
        Sun, 19 Apr 2026 23:28:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.28.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 17/17] libraw: mark CVE-2026-20911 and CVE-2026-21413 patched
Date: Mon, 20 Apr 2026 08:27:49 +0200
Message-ID: <20260420062750.3795917-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126481

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-20911
https://nvd.nist.gov/vuln/detail/CVE-2026-21413

Both CVEs are tracked with incorrect version info: NVD indicates that
0.22.1 is explicitly vulnerable, but the fixes are actually included
in this release.

Relevant commits:
CVE-2026-20911: https://github.com/LibRaw/LibRaw/commit/5357bb5fc67ac616838fb84de67260d45987489b
CVE-2026-21413: https://github.com/LibRaw/LibRaw/commit/75ed2c12a35b765b3b6ad695cc1f044f19efe644

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.22.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
index 2e11a7f1f9..e99f0e46b6 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
@@ -13,3 +13,5 @@ CVE_STATUS[CVE-2026-5318] = "fixed-version: fixed since 0.22.1"
 CVE_STATUS[CVE-2026-5342] = "fixed-version: fixed since 0.22.1"
 CVE_STATUS[CVE-2026-20884] = "fixed-version: fixed since 0.22.1"
 CVE_STATUS[CVE-2026-24450] = "fixed-version: fixed since 0.22.1"
+CVE_STATUS[CVE-2026-20911] = "fixed-version: fixed since 0.22.1"
+CVE_STATUS[CVE-2026-21413] = "fixed-version: fixed since 0.22.1"

