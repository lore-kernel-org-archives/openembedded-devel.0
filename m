Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ACAD33A44
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.27756.1730831923564827662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RSixqCkQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso5345758276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831922; x=1731436722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ZtIWpYkjh4ig/k4Omn2StWq9LXHY7aCTh+gWmW828=;
        b=RSixqCkQVmPPYMz/BYopcJqzGQ05QSf7JBka5sLwgF6/fvLelQs+dIMy0RRrU5rGmr
         Rnd1UQbLHuVs3UQh0qPwBA8/D0Ur3DxlusALpx0zMr3Fto5NZJw5u6ALd6Jtxgvd/FcM
         xnwFM1yhr2DuECzaSjz1b8JnLB2pwO5kBB3FpD3Vvr+yOyC+Bhu714G7aQXhOdQhF6oV
         x/I0uGCmhJPehWIsxj4fwyOlI46fKmaBPmhInP07jCxMjBzusN1E0dxGZJrwB6JQe9Oa
         Jb/tPJtsSzCMsfXtCcIE5V6nVU0WWdt9k3VlO2Xy5HNzYWQbyaVJOZu0HXaLxmFLbiSG
         H/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831922; x=1731436722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+ZtIWpYkjh4ig/k4Omn2StWq9LXHY7aCTh+gWmW828=;
        b=UsnD1CwpE3LH5UI8uPezItmu2PU6hDuCN3nnLLb6NNxkOqbiyoufgLHSRRIDZhzCmU
         0bxBOkMLOD+wuWn2c45HKGGAo6WFkur6ECZCJUOxBgx0EwcFlMlQvUaYij/kQWHyGOGS
         XLRAeE1rBdkL1LDBR+XZzUW/5uKe6hGxJ15Qz3MDt3n5f29c63xh4Usak4hoy+bSmwZW
         eZltzR+oPX3ZcdPS57B5KnME1Gx1623ykknvz428ZVaClJUofMN31KFuI/bqElKqWtfD
         kH+NExMIg8od06oZu3ALoJkbdqW6+JFKzAQ829QdGcunq/mu7c1geMzInx7ZvxH+HqAH
         gNHg==
X-Gm-Message-State: AOJu0Yy0viDOnxzVWkga0WzAtRTvKHzcthCF/KEJSUY+63e6OnKoj5rV
	Ca3Z7ZOs1LOONX7nxFdMb+sCFQk1rozsDc/oBOOF12WzTLQbOHL64Mli4eHO
X-Google-Smtp-Source: AGHT+IFQy6GFC7svOMecJim3lV1mq9CU48wOEbcrghYjdhzPlVFw6UKMR0kst86R6D1jkGxXcMS3lQ==
X-Received: by 2002:a05:690c:dd2:b0:6dd:d5b7:f35d with SMTP id 00721157ae682-6ea52525cebmr191524767b3.30.1730831922215;
        Tue, 05 Nov 2024 10:38:42 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:41 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 053/161] rarpd: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:29 -0500
Message-ID: <20241105183658.34982-55-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113568

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index 293431245..2b09b6bca 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -10,7 +10,6 @@ network."
 SECTION = "System Environment/Daemons"
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${BP}.tar.gz"
-SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
 SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
 
 SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
-- 
2.43.0


