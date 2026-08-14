Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A38C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24371.1786747582695728442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fVaNDL2T;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1727482a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747582; x=1787352382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tCG2gQyDdXqhtKZ5x0zMZfPk/xf+uKSfLI6CaqerXg=;
        b=fVaNDL2Tn/aPax5UCI/TLdQrzVl1Q+BpC/UvgAldn9B8BKg6A5zgGigL6YNRtw1D6V
         +lVaOw+lvXfWAYKJXjiuRDHbPpJJL8Dztkk6ZLcJn+PmC2kFaGeGwEf+nwomq/TwG+oV
         SALA9Q/l6hbjb3OaxUVrjY1eVmPE/91koRmEKpaVh+tzI0vF5IgUtZjYhRRmUsyaDTuc
         9mcUnkrgtb4Hb6U0yoXBr3xjuWXu7BCNd/6LC4Om5BrMZHI4hw68Ak1dCKvl5h3LXpKs
         j/kkCNADe2UMJBWfYIr4pZXnBdEZRHzmRP2oMvYc3Npv1knf9mS2xtFd7Kvv7h8IxBM6
         0vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747582; x=1787352382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tCG2gQyDdXqhtKZ5x0zMZfPk/xf+uKSfLI6CaqerXg=;
        b=jxU/vu7nMxteAddFr92sDODWSdmn1NJ1yBVv1wLyCtwNiyVYbJEsHdUY3nED7UoIAX
         ebkKwg45Gq21Q03o5tEZuJ5FvZ6+OENqV4SsEY6Q6AwM/lhkdwO1Tf6AC6MVrg5Q++6X
         xUNRPGAJubBRKlQiZMXU9nj5D3z3/IARsz+6HExTb34dAL3INSLp9dHGY9GZXCVqrunR
         B9h6c7jIWv+oqhiMH0YABVIpFHtuq0hgejBHK7yFXuaLmXff8GUZlo4SBicXWCAJ3OgO
         SKyD/oxbVxZGJaNW+6RKcQdqrLnNhdAJ6+1/fWI/Dzr9x7p57dXip575QexA/jvZSDld
         ApBQ==
X-Gm-Message-State: AOJu0Ywltw5wWnxnXb4OYqIi+YwZK4/vvt49KzuJOqxBGJfeCKkwcqFn
	httIcaCFWg9/vfeSuPSu4rwsZmkBYkSqr0mVjDhnd2A5W9dGXt0T6UddtgV9WjBb
X-Gm-Gg: AR+sD13lS4e/ptxB7Sh+aFjzry5TLe+DHuGxAUSosG2xe+9TGGyQRxaCuGCi+hZM6OA
	bX6HxKPrg0r0VJF1MtzH3CQzuQi9Gmk9f4rcb9hhex5PRNepElsYi0GagH0kUFRAeszaPctW5PQ
	J/LOw27dTcSezAKhhT8VYLDQXLiOuiWWu9IjdJ+TFYY03NT43hYYJ7v4P7FxdHeILpkQiQhURDa
	PmjO8BEQ8Cejd5+jTXYGPsaff5QufLHFciq/WQhqo1lC6g1EPqf7mPRYKcW1tj6Y0aJG0CA+uUB
	ytZErbJwD/uq0zUHRnMPv47bQur7H//LfoSyeCo2uPCLuRkebglO0niJcS/akHxuSfZg/gh75oE
	CRuO4604jgWTUCbXMi3Qrh2SxzsQRl8++XxTk6V/R8L3M3zZSrSPKLLB/Hnv+3aV90JpY7x3Sp0
	9SDxbi1VokYASC0aAJ4cBZ6ehGHD7PczGvm8d/XjQnHyP5riezfy8uETIcGIX8UpKyn89TVLqTB
	hEvX5AqLRGi3UHxBpJrmvQBIH/IkTvKSiDUgkYxNoFgpehGxUJ0mZgvzl+lej/KAuLPPqDkmB3d
	M3ARjLM9PqvRwj4F4hddN6U8mT7++xls0vauoahuJUWkJjBLhYfebHL7XTEPgyiz7AUxfj0x95n
	TOyjViH08JKyzKoXI8sJH0kjQhVKIJ4L6plLhU9clBOdAYfNgPLLHSysz
X-Received: by 2002:a17:90b:2e4c:b0:390:b41a:b92a with SMTP id 98e67ed59e1d1-3933bd0d632mr11063569a91.4.1786747582020;
        Fri, 14 Aug 2026 15:46:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 036/109] libmikmod: upgrade 3.3.11.1 -> 3.3.13
Date: Fri, 14 Aug 2026 15:44:22 -0700
Message-ID: <20260814224539.1523174-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129100

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mikmod/{libmikmod_3.3.11.1.bb => libmikmod_3.3.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.11.1.bb => libmikmod_3.3.13.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb
index e11b80771f..8ea6c2f227 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.11.1.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.13.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19"
+SRC_URI[sha256sum] = "9fc1799f7ea6a95c7c5882de98be85fc7d20ba0a4a6fcacae11c8c6b382bb207"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 

