Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D83C0218D
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 18:31:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.23200.1737484304778900973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 10:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXeVsZzR;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f664af5so69198875e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 10:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737484303; x=1738089103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=iXeVsZzR3DbuI5MRMoQ4jHafIcjASHwAR0oHMssTv/twL8qwGGZq6M6uh3M2gjV8hX
         qtHA3yDbazMqWxzLrUjIfb3CrCN7sPjJ3Sb9IRnJ/fSRsI58YgqyXfowrJFHdUFT+R1m
         pf9PVkcfpnOKLqmPvknrJq94IOPlorMXU/GFEov42EzgAoqkUS3HzN2rlnmgnrlQ9PE8
         h04y6X50Y7pLRa520+6dqGnbs9vABN9eeBqGwvBYtPgOo1PN5J1/+xYigpxKzYKdqkWh
         EkxrvDQbV+azIEpAhgIFqyXJE7jiD/EIZzdcI2zTPR779grQUCu7u7fwP/qRpJPkwxwH
         qB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484303; x=1738089103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=Waw63w2Yg39sunLGz4lST35AratnVlYfMssw4PY/aLyKsTJ2JWdVWepZm7OVMccXqV
         qQd7tZWJoDhbhdfVPdh3qoZDhuNI9nnaQoILUaZRlTzZZarldeY/dyL45m78yNpkoWNd
         05im1UcuL9/xeO6+DP0oMkCKt6T4lYVsIWiD278QgWcOVQ2ObQ52nuIKju9DJIPVksBy
         NoBYss5qZ6SjP2Hefr+yTHz0ccEPV9jF2iEzKRR3GlV9maYiUlQMQOkC2lueWKHHY5gC
         N4BCDmeZD8UDC38w0mF66lGre+MYMoFv70pVqJqjkEModR++vmbh+2B7Ak8lDZcoVFxH
         dDCg==
X-Gm-Message-State: AOJu0YzKZPR6NJKxH0D1cIU4KLnXYC2qcR0hv2x+uCB1s+adSz8icV+y
	TbAV0zE7wIbBGpu1WYRwxql5RCOq+xBrnQVnPlF3ymqMPNwSo0t4M89yqA==
X-Gm-Gg: ASbGncvIPzQ4RkY7pPabZVa69C0nsGFOfCX8j949sxsuEiQpu+X7sC1ihGN+50b33HC
	rVc24QBQINOJ3+sCCj25TWT5ZxKRbdWe0seVV8vypgRUxqYH1OH60aTeFolWM19059HRwrfStbX
	2khs0DstKAfrxV4dSIoUkB30qedTIs78fpUtKOyblOg/EXUEIQtoWXi+0Zz7lw4Dazm4QGD199g
	/P+aQfWtrin2mwMzioEvA5SfnLs210sq5iCnvr7aDmlmAFcsIkp7pwV4b21XuD9WaubtDBjUwmt
	g8S4EGhbuh0B1e8+oOgjVrywhj4=
X-Google-Smtp-Source: AGHT+IHSjoHELDa5Q3LsghPQzpwmc0RjiSMMfHTRcwPdvOaI4AsbPIqDRVBYIEmj7JtkfxXQkRoyJQ==
X-Received: by 2002:a05:6000:4008:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38bf55bebd7mr17494155f8f.0.1737484302742;
        Tue, 21 Jan 2025 10:31:42 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38bf322acdcsm14365306f8f.55.2025.01.21.10.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 10:31:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: peng.zhang1.cn@windriver.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] lapack: add PACKAGECONFIG for cblas
Date: Tue, 21 Jan 2025 19:31:31 +0100
Message-ID: <20250121183133.23102-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115007

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index 4357515b71..aafcdef681 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -24,6 +24,7 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
+PACKAGECONFIG[cblas] = "-DCBLAS=ON,-DCBLAS=OFF"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', ' -DBUILD_TESTING=ON', '', d)} \
-- 
2.48.1


