Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DECACAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.17321.1758290381403771175
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsZ9DY2f;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b00a9989633so448468066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290380; x=1758895180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzD7oVPwzAQsaWL81ckF9yDc58rkCAXHKSBmm1xGaxY=;
        b=nsZ9DY2f29pf6SGKwbE+7FndPpP2AGMfiiBSCxCN7gyk7gkn28VxaxHytYDDruvNFP
         rnlN6kPOvcc+fMFsJmHuA1+BjW638RyrLXN5dlZf7lfisIvJZMosoZY412sqorpqgI+r
         CVAPU5cHaug93a3Dxs5g1D5Qs3KSZtAR0zLPk5GEp+INqrN3xFdfKO3fHXyawV+ens6J
         xuscckkyKWQskkFiMeJe4NgDjBws8OAZLjf9Mpk+OVAjNyG8HhSJOEifblkFuo6tbAtc
         i8dq8+MIk7eRKnLjcQ1qX322QEBTbsCIxePzpUC1oLZVRUWm245peAz4PbO8irB6CJaM
         9CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290380; x=1758895180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzD7oVPwzAQsaWL81ckF9yDc58rkCAXHKSBmm1xGaxY=;
        b=dh+Mp3vHYLkUTCe/g/c+P90xRyTOybDX0kDe30a3NzvMIyQV72WhOO8DLlgcxYh019
         ZYT9JfreSs8JXevoG3JtFEn9on/Xl0E+4Y+AMyyRuHqYP4nNe9NRyD/J1L2iETMmiDtE
         FnrdOrP0R4n2YvO5GjIaZX+OVY+xuL0vXZ/7OtJy+aKPAuI7lYFDVj6ZTk/VpBvqlm5B
         7ZIK7OImEfmLk25GM+/yU7wYLqXs5UesQZVHTHPbIhZvEsZXmomUNV6pyIDT7vagz84x
         bw+6X+I10nJR6kVcIvbV63uC4qKdNc0VK33yl3kJBxIi0ns7+vP6BiN02jIZ9W/CpqVT
         C2rw==
X-Gm-Message-State: AOJu0YwQjy+o+Qbhyqa3FnSz1PRrQZnmPKP8DAXx6OoU8Y2FBb56J2LA
	6FUbDqUQd9zbSaURaJzRdN2Ihg5/G30EA3GxARVoJ7ZiE+XmUEz4iKp0wfLeYA==
X-Gm-Gg: ASbGncvjJq2XLHj/L2o8vLJJScJ7z0WsEt25Px7LH+/CnpZQYPSUof0/7KlubkGjbjy
	l6eGwchXs6AZCiLSUIOVa5xBiH0+DVk4eEtreIO/32L6oGPX1oar5GQxhUteVsmvDKqV/t8106i
	Dg9a3PENagb69WH1GMt+dAJO4kdb9hOSK3xAcnPyjZujgEL3FDrk5qbLg5P0ipismrxiZUgM1tP
	L061vyC8KTI6qjvtuL6btUPsdnWep/SdcU5qkeZqg+wJzyiu52EqBTev7lOQQxIpAX5O2SkG+yi
	4bDbm0gEkfpEuKoiFlyu6GBvrv25HXd7R0ngEb+s+V6yUQGEBbsGJQFUDfTHly++fU/YRa+L6Y8
	sFTc/V62uaJ4yyVMXbqmR
X-Google-Smtp-Source: AGHT+IF76taybf1S6SLS+yeD751vs5m7Zlv7sXR3XXaMd8NFAsNjidns5OToWa1S8eaZxjcRy1NpyQ==
X-Received: by 2002:a17:907:7fa3:b0:b0d:400:9182 with SMTP id a640c23a62f3a-b248f1a28dbmr389103766b.22.1758290379527;
        Fri, 19 Sep 2025 06:59:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 8/9] gnulib: Update SRC_URI
Date: Fri, 19 Sep 2025 15:59:30 +0200
Message-ID: <20250919135933.916848-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119605

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch warning.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 37d158db78cda787a5833c098423650b8caba0fa)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
index a27968079e..9e09b971c9 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
@@ -13,7 +13,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
 SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
 
-SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"

