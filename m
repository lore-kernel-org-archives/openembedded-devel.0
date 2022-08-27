Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D718ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 07:55:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.46825.1661586946454800295
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 00:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=on4mew/w;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id h5so4218596wru.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=GWPwboARa+ehog9fC9jdCBWIf+hQr4sIFogkOUtwoIY=;
        b=on4mew/wi76RhHaQ9sRsGaKIvgu4+qiA5HdkkI4DADQ8Zc1ool7fXcw8log2AAqGqL
         7B0CMhlrRs/+NwdWWDmcD/KNSNvRjF2UFMNn1QJhUDHpgARdjAlqyjrz4fuGXce/FonN
         6C5oZAlTDT5tia2P2U5XdQorYVwZDZ2T4gpCouSlGEdXrHcHTJQgOZjDQyMRbt+bE8fs
         h5YFUxBoXha2HCrRJQTbngjxRpEMow1BNCkaK1vdst+301NK1V1vDIJhx+JRbTnXGXTe
         7pq9lsl24PI850Ous/58C3lrE56IIpDX0w1iiGGIOYXDYaDnRZUk7pzEUdsxSWFx1d5P
         Dpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=GWPwboARa+ehog9fC9jdCBWIf+hQr4sIFogkOUtwoIY=;
        b=5HIC85LQs2wDOvkuTSkTn/vwT4cN30CbGfPXvYTq/XyfFubE8q5fs6m1X9BeubS0Ty
         avSIyYFD4U7W/oy6HzYsYS8/f/fajTVPBNY3CK7XcdxQoqsclOo1tz71WCoJddMGbvXX
         DDHxNBxNLLECkkoj+EleYf4DEcHYHYwCiu3x9okQxjoZ09dsLb/kY08KO9zBwnJCOon1
         KedvVdzBnvJfxcX3cuUfQKhU3WN1cCuDZcMUloV9hmWJFBFrQeeuo15NmHBRh0+v66mK
         JXTmbVbpI9QeYi8lT9y01WFvhzYe9/+omvqYW5Ux5CfiWlzqHch3k6aHCJfJ9FAK2rgC
         ngIA==
X-Gm-Message-State: ACgBeo0ElO/6pepSr28DN4C5rhKkBv6LU98IS2hVhsvaUsDI/Cjz8prL
	3nDzUbJ8pR+unqGAzMoqclaxxrA182XTuA==
X-Google-Smtp-Source: 
 AA6agR7Etqer8yqCeQ00+SUxhwwL6pJqsysBMN9C9oGXk4s6lUAblwCZYsC1PH3GUP7LlxMQzVZuXg==
X-Received: by 2002:a5d:6e8e:0:b0:21d:ea5:710f with SMTP id
 k14-20020a5d6e8e000000b0021d0ea5710fmr1617210wrz.48.1661586944451;
        Sat, 27 Aug 2022 00:55:44 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm1697853wrp.55.2022.08.27.00.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 00:55:44 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH] protobuf: disable protoc binary for targe
Date: Sat, 27 Aug 2022 09:55:09 +0200
Message-Id: <20220827075509.3577255-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 07:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98484

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
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index 83dabc9f8..e36179363 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -34,6 +34,13 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_EXAMPLES=OFF \
 "
 
+# Configuration below allows to cross-compile protobuf applications
+# and use native protoc binary in your recipes. In order to use protoc
+# on the target, set protobuf_BUILD_PROTOC_BINARIES to ON in your bbappend
+EXTRA_OECMAKE:append:class-target = " \
+     -Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
+"
+
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
-- 
2.25.1


