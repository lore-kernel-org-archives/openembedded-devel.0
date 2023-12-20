Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63C3C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:15 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.17406.1703059095261457078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DPxBnwjb;
 spf=pass (domain: mvista.com, ip: 209.85.210.51, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so3973884a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 23:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703059093; x=1703663893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=DPxBnwjbepanOBzP0lJtIf/pN7ftnfmvS6Y8QNWtGRuT0YFPfokxHZq8SfKiSF8p7i
         x9GzQw7Ap6hej+zXMrUa5EKkBwwU+12yfkCoYV++HyiMXWNmZ3Wwaa9m6hpsblkCtu0R
         QpmcCtxaqSJFoU8m2dyJ0BKNFpjjsY/QTdeoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059093; x=1703663893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=GPieen6dJNXbmwSRlwf/qpe6wBqcZ2kx+EmIOMsyoejUzjjY21FotFqJcaYwb0Nufi
         mbZdHMmEhN7IbmxGGPnaM6cjPfIJXsJd8FOgCvFnM2yxL9/fPDgtsCMM03BDEfSvgW0q
         A2RQYOAtqaBt9tcPYumE+c6xJMaxc1nhc0FALOFAWxt4Vh4YmBsoEHpvlpba0Bdnoxd0
         LtEUG6zsr3qyxdHMKrXNuREFHfh0n6rn9ZjNEQeN1tHvuLBSvAENs8N1TTbXKF34DmJQ
         zgsQPlKqH4LcwlA1L9IUxcFT6MOcOoIW86PCCIyySpXvGYU1IZtt8k6xbGYt8bJJtRuy
         B0cQ==
X-Gm-Message-State: AOJu0YxFJ3JyRO1XfQ7hjaV1h4Loa3IQ5ZepFDZZJ8ur3LzVVur8NbtR
	p1VGsa3ZNG/euMl8ORVVmxv5TqadwH/2XKuDUMo=
X-Google-Smtp-Source: AGHT+IG12AEy0tH2VYDvikMzS4TPfkRuG5/QE/HXL1kaH2LGJl9p8XNxNXXJGB+uKZwkb0+scVyH+Q==
X-Received: by 2002:a05:6358:89f:b0:173:8f7:73e4 with SMTP id m31-20020a056358089f00b0017308f773e4mr406461rwj.3.1703059093403;
        Tue, 19 Dec 2023 23:58:13 -0800 (PST)
Received: from MVIN00020.mvista.com ([223.230.5.216])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b006d451d8d7f3sm6794230pfo.76.2023.12.19.23.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:13 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [OE-core][kirkstone][PATCH v2 4/4] libssh: upgrade 0.10.4 -> 0.10.5
Date: Wed, 20 Dec 2023 13:25:43 +0530
Message-Id: <20231220075543.96481-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220075543.96481-1-vanusuri@mvista.com>
References: <20231220075543.96481-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 07:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107649

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.10.5

* Generate cases list dynamically in run-ptest.
* Install missing file to fix ptest failure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=b0833f1f3ec78f16a79d9ff66cdd19da93496018

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-support/libssh/libssh/run-ptest   | 42 ++-----------------
 .../{libssh_0.10.4.bb => libssh_0.10.5.bb}    |  5 ++-
 2 files changed, 7 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} (85%)

diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
index 159994e9b..6346b72d5 100644
--- a/meta-oe/recipes-support/libssh/libssh/run-ptest
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -1,53 +1,17 @@
 #!/bin/sh
 
-# Valid tests to run
-tests="torture_bind_config \
-       torture_buffer \
-       torture_bytearray \
-       torture_callbacks \
-       torture_channel \
-       torture_config \
-       torture_crypto \
-       torture_hashes \
-       torture_init \
-       torture_isipaddr \
-       torture_keyfiles \
-       torture_knownhosts_parsing \
-       torture_list \
-       torture_misc \
-       torture_moduli \
-       torture_options \
-       torture_packet \
-       torture_packet_filter \
-       torture_pki \
-       torture_pki_ecdsa \
-       torture_pki_ed25519 \
-       torture_pki_rsa \
-       torture_push_pop_dir \
-       torture_rand \
-       torture_session_keys \
-       torture_temp_dir \
-       torture_temp_file \
-       torture_threads_buffer \
-       torture_threads_crypto \
-       torture_threads_init \
-       torture_threads_pki_rsa \
-       torture_tokens \
-	  "
-
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd "$ptestdir"/tests || exit
 
-# Run specified tests
+tests=$(find * -type f -name 'torture_*')
+
 for f in $tests
 do
-    if test -e ./"$f"; then
+    if test -x ./"$f"; then
         if ./"$f" > ./"$f".out 2> ./"$f".err; then
             echo "PASS: $f"
         else
             echo "FAIL: $f"
         fi
-    else
-        echo "SKIP: $f"
     fi
 done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
similarity index 85%
rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
index 4b2ced5e5..f33987acf 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
+SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
 
 S = "${WORKDIR}/git"
 
@@ -34,12 +34,15 @@ EXTRA_OECMAKE = " \
 do_compile:prepend () {
     if [ ${PTEST_ENABLED} = "1" ]; then
         sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/config.h
     fi
 }
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/unittests
+    cp -f ${S}/tests/unittests/hello*.sh ${D}${PTEST_PATH}/tests/unittests/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


