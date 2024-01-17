Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4024DC47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:24 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.1288.1705454003035099102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pd3kx0Z0;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5f15a1052b3so96172297b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454002; x=1706058802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0DzBdMeEKLy3B+RcSPnfSJypwYo+T1CaVyREhtkZBo=;
        b=Pd3kx0Z0Y54Ic5eLAMoE8IU8ctdV5bY6q7isXuPrbvr0NSeBqQ7RHIKkZRBFkP8kxd
         KFbpDpUqMpdqCiyACHYJG/2qVoxgyOUA6hYyokSuwJiW8GeH8XrHyA3DpYKaf5DatfI/
         Rvhb0li4W/e2bML3pJBxBy+ni3vLXVAdZqhdTywe5s2XJDlk5n17G8j2AeT1Tj84T0QL
         FV+02utNMmrAAPnsujQ6LGps/cQIk1mbkqvmb29tGoSMuHa8ymE175FjZhWHCD2DtiW9
         Pf03NpK89AXEvixPjl6x3UovAVAJ1n2TV9VABiXOrs0q61OSber4C7E2o9L68DFyUfCt
         2+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454002; x=1706058802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0DzBdMeEKLy3B+RcSPnfSJypwYo+T1CaVyREhtkZBo=;
        b=mmuMd9JMjJ/o/ZQJsYjvwiiHjfPO4gH9fp50RN2Ng5B2kaI8CPx8KPeXMtfLlsjizT
         NCBSIk1RvmyXxfGpiBibjZ+X7A/MG5jmWMTrwMGkfllFaRXhcZEtnac71w72aSmmeGIW
         LY5y0C1jH654M49DDr7sBDwFWBuIW4ajBkjo6a7IGCeTrma2cZs9UuLbcf3pxOK4k4ew
         5Rp+SDUkwViPYysSwP7Ta4x7OEYX67oNbL+QshYRTNfFGc1ywcw3HU8i75OFbilxdyT9
         X9NoQnfZJ5daBExmd+ml1uDhEdIZqrpwqGT7uB12P6nVe3yCFyByuyWqDQwCf3dcphGo
         3ZdQ==
X-Gm-Message-State: AOJu0YyMGcqW3jE9qyPVCt0YLignmkmutVirHhILGrCiDOz3thyW+8Pq
	srxowcLkSvpdCd9+fIShRUnvgrV9C9c6kA==
X-Google-Smtp-Source: AGHT+IFaHF0mqSSwZrhokD/hBv24IT8Kl3BoWm4MpNNl6pbcXP8F1K0IsN0CGziagVwE7QSTggEixw==
X-Received: by 2002:a05:690c:d94:b0:5f8:b42d:4707 with SMTP id da20-20020a05690c0d9400b005f8b42d4707mr7266027ywb.101.1705454001873;
        Tue, 16 Jan 2024 17:13:21 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 01/11] strongswan: upgrade 5.9.12 -> 5.9.13
Date: Tue, 16 Jan 2024 20:13:10 -0500
Message-Id: <20240117011320.1856392-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108311

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixes a regression with handling OCSP error responses and adds a new
  option to specify the length of nonces in OCSP requests.  Also adds some
  other improvements for OCSP handling and fuzzers for OCSP
  requests/responses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5be2e20157f3025f9e2370933267a56fd526c58e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
index 87d12bc6c8..4523187af2 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
+SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


