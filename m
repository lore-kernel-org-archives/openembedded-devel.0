Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F13C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 18:22:16 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.31399.1653330126804794244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f28xO3qX;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id l14so14781973pjk.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bx+HfRl+/wOUtbwGyw7TNJ6HGn6U5rFF/3iwsunbVq0=;
        b=f28xO3qXo9ZkT41sGIGKn7kFlaI8FZY3EAS656QvT8j6Lq/ytAntkpjV29ALkHWInO
         0gjCoJhbfkYKIsuc7RWClxRGAsBOccK0fGBb8WtignFPJzHcFG9YvdUSZeOyBxfLjq2p
         +9EKWxttMHS7SrULw3BN/fKM8G5QnKFevleV9X0Q293GTpi7Zp8Wes+j76Ld+M904vTK
         as/XwGwRzf8m0hgdQPF2iH+6JMb3kWVVm9VW7YaBl+rMurWnZ3NBKgkkvBdg/e3BBfAf
         0Yea3ShqebZJbMWEh9QhAezviSMBR4HNRus87H/srAHjpMEVLe47Kt80CTNP78lhGCE3
         52aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bx+HfRl+/wOUtbwGyw7TNJ6HGn6U5rFF/3iwsunbVq0=;
        b=C0CFOI2RdRfp1oNw2zZhvmtze6FF1NdLuGWV1CU3zJGql5FDkJ291kgzovHA4e4izA
         33isWbmN1/RROWRRBUhjRpTmr2EetB438PZq2kwE0GL4VsXTi2e5ciHsGuv/FO77f0FH
         6S3+JAJ3tJfmWsXp8BUhMKVeXUFa2VNUVKB+xvWKYuwzzqek47t3inY1NMNShzp69aYM
         FejNxYZS84n3zGurMShE8Mqc6mBlsnKpeI9O2yjvT0GY7nyxNx9nHfNvaf5X/6v2pQ07
         28qPhhavdgYXk9BEbZOrbqS4lULi0BHZ5TjtAAMxTOCJmabF8rNons9X4eFFwoLrGcSH
         O6CA==
X-Gm-Message-State: AOAM530PXjFVrW6Tvk2bsiDhArv5BYFQhbHUoWLCmBKulI622xiG70pn
	ushY3X1OmBNQ0fx8nxMmFB+/FpKfLIDGew==
X-Google-Smtp-Source: 
 ABdhPJydAbjDkM+UIDnZu7Gz4a1RPwE5ahpUk14TW63Zus1rJtL4LUx5vcBqUr/wkQlQaMqPwxb1QQ==
X-Received: by 2002:a17:903:213:b0:162:15c2:e4b5 with SMTP id
 r19-20020a170903021300b0016215c2e4b5mr9502458plh.114.1653330126103;
        Mon, 23 May 2022 11:22:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::47b1])
        by smtp.gmail.com with ESMTPSA id
 j2-20020a17090adc8200b001dcf9fe5cddsm2259pjv.38.2022.05.23.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:22:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
Date: Mon, 23 May 2022 11:22:03 -0700
Message-Id: <20220523182203.8969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 18:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97238

Fix build with latest setuptools while here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dynamic_description.patch                 | 36 +++++++++++++++++++
 ...ts_5.2.0.bb => python3-traitlets_5.2.1.bb} |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets/dynamic_description.patch
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.0.bb => python3-traitlets_5.2.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets/dynamic_description.patch b/meta-python/recipes-devtools/python/python3-traitlets/dynamic_description.patch
new file mode 100644
index 0000000000..6d8e4b1f50
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets/dynamic_description.patch
@@ -0,0 +1,36 @@
+New setuptools turns on autodiscovery of modules which ends up in funny errors like
+
+error: Multiple top-level packages discovered in a flat-layout: ['patches', 'traitlets'].
+
+To avoid accidental inclusion of unwanted files or directories,
+setuptools will not proceed with this build.
+
+
+this is becasue patches/ folder is created by quilt. Secondly, define description and version
+statically since new setuptools complain about it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -4,6 +4,8 @@ build-backend = "hatchling.build"
+ 
+ [project]
+ name = "traitlets"
++version = "5.2.1"
++description = "A lightweight Traits like module"
+ authors = [{name = "IPython Development Team", email = "ipython-dev@python.org"}]
+ license = {file = "COPYING.md"}
+ readme = "README.md"
+@@ -18,7 +20,9 @@ classifiers = [
+ ]
+ urls = {Homepage = "https://github.com/ipython/traitlets"}
+ requires-python = ">=3.7"
+-dynamic = ["description", "version"]
++
++[tool.setuptools]
++py-modules = []
+ 
+ [project.optional-dependencies]
+ test = ["pytest", "pre-commit"]
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
index 56ebaac675..588bddbd74 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=9c125dfc5ff5364d40b5f56f02cd9de3"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[sha256sum] = "60474f39bf1d39a11e0233090b99af3acee93bbc2281777e61dd8c87da8a0014"
+SRC_URI += "file://dynamic_description.patch"
+SRC_URI[sha256sum] = "a415578cde1985f1b773faefe49e9f078d345f38665ce3e9e914ec7b41150ce9"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.36.1


