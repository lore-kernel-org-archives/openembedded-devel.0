Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4129D3F283
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.29986.1729278831245676569
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWdO2Pox;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e3881042dcso22464317b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278830; x=1729883630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zotj6h+iuNMHE9Wk50HzaUT9YNEQwy6IvQHhNTbv97I=;
        b=nWdO2PoxTqdp4eEr2SKVu/Z9p1qoPum+RlJY0PM/YEQ9QALULo5+pe3uQB2PCWlz0g
         Yq36oFSoGAPXkH3XVvr1vW43X1ijcZywIjbPQXzeuJCnzPv/gt7SdoWv51B4oq/7Foj8
         G32YD9a6UxXOLac3yXRTkrjwy5G41O00h7E2OiutGmMCUT4lAw/V/h4hfqaUCcTi2quq
         fNaVlYqcwNcFeT2IrCYnxGBtQ9rbILGKqNNy/uXQ0kkpxmKKUGxXBTbXW/VrvFXxsyT5
         SqU1LrnIdQdzn/f4g2w8vaajX03VnwXMyehn7zMzybeI9nqrkr9qrFPS5sBynZt+EKV9
         LqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278830; x=1729883630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zotj6h+iuNMHE9Wk50HzaUT9YNEQwy6IvQHhNTbv97I=;
        b=nVNkU/g6JuqWUj/7acHSqzDuVYRU64zJSm6iq41F7pHlNI79bgFIvYjjeNelhfUr3d
         vZWWJ1B2NlV4DkAqnRrPvQclpd+TUeM80H7dELInY1KtBFiShGIf7wOGP1GGVMAAOG8N
         P1/4fEwJzZsL/koVGQPV0N7LTe7mNm6Kfs7ZXh1Q975dhXWp3TwvBSHDq6wfXNMVg3SI
         jMlp6d+aIsigC84bknCtpjgQALOfGloxLJLXIWHZTBOdk+jwgGfO86GeeQsoWABXTkRW
         1FsV5e4FFdC4/NnAIE1Fo10Wiiy35+QXmZpZrW32rDT27vYYxtW5bPkh6BR0d9I47OES
         W3uQ==
X-Gm-Message-State: AOJu0YzHf13q6cyBc61pdlqxpnPG+UkwzG/NWjUESFn2Rrjm+vhRlxkF
	Vtbv25qT7zOp73n49N8arf3g1EQeprM2GPqsygAxN6ujt6VL/lzqTdoIjA==
X-Google-Smtp-Source: AGHT+IHSKSpgn9yj49u4coLDRbaGMkVJpx99zdE93Tm9rlt/iIRHoaF1wCJZpZwp+tdlJx8Vd3d8Fw==
X-Received: by 2002:a05:690c:ec3:b0:6dd:d2c5:b2c with SMTP id 00721157ae682-6e5bfc3f2d5mr40040837b3.4.1729278829854;
        Fri, 18 Oct 2024 12:13:49 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:49 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 60/68] python3-speaklater: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:47 -0400
Message-ID: <20241018191101.25184-61-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113047

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
index 5948dc859..9d9166831 100644
--- a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Media asset management for Python, with glue code for various fra
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b810770075a29bf44b96607440e7c801"
 
-SRC_URI[md5sum] = "e8d5dbe36e53d5a35cff227e795e8bbf"
 SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9"
 
 PYPI_PACKAGE = "speaklater"
-- 
2.43.0


