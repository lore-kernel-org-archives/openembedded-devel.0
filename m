Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A215C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:08 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.25039.1647823867497556478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pZAaEWSb;
 spf=pass (domain: konsulko.com, ip: 209.85.160.176,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f176.google.com with SMTP id c4so10910012qtx.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=69hLbWH+v5S8PgmYkQuTZHiu960eg3xDE0V7Zt899cg=;
        b=pZAaEWSbN9B0evyavWgOy3l/Ev1nuIL4S+DsBpiI9vrHG+kZZyZhTlfQi6BWtuAG2l
         tVG65a7jBWdiMss4WfEUpjUW7Yi7ARBcAGih7HJiB3XnagPeRuUoPER198AH5nHjfUO9
         IVtmU8C/a/Fwl5xlJypO5asokj8pT99MJ0w/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69hLbWH+v5S8PgmYkQuTZHiu960eg3xDE0V7Zt899cg=;
        b=bdPIb0KveheAM0FAgYCs+Rrgo53sUaNoOn1MT16t0SIKZyW6G3odafabYJsuWtb2hp
         HFZhHLxVAUfpHJZQShV4DaC5TFGoFYv1ELpVOlBuZ+PqWvp5BanKhpa5dXRBNAgyYcQ+
         sTezPGJFQ1YpMf6py42BLQVIhqKwGh8+RvSHqcBcgtnUHsh/ZtaHG82ZoEJ49+zRFL00
         wPn52G6VrHY2BWWCn28qy3yDd/8eE9dhkBkIrRaCbbOCXoe53keturL0cR7XbU9mMgvn
         hwfEelYykQdITOH0jl/OHrG+L27Pk6l0O2W0Y9XhYwyf6CFdgA/3Jo70njKqMACYJgCh
         Ziow==
X-Gm-Message-State: AOAM53076NxkjFLIjyJxQiWEP/cbF4oaZt84zJnyXdg2rhCyoVVOdzM4
	57auxzjyctZ2oNcSUEdgpqlkJurfnjeLdw==
X-Google-Smtp-Source: 
 ABdhPJzRTQy1ipNM7QwXQzT7/aoqXpMTo6aXMKDoK8qvqSal+lFn7779h0pFJu4L1cKpUkHWORfVrw==
X-Received: by 2002:ac8:5dc8:0:b0:2e1:d241:b6b5 with SMTP id
 e8-20020ac85dc8000000b002e1d241b6b5mr14561494qtx.672.1647823866341;
        Sun, 20 Mar 2022 17:51:06 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:05 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/8] python3-babel: Remove
Date: Sun, 20 Mar 2022 20:50:35 -0400
Message-Id: 
 <0f6b5fb760c81910a9c64d9bfc26b449f1c31b3f.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96092

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-babel_2.9.1.bb             | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-babel_2.9.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 207ab3603..78722682d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -43,7 +43,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-autobahn \
     python3-automat \
     python3-aws-iot-device-sdk-python \
-    python3-babel \
     python3-backcall \
     python3-bandit \
     python3-beautifulsoup4 \
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.9.1.bb b/meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
deleted file mode 100644
index 11c8d6010..000000000
--- a/meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "A collection of tools for internationalizing Python applications"
-HOMEPAGE = "http://babel.edgewall.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05fb707293a85504aa67afc8ea34d747"
-
-SRC_URI[sha256sum] = "bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0"
-
-PYPI_PACKAGE = "Babel"
-
-inherit pypi setuptools3
-
-CLEANBROKEN = "1"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-difflib \
-    ${PYTHON_PN}-distutils \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


