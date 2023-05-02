Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BF6C7EE29
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.121807.1683008403038078206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KQ7ozlWx;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b60366047so2423695b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008402; x=1685600402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InnwXPzMTUhdeXyw/FXBQhpvsEADDdmof69+yG2VYj4=;
        b=KQ7ozlWx2TVCnJVl0faEl3neMJGStbof24oV75GCGQdJv3A3j7wc5dApEl+pDnXdNU
         RbzCFLIaINe7BIIIXzNacrdu7EZaanrLLp4q5wyPq0YY4VBBCBepgjuIYXcKeYLT09hg
         4Z5Xpz237eCXAlKOpYtRo2vD6MP1l7uEfFHd6fuMiUX/Q/H8+zTEntFJqiYFAjYj7RPf
         scRf7ZnLYchPqjWyeKoC6Gw1KmGvkkyITL2DgQfzaiDzsRt3atkgQ/s/3kM5J9tX0VVm
         8yZqD/5zgXJhas0+VTWk2+ZmDDKg1GgHoYc4EupsSnzMlRnnlCUtPkNApKClc/FFqxTw
         Ecqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008402; x=1685600402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InnwXPzMTUhdeXyw/FXBQhpvsEADDdmof69+yG2VYj4=;
        b=fPi+U4jRnVbdChnOOAnkyBhsLPCN0HE1Enhp/QqgoBussDXrH64E+jSdQ/B7Ttv1V8
         /hWL2Buv9TUWUYZiqXIszeAqgfEeAUAjNEoMtO5ut9XPDNX+G4ca+uTng3sjcy6VIc/f
         bKU2mpqBXz68XQuhy2V/1rh5+BA8FH6QxQ7c3HOduCHhUt0KMDUoOtZ3SAhD4cXK/l64
         3prLF3Mt70OgtVY7ThVw9iviozhcl/+rqLEl1OJL5BzEhSE4EomluIXkhUz6VpFukIp3
         wMYmTqMa+crFlFeK8eFge3xl+0TUkMUJwdtalBSYdDxpr+2+uU9TQpqszepdXXVfR/x1
         gRgA==
X-Gm-Message-State: AC+VfDymecJz/jHZqWcSzJ+IX0XS3EZtc5Rmz/g5v3FICwRQD7yFkytL
	YhIl5tRQN+Jd/oouDGuxUyCfMDIUOT1HnQ==
X-Google-Smtp-Source: ACHHUZ4kyek4GQVRM/pVtLWpAgpebJK1/X/b4eJrbuZZ76nB1zqxUeChxm1K/TfL85B9u7/aDOZPng==
X-Received: by 2002:a05:6a00:2450:b0:638:7c22:6fd with SMTP id d16-20020a056a00245000b006387c2206fdmr20181026pfj.1.1683008402042;
        Mon, 01 May 2023 23:20:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:20:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/11] debootstrap: Use DEBIAN_MIRROR for SRC_URI
Date: Mon,  1 May 2023 23:19:52 -0700
Message-Id: <20230502061954.3782607-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102255

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
index 4d13aa66c8..592d997aad 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
 
 SRC_URI  = "\
-    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
+    ${DEBIAN_MIRROR}/main/d/debootstrap/debootstrap_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
-- 
2.40.1


