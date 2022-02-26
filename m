Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A51AC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:28 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.6916.1645890087043646389
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=URqMTWiU;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso7462731pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3oNpA/dNdx0h5Zit7Wyp2g7IdhsnA2J8+siYMf8iNsM=;
        b=URqMTWiU/s27NRhm8zI4DQXkvDAM72gV2YvzzTUNKAwu2K7kPzRD06bzMVLMin0xTX
         W5L+Y5W94/B8mDSw95nY2j6dxk1Bs93nf3UsNZLD8C2Gr5IUz1Y3v0S7zLEeLvCxzPap
         2ImwuYx7fOetYWP9E6X/pcLhS9OX6O+znJu95z4FjuU71yQMtrQ++8J8kwbKhk3jVIu6
         fEJLnJi5hYFSGP8y11vchiBcSTrB8wqNZ15cRXXE8+Vab64FwpCU7bBQKaZuQvBw07Op
         486QtPOgBodiL+WNJG9gF866IbBlduom3s1tp+Qzw9ffIsh8ukkwQSYTt+d32CXyNo7h
         vVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3oNpA/dNdx0h5Zit7Wyp2g7IdhsnA2J8+siYMf8iNsM=;
        b=gmRy7Wo44cq/uG33xSYLI6oLSKLV6/nRoENq7LTmgKkpdQ5JZAJbw5blUDQlgjQGi1
         CSDH38HjYZfq/gBqIPKn69YQojhIhP45zdI9q9JonGChHqnpnkLyIRj9IA/2rCivF7jE
         N0xBM2zVEYDydHEIfamZ4IkkIHruNJt8vaOoqTGyAvVDXrmBGzDUpTWmWcKpYm9fqNNh
         Y9O131ZfZqEh+QJRerHSLIaECZj6Ko52b3qSh6puHrXRj77mynHskBF0DLElvKrAa2v4
         zyo00Ck7ZaPVHBTnNolnQZrYoT2nkXtKaWl7HEFO1kOOGdefOkifd700h83T9j06ka47
         9eKA==
X-Gm-Message-State: AOAM533lUcwgdaWiDVyauLd3UbEt8ZHrMwaC7RrKYsUyOIjVJjpHE+cT
	Tld0XCBQpV/aQWtRrrA5ji7EQ0A2EMM=
X-Google-Smtp-Source: 
 ABdhPJx3D6yoF+loh4fG70n643mjJwWlXiIB5PXt6Q6SXvzi6+9oEIegTFYK26SGpOCbS1+S0zmKMA==
X-Received: by 2002:a17:90a:880e:b0:1bc:650b:6be5 with SMTP id
 s14-20020a17090a880e00b001bc650b6be5mr8408663pjn.34.1645890086400;
        Sat, 26 Feb 2022 07:41:26 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/5] graphviz: native: create /usr/lib/graphviz/config6 in
 populate_sysroot
Date: Sat, 26 Feb 2022 07:41:17 -0800
Message-Id: 
 <7c519caa1a66e0a1e94217e10a78417555b93ad3.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645890015.git.akuster808@gmail.com>
References: <cover.1645890015.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95547

From: Christian Eggers <ceggers@arri.de>

The `dot` tool requires to be run once after installation in order to
create its configuration file.

The do_prepare_recipe_sysroot task uses do_populate_sysroot in order to
prepare the recipe-sysroot-native. Package postinstall scripts are not
executed for -native packages, but files under ${BINDIR}/postinst-* are.

This is quite the same as graphviz-setup.sh does for nativesdk. The
general idea has been taken from
OECORE/meta/classes/pixbufcache.bbclass.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 81ab86c762..72e2f5cc7a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -55,6 +55,17 @@ do_install_append_class-native() {
     install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
 }
 
+# create /usr/lib/graphviz/config6
+graphviz_sstate_postinst() {
+    mkdir -p ${SYSROOT_DESTDIR}${bindir}
+    dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
+    echo '#!/bin/sh' > $dest
+    echo '' >> $dest
+    echo 'dot -c' >> $dest
+    chmod 0755 $dest
+}
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " graphviz_sstate_postinst"
+
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
 FILES_${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
-- 
2.25.1


