Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D58C3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 17:11:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.190.1721322660519893773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 10:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLAyd07A;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b7a528331so52328b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721322660; x=1721927460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7oMhweStmUPMAoyMqmoW4CQhDyVpBS8NXaYOtCQyf4=;
        b=mLAyd07ATzs5WDq6sRJdZEHsREy8oDlubVLnoSm+aTjKMolEQKD7hN64UfOy+t6of6
         EeMR7RcqYu7VGiVV33+OTM2xUPAziRDUHmPBCUBgGrbnJwVhMa0aM9RBQFB/PNqEJELv
         2qayUromJFI4Ck4vSr6ZFY3dJXYLtdgP15HJAHs7kREhVq6vXpNiSQgefLe+X9SG1uaM
         tWpE0CYjnVZLD+rD+SCHCO8wJO5TCdLi6Kf8PZBl/Z9lJhouzkqFBTGKzCAFtyegAGL9
         66VAJULSKgji7OePLxRI0gBFWeVYIpHUk3W59mwi/SoOBNH0RqiQkVhLd/F7XGGXMSg6
         2wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721322660; x=1721927460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7oMhweStmUPMAoyMqmoW4CQhDyVpBS8NXaYOtCQyf4=;
        b=huPFIlrRPHkAaWhmTLf1LG3oIyqVds5QqhEgwVqKit8ZuRWcRBrdkHfKAN3wzKoUKa
         uQQw921vew0DGs1nCffuBalhgAv1Y6Ua0v8Qj1UNXU2N/RW8qunK9MKHUolu+CFX8iaK
         riO6j/Rpnt4Bw84OTziTe36n9wWtQ/V1oKMO08tpY5IUOLx5LyKbMVURYTsgHlaJX08d
         /urzb5STPZtmpjEyIduzL6Mn/z/sKN5DCIZJETNziOD8Ist2McWJm5Eb51s0MGHj6zXo
         BPL0+SpguZTJPMOybhgj13nRLo8o3CffW9OLsZ6+L9N+xbiV5V+HS2UUQFWE+ItM99TR
         M9rQ==
X-Gm-Message-State: AOJu0YzivwcW1adiYYBqO5v9i4uV2sYRj4c0kW80VgdZUePJ/LV3/mIR
	w0lSArDF4SfsdBF5PdCTl6DToeJyV34qa/B4AJ5vFLwPAMKbErod40P9iOvz
X-Google-Smtp-Source: AGHT+IG68GPy2jZ24YqaoVseI5Z68FWMxdK0Zse3icU93W7SR5DJU9QMDyVuORXTyIp45n8GMjV/8g==
X-Received: by 2002:a05:6a21:1807:b0:1c2:8d0a:8eb7 with SMTP id adf61e73a8af0-1c3fdc83d94mr5595909637.19.1721322659458;
        Thu, 18 Jul 2024 10:10:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5842])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cfc70a0f7sm63592b3a.71.2024.07.18.10.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:10:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dimitri Bouras <dimitrios.bouras@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-geomet: Switch to setuptools_build_meta build backend
Date: Thu, 18 Jul 2024 10:10:57 -0700
Message-ID: <20240718171057.1447328-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 17:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111404

From: Dimitri Bouras <dimitrios.bouras@gmail.com>

As per [1] this seems to be the right backend to use
Switch to pypi fetcher now that 1.1.0 is released

Also see the discussion here [2]

[1] https://github.com/geomet/geomet/blob/master/pyproject.toml#L5
[2] https://github.com/openembedded/meta-openembedded/pull/843

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Reported-by: Dimitri Bouras <dimitrios.bouras@gmail.com>
---
 .../recipes-devtools/python/python3-geomet_1.1.0.bb       | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
index ceba10b65b..7339484379 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
@@ -6,13 +6,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRCNAME = "geomet"
 
-SRC_URI[sha256sum] = "cb52411978ee01ff104ab48f108d7333b14423ae7a15a65fee25b7d29bda2e1b"
+SRC_URI[sha256sum] = "51e92231a0ef6aaa63ac20c443377ba78a303fd2ecd179dc3567de79f3c11605"
 
-S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=master"
-SRCREV = "6ac73c312b52aca328db2e61d90c5e363b62639f"
-
-inherit setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-click \

