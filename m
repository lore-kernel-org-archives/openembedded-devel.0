Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7B8ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 09:54:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.47366.1661594086172707788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G5erMvAP;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id m16so4424419wru.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=S/dIY+3Wsf48goRu5AaVWaLnhXFXNAF9Qn1+Xe9H7Vs=;
        b=G5erMvAPdM4AMNqS5DN2UeWWmrq3so2sQUbIT42MpUoT/Z8I2uTRJUH1oWXzrdGuv2
         38SyeXiM4rO7aRbNzoTShAzyd5RWYuOPXXyomDlCJiY61ke0y5V9PQv/XDXMwSNZSG1Y
         Z4/HHjLPoCkt+H5PqxICXLG9Qz8DmWafoIz2LKIqPuK1qoTB22cfeb6DmL8i1s1hMazn
         TFQCWN7FEvXjKY9R9jK8GpgGauJCVGCyFScVilarBnLcuOfZXC4zfSeWFecQpzD8r9N5
         WqxN8Ypn5P6BsFgynQNhF5JoMXhNkcXCWGjro61crKeMd8EnujTGcp249OoudwaVEMIP
         +DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=S/dIY+3Wsf48goRu5AaVWaLnhXFXNAF9Qn1+Xe9H7Vs=;
        b=XtAPPSog5SUus3FbLH/qn9h51G0GltdRb7824IDPzHODfZ/5Sn4KQUcR4r1BiRWB21
         TzW5MiSCWOw6XA2U9m3ijIwE7/+4+sJHNRgQA5DeDipCsPyPgM8zrOOJdr6BFc39u44v
         46RanCzYp4hG043UkzDcSUsjMw06denAvtjAz3ZKFKTLmLtLPbQ1j2fDHpf+bYskQoHZ
         Jyk1wgEbH4OlmO7DnKLgtoXRmQtbRrPff54FS9eWh/zAKXayWhqu4u/4mZsvmVvTm3vD
         RFj4LbuSBRXEiU6s/MvLk8AVOAqD/fuVXR2RmjEHCYz7hAqz73vuIgAa3CclJ2o3RC1a
         84tA==
X-Gm-Message-State: ACgBeo2RY5RBS/5DJ6wGuOI1QncvxpK+dchqwzHMlZ62Hmsd+vuq4QDc
	wzNGHWjL142MsmiZwjbjBigVn+9iEPQOjQ==
X-Google-Smtp-Source: 
 AA6agR4MxQC2NDsne8oHzegSscf9AMZFxkeqoB/Cc0YP0mwWKdKBr9RWYQt4N1HYQgrEQIs6q3Pc6g==
X-Received: by 2002:a5d:5887:0:b0:220:81ca:ec4f with SMTP id
 n7-20020a5d5887000000b0022081caec4fmr1722273wrf.263.1661594084361;
        Sat, 27 Aug 2022 02:54:44 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 z18-20020adff752000000b0021e5adb92desm1926856wrp.60.2022.08.27.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 02:54:43 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v3] protobuf: disable protoc binary for target
Date: Sat, 27 Aug 2022 11:53:28 +0200
Message-Id: <20220827095328.4066280-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 09:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98489

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When applications want to use protoc during the build, the target binary
has to be disabled in order to avoid following error:

|   The imported target "protobuf::protoc" references the file
|
|      "<application build dir>/recipe-sysroot/usr/bin/protoc-<protobuf version>"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      "<application build dir>/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake"
|
|   but not all the files it references.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index 83dabc9f8..0d8648e2f 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -25,7 +25,9 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG:class-native ?= "compiler"
 PACKAGECONFIG[python] = ",,"
+PACKAGECONFIG[compiler] = "-Dprotobuf_BUILD_PROTOC_BINARIES=ON,-Dprotobuf_BUILD_PROTOC_BINARIES=OFF"
 
 EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_SHARED_LIBS=ON \
-- 
2.25.1


