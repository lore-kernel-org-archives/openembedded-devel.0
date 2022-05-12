Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5523C4332F
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.1832.1652344921868276804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=3fwnOdHz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id
 r188-20020a1c44c5000000b003946c466c17so2034044wma.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lP8L4Zoxl3JVJoU3sA6TK2Hy1UJh6HYyh1XVbB5SzeQ=;
        b=3fwnOdHzMe7DXxQ/fu4xKEk0mQTsqcpZ/VpakKWnIZATmGRr6XDZrmy4ZNASwlLPP8
         9wBevvU9nkNuxC3OYp01Im7CxLRetTav3anm+QprKyFOoc/SQ2JwL5dCLNX5HwcHGyYa
         N2EQKzzsCQT5DIHZ31jB8lM7/TL1JEU9p+lU0lyTUG0SXae5giNcl92F63oa5jLlGpnG
         Yuaqcq4XwGCZIxmgkrIn6EYUB+8a6bsSF37dTYyzIAu19mDFwATbFvOgd8l6oTIApyby
         VowIFd1Ppt/ZtkK1GlpGU+8p3ImRzXSzVNTWyits/KW6aSeVuqSQMwUTZWotAPy99B8j
         JIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lP8L4Zoxl3JVJoU3sA6TK2Hy1UJh6HYyh1XVbB5SzeQ=;
        b=fM6Lq3U27LNlLRcWxVcnpfkgyW4MdEp94rNcNxO69JmRbqwiLkhCiQfY/MsATAHTyy
         D+ZM6P9PPGwcbiNURZdeSycr6kxnt9RcAHneF3f8alW58L8sO1sbAKXpO4xZ59ws7k0M
         6rIoOtbwKw+WpRjdUg2H3P6UvxJaEVx6CBJBtSWiwenISHo/IDi0F1x4Mo4lK9xN7ihG
         fHCnjfhXnQqprJfhrRrH5BkNJCuXMmDHRD6DZTFiBieF/0miWvfz7F8SSsnA5/kgaPGn
         OrwUQ+hlNp1LMf/VEYXxuj34JO0tkGK5O+0pJHSV8n56px82AQIPvx3vZtesf4bQEUcJ
         Tw1g==
X-Gm-Message-State: AOAM530fqR5zCQycHuXMKTNKLE+JLDVJgc2C0xwHhU0i7HeguMKXjRc/
	wxaVJMSIkBl6ff92r7rwpzuexg==
X-Google-Smtp-Source: 
 ABdhPJzsRaroKtrWZtWHS6KdJWyGLEA2nUoElIRkXuoqytiLSncDbJAxpLfrodF6zHsFkh88xnBu3A==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr8751091wmk.109.1652344920120;
        Thu, 12 May 2022 01:42:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:41:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 01/16] python3-toolz: new package
Date: Thu, 12 May 2022 10:41:37 +0200
Message-Id: <20220512084152.1388464-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97049

Add a recipe for toolz: a set of utility functions for iterators,
functions, and dictionaries.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb      |  1 +
 .../python/python3-toolz_0.11.2.bb                 | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bee529805..5edec8f68 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -405,6 +405,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-thrift \
     python3-tinyrecord \
     python3-tornado \
+    python3-toolz \
     python3-tqdm \
     python3-trafaret \
     python3-trafaret-config \
diff --git a/meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb b/meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb
new file mode 100644
index 000000000..a597641e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A set of utility functions for iterators, functions, and dictionaries."
+HOMEPAGE = "https://github.com/pytoolz/toolz"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
+
+SRC_URI[sha256sum] = "6b312d5e15138552f1bda8a4e66c30e236c831b612b2bf0005f8a1df10a4bc33"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-math \
+"
-- 
2.34.1


