Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DC4C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.189981.1673932960581806406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRLRzyNr;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so9521870pjg.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAGuByZrEXxe7F8wONTAXOPf4MMYtaBzwuR6W49w98Y=;
        b=kRLRzyNrCousd+z7T05y6rBaGEdKPYpi1SKqmOCzU4zGMs9IL/4kA44c4ZceEwv7Xu
         2uE9XhmDvNskWruVQR2l4w2o0fS4uI8+ioalUGcUCvDxGwSsrps4GvLMzM9HA+/V0UI8
         7VmWn7vMQXxrQvy4IOl5CjtOLJ3YLJNA7bULDHDjTMiKnul8bpCvGkKOBvQ1HBMHnpq1
         2Bt13bHZaNfQNO7eV/913f/9Rqos177DNtgl8dtwBOx965n3m55jAKT+n4J7ZugPaiE9
         xIZi4THYKyFQxgv5MA0tQq+RD+SOunOb1fwZk5XJnoqj1rVL1j4rHUj9UxnSgT6UuuY7
         pIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAGuByZrEXxe7F8wONTAXOPf4MMYtaBzwuR6W49w98Y=;
        b=M2c0cp9PfD75NWvFvE+jLAwk8Np8IGyQKhpZpwSw+iH5X100gEPbmNWgEhwr4SPgON
         cV4JWdbcB4r0M0IxuegPAtoXFXcScOEY6rx05GVCCx7ffLiA4azGt4cxjOZAPMdwh4KT
         Quh+WNFC/f6SJSR8O4jHrcy3c5uWbYZGK+xJlfnpgjeGwFACgtgFbJrrNTRUEW3hW7HO
         b7CZBjiSecQ6+bx1a1N1pTSQJ13EYVt79hWAfHSvrcYNamJ+AgpGgBZGXfHfakIpWN97
         3gVToX0OB+wN3+b/vrmwKXAvjzpuDMzPHmqc/Q4SZlsz7SY3ECphLVejRI5S2Rz2zdlh
         cWzg==
X-Gm-Message-State: AFqh2krXxzBFnctuYWdYrvBFbzK6k/SJ+wAPitjJTLtSU2AW0kZ7xqCI
	t/QP0unBBazpx75SHy9JM16gLIuPvVC0dQ==
X-Google-Smtp-Source: AMrXdXv27GRVCUf2yqXbmjKBsDfqvg5iX8UEyoBydCuEtxmguAHeSmObf4mk64BqIIktdIgIKU979A==
X-Received: by 2002:a05:6a20:a028:b0:b2:2e66:5482 with SMTP id p40-20020a056a20a02800b000b22e665482mr2288408pzj.7.1673932959418;
        Mon, 16 Jan 2023 21:22:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/7] libtevent: Package cmocka tests into ptest package
Date: Mon, 16 Jan 2023 21:22:31 -0800
Message-Id: <20230117052237.3117521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100587

Also avoids
QA Issue: -dev package libtevent-dev contains non-symlink .so '/usr/lib/libcmocka-tevent.so' [dev-elf]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libtevent/libtevent_0.13.0.bb    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
index b3ae63c489..0d898be82e 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341
 SRC_URI[md5sum] = "9f413f3184f79a4deecd9444242a5dca"
 SRC_URI[sha256sum] = "b9437a917fa55344361beb64ec9e0042e99cae8879882a62dd38f6abe2371d0c"
 
-inherit pkgconfig waf-samba
+inherit pkgconfig ptest waf-samba
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -49,11 +49,21 @@ EXTRA_OECONF += "--disable-rpath \
                  --without-gettext \
                 "
 
+do_install:append() {
+    install -Dm 0755 ${B}/bin/test_tevent_trace ${D}${bindir}/test_tevent_trace
+    install -Dm 0755 ${B}/bin/test_tevent_tag ${D}${bindir}/test_tevent_tag
+    install -Dm 0755 ${B}/bin/replace_testsuite ${D}${bindir}/replace_testsuite
+}
+
 PACKAGES += "python3-tevent"
 
 RPROVIDES:${PN}-dbg += "python3-tevent-dbg"
 
 FILES:${PN} += "${libdir}/tevent/*"
+FILES:${PN}-ptest += "${bindir}/replace_testsuite \
+                      ${bindir}/test_tevent_tag \
+                      ${bindir}/test_tevent_trace \
+                      ${libdir}/libcmocka-tevent.so"
 FILES:python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 
 INSANE_SKIP:${MLPREFIX}python3-tevent = "dev-so"
-- 
2.39.0


