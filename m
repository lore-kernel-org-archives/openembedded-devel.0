Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.8894.1585955009804689039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id u20so7678919oic.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 16:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PKgYzZe4cGxJm6wdYDOXtShOqxUct6k5QDPgw4dn/J4=;
        b=uZ9EEAhQqGgSGZazC9g4Scnfew+RnTBWGZLGB2635+TQtn18ZCXFS5VZ0XTaryh/b5
         xztXQxIDU9nTlTGE+sebBL51XXK+8TraXpoWnbP2igOeghaXPVMKc8ygqwfZ4PcoqUZ9
         qX7UZKZwVkunDuRQoU4LDtmg3LApE5wz5TwKUrjYBVkXY4+FmmrS8iU4aRxp5CNsPbPh
         d/lFUNNR7QfudCOEra76QgSLczUAQFD0Qr07UbcxbChizz68vSozYEP6xArLdhKz5U00
         SfwOsxSTwQjsITyajqwoPQOjgStqytKIh7PVdkcLEKTvblHwrkrx92sCyJ2FGYAaC1LZ
         +iiw==
X-Gm-Message-State: AGi0Pua0MQ+4NEDhEasqedTKxKciKmbjDZ3xvFN1ZEFoO/Ed7sXE4cdV
	tjYRCrLodM1aIEODw1nuFYmp08lZWHY=
X-Google-Smtp-Source: APiQypIX2JOSh8Z6Y5G81df/HISKe9Zm15tpwQAOACjXYRMivRIs023PHZq6DQphtBlh9f3nWxr4Rw==
X-Received: by 2002:aca:4e47:: with SMTP id c68mr5136142oib.16.1585955008372;
        Fri, 03 Apr 2020 16:03:28 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id 68sm2464665oon.14.2020.04.03.16.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 16:03:27 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/5] python-webencodings: consolidate inc and bb files into a single bb file
Date: Fri,  3 Apr 2020 19:03:10 -0400
Message-Id: <20200403230311.29817-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403230311.29817-1-derek@asterius.io>
References: <20200403230311.29817-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-webencodings.inc              | 15 ---------------
 .../python/python3-webencodings_0.5.1.bb        | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-webencodings.inc

diff --git a/meta-python/recipes-devtools/python/python-webencodings.inc b/meta-python/recipes-devtools/python/python-webencodings.inc
deleted file mode 100644
index a2b8410cf0..0000000000
--- a/meta-python/recipes-devtools/python/python-webencodings.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Character encoding aliases for legacy web content"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
-SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-json \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
index 71fe741e4c..aa5b8c782a 100644
--- a/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webencodings_0.5.1.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-webencodings.inc
+SUMMARY = "Character encoding aliases for legacy web content"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "32f6e261d52e57bf7e1c4d41546d15b8"
+SRC_URI[sha256sum] = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

