Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.130544.1598003596925135626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pe9H2aAe;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l23so920022edv.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=DBnalphubos4xDBM0F4oMK+4AVCde17u1S6QyzIef8I=;
        b=Pe9H2aAeUzvGy657c1zMUqhT7QgS5s5ovAERMe0UuQzyCE/TO8dC3Q+XcheR5YAKYE
         8CNlannleWvfJNY1eLykdRTywhStNS/O8pq/R/VnT1s9moQHhw5cCYkJ0Y6SwOOh//3E
         R8A2zSpF6m/nDgjfku7yMAH9rEN75mNDvxe7/Y6EHKYG4irXp3UAB53A8MSMReg7GFAl
         Wp9hBq++6ye1LUxNsISOhEI/RD49Ojv3u2NNKlA6T5Ub2CVF3mMBIONB9YWO++dtO//C
         g9VcpDcZbDnVIah3QB69sMys2KlCQ8b05HlC70cp9h98CvFGk1Qnokd/k8pSUwFo3QUo
         JKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=DBnalphubos4xDBM0F4oMK+4AVCde17u1S6QyzIef8I=;
        b=kUy6c92pmYKq9x4bFfl3noYsm1ubMiac8qY60C5An73Z0GutvNnbUZsUe22r/lANDJ
         mfdbLeZlz/7NRMCoGMPDTU7c+tZd0voTun1OorWc60w1d2LvMhzKhQipLxdMRAaBNmlq
         3HFv4/FwVzcAlC3uU4d2QwlLp4FOAAt4cBd8p3niXtGbpL/vqXSVQbSCkvJxhF2wB8/E
         4ePD4G7pLFJWL55yNcURNpJNKIlLmDanIZYcSaHmq1CtyocTE+X9yBotkqvxXvNgDaW9
         H5ZS8yxLNlv6M+aQkS4xEyXqjkL6jP5int8bP/hJ6+qQqTRvSM94cswsQ9YAl7dJCiRF
         TBzA==
X-Gm-Message-State: AOAM532CCKO2of1+CRp08TMioeQ0rsvE4vP5Im/I2Z11/1D8BR/VkenA
	PU2Z+7Q5FxFUj8KNZd7Q9HW8i3sWfKc=
X-Google-Smtp-Source: ABdhPJxtcaQ9UA8RNq2tg3sN6vkgutUkIwRjQNOXZcT+LSExwY1T2E5yuZM3kK7O5r2tg1UfJi6UuA==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr2005632edr.11.1598003594850;
        Fri, 21 Aug 2020 02:53:14 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b03a.dip0.t-ipconnect.de. [91.37.176.58])
        by smtp.gmail.com with ESMTPSA id j3sm787833edd.92.2020.08.21.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 02:53:14 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [meta-networking][PATCH] bearssl: fix missing install
Date: Fri, 21 Aug 2020 11:52:55 +0200
Message-Id: <20200821095255.4830-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

Default Makefile of bearssl doesn't have a make target which hadn't
enough attraction when creating the recipe.

Add missing functionality.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-connectivity/bearssl/bearssl_0.6.bb        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index a0f64e933..74a876987 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -18,6 +18,8 @@ HOMEPAGE = "https://bearssl.org"
 
 SECTION = "libs"
 
+inherit lib_package
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
 
@@ -33,3 +35,11 @@ CFLAGS += "-fPIC"
 
 S = "${WORKDIR}/git"
 B = "${S}"
+
+do_install() {
+    mkdir -p ${D}/${bindir} ${D}/${libdir}
+    install -m 0644 ${B}/build/brssl ${D}/${bindir}
+    install -m 0644 ${B}/build/libbearssl.so ${D}/${libdir}/libbearssl.so.6.0.0
+    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so.6
+    ln -s libbearssl.so.6.0.0 ${D}/${libdir}/libbearssl.so
+}
-- 
2.17.1

