Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF6077BB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:19 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id o86so19592993pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XebsINcA7a1E1Tqa1/KlOUCydXEpsbR7nKQR9slcEgE=;
	b=cN1AMtS+QGGn5jDAerKRF5sw8mxehR/dHC0Oqv7IkHdTAF2JQSe0Mipw5cqXK+I4W1
	crw6bauQ8EGJNbEXYVJosQ0F7M0gNvSt8KusaMxgJiX8H1u3eYY/NpTj/IySn1vwB58e
	nQhFzyytDnWaGkyea+rJi0KlOVKobfZvh07GNO1DI7dGWAurjIXEmRqO9M30TNNuXGO4
	0irtV+KNyhVI561jqPGEfgYhzF1mzazXaT87PF1KuZf7MbTTaN2asfztJ0dtS9tGNzkj
	/Tv1qzAUlWM9TCzzsr70U4PMgM3fRuOLcqXN/XeDd/SooTrSjFCyDWjuCUAYDEMVqx8Z
	qzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XebsINcA7a1E1Tqa1/KlOUCydXEpsbR7nKQR9slcEgE=;
	b=F+6qiuxkI1yE8BFeyKPoWk9chfuKzVNouuSJU2MP00GhYA2XY8N0qr1mTnh0/AKO0B
	+4dd/3X796t1fMY8Q1QaOnSFiu4Hvpc++KVE7PwM5I8qBbggRnehDM1wuuNqKf1+RKrc
	wBvBMU5C8CKo5AAWL4XBNOgTJ1ZhJRkHxFLpIfqEbX96Ek1NymDzIA7P2HKotxTLnUvf
	hIX9fis/y5shyyXLN/lVc72FsyXY0hCWRr8lU1uixWrxLvv7g3Y42Df3Q7XgWMJLwcjE
	6RhN48h79xJiWhJ9zl2bxvlOsT8Py7tFd7kEGkGbqD61cChdyAM7jYqVsHaKMzijEFUP
	4w6g==
X-Gm-Message-State: AHYfb5hgGnir/ndEbiQf2yF1kvH2jm+feYXpWMVMOHeI0/wi6Q+ioLAJ
	zSolzvGZfsPjLZ7F
X-Received: by 10.98.63.83 with SMTP id m80mr5881179pfa.161.1502228900947;
	Tue, 08 Aug 2017 14:48:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:58 -0700
Message-Id: <20170808214800.39621-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 7/9] python-grpcio: Do not hardcode compiler -std options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Aug 2017 21:48:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...up.py-Do-not-mix-C-and-C-compiler-options.patch | 36 ++++++++++++++++++++++
 .../recipes-devtools/python/python-grpcio_1.4.0.bb |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch

diff --git a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
new file mode 100644
index 000000000..3686144b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -0,0 +1,36 @@
+From b02be74a2eff8abc612ef84f30e0fbce6a7f65f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Aug 2017 09:04:07 -0700
+Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
+
+EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
+so using -std=c++11 or -std=gnu99 together will cause
+build time errors espcially with clang
+
+error: invalid argument '-std=gnu99' not allowed with 'C++'
+
+gcc7 ( defaults are -std=gnu11 and -std=gnu++14 )
+ as well clang default to these standards mode or newer
+anyway
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index cb85273..f79878d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -116,7 +116,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+   elif 'win32' in sys.platform:
+     EXTRA_ENV_COMPILE_ARGS += ' -D_PYTHON_MSVC'
+   elif "linux" in sys.platform:
+-    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv'
++    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv'
+   elif "darwin" in sys.platform:
+     EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv'
+ 
+-- 
+2.13.4
+
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
index 5412e0243..2446411a1 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
@@ -4,6 +4,8 @@ SECTION = "devel/python"
 
 DEPENDS = "python-protobuf"
 
+SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+           "
 RDEPENDS_${PN} = "python-enum34 \
                   python-futures \
                   python-protobuf \
-- 
2.14.0


