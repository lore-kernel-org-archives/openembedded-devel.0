Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F08FB3D08
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47970.1774867148057902034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A0lau/q0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so2407681a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867147; x=1775471947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H44S+zLHoeEqavw05guAtjSX1Gj18QcLRvpgjnejSTY=;
        b=A0lau/q0nAAlRkvXaknVYODiiTfspFiAOLpQzpLjKMnXMCVF8iiCme5aT0js9wJP3j
         Zzv3aKa+fCscQB2/4B8u5rQAI63Nr8H7RfEMPZ8TTqaIlOd+1MlLKh0ZEjOp0X/EqUB0
         nlc2EvSJVgHs6cqyIVQipxO3Remhgd9XgSPkUSgZJazR+EPjzGjJ5NxBQCpkz9auiXsb
         q/7N5FoyyX26PQDTRqO7MTqC82UiJBKAg2Yhv6X9EThTq5AsXPDpdGt9i50scYU+y9gQ
         C1TzX9NK2kb2UPpJjuycHJdZoKORKaiZmXXlirWfS7BrNKKwFSM9Hby12vruRI5CxLtF
         enLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867147; x=1775471947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H44S+zLHoeEqavw05guAtjSX1Gj18QcLRvpgjnejSTY=;
        b=TXjHSwWyq8hfp/1d8BjJpOcR4hVEgpCScLzoaNdv+BfibvFcsRl39ByKIOqxAt6Cjz
         ru9ZB6MoHp3bafbRV9ntySVuJJOhxn0UdnF3JBCNv0MpTbEiLarjWinKFSqDtYlj/Hlq
         0A+XAgeRyaF+qr0qsNS11eXbznfiOxHVhlmm4THIqBY+4pQPHUEcQP2e+UBStckbZV3p
         GQcGiaYrsJCWgJAJj+9wFjB1P3VevzPEu2wPhrQxOA2SoywGHNsljzkaP5+JaUZ9LF+t
         qGkWOXjyHN6Mmbr0SL4iUujrHQ7APs8mAy+jBLMgkj3e/4Gf002cG/5Rz/ol/ctbzCbB
         pihg==
X-Gm-Message-State: AOJu0YxVpBtTtnDlHjE2Br/YaK90De2iHwnjl5d+S2Bvo6ypRQ2GztTj
	dwHZQuvBj1X8Y1/jtrLWChT6NzxvnLyfSgNhFKvK2JiTm62um3yS6JBPrprSIg==
X-Gm-Gg: ATEYQzzDzwS4jZ8eTp0Z/anQ7DkO+fVV/hCBehU49+EJsmolI4b7fRbvftXF2aATnTG
	v06U0GDUGnNtqInyCW6NoszwC6rbjsF6fXzeeddIMM8MCJOlDHJ90sq3uz1jtLADmrgyPI+hl9E
	R0Gh4DbmQ3qxs9tZWZCmNyNjgCc77XhcF5Rm4hM3Dq5z+NiublorUhk7mrmgwDrcCspxUrFOPgW
	2+YDBanZsHarVcxEBd87EOxbrErVjUD1JAP8260CDbQnwPKMZ9qKVgE2Uqlml+v+YZo/jKjhmS6
	J1c/kmjcWK0EvpNJ1n9gP66g4dW+KMsb8GWeolY2QIDnYt+ks+hQBcOh1WHqZ2kLDibfWomNGbh
	I+AqCqzLjvRJ6x1Rcca1FhNgVnMHOxJzXoHytQ6RL2mjNg+ULfEOyp99GN/q75/oz3xVompimWQ
	bHQqd2Tsvo2DpvLRhFEUNNFTuiuu7UOUHEvbg=
X-Received: by 2002:a17:90b:4ac3:b0:35d:a557:e44 with SMTP id 98e67ed59e1d1-35da5572530mr4070152a91.6.1774867147254;
        Mon, 30 Mar 2026 03:39:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/19] iwd: upgrade 3.11 -> 3.12
Date: Mon, 30 Mar 2026 23:38:29 +1300
Message-ID: <20260330103846.3381644-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125845

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix issue with handling expiration of PMKSA.
- Fix issue with handling uninitialized buffer and PMKID.
- Fix issue with checking for PKCS#8 key parser in unit tests.
- Fix issue with using -std=c23 compiler setting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7c5ec1fa02b125d9285d0e518ed2e62073b30b73)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.11.bb => iwd_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.11.bb => iwd_3.12.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
index c4956fb22c..a53137537e 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            file://iwd \ 
            "
-SRC_URI[sha256sum] = "85730e79de05978e26e44b958fd11e2ebb45424ca181f8db7a8daf25fc2226ea"
+SRC_URI[sha256sum] = "d89a5e45c7180170e19be828f9e944a768c593758094fc57a358d0e7c4cb1a49"
 
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
 

