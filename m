Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17806C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 08:55:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.18018.1703062505243923074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 00:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ONIGpLqQ;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d7f1109abcso1906123b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 00:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703062504; x=1703667304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=ONIGpLqQpEsrMA4Y74Qg181fiH5XimanJh+CPD/y0rW/zAH58L8qVgpyFuuAS/7XmB
         LxrG10um2EqBG2VtHqeaaeTjngjfw6gKoEpQ7w6ETEXFA1z9NoVO/LC9WPq8Jg4rplgP
         z6n3T7/UJIJrDXXc+3E3bEWlKjYM2Ac4ZDyhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062504; x=1703667304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2b6p1PyOUFKXO0/20SeBxAQG0cS2jUiZxbmqIPPQNI=;
        b=RoCv7oMWXaZOY3KNmbtJr7YpyXjQq40Qdodi9fw80wioOfzBDDgToibamcD6rq53aw
         flidmkbZg8TejvfvhDHKh1+nHVscilQhODpYbH3386mt/CGaYpaulznr9byQ7NlxQUyr
         GCKMo/daqbZi627tu1ZNhpJ6wOSCFzBxI4frX4RylxwNLIYk3Bosp5DSOhMqvoscytGe
         7QMC6HO1WldxalzpMNLwf2zepDfJjtVjRzbascq+/uT9MqVvZ2DD1vZdCiz82TCFCfQ9
         qQKKkAP0r4MWKkwjGqCL77qkHFbHhNSGpfPc3QKgNQhXt2f60qzlaM+0lT/I1fxk8g35
         tvSg==
X-Gm-Message-State: AOJu0Yy3omSujgTu3GvuoXAen+U7nFUOevMlD2va9vyXmEA4yC9ojCp+
	j+VE+LrZ+NLzELYQeAyuFW+ooi8wO5WyaTE6bwQ=
X-Google-Smtp-Source: AGHT+IFXMfEIgCwT37kNcnBE2WzI3WqKtgk5qTQJI2AXS0NKTpSAGzrBacR0H3BHR6jwg6SIKVwFfQ==
X-Received: by 2002:a05:6a00:a0f:b0:6ce:6246:2a17 with SMTP id p15-20020a056a000a0f00b006ce62462a17mr12254016pfh.3.1703062503748;
        Wed, 20 Dec 2023 00:55:03 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb2:ae:9c0e:43e0:a383:ef58])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b006d3dd365a76sm7254213pfb.2.2023.12.20.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:55:03 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [meta-oe][kirkstone][PATCH v3 4/4] libssh: upgrade 0.10.4 -> 0.10.5
Date: Wed, 20 Dec 2023 14:24:38 +0530
Message-Id: <20231220085438.97520-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220085438.97520-1-vanusuri@mvista.com>
References: <20231220085438.97520-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 08:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107653

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


