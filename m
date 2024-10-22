Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E87DCDD0C2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.21768.1729612077542196531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9TQlIjh;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e29047bec8fso5244258276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612076; x=1730216876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5IxnDIIkoDF+0GY+98PxKRwZN+Or3CyussJCXmF3v0=;
        b=K9TQlIjhNXigN8qld6QI4Qnk8Thm5mSyYCdRrAZrpZUNec6hyyYxjTpEGsoxWehpc6
         kP8ElyJF47GrW/dKKtkbR7VzEIukdOyRXIjGzqjs5YZVeJ+hzoA+c7Z3pVxDThB7XyZ8
         5cTuZ0VOgtg3Ji6Jpkrysd+l9vllIEANkPsGbdDZ0TfB5whcJbxBANOWvpo4Ae08Om2d
         PUTQxSkrvdtMQw1i0RqTM0Iu0P8twgY/ocNX5z/oVtvE8L7DenNjsRrhdyFktK0GLdVQ
         +7DVWvpoSto0AKrSxMzriE1Kk/y38OUtzW+5Uf0I6cdVfzoD2HCAA/iJWThjPg2cypkO
         xhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612076; x=1730216876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5IxnDIIkoDF+0GY+98PxKRwZN+Or3CyussJCXmF3v0=;
        b=VLtPymCFdsT7fFkz3kf0IaLCx/Zk4L6P37+V+LKq0+00p4mSKvRMeWIldpBq5zxVzT
         IhkwYhlUHIGYCYOrQWcSBcSLLhYvzs6ES6Of6T1NlY6Mm1OvUIXdzF+tw561qzJ1/GDR
         Eq6QIRWD5yDbwjrH8EsoK+Dlufdj6Z+qWwTciRa2iHcRw9zFLMP0OSiSvjYbCw7tzi/d
         0psI+HOQs0+cqnCRxIUaCYIaen48WFitThGwQ/LAKffHo8lw265DubmUUGSvD59vqfzd
         ALw9uiY5c+Do1lnGbCMPjYxzaSabPURtM1KRQbM4XJVxG+R2JCVyp1f463JFavRqGnVn
         +VYg==
X-Gm-Message-State: AOJu0Yy05IYWBzDazghQU0/vpEKlTGjMhfBBfEpDET/p2aMdsKwpA8dU
	AST2lyPuq5FuJP3HQKbL2EzXzNCw3fuXRYE4JDCPYIE+mgmqJbahL4ap7g==
X-Google-Smtp-Source: AGHT+IGkx3L7AbXEkXe2ZDPD0wK3NkF6o/Xb65vUHYIwnU5w59QBnnR3QQxI4caGQncdo7YczOuwPA==
X-Received: by 2002:a05:690c:3383:b0:6e2:a250:a1bc with SMTP id 00721157ae682-6e7d4945af8mr29819097b3.22.1729612076175;
        Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:47:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 03/46] libalgorithm-diff-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:21 -0400
Message-ID: <20241022154729.20331-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113094

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
index d87df0974..1fc6048c6 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb
@@ -13,7 +13,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=406;endline=409;md5=d393b8ad3b8994b9d0ae9299b8a8a1ee"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${PV}.tar.gz"
-SRC_URI[md5sum] = "457cd497a0411a88b47d3741eb176071"
 SRC_URI[sha256sum] = "aa848b75ad3ecc32d31e8651909551e851cceef74a32822c7a3cb35c259f5190"
 
 S = "${WORKDIR}/Algorithm-Diff-${PV}"
-- 
2.43.0


