Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0309EC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:44:34 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.25830.1653299070891900709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 02:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fVhCGpin;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id en5so18381506edb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfCYCSPVwoe6EAuO+t7GmR1Ahq6oBw3os/ANxj49vcI=;
        b=fVhCGpinAyYUZfVjTSUpJhDNN0B/2PAwPVovz/Ze/OkQtnJbtPcMUiLChtvtEX9CUe
         YR3VjchBc0GWMpCItaoV5SWPgBIHVF6uoCWqTpsfR60ONnXrabozUmG/KLdMpAx3kFTj
         Og+72mpZZENRm29gu1daQNeQwH5b1nCcn3kzooPmi9yeYRiOJfPmd7LvxDzTqUfazfv7
         f5MWF7wPQ+WdQFWs6pbDCgCiWc45M/J7yjti+vCGDTTW6wFdYsrCjoMmoTDp9qFufMnl
         s/ZsJyKsM2i/K9P1JxNh9Zx6hRLMvKXpItZBHOUiLGDYBSRgSeuPY6FHPZXft40hhdlu
         KbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfCYCSPVwoe6EAuO+t7GmR1Ahq6oBw3os/ANxj49vcI=;
        b=cTvDZf3XgQ85IcH1JVB9D2Agg47Qn3pakMAm8B9cLhvi1AsOjDU25nt1VAjtpajJN9
         LMMwJC5pZ4KkR7n2LZO8A9uXs2ZjSM7fjDcgSHKwBOybks2+LzU8Tr9QXg9ryDbmMlr7
         ymKQ99UOUC/4+fkfKg7UtHfN4IUdDWdQPsSoa7UQipwYdUhdJ49bOInq+3kiiZ/5K0rF
         AaVyem9CIzxP6/MRNxMlXCNGhjS0XMRwMfPa8s0vPzEf3FPq/GhC1LRVBVWEB3up7FfZ
         M58zdU9Ei2msbQEMZSydhE4OXN2J5h/Jiuyl0+psJ/4DMAcMTLOB9HrQPw7QR4RkjpZu
         5rBg==
X-Gm-Message-State: AOAM531KOYjW623w4q9FScge2PFGE6wMVtZ2heDK81f9pTzGEwYmp4J3
	26fm/RWHi26UQvtqtWmjbVg4H/IsNBs=
X-Google-Smtp-Source: 
 ABdhPJx9edIp7NqCtuXjECsJp4G0fm6UptNEc9+9AIdwo7+0bRrIVTa3aZcGh7OJ83IBWveTq+y8Sw==
X-Received: by 2002:a05:6402:5193:b0:428:414d:e20d with SMTP id
 q19-20020a056402519300b00428414de20dmr22623125edd.173.1653299069224;
        Mon, 23 May 2022 02:44:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 i2-20020aa7c702000000b0042617ba6380sm7959177edq.10.2022.05.23.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 02:44:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] mm-common: package the files from ${PN} in ${PN}-dev
 and use allarch
Date: Mon, 23 May 2022 11:44:14 +0200
Message-Id: <20220523094414.503671-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 09:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97230

* based on this bbappend from 2012:
  https://github.com/openwebos/meta-webos/commit/f4745112438a5ba1913708b6b6ac30234ec8076e
  time to finally get rid of it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/mm-common/mm-common_1.0.4.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
index 33969ff7a2..1ffdcfd045 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
@@ -6,7 +6,23 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
+# All the recipe does is stage python and shell script, some autotools files; nothing is compiled.
+inherit allarch
+
 SRC_URI[archive.sha256sum] = "e954c09b4309a7ef93e13b69260acdc5738c907477eb381b78bb1e414ee6dbd8"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
+
+# These files aren't very usefull on target image, package them all in nnPN-dev
+FILES:${PN} = ""
+
+FILES:${PN}-dev += " \
+    ${datadir}/${BPN}/build \
+    ${datadir}/${BPN}/doctags \
+    ${datadir}/${BPN}/doctool \
+    ${bindir}/mm-common-get \
+    ${bindir}/mm-common-prepare \
+"
+# ${PN} package is empty, remove the default dependency on it
+RDEPENDS:${PN}-dev = ""
-- 
2.35.1


