Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15875E8181E
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 19:50:08 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.838.1695757801229346304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 12:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f4bc88f9fso88253877b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695757800; x=1696362600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWyJDpoCGlpnI9aek0wCUxPHANUWmG4PG92QqydEfss=;
        b=OP/BTFuGfI1Kw3vhk1ambd2lLLdHUSHcFoOJukhbFnvEFXDdAYxGiq3AtuJiK4sli7
         qID3Q3D2pd0dg6dALPLWG1caWHJcJqQRJIV2F+8TObrV6/Rd5Rqk2mHN8lrDVNWoHEZO
         9GE83n0rZrL44H6GXc2SjjQ8ACFNSfEiwHN6Tg/ysKlSflMehd5a+xzp6O96mq400e0z
         I0l0TbqRARvFyNt3LHeFHRqrK5+nAcz+4JrQuIYbZnRtoyMuL9ZvbY+gtH/dhj1inuyd
         E2sgJzrraZGvTvMNnMihqpu6ZRSmxZc22aT7LmDi1XQj2fOYzAkX+mdo3c5lF6eqmr5o
         u15w==
X-Gm-Message-State: AOJu0YztBTTIuf0zkZlL0DugHnMZ3iwhsl2QPdNs9D3XTPAAYhSMg/Dc
	TQAP+CtBPyDeoIbAFlgBXhA6wdOkIT6c7w==
X-Google-Smtp-Source: AGHT+IEY+A5vJEOE9t83Zc+wmp9dOYjI0jV7vUFaYcNvwt14B7TEicx+lzxqe7JxCZSA0Yi+ZmP4Eg==
X-Received: by 2002:a0d:c101:0:b0:58d:7599:676a with SMTP id c1-20020a0dc101000000b0058d7599676amr10529084ywd.37.1695757799964;
        Tue, 26 Sep 2023 12:49:59 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id j185-20020a816ec2000000b00592236855cesm3131432ywc.61.2023.09.26.12.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 12:49:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-async-timeout: remove old version of the library
Date: Tue, 26 Sep 2023 19:49:48 +0000
Message-Id: <20230926194948.1565612-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 19:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105149

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-async-timeout_4.0.0.bb      | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
deleted file mode 100644
index ca61490fa..000000000
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "asyncio-compatible timeout context manager"
-DESCRIPTION = "\
-The context manager is useful in cases when you want to apply \
-timeout logic around block of code or in cases when asyncio.wait_for() \
-is not suitable. Also it's much faster than asyncio.wait_for() because \
-timeout doesn't create a new task."
-HOMEPAGE = "https://github.com/aio-libs/async-timeout"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fa41f15bb5f23b6d3560c5845eb8d57"
-
-SRC_URI[sha256sum] = "7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382"
-
-PYPI_PACKAGE = "async-timeout"
-inherit pypi setuptools3
-
-RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-asyncio \
-"
-- 
2.34.1


