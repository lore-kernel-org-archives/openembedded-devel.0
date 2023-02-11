Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC85C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:51:25 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.11642.1676130676797252283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YTZL+Zdp;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j5so3376403qvi.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrSItSJBSCfVwf2s9H8ak+znEgTK0GJn5G480fSPFn8=;
        b=YTZL+ZdpIGpd7g4X1nL9WQvrRNxdObs767tRRmBnaiJhUYRdHOfAwdP82qh7ZUGs3s
         qAVvECRyeO4SCKKpb5tT9UBuRPMS9H4NcoebzbBAOdGG1mz6K67K98gKMpi/3EBNYtzB
         35rAnmnzHKC715fuyDRrkzJ59VIaPRoi/zBo5/wJzB0S+pMetzWVxpgKaB18VWpn1EPC
         OIDMXwGbXT39LAmT9ZEHccT9BHmhNQeACRVnsZUiv1Sl/SWckFQKM6S3AUa+t9wcSaDB
         /BT6Yygyekv+5mNuxG7NvasunOO5/lP4s9Fr3mSZbhE95Fircmx7b9We65c7QEAKLEfc
         Pj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrSItSJBSCfVwf2s9H8ak+znEgTK0GJn5G480fSPFn8=;
        b=4/OmERgHL/C3nmeTvaDnpgwRpKtSYl3hSW/tErxjlb6WpGtIAAAB+N9kaGCJ0C/89S
         4IqxKUzqQAwcjP4me3SkuxMa0FdU/8anNQpaMTj/7t4atcgK1lTG/M6u9+kUz2BnUGO6
         IfUiQ0ynmPLj2TPbO+X2rCaNV983uBIWo3mPf7ZZlscylC2vGvPV4w+thBKSX44WVRdQ
         6QBVOlA+ieVseiaAYmjm6sJAL+0CgjnLrXrIXEWa1Ewa5p/Fer3pYwUSQvb+jvuELR6z
         5huoMblfYd2TmmoQq+c5R2CC0gkexXGg8UjWb076RjNCwMoxun0wGrsVXzABHz3rKiF0
         7PAw==
X-Gm-Message-State: AO0yUKVnfpK6YPz5Tn4RltKeRRgfiGEAqSPV64Oj+FmyRI8iBmKftNbz
	jFC/OU8MLCO+onVAq0jNAow8s9Xqfmc=
X-Google-Smtp-Source: AK7set9iyFogqzHLbIIYzA9ldTxmxTV8ve29PsJJAKo9fezk8+HURuNd+jP3kre4cgNKw+aCyd0eew==
X-Received: by 2002:a05:6214:20e9:b0:56b:f307:4e3f with SMTP id 9-20020a05621420e900b0056bf3074e3fmr33018066qvk.32.1676130675767;
        Sat, 11 Feb 2023 07:51:15 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm5855481qkf.57.2023.02.11.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:51:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [meta-oe][langdale][PATCH 4/4] python3-pillow: Add distutils, unixadmin for ptest
Date: Sat, 11 Feb 2023 10:51:11 -0500
Message-Id: <20230211155111.3984602-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211155111.3984602-1-akuster808@gmail.com>
References: <20230211155111.3984602-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 15:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101032

From: Randy MacLeod <randy.macleod@windriver.com>

ptest results:
   ====== 3600 passed, 324 skipped, 2 xfailed, 1 xpassed in 74.41s (0:01:14) ======
for qemux86-64 with 2 GB RAM which is the same as seen on master.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 68c81029c0..5a466778c0 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest += " \
     jpeg-tools \
     libwebp \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-image \
     ${PYTHON_PN}-mmap \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-timeout \
     ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-unixadmin\
     tk \
 "
 
-- 
2.25.1


