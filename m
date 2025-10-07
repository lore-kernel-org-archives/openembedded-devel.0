Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B40CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:23:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.14498.1759829026091601996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wz907XhJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4aed12cea3so601330366b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759829024; x=1760433824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsS0D7Udua7Y695mmlaiHdLfS6GTU+bRpJvnDOUfp2w=;
        b=Wz907XhJO3XuJILS/4pkwbjSnGPlf5GSt4q0EdbZc/WNKlnvCMOn/Bkla/aKjsyfvR
         VNUi4dRQb0mdKwZGS7PnKPdHJy2imfU6UHWBPcPx681tA5anfSHzryP+MwKEUS+/BSs9
         YQSg4ZvbkBwwiPa8ds0Iw7wjm/yKbZKYlLJh76NU/n+uj13N+S8dT7Hx1Xa91DFxr8n3
         k/XUM1vfzXqLq2CEC11AYJmg8JO4jVq9YBOWzoQec4WG9GAxpVfA37RMkFy8Y0FvYXLr
         XvKVGZVOiis5+n/r4egAxeBgZVuzOls3zwk4gVJQ+kCFYx/pIrg71zck4jYvJfAulenJ
         21jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829024; x=1760433824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsS0D7Udua7Y695mmlaiHdLfS6GTU+bRpJvnDOUfp2w=;
        b=MNt2ue+wvwcbzKHLDp68mmI2Ap4C9eTHBSN69PEZqLnIdxC+nfGz0EjC/MM4iR9kF8
         USe/gb9hg03yLCR1qp3XP49Fh9AcKuXTEAKZHiSB6BR3Au9k5F+YJI57z/5EkOkCt7a1
         1HjWoWRDSLzotdpW293sma6ppKZmY+3S1cJMtjvgMcCRhXPOWYaV9LH6+Fw9h/LJ5mII
         gWimjfuUW/kZtIc4glcS3mHG8W2MCQrxCCNat6swz0HdvyXTETRAKIBiUYaJ4LFxIcl0
         ty8Amd31C70kdvnBVL0A5uFne7uXRJDPTDmQTacJbhPvmuMa04GNOxiVkO3KXQwaYyiA
         DyYg==
X-Gm-Message-State: AOJu0Yw69f5FVHWv3P7FjM1kCmO8/KNlJzxjFSLsQnp5COkUgHfSE1NX
	e7cI/7+5Qkd6exToKfBpUcyEcmOwGUzZOJzUT7ki3zTWO9o7VcwPbe75ZhiB/Q==
X-Gm-Gg: ASbGncv8Dk58i0BLGJnlRutfm20LyAcICAhIqVAs8Dkx6dBsY+VpfrFcG1JYWaRHxhZ
	497jCtj0/J81bijFjmP/R8IVHZqBLTbcVwR4jP36Rb8rdfFqXQeMoYetjr2tgZJ4y5KbaV4b3b6
	qyKJFSsbJfG1UCOfGOQKx7xIaqgqbHX948UA22mEQuCmE3mxGCI7m4Vj+DPIK82rThlcwBpI0Or
	GM05kOzgSymCnx9RDWIpBkKbsM5E25rA072rVYNsU2Jc80kD1tlBGt0b3Z3jxFw6vbO8uEfMIeJ
	NO1y2g1IcNNsk7Lb/wfTxSjklAB7jhtMUE8a/RaRbmOIu8GIT1pbD3RuPq1MKjrfkfm7QMEzmTX
	VyNp9eVTmPSperdm1137fiYRFTQpAK1lgZkVjryowar1w
X-Google-Smtp-Source: AGHT+IE6H/8vzLB84DlhikjLfNEEHouGCahlU7ZlXPytojbOQqLjAMYjPgAIozAwHuwzG5Q+Hz15GA==
X-Received: by 2002:a17:906:4fd1:b0:b3d:9c3c:9ab6 with SMTP id a640c23a62f3a-b49c20531bbmr1706678866b.29.1759829023890;
        Tue, 07 Oct 2025 02:23:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1354551366b.42.2025.10.07.02.23.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: ignore CVE-2022-3734 and CVE-2022-0543
Date: Tue,  7 Oct 2025 11:23:42 +0200
Message-ID: <20251007092342.4082444-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120328

CVE-2022-3734 only affects Windows.
CVE-2022-0543 affects only packages that were packaged for Debian and
Debian-derivative distros.

Neither of these issues is present in upstream Redis.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
index 175e0a9fc2..cc98781fed 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version"
+CVE_STATUS[CVE-2022-3734] = "not-applicable-config: only affects Windows"
 
 inherit update-rc.d systemd useradd
 

