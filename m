Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.11941.1625841601288742838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jul 2021 07:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=fk1yCQHT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id f17so12456122wrt.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jul 2021 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AhipI3NwTtmcN6u61Rtcchu+G/UH+Emd2sC0kcXoodk=;
        b=fk1yCQHTwBia52CiivtTOuy/8+a7p9mRlTh8R1xLJjLxNVctLkPXonElPTJVdss/0D
         xX7AhySZsyPPjugWi9OPxg+xipp8qs7NFmpz3DqNE0NBbWH4noHpLQTmA6/afhxIQwLK
         cxEKkTVQcH7c23ojoKZ7PaoHJO3qAAoI+m+J3GRZjEx1v+oEHrHuZDjQEmzAS08P4spA
         +q1zngANdgLregajJAFK3s3CjvZqEQBktUnzNnuszNn6DarwSAkfKn5UfEFxiSo7vV92
         h2UdgWyu7asUuqSv+OmqWkHjPpEayquuTpdTJBPsrWauBv/63hV0AfYxFpXYZSNEWgxy
         KkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AhipI3NwTtmcN6u61Rtcchu+G/UH+Emd2sC0kcXoodk=;
        b=NmJxBiYvBd59QmVY4B4e1GyBUelhohtYOJbzz7K3MYQpOZJvTpxQ4/m7V+HiHvV69h
         dKC7CNHqGFiu60JkXoR5bO6lpn2iHOQgMOP4uVIBh8pf4oqt602JTnDjsQwAfHHxUjUZ
         NE6e2zVhaVGQc8Rnimbs5osRBVJhC7aQKhpvY6A81XL6JmfW98KiPzOkbr7APuoMzm7p
         DyHr3u28p+Ra2Htlz8KqqRxCWlD+o7OkUxEXVGVs5q902IFYbSimNhoGvvmY4HfgZXf3
         o7mdgN7JfJ12ZhipN2/hWUJwpC/9K8ORL08uIAiYEgyC23TKRmHxThZMkFjSFf++ChyE
         9ifg==
X-Gm-Message-State: AOAM533tEngQ1NMCoORvJR04C+UUfK+3odS+BZTQ9/GU82PkvHCcSA++
	6JrszTHJd1uMb2D5U+nHXww2TQ==
X-Google-Smtp-Source: ABdhPJx6Rwr2qzYRot8AhrpmHwCpmKuIw79qIJOH32PxqaD2B63YkxmRNCjiDQXJCEJ3CWGqLXbrtg==
X-Received: by 2002:a05:6000:1ac6:: with SMTP id i6mr37573498wry.327.1625841599721;
        Fri, 09 Jul 2021 07:39:59 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h10sm7358880wmb.46.2021.07.09.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:39:59 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-joblib: new package
Date: Fri,  9 Jul 2021 16:39:57 +0200
Message-Id: <20210709143957.2758-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for joblib: a set of tools to provide lightweight pipelining
in Python.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb   |  1 +
 .../python/python3-joblib_1.0.1.bb              | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9c44d38ce..72ca86b04 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -196,6 +196,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-jdcal \
     python3-jedi \
     python3-jmespath \
+    python3-joblib \
     python3-jsmin \
     python3-jsonpatch \
     python3-jsonpath-rw \
diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
new file mode 100644
index 000000000..4e63b056c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Joblib is a set of tools to provide lightweight pipelining in Python."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b289008fb813a27c9025f02b59d03d"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "9914b330916395c0a1feca54949867a3"
+SRC_URI[sha256sum] = "9c17567692206d2f3fb9ecf5e991084254fe631665c450b443761c4186a613f7"
+
+RDEPENDS_${PN} += " \
+    python3-asyncio \
+    python3-distutils \
+    python3-json \
+    python3-multiprocessing \
+    python3-pprint \
+    python3-pydoc \
+"
-- 
2.30.1

