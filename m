Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620C9CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:40:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.16574.1760449235556269325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRyDueP7;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e5980471eso29305485e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760449234; x=1761054034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UiC3Us6Os3Q2UwgFxbJDFnvOxnwAJKQENTQtMh2FVRE=;
        b=IRyDueP7dPaKqUee7JS3QA3ZnLm39tVf0zeSxOK4AH5p/tantq5yyeLAMVTSlSgzMJ
         DHKN6PxuLpWK9KHLwxDM3snEtj+vbu0+RXhkyISYldB/saHkkGVU2GjqhQd2bN9XKha7
         GjTpKR6pJl31KTEtgGhG5YQkDzo4CYnP9wM3JanqyKly5fmr1o8I1AdyCEL1SQoJss7K
         JW635pFB96Ys9phAQPoVaWfrJzBKvr261jsWxoOzGdQX04iscJCC6tk4Hh1s925VKNi3
         EzIkI0SKMO/Xqn+EV/tGBV+5mhiG1Nd4dFx4SL0ENKniDFvFlb3xDeuAYm63sViFtvDm
         iVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449234; x=1761054034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiC3Us6Os3Q2UwgFxbJDFnvOxnwAJKQENTQtMh2FVRE=;
        b=kdNy9rF3fSVVynZdFXkZnAC5HQfuKDBR3oqQClffjqtgRrCNXqX34O4a3Ys98vPFSb
         PK31bXAC7C2gF18dlnl3Z9PczdX1LkVWB/xjdp2qwsvCaSWZEs4VXgHHCkv4uq76Fz6R
         eOCoXlBzkmlKh7ip5wvA2/r3+XI1zD/u/Y/bWxGML9V+9y8/IXD43xKzO1PDX/QCd0tb
         uqTlfpu1DEeOsVX0L4Y7yJhR8yOhJCrPUCahz4LnOoTr//v1PmhqOg2hkpIPJ41pnjh3
         9uRsaxT8c9qwcVdtf2g8sHt6zBblVIkPWprWY38oO0kzRodzlWAOwRUHYnNT6CQJXZ3e
         v2fg==
X-Gm-Message-State: AOJu0Yw28QWp3rYmeayEO4kHafUe7WSIrbdN4mNStTwDNPB5Znxi6STT
	up9w1VmWAaMCKMrVC66+ZsYqWPBAKl/KeaX1vpYop+ULzdx6d7uH8oCGW6fU7A==
X-Gm-Gg: ASbGncsVTrS3eNmPJr/JMaTAw6jwdSuezw48rpSb4v8t0f7FeHKUa5E6mOb2m6OAdP0
	BHifMfxJFpf01lG2yaxfiTylJaigbJq50Msr2UZlTtBZOdDrwL9AMx4d0ODzx5y9NzqFVPSXlWl
	cFJR/oBnSci7uCaTUJYA5/5lAY1Z+fLFebhB8Kj79bihv1fh4ck56WEwJNryJZOm3zuUYno2Exw
	1sea4sUGbqaVXMIA8ProVWvAmutaiHaxDqE5abhgwPPyayDRGECQYJgn4bIBOJKkTGpAgSwTmJL
	BAJJa447A6VDYCAYzXpfk8gjjhxZuBCXyEctdoDxSEnbXhIl4WCszi45NeCrRGy2UJgdx27wWU1
	1C0AaW8KIx+XVWVSDklBVS+how1mPiuGMAx/T5L3JCTVcdeOJFhH5SUqIuGuj
X-Google-Smtp-Source: AGHT+IEB4sBf80p6o15xMH5SSOHMlcQJHAjx31sLzxUBTyT5BZVXQPh6mIXvZccyF1cF1AR+Tx0/+g==
X-Received: by 2002:a05:6000:603:b0:425:8bff:69fe with SMTP id ffacd0b85a97d-4266e8e6c55mr15833350f8f.57.1760449233273;
        Tue, 14 Oct 2025 06:40:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm23714738f8f.8.2025.10.14.06.40.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:40:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] st: Update status for CVE-2017-16224
Date: Tue, 14 Oct 2025 15:40:32 +0200
Message-ID: <20251014134032.1053852-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120609

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue.
Package used in meta-embedded: https://st.suckless.org/
Package with CVE issue: https://www.npmjs.com/package/st
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eb9c7bb5645b6a3bcf7c40e1a83c8f4c3b020fa5)

Reworked for Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/suckless/st_0.8.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.5.bb b/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
index e88c2c0f09..beb7ed6fd8 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
@@ -33,3 +33,6 @@ ALTERNATIVE:${PN} = "st st-256color"
 ALTERNATIVE_LINK_NAME[st] = "${datadir}/terminfo/s/st"
 
 ALTERNATIVE_LINK_NAME[st-256color] = "${datadir}/terminfo/s/st-256color"
+
+#cpe-incorrect: The recipe used in the meta-openembedded is a different st package compared to the one which has the CVE issue.
+CVE_CHECK_IGNORE += "CVE-2017-16224"

