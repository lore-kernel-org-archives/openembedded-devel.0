Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.2860.1591991671235407808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 12:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Se/RU5i4;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: paulohefagundes@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id b7so4504226pju.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a73nx33+XSS8ZiW+4MDsqJvVb+3mTHmZ7Ah+qZ/8ilU=;
        b=Se/RU5i4BHFvy3yPp8Lj/92JhqON53l6Mwi/H+9kc97OLWPnWMFwrSG4fTUKFJxfWR
         PhuejGe3orfvAIZg6TfdVSsjQtoj4pwUr8L/3DooDSg0sPle1mQwUkALBC91hLqF32g9
         3c3T4qkeu4bpV0s0p2WlJb0wN8OBSm8r9kWwGZNCliUALbQcfyqFn+i6VSC6FStDjBti
         gexm46Ej74uj5GuCkA9WrgYilefOQri09gIThdu9K25Tp4JMzuB+7IAx8NSfK57sEnit
         oYiqQFGgcnhoMbRqh88wkIBXkl191AS4UQ4SKoaevXgN7obj/uHqy45kL/Gc6+BUxCSc
         B/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a73nx33+XSS8ZiW+4MDsqJvVb+3mTHmZ7Ah+qZ/8ilU=;
        b=IcjaF9qntzoOS6kws+dIc3Ako02FFv1061Zrh7bzWTlWVnCagqXJlBmN8p92jJgEGI
         R7AuQccOudGv8Iu0DJImZHxQPdpoW/RY/0QgdJq0w77IMd8n9waJDEZhqTOT1LekuxoR
         H+SEAZLqQL7ZKnYO/7ttydcdRCx222NfPvoVrSuzUtCCh3hqpjVU/mLUwkMkUoYrhmXH
         uQslxAuWkNlUZOvcEVsUnxfU0z3GwSpmEmcYUnZpBNw2eCJV1Uc3kdc9/CQWwXEDlEj5
         yva3k5mlqbzTcHfg5wI8KxhR+aJgSMrXrsACd94AKBLGoRwmKq66mxVoI4nF5B3lQY6h
         IrGA==
X-Gm-Message-State: AOAM533TBA+5y+SriZjKebWb0j3rb4VYyeNgR9ZyOdAVkZU3zE5lc/Gq
	JpbmRvvztnm91Y6Xx6NNS/bAgGgy
X-Google-Smtp-Source: ABdhPJz2HODTwLZ6eLFkF430lDZ5gM08cSqmK1j+G6dd71CQe9C+BeatgsefcvStXVKBMt3QyQgyWQ==
X-Received: by 2002:a17:90b:3105:: with SMTP id gc5mr526427pjb.36.1591991670464;
        Fri, 12 Jun 2020 12:54:30 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from localhost.localdomain (c-24-11-33-45.hsd1.ut.comcast.net. [24.11.33.45])
        by smtp.gmail.com with ESMTPSA id 187sm4721357pfv.53.2020.06.12.12.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 12:54:29 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-python][PATCH] python3-fastapi and python3-uvicorn: add packages and dependencies
Date: Fri, 12 Jun 2020 13:54:25 -0600
Message-Id: <20200612195425.36226-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fastapi depends on
- pydantic
- starlette

uvicorn depends on
- click
- h11
- httptools
- uvloop
- websockets
- wsproto
---
 .../python/python3-h11_0.9.0.bb                 |  8 ++++++++
 .../python/python3-httptools_0.1.1.bb           |  8 ++++++++
 .../python/python3-pydantic_1.5.1.bb            | 12 ++++++++++++
 .../python/python3-starlette_0.13.4.bb          |  8 ++++++++
 .../python/python3-uvicorn_0.11.5.bb            | 17 +++++++++++++++++
 .../python/python3-uvloop_0.14.0.bb             |  8 ++++++++
 .../python/python3-wsproto_0.15.0.bb            |  8 ++++++++
 7 files changed, 69 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h11_0.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.9.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.9.0.bb
new file mode 100644
index 000000000..6219032bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h11_0.9.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A pure-Python, bring-your-own-I/O implementation of HTTP/1.1"
+HOMEPAGE = "https://github.com/python-hyper/h11"
+LICENSE = "MIT"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "53affae306153388512040e038519fa3"
+SRC_URI[sha256sum] = "33d4bca7be0fa039f4e84d50ab00531047e53d6ee8ffbc83501ea602c169cae1"
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
new file mode 100644
index 000000000..cd4ac2dda
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A collection of framework independent HTTP protocol utils"
+HOMEPAGE = "https://github.com/MagicStack/httptools"
+LICENSE = "MIT"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "063a9b6f8c79cf5f11592e7a49715275"
+SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb
new file mode 100644
index 000000000..4a627e2d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Data validation and settings management using python 3.6 type hinting"
+HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
+LICENSE = "MIT"
+RDEPENDS_${PN} += "\
+    python3-image \
+    python3-typing \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "866774950cb506f15c309875b7297240"
+SRC_URI[sha256sum] = "f0018613c7a0d19df3240c2a913849786f21b6539b9f23d85ce4067489dfacfa"
diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb b/meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb
new file mode 100644
index 000000000..78b26f655
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb
@@ -0,0 +1,8 @@
+SUMMARY = "The little ASGI library that shines"
+HOMEPAGE = "https://www.starlette.io/"
+LICENSE = "BSD"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "888aa6af0a42e5d1f2aeea4941e8102d"
+SRC_URI[sha256sum] = "04fe51d86fd9a594d9b71356ed322ccde5c9b448fc716ac74155e5821a922f8d"
diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb
new file mode 100644
index 000000000..c394be54f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The lightning-fast ASGI server"
+HOMEPAGE = "https://www.uvicorn.org/"
+LICENSE = "BSD"
+RDEPENDS_${PN} += "\
+    python3-click \
+    python3-h11 \
+    python3-httptools \
+    python3-typing \
+    python3-uvloop \
+    python3-websockets \
+    python3-wsproto \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "9f82b3674ced119596afe3b7b977f82c"
+SRC_URI[sha256sum] = "596eaa8645b6dbc24d6610e335f8ddf5f925b4c4b86fdc7146abb0bf0da65d17"
diff --git a/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb b/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb
new file mode 100644
index 000000000..9c8c8443d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Fast implementation of asyncio event loop on top of libuv"
+HOMEPAGE = "http://github.com/MagicStack/uvloop"
+LICENSE = "MIT"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "a2f82abb676756f11f544c6b51caf171"
+SRC_URI[sha256sum] = "123ac9c0c7dd71464f58f1b4ee0bbd81285d96cdda8bc3519281b8973e3a461e"
diff --git a/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb b/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb
new file mode 100644
index 000000000..f76346aa0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "WebSockets state-machine based protocol implementation"
+HOMEPAGE = "https://github.com/python-hyper/wsproto/"
+LICENSE = "MIT"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "7d85f66da7ca9945b8bbfb8134900057"
+SRC_URI[sha256sum] = "614798c30e5dc2b3f65acc03d2d50842b97621487350ce79a80a711229edfa9d"
-- 
2.27.0

