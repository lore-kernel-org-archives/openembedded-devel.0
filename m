Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11305.1611429929148257526
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 11:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U7DthdU8;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m187so7126407wme.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PgeqKSyTIsYEdUSjI2vxj9LPKaXTakZ6veN7wmQO5yU=;
        b=U7DthdU8KSqpiLJqghfdj+F9eVk7kmiRiJbaeKsoBYux2xYsvtvACGaURRm0+vS4ge
         qJZyqDC5M/kmcTmBjcd1i1jMWeXGNsK3+tFs8Pg3AZb4RrPhGzWspve6i1ehJlI2iOPN
         bJxGRdJDEnRLeLQTS/toGuEI/gyHn+IEusa5HUZ9UX5Dx+KgpVKYEzRKsDUR6+YI0ApB
         DBpRf9NRkgkOing/x8EUz4ww5JnkWwSl0lBwwsnSVkn8emKm7dJVktEQUB6+9UUUTCKv
         KvkhZmxfVBLoAxw6CvMKVW+JFwZ9jlv3C0mZURCEJ0OkgfSNTBRN6mkNaJHyA+clc/hM
         DN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PgeqKSyTIsYEdUSjI2vxj9LPKaXTakZ6veN7wmQO5yU=;
        b=obv/8FZB30R7+0RkLi048WjlwylJyYtKUjTuyDX0oN5hlLI4qxJzGP2dTH7LY6B7+k
         rW8snaO9Byw5WWl1sF+kMZO963PiYN9dTPg4M+ZFOnQogG3q360Eak2zlcegUsmuiRfM
         0ZpFoi1buseJipOgfzfHftZQbScE8KNAiNQWLcNQNrtLBkn+ahhjm/0G0QhIWHjpye4y
         zdkyGC+SINSRiPkG7awGg9u9Kagvc/7Wf+RTRKFFvqGuiGGjZ3Dfsg0j2fQ7A629s5ig
         daa5Ik7ljvGQh+aTgskq9mlAWYum8Fzyjfq1Wg46K2fBpidQbqD2GKcIHRjT5Ey8mzqW
         jDOQ==
X-Gm-Message-State: AOAM533AeDB1Frrr0KeL6Q4nXXn0H7Z2EKr/6sl2EpvROX0zcBxE+Qcg
	cukzGPXxuVZOIHFn3YD4VsjzM6M0M0WfgQ==
X-Google-Smtp-Source: ABdhPJybMxPgAEuarVEuryfHnSC+Dlgvp3OIzakRkW3JcHe96E3LNtRrK1rPh0J1TOM5TUPY7TK/hw==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr9533219wml.28.1611429927400;
        Sat, 23 Jan 2021 11:25:27 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5532665fa05402b8466.dip0.t-ipconnect.de. [2003:f0:7f38:e553:2665:fa05:402b:8466])
        by smtp.gmail.com with ESMTPSA id n11sm19159740wra.9.2021.01.23.11.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 11:25:26 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH 2/5] python3-mypy: initial add 0.800
Date: Sat, 23 Jan 2021 20:25:10 +0100
Message-Id: <20210123192513.2663547-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123192513.2663547-1-schnitzeltony@gmail.com>
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently it lives in:

* meta-microcontroller
* meta-ros-common
* meta-sca

Seems important so add it to meta-python

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../python/python3-mypy_0.800.bb               | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.800.bb

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb b/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
new file mode 100644
index 000000000..0d019dfe1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
+HOMEPAGE = "https://github.com/python/mypy"
+LICENSE = "MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6afb7c151c4dedb5c3dc292cc120fadc"
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-mypy-extensions \
+    ${PYTHON_PN}-typed-ast \
+    ${PYTHON_PN}-typing-extensions \
+"
+
+PYPI_PACKAGE = "mypy"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a"
+
+BBCLASSEXTEND = "native"
-- 
2.26.2

