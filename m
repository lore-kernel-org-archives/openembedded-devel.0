Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDB9CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:40:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web01.6387.1761745254590675398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a520Nxu4;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4270491e9easo5993442f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761745253; x=1762350053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWO6eXP/ZZJjyeAvjRmOJwPae6YNe76sDEJDL/RdZvI=;
        b=a520Nxu4NwEr1sH/0lQ1kA7E9wAf5mX3fUq/iTALByJ0K0HIZ375mixHRuAAMBFtV3
         pI3CP3ipsW8++e4KCHzsktbtraNSni8m9ybASSjtnxzVR74L1+1GTTaTCIPBMzE8Tl9D
         /EHAfpN/BJEvfvN/gIiDq4cFDVPK/N7nZjsVjJqxSoezuWpmuX3W+NSbWNBRWazd2lHF
         +VsOinjcOYxKwC614GppDroYD9kV569r7Hbud1ppceacHziH/lXUFxsMKvHYc/2pF0qn
         P2mAdnNP4+DiQlCKZn5BYlmtBu8kkQkKv/5tkurIS9KU7OJOUoTe7I2XbxE8FAVKea8i
         TnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745253; x=1762350053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWO6eXP/ZZJjyeAvjRmOJwPae6YNe76sDEJDL/RdZvI=;
        b=ekX9qseQqdTnnOnITCfCt3CGiWgTgwN3kKezUDCy0C8Qg/IoZ7xWCiNrAYI8Lnw3LO
         /gRnKXYKEMNEouhD6F8uTrwyl9xmwVdrbkMifYqQP0hwg6ctiMtGoz4pjQoxP+KlHnZU
         fUClYJdkITE3A2dwN6H07QsI+Y7ZfzdU5AIYySlalLpqz4ySV081gk/nQyy8yHBgbLhQ
         Fkw0lq+WUMSSTZWIgvNpswqvyNYElBar0dRLVrtfQLhTYEhqw1KTu/11Zdh30TFqg3f1
         4IRi99mRN90h8WzLiviX97uxGyC7i1uMuKmyT1wOTDyJWrD1FOBzOQHzIftFYDoZIPYI
         c1hw==
X-Gm-Message-State: AOJu0Yx3U/ASCnCRYgf3dR8QUPTJi9ziby8deOb0Q+Nr4hFId/7Ufr5W
	UTlJl0jeW6ZRrb7yVbsYqRK50z1rpW7fQ+YwdC8VaKO0YFyLqrr+Q8/A+1RErBAz
X-Gm-Gg: ASbGncsg9JjsMt1KQonxMPSd/hEy443Qwk5e/7YaMBvuRrNV3ALGg7HbmjVBmHo+axc
	GhP7vAQ0oHqGxOOk0uOb54rc/OrcEpm3hMMD2JWKOZWYBBAYhIbMNU4vI5HwNdDB4U8Zq3XCywh
	kye6+LGV2f44p1tB+VYDyTnRfdhkEZ/wr718peC13nQ+2faIeV+qxMPp1vKQzB3UnG6GAnjSM6T
	7CJLfS4dI80SFlfz9g6X368GYz/9K61LdXStHboFUG7t6k3q2T3wHf3DNnHVUHImbMvM+XXVxFr
	5GzdVGltvcLjc+Usjk56jdk6Zm0CIeS19UegVPWR5Y+5x+HylUnoWj3uEXeRpjFDrIpSbSONJiV
	vWiRyCQwPUgoFFp7wVHdqZ2sLig/BFqDu515UEWE4iCkAIn9DXzDu1z5g9JsoL3Wh7VfhvYg64Q
	==
X-Google-Smtp-Source: AGHT+IFB50WrI/DBcNk8KiBOSwrm40n9XG/41VGuZsDb7YRSqh4EMr4jcMZEXBxm7LBNNVb/h09LNw==
X-Received: by 2002:a05:6000:2313:b0:429:8d21:572a with SMTP id ffacd0b85a97d-429aefbdb9amr2241749f8f.34.1761745252778;
        Wed, 29 Oct 2025 06:40:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25950484f8f.22.2025.10.29.06.40.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:40:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 2/5] libopenmpt: fix ptests
Date: Wed, 29 Oct 2025 14:40:47 +0100
Message-ID: <20251029134050.3455088-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029134050.3455088-1-skandigraun@gmail.com>
References: <20251029134050.3455088-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121153

Install missing test file.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
index 700df2cefb..5250ffa456 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
@@ -59,6 +59,7 @@ do_install_ptest() {
     install -m 0644 ${S}/test/test.mptm ${D}${PTEST_PATH}/test
     install -m 0644 ${S}/test/test.s3m ${D}${PTEST_PATH}/test
     install -m 0644 ${S}/test/test.xm ${D}${PTEST_PATH}/test
+    install -m 0644 ${S}/test/test.mod ${D}${PTEST_PATH}/test
 
     install -d ${D}${PTEST_PATH}/libopenmpt
     install -m 0644 ${S}/libopenmpt/libopenmpt_version.mk ${D}${PTEST_PATH}/libopenmpt

