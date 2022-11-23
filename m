Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF011C4321E
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 09:40:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.16478.1669196427850638847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 01:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OgkG+SnH;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j16so27321095lfe.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3nk5X67iqbc92JdTkxATX9SrFRvkhnesVtBE1GWtag=;
        b=OgkG+SnHnCGYsrEh8s7OQV1kuReVDYexjdBq6KPSCusOx0rK3tPa6Ln6XEQaYn5Fb6
         3uFY0dx3sZ4i9cGgyVZxEBImQ7za4trY45HCKtUdB7LxkLJUV+rWoWSws4ClUtJMr6Ce
         M5vAyTjsIo1T7oCz8B6m4ywHQd+7oPL1khBmsHjKwu38ZZIocASlc+ECD/B0WvwLgUAs
         xw/yF9EQFRt+JcZZl1V0japKtp5skbGZjIpEzTxuaPqrGfghcYvkD0ueUly9vQqS/TGH
         nHyAI81FKi4fqmuz8hDzUiXsbLonGcLbhxFjKegTd+ZiyiLIhY643uxweFTmkz0Bb/tt
         OScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3nk5X67iqbc92JdTkxATX9SrFRvkhnesVtBE1GWtag=;
        b=LufjSXpVarCzAFwxYzaULMgnxiLdibFptYJv+9dZ8alja0y/Wcov/Pt7iYUhgqO8JU
         5BlxCrp1xeeUxHdAlzlhVBybPwlOfggr2iaxOxd9Ny7UdkHDDOecDF/BfFnHbcxi7URs
         y4i4CFRIFCS98O2ikZgIzJauPy4tej1gR2gTzJS7oOXJRYizlDSOk0xD9BFHzFL0rIP7
         Zl0ok5F+xa9dWL2pyddd3zl9tLHt0WEdHq0/R6qY1aV8bmyO7BpCDeH49SGf7dG1+95H
         G8da7gD/QtE00udvsqqWQfL0FVze/J5DFa899Nv2RgK/0ditmT0nfTo6lGrEfeBT163k
         cz5A==
X-Gm-Message-State: ANoB5pnC0MuiGQjCjlU27HXNOlg+5chRk4nI6clTeringxlDexdBL/oE
	uP+GM4L2E4wlVcRLCtdfc9bOugGzk4Y=
X-Google-Smtp-Source: AA0mqf4EGTqyrbnf39Wv85RHiu7Pva7FubjQtYnTIktOIUkpe0lHZWvIfdtVsNaIOxAgQuHWHanltw==
X-Received: by 2002:a05:6512:1042:b0:4a2:46f6:6cee with SMTP id c2-20020a056512104200b004a246f66ceemr4311966lfb.642.1669196425346;
        Wed, 23 Nov 2022 01:40:25 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id y23-20020ac24477000000b004b4ad5ee601sm2856458lfl.255.2022.11.23.01.40.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 01:40:24 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
Date: Wed, 23 Nov 2022 09:39:57 +0000
Message-Id: <20221123093957.3029576-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 09:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99700

If protoc is enabled for the build, recipes using protobuf will
fail when protoc is not available in the recipe sysroot:

|   The imported target "protobuf::protoc" references the file
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
|
|   but not all the files it references.

Use SYSROOT_DIRS to stage the binary to sysroot so it's always
available for other recipes.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index c8b9158e6..201908f3c 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -92,6 +92,8 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


