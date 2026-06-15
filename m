Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840CACD98E1
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132069.1781536402646026858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ce+br0Zs;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso45204705e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781536401; x=1782141201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAfQFYHHdG0Tgp1otw0YgDiTtbJ7QoUefl7YYHf2r8E=;
        b=Ce+br0ZsbErwJx/fa1KO1Gll9ZH65zmH+H6+mVB/n+5O5zdOk5maEClVP19AaL05+9
         5EzOMRv5Tjqha2umnu8jJ8LV6UYJBAhlwlCI4lYTsNv8is45SDOpPZOAiVycQJF4HuUD
         g89ggJyE449g6+XXwuG1vtUXD95hjaGypdH5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536401; x=1782141201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAfQFYHHdG0Tgp1otw0YgDiTtbJ7QoUefl7YYHf2r8E=;
        b=GTGA4nHF5UfbG5RFsCwIjAWRFkKz5dOJVytCxDjv0HVB9F5xpOmnbVpOQ+dR2CDgbF
         flMIfgd6zGG1SwFkirxAwEfVlfF0Z7tL0BXZyMOtGNdFzoU3UM5QxdwYTLO6vEy2t43H
         OoNPlBFnA75rB2AUJgZrD2AB++DbkG49/gGkGLXBTnoSIrTjdX3IWuvyi4apSihgdsFh
         tsLR8WBYKTKxCVeA0IgGf8x9dACPcOm+uqW/+3mFpo8lBqbau4vm44t7a7GPswOKTKwJ
         n/eM1rhU58s5dVls8HUMwg+N3IibTPGKD6qhxFl7/+bw9fzph5kFlO6pDN567spkzcOI
         yGlA==
X-Gm-Message-State: AOJu0Yx15okeOzqHzkZZi1EA8abNs4sgsnVKS0HLD+8jSQxB8LtFYGQE
	re5u83j18VirNOEkGEhlsMctzszLw6SsGH6EFSSAwmy/Hrvf5I4GU3S1NBSfFxDMGzlLgKksLcp
	SDPtm
X-Gm-Gg: Acq92OFJe+heujxj+mBKe3N0qbVOX5YIyRhuAKVzhJtrhBtUJPmUaNoOBTi0hJvAZKM
	lCUG8nwtujaWztcM3zh5DyPDkntWgpL+jbJhDPZyZev7/f6Vyv6nzjpDqEMkk7+0EmSqIg8fc0m
	Mi2kF3FOuwwA/tpMbWVdNMOQAuQa0DjGB0KtaaxkMJwBf++DCu59qqYYKUkQp1K8pFZDHguOiG0
	ihtX1dxgezGUBfwE1U6WlKiHEtGqqybHmvL0VHUF8Wm2x23qNq159R9D3DIOXHUJl26BW6E7WWg
	4Cl6S3NiCB8FHueQlRVuTioz/d/GPOlrabUr+NjZma5n7PtFv0/YcGInaV4rsW/LOVik1pzQDYy
	h3ev36G13SCAb5bJW4AQvMpSQnedRVTbdnEsLWhPjb6Ij5WboC3B0Fc8lk4AUVHC2YoM3FZ4VKU
	vhriHjwj7we3a+X+pSoE98irirIxEqihlFtv/U
X-Received: by 2002:a05:600c:68c:b0:491:731c:892a with SMTP id 5b1f17b1804b1-4922013d409mr89736055e9.35.1781536400244;
        Mon, 15 Jun 2026 08:13:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm219066395e9.0.2026.06.15.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-langtable: Upgrade 0.0.70 -> 0.0.71
Date: Mon, 15 Jun 2026 18:13:12 +0300
Message-ID: <20260615151316.3273340-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127586

Upgrade to release 0.0.71:

- langtable.py: Fix deprecation warning:
  langtable.py:2652: UserWarning: pkg_resources is deprecated as an API
- Add xdq, sus, mrh, hrx, brh, ary, en_SE.UTF-8
- Get new translations and translation changes from CLDR
- setup.py: use open() instead of deprecated codecs.open(), declare
  minimum Python version >= 3.8
- Add Yangon timezone id part
- languages.xml: Rename Asia/Rangoon to Asia/Yangon
- territories.xml: Rename Asia/Rangoon to Asia/Yangon

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-langtable_0.0.70.bb => python3-langtable_0.0.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.70.bb => python3-langtable_0.0.71.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.71.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.71.bb
index 7df58f4e0f..0335366445 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.71.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "725b94121856a3b76d2345e8596954b82ed1eda78513e55ac55fbe4a4823e66e"
+SRC_URI[sha256sum] = "f9d39c06d5182ea14eb4576bf1da8875af1d44efb166e55d6865b3b59b8ac617"
 
 inherit pypi setuptools3 python3native
 
-- 
2.47.3


