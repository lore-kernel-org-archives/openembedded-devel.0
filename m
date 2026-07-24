Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1885FC531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 15:38:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22060.1784907479878480909
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 08:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ekWiZ8vF;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7872abb6so410104f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784907478; x=1785512278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zm3tyfyBLLbSXR7tgd1yRrQai9LKNOc7oDw7AwxgssM=;
        b=ekWiZ8vF01Y26K42jYxUTMDWuXOqcYA/Y5bj7O0ifjY9uODXrnxoSO5d3MRg/hmwUO
         I153pUrZFVXqiwQgep0C/Kh+HzNSpmHuJLNECdjcEwHvp+VPHWnFs2bmOkCP0igqhZ9M
         wIZ5EtmJ8LYhyRza04dONQjyLiSaLh/UzNxQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907478; x=1785512278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zm3tyfyBLLbSXR7tgd1yRrQai9LKNOc7oDw7AwxgssM=;
        b=Ke5Xs0F5hR3dp9BnyrKijytaAxoyZbxRd0xLJ5GCnwisX8xq2wXIvWJe3Vm4yUs3cV
         0UDTL1ld0fg5tzc/VrjxEsR3rDtD8Zp0og17jdgQGuU6Vm0JJIXAS7A/Wuift6N24oTr
         6jm4A1PSjtVVaFWImpVrd0+oqLouYeNTIFP6rQut+vmP2lGz580IrAI8q0/ZtqZvwB1A
         3nXq7YGiKXP1wPVgBegp9Feebr/2vUmhQ16dclAiJmMj1wozflAJis9hQ4V/2DJRCOgc
         fGzNryP54HsVEprHvlyYOnzKiTbj8xvBUAunuJlCh6dU8g/GyE2I/9lNuGCLMGqtvpiC
         bE9g==
X-Gm-Message-State: AOJu0YyiCsq1u20LHUpj//2xBln5Jzc4yc9IS2mbdklH5PmdYVCANv7z
	YhJKBP+ck7uIXuSn5Z4jwfUOMMBpXhgK+pwd7X+Ukhg+i+g/LEkFK/gDHul1pbErQqrKzr3C29H
	23eyn
X-Gm-Gg: AR+sD12N90syERIQolY4ocAabAqWYI58Z0NfumwfvGO9NJ+2EPPM9tCoBiWACtzYUdA
	Tm3VHdDInPJVVx8gyn51IxMjMTpBi5NLFg4TQEWYKUkF1z2cXaP6DqU/OyoEzTIFuZ74iAQomSH
	mNtEsdPYA/jugGClqQVtX+38Cd+ajsgGTLDRfc3F0B7frjxHIC8/LnzlFPFpfC8GtGO6U7G/M9J
	qpP/D2QpQs2nWAxFqbjBtuYswHOVhq7+Qfsm7gjNWBO12rRkiZJUX1v7R4KUHLzppnUlk7KYnB9
	83SGzJtdM7BhsHSLYp3p3wNiYufCMJ03LpnQW0X0FsCPlHI1UJoC4YwnHYXgeRfRjonyLzCVv9u
	f5ubqq8nz8MhC3xS2TvhpToA2xJFtPb708BwSX1tLMK6nVKWffBjsarFYUPX+AleSKRxPov3jkE
	lvzjA1POvD9QHQzNQJSt4qmmNScQfV3jXIwtEm78+1UX9iKybf3S6yr+gtp4I+U1SX1qrAyhtVg
	f6AzesItvKOjufnn2vWRLs0dFIjPfg=
X-Received: by 2002:a05:6000:178d:b0:47f:6f04:407c with SMTP id ffacd0b85a97d-47f8dc9b901mr10136555f8f.41.1784907478005;
        Fri, 24 Jul 2026 08:37:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm23839780f8f.29.2026.07.24.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:37:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-virtualenv: Upgrade 21.6.1 -> 21.7.0
Date: Fri, 24 Jul 2026 18:37:53 +0300
Message-ID: <20260724153755.2259698-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 15:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128439

Upgrade to release 21.7.0:

- Replace prettier with mdformat and yamlfmt
- ci: test against Python 3.15 beta

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-virtualenv_21.6.1.bb => python3-virtualenv_21.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.6.1.bb => python3-virtualenv_21.7.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb
index d6db6a8692..56963b22ef 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "15f978b7cd329f24855ff4a0c4b4899cc7678589f49adbdcbbb4d3232e641128"
+SRC_URI[sha256sum] = "7f9519b9432ff11b6e1a3e94061664efc2ff99ea21780e3cf4f6bd0a5da8b37c"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3


