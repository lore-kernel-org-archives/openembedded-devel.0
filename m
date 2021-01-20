Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.25570.1611134320265042042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 01:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdE5aSKt;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id c128so2157649wme.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 01:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KKcJ/yssSjC/zkI0R56BjPe6KBbWrEBygg8YyU3Q5YY=;
        b=PdE5aSKtZIk0DFCnqvimztJ+ULz7LFw/TxGwMVi30WtC3urHooMETsYfZOnTzJZMzd
         v9CRvqstVrvEDv/Nxz682ESpv86Ytrww2wdCRVI361YHFZtuazuIJsIrBpfCIvlvvT0x
         0mtQ5qwHGd0gvD1cGpL4WwpENxCgF1s2/PMC3gyH10hiN4S0hbzyxjwqRuhygSsZ8NfF
         /3PKiCUxrntB8TKqA9BhpQbr7suKZkzTo2VwYSh1DtYlhDW1fmpKv3kIB8J+mHEAjCU7
         MtbD9BBPczsBer8kzcPJhFRb3AcuPTe6ga76ii9BGsrbuvDA7hacACSgBYtnerM5KDM1
         iTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KKcJ/yssSjC/zkI0R56BjPe6KBbWrEBygg8YyU3Q5YY=;
        b=HZ/XXTgSZn4PuXKck6nzPnspN2AmShiKn8YhM5iKNRv95KSeFlNvc8QRtKcWVnJEax
         h4EclibwGXiVQMiHQ5WAZYke79z92hDfw/PUZrgzy+I87c8N5kFkLep8wKKtswrb9+7t
         8he+hO851sIn0thIOukbbm0biQF3e5KcEWMdAKlrDaqdfkuut91qgWKH4CEU08ZhnQkJ
         qlyZRqFsHsWo8DAVXsD6yl4/o7NmMdDTTfDaLsOADJEBxD8A2KORvY67wtPf9432Sd8u
         furEmWf4vUJ+A0jmEPugd2Xn9HyGCBrnthl227/sgqQFfhui82qcm4t/st6yUoCR0Jii
         j8nA==
X-Gm-Message-State: AOAM531TL7iqihVvXiYd0vF4rhS79XN6KcyhtLb4DTJCzB25YS/VeaPa
	PhaS7PaEk0L1hD0/TcFytCn2PSqyrTfu7Q==
X-Google-Smtp-Source: ABdhPJyEdNCMPRiM6tRO1m+QuSQU/pC/ccIJsqRhkL4U3anJjbXni4YmQ+tNWtuvk/qKGy0waZSOJw==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr3358134wmi.181.1611134318635;
        Wed, 20 Jan 2021 01:18:38 -0800 (PST)
Return-Path: <peron.clem@gmail.com>
Received: from clement-Latitude-7490.numericable.fr (213-245-241-245.rev.numericable.fr. [213.245.241.245])
        by smtp.gmail.com with ESMTPSA id z6sm2723393wrw.58.2021.01.20.01.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:18:38 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] Add Google RE2 library
Date: Wed, 20 Jan 2021 10:18:36 +0100
Message-Id: <20210120091836.2714687-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Google RE2 regular expression library.

This is used in new version of gRPC.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Hi,

This is my first contribution to meta-openembedded.

I would like to bump gRPC to new version but re2 library is required.

I'm not sure if i should call the package re2 or libre2.

Regards,
Clement

 .../libre2/libre2_2020.11.01.bb               | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/libre2/libre2_2020.11.01.bb

diff --git a/meta-oe/recipes-support/libre2/libre2_2020.11.01.bb b/meta-oe/recipes-support/libre2/libre2_2020.11.01.bb
new file mode 100644
index 000000000000..7c07b332dfff
--- /dev/null
+++ b/meta-oe/recipes-support/libre2/libre2_2020.11.01.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A regular expression library"
+HOMEPAGE = "https://github.com/google/re2/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
+
+SRCREV = "166dbbeb3b0ab7e733b278e8f42a84f6882b8a25"
+
+SRC_URI = "git://github.com/google/re2.git;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += " \
+	-DBUILD_SHARED_LIBS=ON \
+	-DRE2_BUILD_TESTING=OFF \
+"
+
+# Don't include so files in dev package
+FILES_${PN} = "${libdir}"
+FILES_${PN}-dev = "${includedir} ${libdir}/cmake/re2/*.cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

