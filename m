Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.27832.1595766055173425682
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 05:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=13l+4Yxu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id h19so14290334ljg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EV4R4i3gCqpMmP5fiDD1q7+q4OVJf3rNaXrRsNOucGY=;
        b=13l+4Yxu8xTkY+glroOBB0MfV/8XMdwI+e4KcBIFSRBuwFHxVozMDsPxC81zwPYXvL
         i0c9kUnm5ZNPPgALGat1K2ddZ/FgN6yAqHqmDYLbWOi1qYjfS0Go8GJDQNK5v3XvPZjX
         7bNrjXS5MZIPUqjgh57vkn5w0yIKMSaGyGTHRUJESGQCXAw5Ud3wG1eylE2LqWlFLFWG
         Q7mHb+jz5xswkBhf0Xl/sAMmu042NzVss+dLTPIYu+Lz9tdAeflc9Hy9d0P4xBFacL7t
         WvevuzzByyxZOPiu5H7HCuwfhSeWgrnuKZ4mTywSIOqL4IzUIHqwfOau+qqrTtoxBRu6
         Kjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EV4R4i3gCqpMmP5fiDD1q7+q4OVJf3rNaXrRsNOucGY=;
        b=uPtEYcy2x3aKE62iaog9vlhqpVknVP51kqwd4MCFNnnBPrc3llhH31Tj7ScPJ51oCW
         xTLZxPwLCRSPf2c9UE6/8hXzQzZibYtCiv6q9Ay8lIPmk8YfVqtPb/EV7Tnu/d9CKyjM
         HpQzIfbjmIkjLnMpzTIl7ky8LbOKplB/2+P64emokPRGMSrHU0xsmQ+lEN2JjSKR+0Ei
         rWg5PytvoWGFYzehheaMLOLcO/BUqX872SwcggvdLciiml2qAOMyBbHDCR8KagKO58fC
         GkuwQ+OZPg6lthShdcgGECkcpxmAb/rBCkR90A89rNnPSxdjcKPyp/OQip41so7uDn3h
         pVIA==
X-Gm-Message-State: AOAM533YlFVY1cZ1DkVOJuFRfSUHVWs9qEMrAwd17Kf63U4yn+ncHruG
	0dfgCdh8XFJit6wKv0JycHR2dJMsFLg=
X-Google-Smtp-Source: ABdhPJxURLhoUOEjYX0yh8UDxbFE7jRQSKmq2fIEa3EvRAdI/g4F9WYwEyq34CUn24LZ9oXNb+GYKg==
X-Received: by 2002:a2e:9d52:: with SMTP id y18mr3829109ljj.25.1595766052895;
        Sun, 26 Jul 2020 05:20:52 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u9sm1778798ljk.44.2020.07.26.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 05:20:52 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] kronosnet: update to 1.18
Date: Sun, 26 Jul 2020 14:20:50 +0200
Message-Id: <20200726122050.18769-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{kronosnet_1.15.bb => kronosnet_1.18.bb}          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.15.bb => kronosnet_1.18.bb} (67%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
similarity index 67%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
index 6bf268da9d..7b1dfc2411 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
@@ -1,7 +1,9 @@
 # Copyright (C) 2020 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-SUMMARY = " Kronosnet, often referred to as knet, is a network abstraction layer designed for High Availability use cases, where redundancy, security, fault tolerance and fast fail-over are the core requirements of your application."
+SUMMARY = "Kronosnet, often referred to as knet, is a network abstraction layer \
+           designed for High Availability use cases, where redundancy, security, \
+           fault tolerance and fast fail-over are the core requirements of your application."
 HOMEPAGE = "https://kronosnet.org/"
 LICENSE = "GPL-2.0+ & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa882bbe \
@@ -9,9 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "0ba5985c3ddec8429b989f0e7bd3324f53e0a9b0"
+SRCREV = "e1f3d4fb4906a26bf155a0e3fff2b6cb02be4dd2"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 
+UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
+
 inherit autotools
 
 S = "${WORKDIR}/git"
@@ -21,3 +25,6 @@ S = "${WORKDIR}/git"
 #                                                             ^~~~~~~~~~~~~~~~~~~~~~~
 CFLAGS_append_toolchain-clang = " -Wno-sign-compare"
 
+PACKAGECONFIG[man] = "enable_man="yes", --disable-man, "
+
+PACKAGECONFIG_remove = "man"
-- 
2.25.1

