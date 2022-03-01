Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF56C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:55:29 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.2535.1646168128350481775
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pFmbR3aG;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id p8so15410944pfh.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNkgOwGZEYAy/mUyDFvS9FHyr6TGehVLuoxaKrUMhZM=;
        b=pFmbR3aG5Rq7+NUl4o8Xg5IW3ryh2mhMOVJIIEyDzgAXIIHqPlmHFYV8NRPASed4V5
         cg+BK8IGagHmXqBkLn73Nwo6qhf5br3MIoqmWwHBzKfqymwNYIkDUQXDUYEA4UHrcv5Y
         vJMyexPFh0vUqCnShsltfKHByX754zs3udwiKq2HEEb2JJocmYv8cU2yQi+2UMbyXxuF
         vXvvuu0cGhU05TJeXPpuzs19DKEwD4kGBL/+2e3h/lui5cwwiuCgrPTH9MkHN9LEjmdo
         UD/0kR6aI7mlxg22Po2qqxa4/9uRjlVDIiuBbvyuYcHCVB9BrKybfBlIYujoVXEM7k+A
         61qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNkgOwGZEYAy/mUyDFvS9FHyr6TGehVLuoxaKrUMhZM=;
        b=MI7VeyGY4N8CKXAyFfqwpimvGuRRpj5oYPIzlckCXq4JFsgHV4V6fZYuek0pZbQ/Q3
         U+ZoUwmlQ+OROy4VJUw8eat07A1aEXIkRpIezVzsIJb46vdOYVR3eb454XRpuOnpvUs5
         nw+Ki9zXGryVKFW0tjGDwp0TTi1qeUA/NFRazEwzN9opYJfgTdzatpMCU0EQWWXhfRYM
         8FRsiPgfOvcyXiYa7dVF9yyXpb9C3p9zFDGxxfUaPhBuOl7NDyZqdkgxPo2ZBt2P3TRx
         Iolr80wL7n3Zu7ft6dBNzLMO87y5mY9Tm3Pja/7yh9TMnOOapVSfBbJ5yub6o9UZE2tI
         FF8g==
X-Gm-Message-State: AOAM530S8CmS7lJA5/v45zBxCstWNWS9he3fqxSJwTQ5+rjXZDFQ0XsI
	0I0sLE6klrxaNTfNq5mno64FeyEBf1nkgw==
X-Google-Smtp-Source: 
 ABdhPJxZlSAwyKZ8qy7tj3jqT/B8h0H6PHKazOZ6rDASeBHf5b8bJpODs3jbrNYgC7ioR4Ab2KexFA==
X-Received: by 2002:a63:fa4a:0:b0:378:5d07:96d3 with SMTP id
 g10-20020a63fa4a000000b003785d0796d3mr16888483pgk.54.1646168127503;
        Tue, 01 Mar 2022 12:55:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm13498942pgf.32.2022.03.01.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:55:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-xmodem: Move docs to /usr/share/doc
Date: Tue,  1 Mar 2022 12:55:25 -0800
Message-Id: <20220301205525.2264936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:55:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95657

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-xmodem_0.4.6.bb        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
index 9d722b84f6..6df392e2d6 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
@@ -7,8 +7,13 @@ SRC_URI[sha256sum] = "089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8
 
 inherit pypi setuptools3
 
+do_install:append() {
+    install -d ${D}${docdir}/${PN}
+    mv ${D}/usr/doc/* ${D}${docdir}/${PN}/
+    rmdir ${D}/usr/doc
+}
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-logging \
 "
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


