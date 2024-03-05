Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BA4C54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 01:11:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.10765.1709601092834150044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 17:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHE7cMW+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dcc7f4717fso51485185ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 17:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709601092; x=1710205892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UBWEHJTSXJ/lV4THnezoDdfxWlw1qnaVGC65z0+bBg=;
        b=CHE7cMW+ekEBmjDbHuB5K7T5AAsAI+rjXyEOhBQ5XmiMGdXlc8TNAxep4UHdFIGygk
         diRcx5LyQj+ZDYaMi71Uu6PIZ4l6HUuSnGHg/+itDv24C/Jnfb1NQQDHGgauWPfXePT6
         Qg905G7qmePVWgc0dtKH9K1LwJUe81D9O2LIopdStGBRuWHmeKPr9nqlMd17iIPX6e0f
         //jjpdomjCMSwydf1htx8+AXsMAdXy9dikYBHMZ9qyE5K1+y6XEL8uNOsvKPKyvbDVMg
         GAyBr971SHgO/HTjd3JETqqlKjpvl1GU/zc40AMJrtTpeL9U/17Wzam5/BaarZWrEauN
         VVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709601092; x=1710205892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UBWEHJTSXJ/lV4THnezoDdfxWlw1qnaVGC65z0+bBg=;
        b=Ugw37Ya9XtvUroQ58yY8Ts9UHru+NyLDpV9ZMN45qENUU9RbfIJTe9tfPhEJykF5U2
         +sL4cEP3UOgqMUp8f9XcS+XmO4BcOO0jUlFqywDs5brWhiV1QlD3j7PH6FD4Kf02ly21
         A8vp5BJ33ABq3LdlD4HN9KdRBJZQR6ozJ2zx+P7NbxSQ0iew/LNMMJ2/oTdlTOppe0jg
         GpsGc5DqgFQnT79eHukxkDTQD5haPwemofOTIZ3uSF7TaR+hW8ENq4K2itAoTiQdy8KI
         LjC6YgCzxH0BW2Q7Xj9USp8lnws0Oh/WW7FjU3GC1wzaEA0Fisi886Y9ZjnAkEaxpG5l
         cOCQ==
X-Gm-Message-State: AOJu0YzeHHdEJoGSpE9x7rfhVWXCXHGTIduCJjeDYQPCCo2lEFSMUafF
	AI3gVVYw9epaulqjfc2DziYepnS6WQ/l0sQnPtJb1bpy5VzfTmQEAqZEbG7w
X-Google-Smtp-Source: AGHT+IHJqbkdnk8hWJzvcjD5OoUgrKhoKtwRNB2bpvSGHPQYoT2KwUxLEkM+vkTA1Tg+s+z0yzj2TQ==
X-Received: by 2002:a17:90a:53c6:b0:299:7120:e08c with SMTP id y64-20020a17090a53c600b002997120e08cmr8297011pjh.22.1709601091797;
        Mon, 04 Mar 2024 17:11:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::97ff])
        by smtp.gmail.com with ESMTPSA id db12-20020a17090ad64c00b00298ca3a93f1sm10865160pjb.4.2024.03.04.17.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 17:11:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] e2tools: Delete unneeded files from ptest package
Date: Mon,  4 Mar 2024 17:11:29 -0800
Message-ID: <20240305011129.1239086-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 01:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109107

These files are useless for ptests, moreover they cause build QA errors
like
package e2tools-ptest contains reference to TMPDIR
QA Issue: /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in package e2tools-ptest requires /usr/bin/sh, but no providers found in RDEPENDS:e2tools-ptest? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
index a80b6f5985..1fa5e01874 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -65,6 +65,9 @@ do_install_ptest() {
     cp -r ../build "${D}${PTEST_PATH}"
     cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
     cp -r "${S}" "${D}${PTEST_PATH}"
+    rm -rf ${D}${PTEST_PATH}/build/config.log ${D}${PTEST_PATH}/build/autom4te.cache \
+        ${D}${PTEST_PATH}/git/.git ${D}${PTEST_PATH}/git/autom4te.cache
+    sed -i -e 's;${RECIPE_SYSROOT};;g' ${D}${PTEST_PATH}/build/config.status
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"
-- 
2.44.0


