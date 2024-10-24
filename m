Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9E4D10374
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.6179.1729801136875558727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2APwwwb;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2e32bc454fso1472418276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801136; x=1730405936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZKL2QMm06j3SLhd5wvA93zmGhQyJ/s1bhz/JIkRquA=;
        b=a2APwwwbKsIjXEWOCQ5zMjtFirI7uWu9qGvnP/0gYA8HGg9gR7AFP5+Vk3r7Pn+Nle
         2KOZvkNlRhYhO+HeIfQiUzuA2KarS7HhyyrfDlq+Z98wJQrroQjs8PMXQeZKCNtwFK6g
         1sBZ3XazGaCwu1UxFJ6W5+/X926uYC/YsVVUrMH+GPl1qELVvb3XO8n4t2eR6poEm1Qd
         NTHdYRn84MAw7CBOsuANKxejT0BKU8haAwHjTGK313Ra7TWfSDETkDKXHXhRj0gr0wsB
         UMvo7UBDlxSDbguz0geTRSuaFCumN9oi/coj4ZqlgEEHXAeX342Fhqi1prPrb0+KPAzT
         FInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801136; x=1730405936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZKL2QMm06j3SLhd5wvA93zmGhQyJ/s1bhz/JIkRquA=;
        b=meSOgb6zwx8X7hsDqAkEBfrADGqIAJiPCup/38Mq75n8hGKj9IMpgOGoBRuzTgsCsv
         hDNDrjapBPzItG1Yh1CQi+cls60nc+gedxlh1kpcSkIG7NEd4j3gHWTRjQ7LFRzrYkKQ
         Hx+wEqyJ86eo585+7kOH2l1GHItlgCRPlDXj7FJyDwunT/ixMEKE4hnO04IBm91h8uN0
         fqeF1dG19kqk0f+8789GZMm+TVFpWm5sc9B+G9SupdjJmApFrqcB+WL3CJQGYqs7EbQm
         Tj+3NsIAURTDW7TyVFyO5FiE2j7tro4c5/JPh7yahx2ZlGrHCUgF7kAb1Pk4BqtEnAJP
         VMIg==
X-Gm-Message-State: AOJu0YwTESS7c5W8HKxDietYVa5gMz+fOYdRv1tUJqG4F6nWImld27Bt
	a5QAXfE7MJn9p1DdJh1zIq+6vqDv8UZEqrRBqZbXIqKwria6YGny5dcwQg==
X-Google-Smtp-Source: AGHT+IHP697LV+69ZSPB7nbfYRHsWdFzLnExgNM6hFvY7F680+X56WZIQIBhG+cQaq6yqukwHUGu5g==
X-Received: by 2002:a05:690c:c09:b0:6e3:f9e:5fe7 with SMTP id 00721157ae682-6e866355ec3mr34241077b3.46.1729801135552;
        Thu, 24 Oct 2024 13:18:55 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:55 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 05/42] libcapture-tiny-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:24 -0400
Message-ID: <20241024201806.440273-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113183

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
index 43d6b03f4..e37101d72 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
@@ -8,7 +8,7 @@ a dozen capturing modules to use in any particular situation and just use \
 this one."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~dagolden/Capture-Tiny/"
+HOMEPAGE = "https://metacpan.org/dist/Capture-Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
-- 
2.43.0


