Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51B9C77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:36:47 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.3368.1685151398500542888
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 18:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CxqhXNZ/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-528cdc9576cso913247a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 18:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685151398; x=1687743398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj4Y5nJDS6gffq4ryENeunuakfyOBk8cEkmBrq0f7Os=;
        b=CxqhXNZ/wWCPTSVz2f6UPIvtyy3S8OJ/RSZOE8JaBfacqrN218S16ZYcSBEtxQe1yP
         Gl6P8F6o+SzkL62CDdDmOLvNaSN6NDIZNNJvrC28YFOgXGcagyZjBm6CRkPnbWdMBJrY
         j243CofP3BIl6dHI7agY9ss4WJxEBvdokXFMZHDtED5DLmTj1zpVPtNEnF8egTQTiOnX
         0VylsvQWfF2VnLVXoIJGt0iLGTBC4tW6doh2MaglepyPxLvtmI7OSVWgQv32b22IYMMQ
         zrLuGSGuRyOZbCoEFD8t/iF+l53ogH8MQZSKR0lpG1w0QmIE9paJaS9zH3f/f+XvyXo+
         xLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151398; x=1687743398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj4Y5nJDS6gffq4ryENeunuakfyOBk8cEkmBrq0f7Os=;
        b=dyIpDznrdAKhVwO7P17UEVvgigWfXyQviFGcKUiCMgEnwNj6E/z827hUVVgUARVFEG
         qJWSq/iS/yl6moBThR7eZ6VtFSMXgZkno45NdSazRrwYEMoq6lqPXumnvZpGKqKO9bVO
         scQGCBusljbm/CmXTb1XndEO0lQhlR+6diYUHbpPIbKuWtUTcILiy6v8S+e+1Etoxaga
         sqhsVgEwYRQnNVFulpeZjz4rQk3jzBOqALlOZQ7guYivk0n+molWiUtMscsbVAq5SFVw
         VbetLSCp7HuCw2Co0SHfn9Jwa1hTp1YFPlRyjT5TMozFBMQYMerOYqK6EBfqLoGhUc/2
         DzcQ==
X-Gm-Message-State: AC+VfDxUA26hrROaqlscWPzO+Pj34/gLi8QOEgoAVjR5ImlQokg+m1v+
	829CbUl+3+rXg4Pyr9YhM/T0H9hLOqE=
X-Google-Smtp-Source: ACHHUZ6Ceknt0Y37GOaQ0hfH06g+oOIk5LvqX4Ct9hR9rHiNn/KY2Edg+7JWuH2nyv185fyFpvWRXQ==
X-Received: by 2002:a17:903:453:b0:1af:fb59:6a5 with SMTP id iw19-20020a170903045300b001affb5906a5mr4387984plb.10.1685151397654;
        Fri, 26 May 2023 18:36:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001aafe4f9b8esm3802191plp.180.2023.05.26.18.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:36:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] lshw: Pass OE cflags via RPM_OPT_FLAGS
Date: Fri, 26 May 2023 18:36:32 -0700
Message-Id: <20230527013632.96030-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527013632.96030-1-raj.khem@gmail.com>
References: <20230527013632.96030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 01:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102878

These flags are needed to edit absolute build paths which get encoded
for debug informaiton etc.

Fixes
WARNING: lshw-02.19.2+gitAUTOINC+42fef56573-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/lshw in package lshw-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
index f2de593cf1..6420c7e325 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[sqlite] = "SQLITE=1,SQLITE=0,sqlite3"
 PACKAGECONFIG[zlib]   = "ZLIB=1,ZLIB=0,zlib gzip-native"
 
 # use the PACKAGECONFIG configurations arguments
-EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} RPM_OPT_FLAGS='${CFLAGS}'"
 
 do_compile() {
     # build core only - don't ship gui
-- 
2.40.1


