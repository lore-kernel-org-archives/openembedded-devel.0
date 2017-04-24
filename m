Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFA271D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:29 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e132so13852199ite.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j196NGk8mXpCkjc8P1h2YB+ThdelHacmNnN4z6o+7KU=;
	b=vZPRB/qH5ANyNQQwEaCbNJ8V8ZYGi9PEl2kpuMDOl1exBTnGu6fFtB6P55JgTwu8hC
	NW9I5e49RMmUtQ3SSiNJe/6YctvYcXNiqrnq34yb8uJK3rnYtGc2qr8POUkr5Gtys6oh
	ZlxhlQpbxljmA/8j0br5YHxrA21ApyyoypLxOljYSPFeYJUMbluhXI5BPHmYq6z/c5DM
	uF+4kUCHviG20Gn0tIxz4AmjT6ms4CSvhbPCQzZwJwa0IkztVsuOZA3mThYdC5hp4DUc
	EQ1K5KrYuwihOU86SDlGSnSR1btKrbXB3CmKSUrRHQKFy/6yWSngWOFzmmmfslVa5pxp
	803g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j196NGk8mXpCkjc8P1h2YB+ThdelHacmNnN4z6o+7KU=;
	b=dzniyGTy5HZQAfrfkM7kCX8MDqyCk4cNTDYP42SdlkVKwr/zoHz30UTaDSvXv40CU5
	TtEI4Jtz2+sRtdYXgIKX1eNOFS2kmcuYYvAN8FMJO+POv6aUXKMniDmavrLTHMOZRmRy
	L1wLSkQkTsCLyLbhYTVUFWnvbvrT2UCSIKcO2Zbw5DL1GlTBTF6nybPOUj3ER1FIXeiY
	bIyb+FEFAbwtXrQojaJzojqHiZzJu7LrKR8AzBDCup0eCt5+lKLaWqAd5WO8DSeE9C1f
	kQFKJ+U/XdwXz0PpTzalUoz6z5CE6KMeKTRitNqijhAvol0DQZc48ph2VK01iYbaGal/
	GgWQ==
X-Gm-Message-State: AN3rC/6orr1wwCceJANjZuuNK+lXzxFOdSTMu8/+tBXrdKuDu9rxQzX5
	UsT9JIz0Fxk25w==
X-Received: by 10.99.1.198 with SMTP id 189mr22858731pgb.229.1493011291183;
	Sun, 23 Apr 2017 22:21:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:53 -0700
Message-Id: <20170424052058.4952-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 12/17] squid: Upgrade to 3.5.25
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:30 -0000

Add patch to fix throw() errors with gcc7
Update copyright year to 2017

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-noexcept-instead-of-throw-for-C-11-comp.patch | 48 ++++++++++++++++++++++
 .../squid/{squid_3.5.23.bb => squid_3.5.25.bb}     |  9 ++--
 2 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
 rename meta-networking/recipes-daemons/squid/{squid_3.5.23.bb => squid_3.5.25.bb} (92%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
new file mode 100644
index 000000000..48674c3c5
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
@@ -0,0 +1,48 @@
+From f9150a0dc092ab2cbd47ee428436b747dce323a9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Apr 2017 10:28:28 -0700
+Subject: [PATCH] SquidNew: use noexcept instead of throw for C++11 compilers
+
+Fixes errors with gcc7 which is more pedantic about c++11
+conformance regarding deprecated features
+
+include/SquidNew.h:21:51: error: dynamic exception specifications are deprecated in C++11
+_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
+                                                       ^~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/SquidNew.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/SquidNew.h b/include/SquidNew.h
+index 39fcee0..c960347 100644
+--- a/include/SquidNew.h
++++ b/include/SquidNew.h
+@@ -18,19 +18,19 @@
+  */
+ #include <new>
+ 
+-_SQUID_EXTERNNEW_ void *operator new(size_t size) throw (std::bad_alloc)
++_SQUID_EXTERNNEW_ void *operator new(size_t size) noexcept(false)
+ {
+     return xmalloc(size);
+ }
+-_SQUID_EXTERNNEW_ void operator delete (void *address) throw()
++_SQUID_EXTERNNEW_ void operator delete (void *address) noexcept(true)
+ {
+     xfree(address);
+ }
+-_SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
++_SQUID_EXTERNNEW_ void *operator new[] (size_t size) noexcept(false)
+ {
+     return xmalloc(size);
+ }
+-_SQUID_EXTERNNEW_ void operator delete[] (void *address) throw()
++_SQUID_EXTERNNEW_ void operator delete[] (void *address) noexcept(true)
+ {
+     xfree(address);
+ }
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.23.bb b/meta-networking/recipes-daemons/squid/squid_3.5.25.bb
similarity index 92%
rename from meta-networking/recipes-daemons/squid/squid_3.5.23.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.25.bb
index 0fe9673af..5116383b8 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.23.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.25.bb
@@ -21,12 +21,13 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://volatiles.03_squid \
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
-"
-SRC_URI[md5sum] = "b9e5603f00b0c40109610667d8693b22"
-SRC_URI[sha256sum] = "4384564e6227fbb4c18626d663e1b47912d3507b596ed997f2149f10dd8d70bd"
+           file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
+           "
+SRC_URI[md5sum] = "c34b228129a755f363367c45c46287ba"
+SRC_URI[sha256sum] = "0bfd6182154b7f29574d71c659f1cfd1b7d9be9356895dac70dc0f3696a0639b"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-                    file://errors/COPYRIGHT;md5=0d98c4448c368d146f31a970bb0ced21 \
+                    file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
                    "
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
-- 
2.12.2


