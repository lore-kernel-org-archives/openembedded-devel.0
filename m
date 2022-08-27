Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F5DECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 08:00:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.47193.1661587202461425357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 01:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k20NK/Ho;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id az27so4233262wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=GWPwboARa+ehog9fC9jdCBWIf+hQr4sIFogkOUtwoIY=;
        b=k20NK/Ho6BIDyk5102ki6cFXjQ07DNyuculd6wShh1kPQpCaVAdobce0aWwvjoO5og
         tA/ymgt9+QMEeuqaos6pdHB+0L/vGzTuDpu+8s0tgnY4KCBu4fv5mFmd5R7Clrj1lI58
         ZnhDPFOVLQe/CWNH9+hHosHiVD6O2dCH9K6fZIEdFs1RHGtJRS7LvYBjEm9Myf6yqoQa
         i4V3DHFHVyeCw2bK5KsnRx0K9uvHH31hhdvgUlTvqFJI5Nsa33vhsfjsiLRvhuRcC2mk
         jKSWML9Hzs1khotyN/8vE4J+WDmc5m3W5WtPYbrGl7zrqCdFQTL0yum6UH6/IHAnsa3K
         YIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=GWPwboARa+ehog9fC9jdCBWIf+hQr4sIFogkOUtwoIY=;
        b=2FomSAhm/MvPlJKNnSyLZ9l9nx5/EozGSXHzWFIbwvmWRAVi6Ls8FbvZyq9LSx+67v
         YjtwJKjOCM8N43cMk0Cbq2tonyHwB7yh3mrtS2UH2VgPDKxDC/p/4RBGdEi4u79tQKqb
         mH9WvJTWssbjCqLH5GBheSCOYnRzsnDMsWBeeH8lBmZYWqi+9KL/vfPzewAu23ewZ+B8
         7+Lajys3qRBoqFcW/wkaSrd/hGf4CQgmZ5876kwJ7mUEeuXOPYZtMS7vvw0iiPGwtIL6
         QpkZz8+idnk/Kkl7X8DWroarpDmpUKJNi1Dj83PzBYimxMgk79mWeBOAHUscV4sdJIhQ
         LGTg==
X-Gm-Message-State: ACgBeo3myeDkHzNJzKIejX9KNNRYicMG53nBRwB3ksWiwLIGWLg3bj5p
	abkxa4KvdqV6qvmRcR02YMBsl0m9Si33Ag==
X-Google-Smtp-Source: 
 AA6agR5W3vHCybBsPm7yhJpfPh4MYDb5yWwP270H9phhe8RQWZeFIo2a/QpV9q1vnnNuC6xaTTJTdw==
X-Received: by 2002:adf:e549:0:b0:226:cf45:a6ae with SMTP id
 z9-20020adfe549000000b00226cf45a6aemr1627611wrm.290.1661587200774;
        Sat, 27 Aug 2022 01:00:00 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b003a62bc1735asm2225880wmm.9.2022.08.27.01.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 01:00:00 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v2] protobuf: disable protoc binary for target
Date: Sat, 27 Aug 2022 09:59:47 +0200
Message-Id: <20220827075947.3579120-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 08:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98486

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


