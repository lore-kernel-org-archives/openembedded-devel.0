Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DFDC41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:20:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.19292.1718799625282346320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NcvkNEAB;
 spf=pass (domain: konsulko.com, ip: 209.85.208.182, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so73929901fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718799623; x=1719404423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mO8RhMICDTBSUJjw6htdZRdGrvYJ1ZkCBO0/pPRlF3Y=;
        b=NcvkNEAByRi+vOt8uGhCEtn4D+9tzD6uc1+Fs/vb40UeuECHb1XZL0tUbeYghYWldj
         8KNwQpp38tTpQF/pN4Jc9ujTbrAcQMDxn834t0VhRqALojIx+4eze7QhXnQt1auAk4HJ
         /SrI+VjaVT4U9EBC21+RTqcQZHI7Dqnx5IxdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799623; x=1719404423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO8RhMICDTBSUJjw6htdZRdGrvYJ1ZkCBO0/pPRlF3Y=;
        b=PZPGYJT+3mKBoZe4xbo92Tf/jc7RUBj9sNuxik4TwNUYSREPUBAeFBSD3XcuR5MG5g
         edy3RJuIdmnc/O4TcHD09tHbsSZx3f+92M410crCR9t1O2yCnN+Ul87S12sOl93m7Hbm
         LYBed+RyXzElwf4XirZjB/Pj9a2mvUNdcOn2MiI6p+SG+jdwWvjCjKhqA9LJwY1rdSDk
         G59BVZp8kEQiMXgm8hCbdhVDFR4/eHGRPNgEF7uOSSnSqwdwi8DzEnGI1/pDo9BAZGA2
         hYdzhHfodmFYwYRJq9UayCjCrEovTNhM8aS8H67QZnDHLuX/ZK8WwY98affUP0GboFeb
         3+eQ==
X-Gm-Message-State: AOJu0Yw/2TVv/XBN+i9r6Qe5cu99KLCXnCQEdVV2xeH6cVGyVI5TjLYT
	Wfry8RB8MO5uQpa7GTQUG4E3IaRABzFo3yUihKE9+1sha3VKY/JENduKCuaoiXiRi3ExS9pnSi6
	s
X-Google-Smtp-Source: AGHT+IH0/fufOVNeRp/BKe/BomMGYYVwe1XSw6b7Q9Wg/+YCZF6br4s8ZPVySYJ0uqR1mEP/Nj1hrA==
X-Received: by 2002:a2e:b0c9:0:b0:2eb:68d0:f1cc with SMTP id 38308e7fff4ca-2ec3cfe125emr16976101fa.43.1718799622830;
        Wed, 19 Jun 2024 05:20:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm266329885e9.38.2024.06.19.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:20:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-moteus: Upgrade 0.3.70 -> 0.3.71
Date: Wed, 19 Jun 2024 15:20:17 +0300
Message-Id: <20240619122019.529213-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 12:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110964

Upgrade to release 0.3.71:

- Properly decode AksIM-2 warning and error bits
- Make MA732 trimming for off-axis applications actually work
- When encoders are no longer active, stop using them and
  trigger a fault
- Limit the commanded velocity to something physically achievable
- Fault if a non-reducing gear ratio is configured without overriding
- Default bemf_feedforward to 0.0, and fault if it is configured
  non-zero without acceleration limits or override

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.70.bb => python3-moteus_0.3.71.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.70.bb => python3-moteus_0.3.71.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb
index 7e77d8f7a..54c53afe4 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.70.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "39e6e2689511c601dff62e502ca6c6ab91100f34b2ebbf52fcee241bf8bfed31"
+SRC_URI[sha256sum] = "7caa994ad7ed2b0a219b20e4a2e83b6bad01e549402c38a264f0d83d560d7908"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.39.2


