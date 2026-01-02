Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89AFFA3742
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:19:58 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3826.1767354833610502337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aa35ZCvd;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3e83c40e9dfso7978172fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354832; x=1767959632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0sb8OvYuZJKMyTcnN3VIReU2WhY7FC3CfYfaoX84tk=;
        b=Aa35ZCvdXDWeNCVRPOLJdGe32iHOymJz6aHJNp90LWbHEekhfMh4jRX+zCzR+WG6FM
         MYjvAaZFxGly6i0qnhifZbCZawfggq0ZLz8XFEf/CsgNR9AG99dHJFlqmRYQHtFwA4an
         RpKemaBbpSzW+hIJsCpmoGdxt9IBof/Pd6SrYUPOROhR6ZAG1tuQHER7H1Am1RFwuLDb
         vYXcP0EzRohmufs/y/ZVclTQKJbC3IObHpG/xXu7kwfAcGSIO/JwVq1GE+1hAFkYBBHh
         LNN/8Du+2FMuwo9YnBqzdb3/5Tq+PzTRZHv1hqBRRgauXisxlfthGrx/tsC2nEwNYzZ0
         Q5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354832; x=1767959632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0sb8OvYuZJKMyTcnN3VIReU2WhY7FC3CfYfaoX84tk=;
        b=jiZq0E+OLzqRAsIS0WqUrOJx4nv4TsPtkD9hOrwfHOCniFVAaVCiEPVMCuC//jX1M8
         ZnhpWhTLLaMtHPki9rVZB+jNic+INYR95IoFlKLhIcAnUPghBm0dUOT08Feps3aNf6xv
         0lqAbkwhaQwGjxU9RHu5KMroqYYi5UqHRKdZroDvvpbBUi8wOPS6oP7M6Rq0qmsxTqCa
         3SYRNzoiJtH92OM0ZW1KrIjya2qr5op3OPIx5+IO7Ln4XdrrNiYUo4cqh5UFLF2REqPQ
         Y1e7qvK2MEET2rUlAStqnwz5jI6jJ0jDcimKvDpoIo7mKg+yykXNUV50oWDEhgJH/AVu
         RviQ==
X-Gm-Message-State: AOJu0YygcsmyQO3XSWvvo19xylUCtBdW1cN7q9awkbvjcmCP2Ce+sDIB
	EvrSB+Xg7G/qhbCJVB1qLbsgnuSi0HnBSb9+vUhCBMAF5zb6sSkQbeREO0NHKg==
X-Gm-Gg: AY/fxX4UBViW4FygRmQwutffiA1EbCvLm/rzVMYIXAP4rOz+udOVjVtNHCWxUJQbnb6
	iUhH+DYtIbvHB2CKR4sdeSlC1uVQJpVUSDT1nnHkEhs0eBxkr9VOcLt/lf/c6OSFQmf4FnAoV2K
	OdiMK1Lolc93aFoMevx/3WFLFzJ9+di1otny3DF2KHtfNpYnI1Gv/6dHlN7Tvcmnct4u9fYUeye
	zgCW0DjMxK6aAe4vTuBISrIF5AAT8y2PN1+oqGFtsoibNwLPlhCZ2+CHxKOgO/D8F42VLpcbklT
	IoDe9vRfOnGmT2QTj1yLTdAz8SH+JI8YCoLzXg9SfV22EURvirzbsrJJlbtRR7nbRf9t4ju1rQs
	Nbn/nIW9n2QDQHD2kun9ZeDIV0HV9INc5ofjm7KXUocaVSlB+M7Cvx+ph/rrudqPR9rejx52pF4
	/WpaVFO7EubeVq+xz85KP6y/LGpGs20cZfJkwt
X-Google-Smtp-Source: AGHT+IEL5pgQZRcoDG0J8an64ju1CzXJUOo3Ybu5VoLoUGMhd87F8v4s9RLWA84XX+zbsXEqUovGfw==
X-Received: by 2002:a17:902:e80f:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a2f293d125mr430282395ad.41.1767354380395;
        Fri, 02 Jan 2026 03:46:20 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843ee4sm40993724b3a.10.2026.01.02.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:46:19 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sanjayembeddedse@gmail.com
Subject: [PATCH] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Fri,  2 Jan 2026 17:16:16 +0530
Message-Id: <edb5e5e2949f7876e0c21ffc8ad8006058a0a60d.1767354275.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 12:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123097

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
index 50ce50d1c2..b1d25fa83f 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "4298c90a2b238348e4fdc9f89eb4988356c80da3f0cf78c279d2e82b9119034b"
 
-- 
2.34.1


