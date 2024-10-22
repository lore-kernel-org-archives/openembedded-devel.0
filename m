Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D87BCDD0CD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.21937.1729612078758585649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aaKIhWsV;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e38fc62b9fso57556667b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612078; x=1730216878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpU3quLRlZI9Z81iOJGWGRJPVF1Y3qz+NqDf8kO10Us=;
        b=aaKIhWsV7NdR9vHATypSJF3O4Si5raXo+7Fbyok8SBxM/hgOFbwszkTXyAEYkGuZDx
         8XQhX6va2WIKErAIdTCpUulLRD4OnY61ZzXVdZEa24z7OTGbrqHfTNP6XR2tPy85R9Rk
         EYknQuk308UexabWNq21ddvuGS4ESlzZQtg64s0qp6Ceoitkj/A+AK22fjskyewuTtX9
         eJc2SHVDath6dJdyKHvvSTBKLKp49VAWgh8s/REf3jP4loFVl2Sym1z1KeeQjzZxJnvW
         DkgUKMPttYZQ3+GFP6fJUfs2eJrigjewBTBoLPBtdFHZ2/165NnrjCgUqgn2TMLoZa5M
         i9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612078; x=1730216878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpU3quLRlZI9Z81iOJGWGRJPVF1Y3qz+NqDf8kO10Us=;
        b=sAYnb0oRJ3AZNCjbdRIjWrtc0GZZTkUtDAocJaMxC6C2TrSfVzuHA7V9JTKJzC5/bM
         pH9zVL1n1QzpqIP/K4EcD5IGXnHhpvaNYt1ukFpnDjqLS41dXxxg7FDcqfWuSjV9A+vq
         fWg4g7N+za6jhaHsOTWR6CnOOg9XO+y2igX6KCvXMmQv92O7jPKJYqX0d3Kyxy3lulu8
         0jH/6qx3NmQtIg/IECWS/PlAWqt23MbpwX6OS/YL37qtk08pcsG+H2T0/wCk4q+stjSc
         wH3GDpTO9yaHCjyJZRaEg9dAzNqOF5ViBo5RVtwyDi6KNAZJbLn3wHXYwHhtc9N7oiTx
         YVng==
X-Gm-Message-State: AOJu0YwVALZ6yi/Bli4glXo//Ni7HonMyRcwydISTvz7Za/BLvu7hRBQ
	Vxi0YLClpaqQXvZsuZjYxinxy7zX69+ytODGea8Vr3FWYIvK1o41BZECBA==
X-Google-Smtp-Source: AGHT+IH26XTc0Vct8RLfZa8QxKL9ZvsaHiFTYhgKf1Nz7qN230F7V3PE0sO0WSTIyMsNSa7rHyuCuQ==
X-Received: by 2002:a05:690c:2c0b:b0:6d5:7b2f:60a0 with SMTP id 00721157ae682-6e5bfc0c7fdmr110540247b3.34.1729612077486;
        Tue, 22 Oct 2024 08:47:57 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:57 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 05/46] libauthen-sasl-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:23 -0400
Message-ID: <20241022154729.20331-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113096

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index a9eec6950..531bc61cf 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -14,7 +14,6 @@ RDEPENDS:${PN} = "libdigest-hmac-perl"
 SRC_URI = "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "7c03a689d4c689e5a9e2f18a1c586b2f"
 SRC_URI[sha256sum] = "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32854e09"
 
 S = "${WORKDIR}/Authen-SASL-${PV}"
-- 
2.43.0


