Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A517AC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:46 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9041.1788343536453253358
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lNWrAS0t;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso808974a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343536; x=1788948336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltmi//KzsLPZOEADK4gVsgHUBswTDwzzlU7/ARXqpbM=;
        b=lNWrAS0tLDjGO4tc2fwc0Bg42P18cbe/EH/faZSNZJ4blLtAAQpVtQs1+BtSc/AfmX
         k+8gyWVNDZbg2f1FIqz2nYM1NOXVGuB2z5ihXdQfdVpGBXbfj+T3ab2Fky/Mu8zKNswh
         nXm/ftp66s2IDABo1CnC01id4GUU26M+UY/HBaooDdrLEipw0iyg0uFfcG9ToiLc1IpK
         s/HZ0tHzX4kv6LBpi6annWkIaTwqggzlnNQH+OYk3sX5dVZ+XL7zPuim5Qhm/Y3YkM+R
         aM3tqG3qqZG5tzThAilnRWGPnl3UL1BONYWoTBeXJkY8SUMlRUIMShgnSnIEkCZsmNjm
         FUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343536; x=1788948336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltmi//KzsLPZOEADK4gVsgHUBswTDwzzlU7/ARXqpbM=;
        b=suAeB+w9fDB638aMGwSMd3erA+xTfBpH144LeB3+J8T66pByL/dpg/cRspRvcTZtIi
         Y1HPpkL5pcVofGF4HPi6m402ph2Qo09x2L9191AN7C59DJ4zMhHijIN3jlf4bv4Y/dEg
         0OFnrHO8aeq6OgVPma3r3Z53QGSX+T6NNkV/uxf+h+QH88MT3uw5bq92HbK3xQ47cOom
         eA3BAju/2jsQiUBveRfkVdnutN0W7QRS4mUh/IzQThR8Fex/BtrkbNRAd/Mvp1TNml05
         FCFuWbuGyMjbWwusprYLJ8z/QroJvgOuGgOl2/gDrNNFrBvCiXU7lnHBBaqb4KBWSHtj
         uonQ==
X-Gm-Message-State: AFuF++ljUNUJyBPCEXRhxZZSbqDpP069HbvyAO3ncL1OCkc+Gxzqyfc9
	a3wxQxYYG1KX6sfEso8O9VnghQqrdd/0eoFtgRHRUjj0fznDiE6jSQv83giUEg==
X-Gm-Gg: AYBFou2myAenRd5YS2Phvy4atkwaf5xmRenLomMqbDynUIEl8+C5biIuM3igtXk7RmX
	WU+Sai555CNbEBn48b4l+Py7dY35XQym5fCAMnvqT4cToKStohd8kgf35dc26bSVsssx2BHI24f
	sef5X0/FAuRRmSu4pDtdaaXBovDlQ+qSfadTbDT70uq7fZuRLF63PWKfAMWBGBVKsy2lQKVoVcp
	nipfjPeDvEfJw+ng8yHcOUKC+3ONP6HL3zt/lJ8hmsNKoGCT5s9tMkZ1Tih00kMDB5pKprosqQ9
	/ruxGtdZs5XT3TiX8Tjg5vn8e2FLKWKGJdJlDs+dcs4dbOhH79N7rD1tBBoouV49gJhf+ySVvC6
	O09PhW/4RirRPhEqYYJ3S8aDBYSkMu9CXJbwWzBcLIWaSeRN9o47cKc+WA7B5xqkGfnzItCeMO5
	DdV2ENk7y2z0gSW2X0kem+B1/i3KZNTj/cbwQ95FjwFKqmsMQpZPJKrxRFj4UwMA5G6qEVimK4
X-Received: by 2002:a17:90b:280a:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39aee085053mr5341466a91.16.1788343535637;
        Wed, 02 Sep 2026 03:05:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/28] bcc: mark CVE-2024-2314 patched
Date: Wed,  2 Sep 2026 22:04:49 +1200
Message-ID: <20260902100511.2105916-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129638

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-2314

Fixes:
WARNING: bcc-0.36.1-r0 do_sbom_cve_check_recipe: bcc-0.36.1: Found unpatched CVEs: CVE-2024-2314

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.36.1.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb
index 0d8bee5da4..69f5916f94 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb
@@ -95,3 +95,5 @@ COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
 # path from the test binary
 WARN_QA:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' buildpaths', '', d)}"
 ERROR_QA:remove = "${@bb.utils.contains('PTEST_ENABLED', '1', 'buildpaths', '', d)}"
+
+CVE_STATUS[CVE-2024-2314] = "fixed-version: fixed in 0.36.1"

