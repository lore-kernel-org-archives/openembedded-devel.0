Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46A5C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 17:31:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.18063.1658079115361006101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2l3WivD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ez10so17518915ejc.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Dh74FIBRBOh6YxCypv8sS2L8YZmDhY6rnHJ2TB3R0U=;
        b=O2l3WivDkk0w/ZBy87aR9o8S4BQVKHWzJopoSEh9lBjqiqhPwM8ItWV4MVVHbAI4qb
         0/xGuv+HrTQJwlY9rSstblCQfnpS2WfVZtOaN+ZSek0Rjuvd67KbwmWvxzBfx4IztWnb
         YXyKK9QAV3crcvTllBBRkC1wZmKpfAwff2734MUhO/RMD/mudORkculp/c42Y8nbVPnf
         kUs/gEelUzAg3o5casilARk22Z7TSqs7ZGmhaSeoF4MPd5HXBQXz/SKM1BsjAiQh9axx
         8C+G7ZYypOjXGt9k46ZQEpCBj7qd35T8SIp6MIBY6WP1oXjxsKCA4Pt9tcpE0LhqPW0Y
         rp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Dh74FIBRBOh6YxCypv8sS2L8YZmDhY6rnHJ2TB3R0U=;
        b=oj3cpZ6ooaF30u+TjNL/vEvCuylxph6lsW2et8FhHJr/lTt8SsyQ1c5bqel9F6yzau
         NPNmNzYWDbF4cBvuxH4Lmuymh+dkrMJvAOsVQ0H7kb8XSfTpDdbLcrrDZVlHHQJwjLVj
         x+xsbyQCULgtxuprFMwyh13vgQxqgDNVGYdSjd0POoIooTCYWkgh6huDOj9DljVuW8Fz
         dSDVArLlxR0L3VNkPvkPgv7T0VsDumrsxa8AHw1D3rc/tJdI/9lZZX6RIWlcNi20F8PJ
         jGJfsssW/tZWCq1HL0d9YR9X6Obwatnv9zlIZAU770QZJbG1tc3GP81EndNYXqtzBKjb
         C26g==
X-Gm-Message-State: AJIora8ts5ulqdr7Yd9tWrGT+aty68EN+hbsdqKKQQv1HP5NCR5Numxz
	9ZnIvpMGxkMLFMCqbrQ/PKm/9wlFjq4=
X-Google-Smtp-Source: 
 AGRyM1uQRezvfGcB9/cme6G2dwbVRQrX1CmI3AYxMgfM0fWlXRl4I2BOGAN7h00IX9WooW6w49xvIg==
X-Received: by 2002:a17:906:974c:b0:72b:8cea:95c2 with SMTP id
 o12-20020a170906974c00b0072b8cea95c2mr23026189ejy.65.1658079113776;
        Sun, 17 Jul 2022 10:31:53 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-fij45r07ru9hofylq19.18120a2.ip6.access.telenet.be.
 [2a02:1812:512:2c00:fdf0:ba80:8823:350d])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a1709067cc500b00726e108b566sm4587591ejp.173.2022.07.17.10.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 10:31:53 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-oslash: added the oslash Python
 package
Date: Sun, 17 Jul 2022 19:31:35 +0200
Message-Id: <20220717173136.2777245-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717173136.2777245-1-jan.vermaete@gmail.com>
References: <20220717173136.2777245-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Jul 2022 17:31:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97861

This is needed as rdepends of the python3-jsonrpcserver package in version 5.0.7.
Is should not be needed anymore in the 6.x version.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-oslash_0.6.3.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb b/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
new file mode 100644
index 000000000..d9d977b70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Functors, Applicatives, And Monads in Python"
+HOMEPAGE = "https://github.com/dbrattli/oslash"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.md;md5=ed79d2637878dfe97de89e357b5c02dd"
+
+DEPENDS += "\
+    ${PYTHON_PN}-pip-native \
+    ${PYTHON_PN}-pytest-runner-native\
+"
+
+SRC_URI[sha256sum] = "868aeb58a656f2ed3b73d9dd6abe387b20b74fc9413d3e8653b615b15bf728f3"
+
+PYPI_PACKAGE = "OSlash"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    python3-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


