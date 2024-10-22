Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614F4CDD0DB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.21956.1729612099980106725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vngt2D5G;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e5cec98cceso33900747b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612099; x=1730216899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1EYftb3Xu4dREaar08dXnivuOQPqshvYSKmw17WgtQ=;
        b=Vngt2D5GHlHUN9y8B1Dsdy5I9qBPYnA35vhi4FjO88GZPSL3lggOYF5ffadYCKmGpi
         mDm6ugeoWT3dHgM8lJZuS02H4XNlZTYeVeQmGzzQbfP6sq4O2GREvyX6G81bjQL/qTzn
         2XuGfx6OyiS2t2oywwJmnUHC+8nJJE1GteeFds6ZZwDd5bmrqiOu3eKbMSPSaorpmItA
         7X6PillE6xMezn67moNNMzL8rtVFu2APtcMKdviVtz4RHWQeJuXP0EZX8kLKQId6L5rO
         UbggCy0/zBi76lvfSSZ05bVlk/Tw3rZ7xBQ7JBI9z/ICCkbMwgLafO4meF1J8JpDvIp0
         hbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612099; x=1730216899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1EYftb3Xu4dREaar08dXnivuOQPqshvYSKmw17WgtQ=;
        b=N+cSrVJr97YfeHe6sSEll1mQjnPCXsz3Jv/rGkUh6qdaflZ0jU3jGtWEEGprmMFYNE
         9Hnw2HC5D3AOqKGyIndK1AaN1+Lhu83AqczVrxthiER+l0X993vx80Bm7y3YvbQeIpbB
         o8JZ3lF7OkkX6r6YcuEs3UgtSrJCeEJw99jqieJ3bs6JFUuW/ZBa1jw1nePbWYBBUKEY
         84AbEESjvdagIhmUvvEMXQ0vVxZDgccVg8+PybPm+frW5w/L+p56It2gAha5WQGvtZK2
         zPG0On8jkbVz7KZup8WpaU7n8/iUWrsgpTHJjUpCPFS0K7Xkd9vuDt+qt1R+ljU6xNTV
         jRtA==
X-Gm-Message-State: AOJu0Yz+PAQxJMVYz5wStHpdRyy4e2Jv72KbW/+IcFAvORaTI0MRYW0h
	oV71cl3NKxt+xjMt5d0Pzanfnzfdk4Sp9TsHnLcbo0JOanB4GuwplIDvKg==
X-Google-Smtp-Source: AGHT+IEL2H0OLkwPgcgXICkLvYjVugYcp2UnSWAOrj4AzmMosdVGpfm+vbAqFVwZ/898Zn5ORqNlog==
X-Received: by 2002:a05:690c:312:b0:6dd:bcce:7cd7 with SMTP id 00721157ae682-6e7d82dc069mr36223357b3.42.1729612098627;
        Tue, 22 Oct 2024 08:48:18 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:18 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 37/46] libsub-uplevel-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:55 -0400
Message-ID: <20241022154729.20331-38-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113128

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 3a0de9757..1981ae4a9 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -17,7 +17,6 @@ CPAN_AUTHOR = "DAGOLDEN"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6c6a174861fd160e8d5871a86df00baf"
 SRC_URI[sha256sum] = "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1d98f3c8cc4a3ece293"
 
 S = "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
-- 
2.43.0


