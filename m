Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B728D1038E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.6192.1729801148577773493
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kBVWjNlc;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso1515126276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801147; x=1730405947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLdmVAcA/UVQ76QfLrwQ4iIZahyOyLXSnTngdJRLvZk=;
        b=kBVWjNlcd+qnomNsWfKJrk9MEWOemyXp87cec3Mp131ink4hxOBfdiEhl6ywQe/GGX
         HhGBaHCcaIs7RLHDplYo2h68OcVhQLdcZOt3xoIR0kcsyr9jzXGVrieJa63soDoD0AiF
         sC5CNGF4RP/sV9XsQlv1lalf3Iti0rt8g/lcN3au5z6VaqGOp2RLQQTt/MHDU1rK/YRF
         lVL/17Uj284P6cOpfXo5ZUoNg541g24sZNGy/45luUiOl780j8c9CXGrXTmSZPTUdUQj
         kOdoXfL4gf0VqW//mSahBekN/TuBTb+EanXKaUYrb1H7S1oJRk9nDHZdbKcQG8yCokgM
         3McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801147; x=1730405947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLdmVAcA/UVQ76QfLrwQ4iIZahyOyLXSnTngdJRLvZk=;
        b=EaihfE34IxYQHcZfyJ1Kak4oIhvL4nASMZuKfhVhxi13UQ2z5iZLoAbH4o+JvC3SGx
         7oMwiooiK13dhD6dqF92gZezt3iDxi244GuZS7vCi6gBs8F2rWeG1+K8X57megy3XXB9
         MjV2k4MI5SbiCFoxQ0bRDe1p45DGfN20NBoNdnHw22H75WbWwLx8qyr/uZqFghLvlEez
         MHSuxD59rBu4TQJtS3gX+LtzVyK42b2cmRGHkTJQEs67XXoEfkD39OLjaGY9bkIM94Hh
         29+ewK837Y2ZvnlMz7qx/O1yyDOiygDAmzslhqvUiD3z1ryou59YHshIQkxMknd6AE7V
         1edw==
X-Gm-Message-State: AOJu0Yxi1naAJgABK28w/7uZrAj1AxSLJYUzQoyog8w0s5titM8gBakb
	2aIw2WUG5PSP5iL+rM2FpE5Xt1+rcma56hthYumoJG5PfxVNAXTNp1PV7Q==
X-Google-Smtp-Source: AGHT+IEPedVqK/QWChA8sAbF2ZCLgSCYyWGR7G+H5o+ecoji434J7hHlJFhu/Eqg2D5M84Rv29PgOw==
X-Received: by 2002:a05:690c:670b:b0:6e3:36cc:eb74 with SMTP id 00721157ae682-6e7f0f7e3abmr93921607b3.32.1729801147174;
        Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 22/42] libipc-signal-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:41 -0400
Message-ID: <20241024201806.440273-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113200

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 6172933f1..ca49b304c 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -2,7 +2,7 @@ SUMMARY = "IPC::Signal - Utility functions dealing with signals"
 DESCRIPTION = "IPC::Signal - This module contains utility functions for \
 dealing with signals."
 
-HOMEPAGE = "http://search.cpan.org/~rosch/IPC-Signal-1.00/"
+HOMEPAGE = "https://metacpan.org/release/ROSCH/IPC-Signal-1.00"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3
 
 S = "${WORKDIR}/IPC-Signal-${PV}"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
 
-- 
2.43.0


