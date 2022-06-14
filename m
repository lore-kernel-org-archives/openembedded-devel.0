Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1BAC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:45:14 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.3883.1655196309486049513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgqxKFD+;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id o7so15797568eja.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDXcHzxW5HDW10VLyapc5HB5altLo/b+/3bJqCIoiG4=;
        b=GgqxKFD+0U4b+wCCFMYF9/0ItKbf0thMD4fPFLxlrAizmnia1HTxV94FdjKLlitPyw
         zyIZOnUnZiiakER8WS0EfmxR5LhTLZeKaY17XzYnO2I9ED/NQoxVbQGHm4HL65GBjnDA
         ED0LUTo9fEBICApe0ffCmKSiFgxOAAGjMuCp6D7Kn1VlXCR7p4mqCuxjJ69q8ZxwIdV/
         N4mp3M8L7z+YLJCpne/g4BewtUiVyBu+PDe8XWpsPkgYUKX4f4GMrexLqPfZXvnr3fmp
         W6z408aVS6aDuQrpFTMfo3uon0q0TyYKvdjJWJ4mSje9Uzzjmbik9tGH7gsspnv41k0t
         62OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gDXcHzxW5HDW10VLyapc5HB5altLo/b+/3bJqCIoiG4=;
        b=rU4QSYraBMDxBEE+gj6Rr0OssMcv7nbIT3aEt4iTo0eG83216eYmokvgQV17B+Kztp
         ETl4renJP9OXqdZm2kD//i/KjTyH3rhg5QhGJVnox8ufUaj3NkRKGpuTIWmcXNNfSlaH
         jqOGn4Brn3CzJ8Uu8ANPYV6+hPIpZFifbvmstqgUept0LWulU4sw0xgb7W78qEzKy3vn
         6OB2degL2u9K8Sxbb72YHVMtN7soOzbQ+QdWQPiJypTldmbLT51Y81UdpbDvAhmnBxNi
         JrBlPIhX9QqnMyFyYsj5uzemccu3Bw9hIS8sr+BgQ4ydPwEx955kyyP5xiZldS40nKjl
         0O+A==
X-Gm-Message-State: AOAM533rB3mzrfkuLwyFkN2wtK1IvPlOqxqX23ri/v+BBRjIcudy9DKR
	fAEGq5m9Ckv3vnp1CQxfhijkeVp4fFU=
X-Google-Smtp-Source: 
 ABdhPJyr8PC11G+/bCoq+xOmPWfKRjepyyVD8e7xrF8YYKeO8c8xo2YmaIN9VoFhbzQGo8xbhZ8jeg==
X-Received: by 2002:a17:906:10c4:b0:715:7749:8d0e with SMTP id
 v4-20020a17090610c400b0071577498d0emr3131116ejv.765.1655196307711;
        Tue, 14 Jun 2022 01:45:07 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a1709063bcb00b006f3ef214e13sm4751707ejf.121.2022.06.14.01.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 01:45:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][kirkstone][master][PATCH] leveldb: switch from
 master branch to main
Date: Tue, 14 Jun 2022 10:45:01 +0200
Message-Id: <20220614084501.2517352-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 08:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97510

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb b/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
index 87750ec79d..6afc45ab7e 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.22.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/google/leveldb"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
-SRC_URI = "git://github.com/google/${BPN}.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/google/${BPN}.git;branch=main;protocol=https \
            file://run-ptest"
 
 SRCREV = "78b39d68c15ba020c0d60a3906fb66dbf1697595"
-- 
2.35.1


