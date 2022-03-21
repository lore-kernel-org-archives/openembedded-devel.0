Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA5C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:10 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.24907.1647823869482291901
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=f5wxO9cG;
 spf=pass (domain: konsulko.com, ip: 209.85.160.169,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f169.google.com with SMTP id a11so6979751qtb.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0YfoHsRml7PSO1gHdSxf/VVF3kfis9Uy+1TGaGL6rg8=;
        b=f5wxO9cGnFnwRmAnsM4lo/glMfWekZBi24zwxOPj9u6sPIc3/ZqIciLuyfef9FHg8Y
         KhPbeVWiBIe9e2U0Ug7H3aa9Wz7BB80LDxeoJJ1xHAkOIHiFWz6/vRFbaAVZWHUsBh59
         nxUHWUVPT1FSFcdSRPafk/TnhV6OoQzzWwDy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0YfoHsRml7PSO1gHdSxf/VVF3kfis9Uy+1TGaGL6rg8=;
        b=plEcqX6e0xWa/tdPIIhQj1aQz2Z+1CfOWIYPyXTGQIERCv1ZkO/dyw3CZeyAn7mxJ8
         NC28Z04ypcPJYXPO8YnCJRFJa/qcltiQkXSdxX8cEdrKvUzK+lvZIJontD8ZcF589old
         far91/NQjwtN63LX1Xstbi3G7BCYs1IpkPFPsnkEW3K2PgVUujNB9dZ1lQW7PtX2JIqA
         k8OfkhUWovcLeravMwLlX4pCCA7lYzzh97bbALbs92pvAgGZuq0r4pE/C6S92ZPw+YJg
         9IRjTGG2d2iMJMUMHDhifHF84x71Iuk9OD26mYPhXqrnxnV+HhQKLymgYMVBKNT6mXwx
         GtVw==
X-Gm-Message-State: AOAM533xlOfPAWG4X6r7YqsJPJQYjmzS5XeJcc7avqR+myU8quSex812
	SiUqo0gvZhJJgop5tXhnLhGibEZU57J5jQ==
X-Google-Smtp-Source: 
 ABdhPJx8krgrj7xqmRbSuNx5Md8YTBN7KHkcUKeiNYekc1UCHg6J5ofti1zG5LD8r6raeaFt6brYXg==
X-Received: by 2002:a05:622a:1808:b0:2e0:6d99:a782 with SMTP id
 t8-20020a05622a180800b002e06d99a782mr14691797qtc.406.1647823868300;
        Sun, 20 Mar 2022 17:51:08 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:07 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/8] python3-ndg-httpsclient: Remove
Date: Sun, 20 Mar 2022 20:50:37 -0400
Message-Id: 
 <690ea17dcbfa7031e3017c8c38b588fc1b72fdb9.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96094

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 31 -------------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c7ab10066..9fe47ea89 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -232,7 +232,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-mypy \
     python3-mypy-extensions \
     python3-natsort \
-    python3-ndg-httpsclient \
     python3-netaddr \
     python3-netifaces \
     python3-networkx \
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
deleted file mode 100644
index 6f3c096cf..000000000
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
-HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
-
-SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
-SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
-
-inherit pypi setuptools3 update-alternatives
-
-PYPI_PACKAGE = "ndg_httpsclient"
-
-DEPENDS += " \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = ""
-
-ALTERNATIVE:${PN} = "ndg_httpclient"
-ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
-ALTERNATIVE_PRIORITY = "30"
-- 
2.35.1


