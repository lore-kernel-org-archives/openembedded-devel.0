Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A17C4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 08:00:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.37836.1672473622967768271
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 00:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lhxXejoX;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id 18so3503197pfx.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 00:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhSJq3HRKEp7tVgsy2hTSTMOf0VzwNJuufvRRtuem68=;
        b=lhxXejoX8Kj8eakQMnb32jKicACtvysoz4F/RGNOZk9KVN1mT+TAy49ojyN5zFV7d0
         BBBNkp9fFZt2GCIe17aPPR1Ub6Ib6uKWq4qvQ+qGVPYPXt7Ueo1Ji3OuO+/00FxBxloT
         Letu/iczMyw8B/PRbzY2PLKqSd8p624RRUct/WTdJEcEFwxq/ja1iMvaiBBu4fM+Ek3z
         ZeSISNcQqXw//Vow1N77fwvDAZxYi230x822rBArt3LsZtjtNAE7Tj13yzjqqcBD9aL2
         EcgKm9Py72p49+ANJnXrjjL+8prR9pnjNSDiVh8ktEjAgj51gTCq8yiSkaIVE27cubZe
         mxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhSJq3HRKEp7tVgsy2hTSTMOf0VzwNJuufvRRtuem68=;
        b=oXEtFn78uQGQL7ti7ikqgvSk4WU1aiBdcSu+t1FXMsBEfqOJfFBYhrcw3Wg/NkFCaJ
         ulqY8vhWawDG5Djy+86IYaQn6gcv+z2o7njrz78XxCZv2oB0oDx3NqKCsE3IJ91bppf0
         EMxN8cImEruByHf1Am+xj1Zv1tvWNF6Mtp+3etc/3Czrq2lv9iKYEA5R8vc7rJwR61xr
         7BoVoy7fSaK0SFCkDQn1/fWzyAtodoA05TpmqRlWMMXrYpYU13m++fA7A7j/u53zjbxQ
         JdvKVbNX6HjQGq8qgB7fAaxp447Mlh3Q4CrAFUQB0X1Bo5gtKJ3aqWqCJEYmO+kDCGrh
         r3QQ==
X-Gm-Message-State: AFqh2kqimBlQ3i1/cUBEf2rFz93V+0OsTrvDz41EkRjybqMzGfBZRZVg
	KD+ckfwuPSIIBN1bwpo12Humn7guIds=
X-Google-Smtp-Source: AMrXdXtxUrAD87cRse1EHQKxPFDFKVsxNMd23mC4pTZcvL/QM8EzRwnYUEniE656KGpUq4QGSbVFCg==
X-Received: by 2002:a05:6a00:1d92:b0:580:9e0f:bea6 with SMTP id z18-20020a056a001d9200b005809e0fbea6mr26314871pfw.28.1672473622043;
        Sat, 31 Dec 2022 00:00:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id bh1-20020a056a02020100b0049e315c3341sm3883330pgb.61.2022.12.31.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 00:00:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Define -D_LARGEFILE64_SOURCE only for musl
Date: Sat, 31 Dec 2022 00:00:18 -0800
Message-Id: <20221231080018.3097679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 08:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100320

On glibc this breaks build when using 64bit time_t since zlib ends up
undefining _FILE_OFFSET_BITS when -D_LARGEFILE64_SOURCE is defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
index 9a3c3734ac..b0971db1cc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.51.1.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
 inherit setuptools3
 inherit pypi
 
-CFLAGS += "-D_LARGEFILE64_SOURCE"
+CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
 
-- 
2.39.0


