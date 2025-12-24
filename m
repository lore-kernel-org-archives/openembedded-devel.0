Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4DAE78487
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 19:25:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126880.1766604325251806591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 11:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eAZCuJIx;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430fbb6012bso4984661f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766604324; x=1767209124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEIXcx2SLAxYTwqquKJhFZlZqEVk7eXv+MhXSl3zdMM=;
        b=eAZCuJIx+V23IlR88EwkECKrWlMyIGvDTMsvt/xTjtItfOS3cSuFoubU6ZE81V6AGu
         4kLL+3SI4F6H473rIqCnGCxNXZhV1aWfdrK9bMygDU78LncsqgZq3XAm6uo/vBYoGfyL
         rB7zDlGZdLvewlzDKeFhRm4wH6UDBkMw/Ut42iKmF3pJg6r2laSsDRVlpGPMA3eU0M3t
         T5oEuqH8Rsw9UNhOdQd6xYNGCIYE6DLqPYsLGZVPee8fDT42WJ+fe0/XbfAqiKtmddDW
         SoO0TQkjec1xS3KeQUGG8pbo4UJqbUITsECTKFU5idBA7FWEDug05nwLAnLcbpwEYN71
         Cm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604324; x=1767209124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEIXcx2SLAxYTwqquKJhFZlZqEVk7eXv+MhXSl3zdMM=;
        b=VbKOyRtmRlkGyv+N8P9vrjN7NWXVpQSdAEKuQk76v/RNzz8UBzWZvOGuMbZs3QKXmY
         +OBAm6mXJ8JhhH3z1qSKIWLgJWqcF74YE8PLF0LMBjciQc1/OjzCc0rVFQVwBXu8tvpT
         JvX9fXInkLkWqPKZCartTRPC7LO5+jQj0BxpO2ekj4u7KsST64VcxWyf32vgWZiEhBSC
         LD2DAsx/guVJUDxQQ5rrDeK82s5PbF4Ha4u7iemYWvOODl9RR8riBKfY/U3kPYd/Qx5k
         JMp48We0wHjYOm9ziUf2Kg+0AVL4IIqgXnTvKumlMZ+8FCxTCd9PMDkAKm7xqxykDrZH
         ehdw==
X-Gm-Message-State: AOJu0Yw6u81Ki1kNZpgSXovLtQ7Pat/0tyjgcPiKTw7J9oT6siUpby2f
	9NBBR6BWAhnHYv+xUW59qkPlqntEg5RaGD3Af66Sgoh7Gb1ESSzAQnp8mlGNMg==
X-Gm-Gg: AY/fxX45UBcm3hEa+NWTMwuQ87MwcTqaFPNh9ox+7kJn30LtiBVqroFnTztOWK67NZ2
	cegLhDT82AAIwz9t8+O00hdbYiPNV8McGmTyJtyLFm57UPZgcQKT3zM4AdUkRc35P9BMitFgHJn
	mVToLz16/CF1rXnX+V2ROKybYwamkjeLIJQIviGkQsLzERwm4QrrxPzssNsjX7aU4mJCQ+da8cL
	P67CgpSEfbrnC1+mHsPALVXU44STQWbwa0o5xQ1A8pAl0AjxqcmtYVbmIwYT04uS5Wc+BU7yN1i
	AfMw9PyB39ANeEHlMlNMapNk8LPWORJq9stCDSmdvJPULOeVT+2npwsIx9Wa/HaAqrR08HCbkM4
	O0uhoE9orjEqNGQ/kSg6ITqCV84KP7noEleDmHP5y4vLopXVtvnfyUKRFkUwxHHvS5vP2olaURr
	B/48eRbGjm
X-Google-Smtp-Source: AGHT+IHqX3GSIF5tekj1d8hZFYCEPdXRd4KuJ3kDJnKw0YO7qaK6eQPq7z/hEkxWOl5Jum1zXqAJ+A==
X-Received: by 2002:adf:ec8c:0:b0:430:fc0f:8f9f with SMTP id ffacd0b85a97d-4324e50638cmr17964089f8f.37.1766604323525;
        Wed, 24 Dec 2025 11:25:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm36782038f8f.17.2025.12.24.11.25.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 4/6] crossguid: add ptest support
Date: Wed, 24 Dec 2025 20:25:17 +0100
Message-ID: <20251224192519.2630037-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224192519.2630037-1-skandigraun@gmail.com>
References: <20251224192519.2630037-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 19:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122889

Execution takes less than a second.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-24T16:06
BEGIN: /usr/lib/crossguid/ptest
0d154108-445a-4d20-9d74-623eb15c0ebe
c79e3cdf-fe16-4a9c-bad2-0fadf5761d05
ac7f9a04-f63f-49ee-a95b-6020378bff6f
All tests passed!
PASS: crossguid-test
DURATION: 0
END: /usr/lib/crossguid/ptest
2025-12-24T16:06
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc     |  1 +
 .../recipes-support/crossguid/crossguid/run-ptest      | 10 ++++++++++
 .../recipes-support/crossguid/crossguid_0.2.2.bb       |  7 ++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-support/crossguid/crossguid/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index 0c40d967d9..ba511b9ed5 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -7,6 +7,7 @@
 # ptests which take less than ~30s each
 
 PTESTS_FAST_META_MULTIMEDIA = "\
+    crossguid \
     gssdp \
     gupnp-av \
     gupnp-igd \
diff --git a/meta-multimedia/recipes-support/crossguid/crossguid/run-ptest b/meta-multimedia/recipes-support/crossguid/crossguid/run-ptest
new file mode 100644
index 0000000000..9e058f8925
--- /dev/null
+++ b/meta-multimedia/recipes-support/crossguid/crossguid/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+RET=0
+cd tests
+if ./crossguid-test; then
+  echo PASS: crossguid-test
+else
+  echo FAIL: crossguid-test
+  RET=1
+fi
+exit $RET
diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 811a876885..48673cddcd 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -9,11 +9,16 @@ DEPENDS += "util-linux"
 
 SRCREV = "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
 SRC_URI = "git://github.com/graeme-hill/crossguid;protocol=https;branch=master \
+           file://run-ptest \
            file://0001-include-missing-cstdint.patch"
 
 
-inherit cmake
+inherit cmake ptest
 
 do_install:append() {
     sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${datadir}/crossguid/cmake/crossguid-config.cmake
 }
+
+do_install_ptest() {
+    install -D ${B}/crossguid-test ${D}${PTEST_PATH}/tests/crossguid-test
+}

