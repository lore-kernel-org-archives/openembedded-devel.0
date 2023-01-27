Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68763C636BD
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.101353.1674824555733224485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FsWUL8C9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so3417766wms.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VGQY7A3BdxZGGH0Jvp/zeq29GPuTRtyhq2jvulsAvQ=;
        b=FsWUL8C9GhOCIjl8jjp92RU2puBYeHWw6p+TgAsZJGHF9GTmu4UII7CS4GD5brPnE8
         af6PyEa4ewFaRGMwBE0I0OllqCAZinKggvBh1/zaeGhUZar84fZ7sGDFx/sg8Sccbq6L
         K62DYWOsBdT9ReDjjuk247K1WcTff++5BLWjOjHTqD0T81RUq/ufoQrI02s0Sly2vrkh
         TZ9G4R556KSL018KT3/BQWepUFdW1cm+vKsG/H8vuTgSjRajR4Zyoe7kWzBW7//hFXc5
         /Ph46OMGX11S836JlnI1zjSa5GC337he9Ff6FlT6g9AxEOYGaUTloOZUoAp4d0+CvnMW
         uB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VGQY7A3BdxZGGH0Jvp/zeq29GPuTRtyhq2jvulsAvQ=;
        b=WSmfSlgXMfvEAdoj0RJszMPOdd+LJrkSw6Jhvjev0MMMsusmlmkumMCzwzs+YxK4+z
         +ypsBpRmimpG7bHZzU50rOf8+EvwAw0g0X8zhTLVpiuVHZ6md2hB7yyvH0U/vAKODpt0
         Ycgs2qCdykTOWjjpIKsNV6RDkGSh/Spfi7qKzqhTIUDCxtRlqT3B2Qo+Xa2xv1FTgZXK
         b4B9okKTKQCALJ8eGSOIZpyHeAmZIB1S6635hpND4XuvKii3kCTV3m39ZDPd+kYqPoRr
         N2LVfH65pZ5iVXIirDij5ShheDeqJv0zds/2QZRnoxpmn8UskX4fatyxJnkNVXU1qrJo
         fhgw==
X-Gm-Message-State: AO0yUKXQ23KtTlqjGq8U/Dn7jv5D/g9YZRlb37OiaQSRjn0hq2zUyXlT
	hE9cVYUZ/ic9jCZ5aTDLszk8JccUJHk=
X-Google-Smtp-Source: AK7set8JaLCVFyYe6ZuSlhLv2XgIMvhjSPe7SYNCHj3Udbwf6shKPQJKr3VOZ8DKC0R68Bu10mVdsA==
X-Received: by 2002:a05:600c:4e8b:b0:3dc:1436:af5c with SMTP id f11-20020a05600c4e8b00b003dc1436af5cmr13905268wmq.31.1674824554171;
        Fri, 27 Jan 2023 05:02:34 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002bddaea7a0bsm3897867wrx.57.2023.01.27.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] android-tools: fix Upstream-Status formatting
Date: Fri, 27 Jan 2023 14:02:23 +0100
Message-Id: <20230127130225.1280161-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
References: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100819

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...5-libsparse-Split-off-most-of-sparse_file_read_normal-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
index b3893f0c80..5009c73a05 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
@@ -8,7 +8,7 @@ This carves out the core of sparse_file_read_normal and splits it off so
 it can be reused in the next patch. No functional change intended.
 
 Change-Id: Id00491fd7e5bb6fa28c517a0bb32b8b506539d4d
-Upstream-status: Backport [95657f3e5976d96073f7bbfe3a49192509999d1d]
+Upstream-Status: Backport [95657f3e5976d96073f7bbfe3a49192509999d1d]
 Signed-off-by: Sean Anderson <sean.anderson@seco.com>
 ---
  libsparse/sparse_read.c | 21 ++++++++++++++++-----
-- 
2.39.1


