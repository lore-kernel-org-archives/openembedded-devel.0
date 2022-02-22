Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EC8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:15:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.1832.1645557322027400924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVNsd5Gf;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c3so6856342plh.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KOZkho9EnttwQQjZij/HjoZcgmtUfSXuefriOI43DUM=;
        b=dVNsd5Gfy6Sl22zy+QWmzV2/lb9AU5UjbQz5vrwMBWHXnT0IX9DxuCvqDebeMFoKIz
         fxfMX7Qo6miON8/g92LkKjgLinm3nXG4MekfwdpXGxkt2B1L3/5hiKsyrrhhy/JnfkcN
         Ne3FolPUD/b6rCyxpja7u5zWfZd7Z5Ym2V9Ta5ELnhoFvBSiq4YL86J0pARBpNf1Z0AJ
         XNxKV4TzflLIJU3l7ES1z7gG5nf3eHun+neb56oDduVfE2ECO1/ZQ9RnRwqRGreGPuZC
         dO8d8n3Vvh1EEq772OcrIvqB5ISj8t+RLw1ChQbys9uMHglD8ZgJcvmjnwjZZl8e4sqA
         cB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KOZkho9EnttwQQjZij/HjoZcgmtUfSXuefriOI43DUM=;
        b=IlWNrY9yeiOtV2ky6vw5TGLbrj08OudWA/jVbV4vs8jVP5JtNZl/e/n84a2OUZE40h
         jPPLyDtwP4GoGPX1xJ0WqtIitna1hAkrSav3SEKqJBore/PbcaX9Lp+EC2M/brsqoLAf
         P/MdCr8qp7owNMhRkhGbqv3BIcUBDFdSBz11cBLthkJMeSA6WB3jhBe3a5IkoezPrCry
         tJny54nq04Eq4eKT/6YWD5lkW64kXFFhtXB5fNauQfjZ0ffJCKo0v3bYMpeDnI+G9K5K
         yRN0irHO4mWdBtQ10c2/EIVFfhP8gumPAcP3vZZTg/tsNt3WYJPnwh3AO37STBJteX5I
         0l8w==
X-Gm-Message-State: AOAM530sSs3/1BvwB8FI0e1ZwpB5Zu6wobWbqQYisZMKq8OZ0lIRFC9x
	IRqodS0S24URvezNwjbaw3I1HGQcIA5JjA==
X-Google-Smtp-Source: 
 ABdhPJxfQnjHeVul96bcfePVU2u/XsW728T7T2cQQzF2uQ5OYoWvm0JGhm5nFmWDh3X3CTjL/8YJrw==
X-Received: by 2002:a17:902:d103:b0:14f:a3a5:3974 with SMTP id
 w3-20020a170902d10300b0014fa3a53974mr13443728plw.74.1645557321249;
        Tue, 22 Feb 2022 11:15:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 p16sm19169973pfh.89.2022.02.22.11.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:15:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-wheel: Delete
Date: Tue, 22 Feb 2022 11:15:18 -0800
Message-Id: <20220222191518.2413565-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 19:15:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95450

moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 -
 .../recipes-devtools/python/python3-wheel_0.37.1.bb  | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 319d49267c..a8a09b4d56 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -462,7 +462,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-websockets \
     python3-werkzeug \
     python3-werkzeug \
-    python3-wheel \
     python3-whoosh \
     python3-wrapt \
     python3-wtforms \
diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
deleted file mode 100644
index 6c7a31db9e..0000000000
--- a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "The official binary distribution format for Python "
-HOMEPAGE = "https://github.com/pypa/wheel"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-
-- 
2.35.1


