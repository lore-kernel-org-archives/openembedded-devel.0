Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C915CC83F10
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:38 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5590.1752004655500071536
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJ/3a3Xa;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32f3ef6178bso6918821fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004653; x=1752609453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnRe4mECvhvFVBMsCDg+e37WpmUKsFgh/5X/YXZ0WNs=;
        b=WJ/3a3XaMwpTfjqnmVo5vYMwrk0pMBED0GpDxIIsr3cqvopWoWLjzo3LW1JO7NhqCn
         tf3EYwc6IyymxyTMIJHJ87d6vnjbH4fqoTCkKB3QKNKrIZtLZNV7OhETRzIUYaEHxtY8
         GaojLGSzEETL3zvSNQbdIStQmDH8r3VHLrHG9STpZvql37UKNXBZvwMF2reTae9zUOwM
         oV70WYGrU58WebuvzeiFQMegLD67DWxYvB5Y6so05ZyxmX3w5+DHl6Wj9ejVhwf2mJPE
         kmlrqd+vHmLSaFaglXXYQuTbNyEVDSvhqr2B9h3mgTLPBI+yigu4gHSkq5QUq86Aat8g
         GvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004653; x=1752609453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnRe4mECvhvFVBMsCDg+e37WpmUKsFgh/5X/YXZ0WNs=;
        b=nZMBxzU/w0VTM+z6FoY4JKBg3QCykrOslNIWpBySQif5/WO2+la9f43hJzHqeD8RIU
         E+hzBc+v9MLP7YhRbIW4LfOUc3CYw6sz7i631pZL0EilLjDVPpYkrRM4WKl61qvXKUCi
         4qxDIR+iCA2YujfzCsVdZU84Fjto+b0ee36wgazTnfeyHnrB4jmkmQPoWAyEXvHu4fbu
         atRNkVtvh09s7BI1wWOovaUexnolS+spT8cIeBU3tEQtq9GvPFewaZZlYyD26gnWGOfq
         T6LjCoAOKEr99BtHDFb9frqeMkNwFKWTWSwDEYGuxJWT8/3jNJ7RIZOENYqTa1dvajDh
         y25Q==
X-Gm-Message-State: AOJu0YyDPe+mwan73x9chvEhKusR0k8dIrOCKWHAC24LM6oKHA/HhrUC
	Nyz8nP7Ag66gT3HZFNfN8msm6Ifo0v9wm4JbzTPhpf/2uKf+UnXu7wTxZX3RQA==
X-Gm-Gg: ASbGncta3IMf8zYsOXA1B8QeJYyRQEq9sidEaLyzc0FIvyANaivKsAmedjQNNYRE7hM
	L32KSQNnFUZZnHwLkfNuEOvpw2Hfrgwd5vxMDF/yeAOJI5ygT38yhpFqoNBZWx1GiKTpVpUI7eO
	TmvIFjZDfbPWrZ7zVdoWremiqYlKpWPg00370kTH624tbtdEemvAKONJ88U/IZp0BJ5FO8oh/R0
	KTPuDct584asOWGzLpZfLj15HXxPImgLCQcLIYVIq5iUBpPRs+B9ygdP0TL12Rbjwjk6DH3cWZa
	TQ6wzIaZz7dsvxLZQgcb1O97xkUwQZRRadn+HPw+85nI1/0wHbwVSCs/b1MsBYG0rsO0mvH8/78
	Ns5g=
X-Google-Smtp-Source: AGHT+IEfNgGJ7XcAzsjm6cyaXAPamjyk3rOPW/hBQ291FzyKguNl6mJFBl9jznGqYg7XminFEkoEqg==
X-Received: by 2002:a05:651c:40c2:b0:32c:a006:2a1d with SMTP id 38308e7fff4ca-32f42d15dcamr1232451fa.4.1752004653009;
        Tue, 08 Jul 2025 12:57:33 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:32 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 05/20] libebml: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:21 +0300
Message-ID: <20250708195636.1678606-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118327

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../recipes-mkv/libebml/libebml_1.4.5.bb      |  5 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/0001-allow-build-with-cmake-4.patch

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/0001-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-mkv/libebml/libebml/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..f62d412ac4
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From b54451a2cc63672284c7768ecf5562214826ea50 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 17:15:08 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Backport [https://github.com/Matroska-Org/libebml/commit/cc63f6b3ed2007a3ef04206a26f9ad5a657331bd]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b168a38..a8b789f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(ebml VERSION 1.4.5)
+ 
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
index 4b439e2ca5..1bc56b788b 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.5.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/Matroska-Org/libebml"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https"
-SRCREV = "1878e784321673561039a6a37076b2736f4dc98f"
+SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https \
+        file://0001-allow-build-with-cmake-4.patch"
 
+SRCREV = "1878e784321673561039a6a37076b2736f4dc98f"
 
 inherit pkgconfig cmake dos2unix
 
-- 
2.43.0


