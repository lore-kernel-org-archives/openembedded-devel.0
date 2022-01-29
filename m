Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10255C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.6391.1643466076154360976
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khAd4w5X;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id q63so9266092pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=va/gC7C4f4DXjsGVMwc4sXAyLbZ32JyhtK81uam5rWA=;
        b=khAd4w5XwQzIks7JeHED1jp2TpUgoiaj5pfYhAmXe7GvRJlSxUvLLXb9lgUmOGOMF3
         fgsov8Z8ivVIzBKaTPmx2wYCVADFPHIFhH3pDmejdoX6mgGyJkt25FStzjzJS2SQqeO5
         POI42WmUbmCSuULEekZHUK0uXYCpjIdphL5wKy+hLeLYxnBbLrMEIzEaBS8KdS/st1H5
         epqvNscJVzr6tbl1RP0EJPUilz82DT8DKDOIYw2gmOwR6/p7UZ5Mpe8C6yKWQJAjRP9x
         tAPgk49FUadeLaCBWnyuVYCw3C0ENnEzyGV1BBV7nwJ3v5wRWehZNexpCAGLyV2GXSe/
         qPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=va/gC7C4f4DXjsGVMwc4sXAyLbZ32JyhtK81uam5rWA=;
        b=5TUCsBMhF+YBXJXG8hEuuJqmTjAcnAePqTlYhqqjkrIrNrtwu0CnsA1NdIl/iczWF7
         34PWbNzpn0jsWJMEGflTEct7SNiPzzcTjaTi5VVkja85LswHEuM5fLCyoPfuORAs9GDM
         AJo4/NISs+A9jfb4Fnb+Xj/L0irfWCAFMbv2lTpNkJxcsoPa2tkEBYmWTrT0Bl1IfVxI
         lymEkXX10gm+wvaWSKoFdgCvehj2291gdgdGQxF5MxDVbD+gzNKsIB/rtCQ0GPwFVRYk
         sa+9LmoARJ8x7Rs8lppJzIynDpJgFhBSe7OK//ekt6VivyCYJ87meO3//FpsCVM7XsHM
         ulXw==
X-Gm-Message-State: AOAM5332qRy3Mi5NL3mHJZabA9KUe8R/QR+TaoyN0GJGwtiouxq9iQsn
	zUbPVvDxffBOd8IRJszD67E9PbVjyOPMCg==
X-Google-Smtp-Source: 
 ABdhPJzvhdvemK+Kir7qjxSO/p0IxUedHz5UsPj2xQAp04osiNtlfUnOKMBRgi1X8As7JfxsXG+swQ==
X-Received: by 2002:a17:902:d48e:: with SMTP id
 c14mr13501833plg.1.1643466075446;
        Sat, 29 Jan 2022 06:21:15 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id
 h5sm13196205pfi.111.2022.01.29.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:21:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Subject: [meta-oe][honister][PATCH 1/2] python3-prctl: Use https protocol for
 git fetcher
Date: Sat, 29 Jan 2022 06:21:12 -0800
Message-Id: <20220129142113.3829383-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95167

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index b87a470b40..8426e48113 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -13,7 +13,7 @@ B = "${S}"
 SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
 PV = "1.8.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
+SRC_URI = "git://github.com/seveas/python-prctl;protocol=https;branch=main \
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
-- 
2.25.1


