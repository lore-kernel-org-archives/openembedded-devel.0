Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.27676.1611149763573585035
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IBioZrJj;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m187so2883470wme.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7RQO3RTPblD2N9FV+fn3M31lJT/5M4O6S3ffQRgM1w=;
        b=IBioZrJjlMDYhSCkdHnOOW+pGhI2944xrF3M3w+z3Eo4CmPqAAHWlS/L5aNNtYDLkr
         a2jb7dz8CBUuzo4dYquPi5MQqKDLOIEgs29bFGpFoGzdtug+FUDs+OpBZn6p4tuxwDMy
         QQ6yEyXlGeQvtcK0NC8V4J/GMmu7GqvRePdqXSGs7k3o7IeGIeu1ZeOL7Fhjr9Ib0sOa
         Np01uL6yMQfAxAqiKyHWpx/bL9ZfKdXQ33Q9s+ME/EfoqsVWbsmECg3v+lNBWJ06jNlM
         he8ZaF6mw1Ab8t5uElqdA1jSZd2msN/pWodJJ7I7jE/gar7XOxCOKycF7uBXZdyH3Q1J
         vwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7RQO3RTPblD2N9FV+fn3M31lJT/5M4O6S3ffQRgM1w=;
        b=RnpzTlNlBbGekMcH5wDcLzEBn4q8esjimgts9wHbQjnMxZD+D3guG1oxoM4uTbjBqJ
         MqFUKXGTMWR3gRjsOkNy3QMyd0R2WUOssg9lc7L4/PZ2Hp0utJnFVNxAvrt/0c7lPOmZ
         kB7De1aEngZ8pUNE8vZmj8ymNax2Ni3oDOI188KIGEdiRrb4M8NRBm6LJL0G+Lz06IQX
         sDOfoaedfKwnslXY1H1Okq9FwpH3nc5Dg9HaRDijodCRvT4Xcdm/1RfEF+T/d8zWf/YR
         RG52lGeFQUej5grV56t0p049dlEdR7YiwNs+/SZKSo+QRHD90spfmt7nBJwylD0v0T/q
         6gMw==
X-Gm-Message-State: AOAM5324jQLaBw7KWm2vLvq9iirVOwZMiJZVH+5CMdY4rWf/biWYgQpf
	bWLUZZbufE1nfid4FCBFW/5ZnrG4vUZHYQ==
X-Google-Smtp-Source: ABdhPJzqpLaN9csoqNQDl5opvy2G/a9tF8d2S+YT+8burRWdILqWRJTDLzsiWEwub1sA1DFP6ljq/w==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr2676330wmk.130.1611149761626;
        Wed, 20 Jan 2021 05:36:01 -0800 (PST)
Return-Path: <peron.clem@gmail.com>
Received: from clement-Latitude-7490.numericable.fr (213-245-241-245.rev.numericable.fr. [213.245.241.245])
        by smtp.gmail.com with ESMTPSA id y13sm4349452wrl.63.2021.01.20.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:36:01 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2] re2: Add recipe for Google RE2 library
Date: Wed, 20 Jan 2021 14:35:58 +0100
Message-Id: <20210120133558.2769347-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Google RE2 regular expression library.

This is used in new version of gRPC.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

changes since v1:
 - Rename libre2 to re2
 - Change commit title

 meta-oe/recipes-support/re2/re2_2020.11.01.bb | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/re2/re2_2020.11.01.bb

diff --git a/meta-oe/recipes-support/re2/re2_2020.11.01.bb b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
new file mode 100644
index 000000000000..7f6fcdb01b48
--- /dev/null
+++ b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
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
+FILES_${PN}-dev = "${includedir} ${libdir}/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

