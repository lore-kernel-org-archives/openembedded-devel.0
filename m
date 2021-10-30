Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A3FC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:02 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.17854.1635592561049128686
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GKwGf30d;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q187so12464358pgq.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RnxyYhjT6hwRgL1tQR4yZHLPT0eHQfcRlV8z1eLuLiI=;
        b=GKwGf30dlqUaWnei1RVf9tN/atJc3WfhB+mvfnMq4mj7gWQzEYQnioagDGtb12jxqj
         MIrO33ONKX5Ecek0zlnEC9jaPG0O/H5T23Vv8Y3/3lqeNgOXFoF0Q3AzqNNlL8g9PZ2I
         pR6rBsa5cIkS5LcvSpBXNFiDJOlo1WIU5RhXctfr8xeBn9z/dxVWFv+1WhmizGWyMFju
         4ZBTJ9YibrTPZ2ujFSbqKB0RNNq/u59vYNCyVuIiqOVYsTzrn01gMyRPAdP9tLqCNfaA
         NlDoUaWl9OXTaTG+WJi8iKyBOVQlR1kG3roHN2BGfNsShiAXFIgJsqlRpifYH5scKF2p
         LqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RnxyYhjT6hwRgL1tQR4yZHLPT0eHQfcRlV8z1eLuLiI=;
        b=LBmDzsUM/sVWU++ZM9CyCG96YzrZXF1kdYvEL/wY9KAnykkl9MyjbnHct/6ayRq1Zv
         l+DQdfjSgfnp/ZOu4yAYoKlMvDnCUgWxOZ4Uh2U5GeZdveN5CDUYwntLOm6BVb4fTcCX
         j9sQL+uTbR0jumgj3q5ARaEEgOEpKyuO0FFSL1mzhIUZmWWL8ygrYS3WuovQoaU2NmUb
         mDe73sT/Y/DiSf1mU6mMn+zzFHUTYm51bafakO1y8jU73xnCIkZ+W/4w98Ga/qiwAoSL
         puE/J1cEfj42fLx8OUCb0vxW/kS5ZBQuN1wL5esZ9k3SRNy5CuBt7WjKa2KJCMyMbj1D
         4kQA==
X-Gm-Message-State: AOAM530nYJqh5NPlMEuiZ2QWdu3B9DWS4RgdcuJlqtYxyF+VEda227Xh
	bctB4kH6q2k/SMYxNu+juHTnuytadZE=
X-Google-Smtp-Source: 
 ABdhPJx4mSgSE5gDInDcSTIZZLiTOVKPvUwtt80enUm/ESXmy6AGlfqIyLPYdlYCVeAfh65PItbktg==
X-Received: by 2002:a63:e516:: with SMTP id
 r22mr12561309pgh.197.1635592560358;
        Sat, 30 Oct 2021 04:16:00 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.15.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 02/14] python3-jdatetime: upgrade 3.6.2 -> 3.6.4
Date: Sat, 30 Oct 2021 04:15:39 -0700
Message-Id: 
 <3f8453eb11dd5b0db360c017f57fcfe9e53e90dc.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93659

From: zangrc <zangrc.fnst@fujitsu.com>

-License-Update: Update PKG-INFO.

[3.6.4] - 2021-09-15
Add
Add date.min based on cpython implementation
Add date.max based on cpython implementation
[3.6.3] - 2020-12-11
Change
Run test and publish package from github action

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit a4724fc450c5f987d45287a5e5b50a549cb58cbf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...python3-jdatetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
index cadddc49f5..ad1ca428fe 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "Jalali implementation of Python's datetime module"
 HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f6890b2f685363312aff7f520831cdef"
 
-SRC_URI[md5sum] = "3c9ee1bc7de48ff4d9c773046b2eb081"
-SRC_URI[sha256sum] = "a589e35f0dab89283c1a3de9d70ed6cf657932aaed8e8ce1b0e5801aaab1da67"
+SRC_URI[sha256sum] = "39d0be41076b3a3850c3bfa90817e7ed459edc0e9cadce37dc7229b11f121c7e"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.25.1


