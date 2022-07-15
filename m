Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C707C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 12:08:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.5696.1657886902190382487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YgbjVWSo;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m16so5986876edb.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRMhA3YAXoIhgiamGAa0ahp7sa6vhtJW8VQqau23WbI=;
        b=YgbjVWSolN85QvKU3rzW8n3OZk2AD4tRUcC1LliakyPdnuhxjYG5iFYOvpoEHls48O
         uEA6rlAoARh0kfv0EkWSsOFY8rN1mun253u3tAiap9Mu/rKzfv7qRETZFTO03MaE/IC4
         JGrDaKkbVNMGQd27cKywVuAFQ9KQNZEPDZJH2HZKLh6K5QYqYcVbrxBBTY/NksuWj0Ip
         L1rzywa296ZSYwCjtkHk2SulIGP+9pIc0gFnALiaXX1ui3TKW0t0cy4kURzmDXCMGYHs
         GLxIwxia7JzvvYg+1N2Nu7LrPpUBgnGu9EpxYcOOo0NSDanVFOuuC7URab4Ij/bJssUC
         dpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRMhA3YAXoIhgiamGAa0ahp7sa6vhtJW8VQqau23WbI=;
        b=34V3S4BltKF0OCXXX0VMwf23Lc4SSF7O/1nsKfmXbrvTccwAqPLCz0+VOJKR+zw/EU
         owTwO9E3BcPX+1DC8o6Xd7vauwFAVB/QI8O6sjeiqZWVzFKYqQHPkiqoi0RT+ytyHQOo
         NVqB5iAZpAnDVjKdC6RSSVhK4ubN9R3IZ/o5Vv6jcl1RYgb3bjyQdGNAdAUrCabxznhj
         nXZ5JwWH0SaUuCNYkD95cBuC/61RJZ77Ae8ph05Ww3YyWZmVkgfp2vn6TCuSSVjz0zBO
         o7Q0onN65K0Fq/1ev8kRvkmnEJU4+lp9pefnnqlnXXo58IFM/5ScVnoCEv/tG+fOXI65
         BJTw==
X-Gm-Message-State: AJIora+nGZIKa9ZNTbq2qtqwR3ATafqhRLL4dz8GwEcPkW92EIKQUpD1
	niE/ZUOc2yFX2tSRDUtdk6tOrZpBB/Q=
X-Google-Smtp-Source: 
 AGRyM1uI6K9pfqrqn/i6y6UkzVpNyWxICP90XeetCHNLTlDza4hEBVX4rzlBSkxayiOz4KPBNPsVsQ==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id
 i21-20020a05640242d500b004331727b31cmr18491660edc.9.1657886900159;
        Fri, 15 Jul 2022 05:08:20 -0700 (PDT)
Received: from vm-lpt-vermaete.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id
 f24-20020a056402069800b004316f94ec4esm2690700edy.66.2022.07.15.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 05:08:19 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jver@oip.be>,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-pyzmq: version bump 22.3.0 -> 23.2.0
Date: Fri, 15 Jul 2022 14:06:35 +0200
Message-Id: <20220715120635.4106-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 12:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97841

From: Jan Vermaete <jver@oip.be>

Still with the warning:
WARNING: python3-pyzmq-23.2.0-r0 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/zmq/utils/compiler.json in package python3-pyzmq contains reference to TMPDIR
File /usr/lib/python3.10/site-packages/zmq/utils/config.json in package python3-pyzmq contains reference to TMPDIR [buildpaths]

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../{python3-pyzmq_22.3.0.bb => python3-pyzmq_23.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_22.3.0.bb => python3-pyzmq_23.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
index e4762eb5f..c6bab9fa0 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://zeromq.org/bindings:python"
 LICENSE = "BSD-3-Clause & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
-DEPENDS = "zeromq"
+DEPENDS = "zeromq python3-packaging-native"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "8eddc033e716f8c91c6a2112f0a8ebc5e00532b4a6ae1eb0ccc48e027f9c671c"
+SRC_URI[sha256sum] = "a51f12a8719aad9dcfb55d456022f16b90abc8dde7d3ca93ce3120b40e3fa169"
 
 inherit pypi pkgconfig python_setuptools_build_meta
 
-- 
2.25.1


