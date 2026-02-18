Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECDCE9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:42:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14752.1771429315208338095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EGlAY2YY;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4401614f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771429313; x=1772034113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkt++EqdosCT0XwP2D8cUyQ7kXG/Qav1lsFYqLaOFiM=;
        b=EGlAY2YYWzG78mzK5/QPHgsnHO/W96TvfNaom6o8Ntl8ZnqKrxgfJ/IqI2y8XFICTk
         hAC3CrfJGN39BBTk5y7KUlUfteZhvNG/3fKhByhmlckXcoMO6L9/tqw2IWbkh1pPWtHh
         i6tZVSeRCcON9HrQmUO5ofQny3im+ZTy9oA9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429313; x=1772034113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jkt++EqdosCT0XwP2D8cUyQ7kXG/Qav1lsFYqLaOFiM=;
        b=XkXwKTPAA4Ih92JoCz41v261b/HabYSEJdSjHME3S9quXbTp/o3zrsXDmjtCW+k7MZ
         0s4Tv9Io2rQIj9MOQPBmmRy9FarCnUd7DcVb2dxFu5zGwyWzwS0rSieg0XvHKFKQbkEN
         1BGDLKL0zR/z/nIiDPbEAMffV1ajYffyFVGWT1YJmfl9hW+/HJYZAYBH9XPPcOMmn0ou
         O6rAVtp0aPy+5hKBQnkL/7QwPm7+flGDJgmADdtta3o9990Zezzsaq7jFdKdrUzk+s8k
         oQP17Ic8ZG74FX3tW7LwnWGufm01zuXhoS6e0/wiQWzen5gk0K1YS90iRxG3XgmMxWoI
         KUEQ==
X-Gm-Message-State: AOJu0YwogU+roVk5fQ2qgm2F3bEWpFVd/PpV+7/2jcTEj6xcPVvdU/ff
	fE35sjcxGzIRQtHM8I5RUQUV1Q/BAUOxFSlOSfb65iA1Y4wOIcADSkAWhVBqLiYiRxAdLX5qih2
	tnBJq
X-Gm-Gg: AZuq6aIgBBiluqxOH+4lSk6u92RFO+0MJBBLaOH4CEp2Hlhg/YTNGQxTdx5vknVtOLX
	m79JUayLWR1PY8BUo8eh31S0Ny1MjAiCl4lxCQKFYUa8ndMu9ZslDS2HNRQCs6Mo7acUG/iTOSk
	4jiuNb1fk6yCwMwyC4G7T2fuvfdFkJ4igj5C+QyGbmt2vat+v1oj+mLXIF8XAuw3sFJHxXkdb2i
	50IC0b70d6dilHXtFfV0rYlcA7KYvfxrpzvfcYjxzuxdlqwSGO0vrpJnqMPggPL93uenZqRh84M
	5aF7Tp3FvganLTtPQBCUYWYfQRvg2WZEv1YVNZSa3eZ3dCcccqYucNUaIpRExqhpAL0AeBOBo5X
	vcb0p6z+kX5g8Wca0s1hnEP2kPdIlcEjX7qUHlGOtb3tC5eiWkmAUhk+/vOAA5XfFoZQ+vlYWCb
	EBiDFfpL3tYgr4R9ASPKPq9ilPahmUOyIf62ty
X-Received: by 2002:a05:6000:601:b0:435:ae97:b37 with SMTP id ffacd0b85a97d-4379dba75fbmr29822578f8f.52.1771429313130;
        Wed, 18 Feb 2026 07:41:53 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm45102522f8f.16.2026.02.18.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:41:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-bumble: Upgrade 0.0.223 -> 0.0.225
Date: Wed, 18 Feb 2026 17:41:46 +0200
Message-ID: <20260218154146.3267220-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218154146.3267220-1-leon.anavi@konsulko.com>
References: <20260218154146.3267220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124490

Upgrade to release 0.0.225:

- Fix wrong LE event codes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bumble_0.0.223.bb => python3-bumble_0.0.225.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.223.bb => python3-bumble_0.0.225.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb
index 3d9a6aa89f..a5f5ffc020 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.223.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "2a5c3f2605fc5ecd6a519c1fb89ada6c825b4d27db32f8be9ab1c0a654703d3c"
+SRC_URI[sha256sum] = "a69455e9b35a80e4b9ac555b749c9371039fd0a7aa88116bb3fea07204199ed8"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


