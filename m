Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1551C43219
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:40 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.39419.1649096298630209099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwQfiqC+;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id kw18so3300694pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXAPTNq0ktLcpl+fBsyEMLY07iFZ4OuHsZA6mm9zgj8=;
        b=mwQfiqC+x9T8TCaktSHVi34rMXEIzBfECxVdX9iz0b/wHhjBLwjuDhtFKrSbJt4jao
         smStuBRwdvNJP9UlprEZdGVPnbkTp/Ug+w7zSFWjKXFGfO8UDwTwehGo7YoQORpJO9qy
         0gsGPhfQYs8NYlxk3hKCtYbcDuZPNv07yXy68y5q/+pO5jsBnPMCWZ9fz8mzP+A1Wkzy
         Hmi/DRy8fX9ksqAxwfNH2969NTNi1LOK4rdV2fi4TCO0g+pFTumz5vwsygqHf/B26D3W
         D6qFeKKLMZYchXOD27bfJhvoHMRhMpLOdl4K5V95hF4ZD8vE061dYbYQs6fO5Gv/Bn9I
         yb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXAPTNq0ktLcpl+fBsyEMLY07iFZ4OuHsZA6mm9zgj8=;
        b=ZF4IP2oAv7JTx7tDZRDXPBYTudFVkRuJ9i7vQe3gmzJgjm6Zz6PeczYmdHs67uun69
         ouFxfcbTjuSEeHxmY9Ac+WPphsMnfRvrNzvL3ktU2TlBqpvuZqGvQcnLTEqfNWXnwcbr
         a6UtZIM+AgW3f4EhqSXEPCqyAI/WbJ/3v3TnPqs/K7MZqYxowNl5LEqKVmsFjZmDzYqc
         I8y2uoGoT8MHcsQSFPk1lZW5j8RO9EkL6MgIq3tBbPV6HnjiywEdcvFgkxf+48p5dUUA
         VAxCBCb9YnC5xm08AzK/7LuHnAMhxNcMmPFPJN9paT+3hyT0F/cgcy/umkSrPoAM6qhC
         CdZg==
X-Gm-Message-State: AOAM533lhA9geFHyEZSJHSEMFEnHGFDGV803N5q3L6r3QZoGJW0BBZfn
	QfBdoLoD22IuOZsaqCMp0dn+uC3TneI=
X-Google-Smtp-Source: 
 ABdhPJzA7aWyYV435q0NMDWpT5JkBAZy4XWuWW2sv2GPqpbybp5varNZ44nRB1BHG3LDKRei1DTRkg==
X-Received: by 2002:a17:902:f708:b0:153:839f:bf2c with SMTP id
 h8-20020a170902f70800b00153839fbf2cmr920945plo.113.1649096297746;
        Mon, 04 Apr 2022 11:18:17 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 u126-20020a637984000000b0038147b4f53esm11059216pgc.93.2022.04.04.11.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:18:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] breakpad: fix branch for gtest in SRC_URI
Date: Mon,  4 Apr 2022 11:18:15 -0700
Message-Id: <20220404181815.2893388-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96387

From: Thomas Perrot <thomas.perrot@bootlin.com>

The commit 4fe018038f87 is in the main branch, so the do_fetch task failed.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8bb7dc157b248802218fcf80215f80a6c7cd6f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index d85e51ba81..1434e4fee6 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -29,7 +29,7 @@ SRCREV_lss = "fd00dbbd0c06a309c657d89e9430143b179ff6db"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
-           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=master;protocol=https \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
-- 
2.25.1


