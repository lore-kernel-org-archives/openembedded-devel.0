Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.4732.1624523530905972340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 01:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15O8W8v3027288
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 01:32:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15O8W8Yx019859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 01:32:08 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 24 Jun 2021 01:32:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 24 Jun 2021 01:32:07 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: avoid host contamination for swig
Date: Thu, 24 Jun 2021 16:32:04 +0800
Message-ID: <20210624083204.17626-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

If the version of libssl-dev is not match the version of libssl on the
build machine, it fails to compile SWIG/_m2crypto_wrap.c which is
created by swig for python3-m2crypto-native:

| SWIG/_m2crypto_wrap.c:9757:19: error: dereferencing pointer to
   incomplete type 'struct stack_st'
|   if (arg1) (arg1)->num = arg2;
|                   ^~

But it works if no libssl-dev installed on the build machine.

Export STAGING_DIR to make existing patch
0001-setup.py-link-in-sysroot-not-in-host-directories.patch work. And
filter out '/usr/inlucde' from include pathes of swig.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../avoid-host-contamination.patch            | 23 +++++++++++++++++++
 .../python/python3-m2crypto_0.37.1.bb         |  3 +++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch b/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
new file mode 100644
index 000000000..9d9b8449b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
@@ -0,0 +1,23 @@
+Filter out '/usr/include' for swig to avoid host contamination issue.
+
+Upstream-Status: Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 5a12981..389d49f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -153,7 +153,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+             self.swig_opts.append('-py3')
+ 
+         # swig seems to need the default header file directories
+-        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()])
++        self.swig_opts.extend(['-I%s' % i for i in _get_additional_includes()
++                                            if i != '/usr/include'])
+ 
+         log.debug('self.include_dirs = %s', self.include_dirs)
+         log.debug('self.library_dirs = %s', self.library_dirs)
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index 2284a43a3..b3da87fb7 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
             file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
             file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
+            file://avoid-host-contamination.patch \
            "
 SRC_URI[sha256sum] = "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
 
@@ -42,4 +43,6 @@ SWIG_FEATURES_append_mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
 SWIG_FEATURES_append_powerpc64le = " -D__powerpc64__"
 export SWIG_FEATURES
 
+export STAGING_DIR
+
 BBCLASSEXTEND = "native"
-- 
2.17.1

