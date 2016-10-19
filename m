Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E722E719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:49 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 128so1429547pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5E4PHN0WpVVSKpMDoolZEc7kyOvSWEleQJznvqFjwGM=;
	b=ukZxo58Elqrs6//ArbQzXcMWJgF8Zbx3V8peybDcJ+5BQJFNK4mztRMZegTosC7Zj+
	5U/X7E/6i+wgEUF0eU6egzuBzxBtxlDQ+REjgOpsBr741x8BRwNK3epy+8TrfDsMksiC
	qCqzueR7bFb45V+S1jKwCWjUCepoBMMhBLMyhDexs4kPn8f7wx4/SbfPBHNTKNwaYTlq
	nwITqKbZFxcjG0rK+bZytQKMhAQEIgNIUjTkBbop2NUPV3FWdEUDL8SUAWvYG7HF0vLo
	TacJrXCRgls/OUJldCqkkPjBzeYbHiTi1i8BcwkUoSW84VOeMFfXvLuFcxXo00Q+0UGE
	ExVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5E4PHN0WpVVSKpMDoolZEc7kyOvSWEleQJznvqFjwGM=;
	b=dLplYZT/lTfiCISYnrc7S7zHb4Pa3HrI0UkX2kzjkp4uw+89SciIuev2VwO9vyi6lD
	gq/ZDmlfP68cKM0uAe1mHnCk7mwcpFUpqMB737h10C38iZlzIKHuoe9AxcUhDdraF2Dw
	Hrrxb84j69OxcDubHsbuumtvW/3MBQfDqosuCWEU692TRWc1bVQEUsi8K2mwcWANh+rz
	3nQzG6/bhbluMkOP/yYvDlMAA3SGIRJ1MbOuObLwXwzWe05lw8Qj2TXSGNUrM7KqoXrO
	i7XCBkaDn2UROCWVV6+Gma+QN7cyBl7WY4wi5CXnynQoPex8lqZshvhfXOhlRUm5NomL
	JGwA==
X-Gm-Message-State: AA6/9RnXUA4eqZUxiL+PPlR7UvC+6JuNeh+MXy7HT5dYF3TQSNiN/BbSuHmI5GJxPhnyww==
X-Received: by 10.99.109.138 with SMTP id i132mr6320829pgc.39.1476855531447;
	Tue, 18 Oct 2016 22:38:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:30 -0700
Message-Id: <20161019053834.11523-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/16] glcompbench: Demand c++11 explicitly
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:50 -0000

Helps in fixing build issues when default std of C++
compiler is older

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-build-Specify-std-c-11-on-cmdline.patch   | 45 ++++++++++++++++++++++
 .../glcompbench/glcompbench_2012.08.bb             |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch
new file mode 100644
index 0000000..ffbc297
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch
@@ -0,0 +1,45 @@
+From 47bfef0dd83ed2e10ec4c615908ec926c4d5fe2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 00:56:54 +0000
+Subject: [PATCH] build: Specify -std=c++11 on cmdline
+
+We use c++11 features so demand it explicitly from compiler
+
+Fixes
+| ../src/libmatrix/shader-source.cc:37:10: error: no member named 'unique_ptr' in namespace 'std'
+|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+|     ~~~~~^
+| ../src/libmatrix/shader-source.cc:37:33: error: expected '(' for function-style cast or type construction
+|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+|                     ~~~~~~~~~~~~^
+| ../src/libmatrix/shader-source.cc:37:35: error: use of undeclared identifier 'is_ptr'
+|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+|                                   ^
+| ../src/libmatrix/shader-source.cc:38:30: error: use of undeclared identifier 'is_ptr'
+|     std::istream& inputFile(*is_ptr);
+|                              ^
+| 4 errors generated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index dcaf298..485a9fb 100644
+--- a/wscript
++++ b/wscript
+@@ -79,7 +79,7 @@ def configure(ctx):
+             ctx.check_cfg(package = pkg, uselib_store = uselib, args = '--cflags --libs',
+                           mandatory = True)
+ 
+-    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -Wextra'.split(' '))
++    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra'.split(' '))
+ 
+     # Prepend -O# and -g flags so that they can be overriden by the CFLAGS environment variable
+     if Options.options.opt:
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
index 35fb4ad..7cf9692 100755
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -9,7 +9,9 @@ SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.
            file://glbench-compile-fix.patch \
            file://Fix-configure-for-sqrt-check.patch \
            file://Fix_space_issues.patch \
-           file://Fix_auto_ptr_deprecated.patch"
+           file://Fix_auto_ptr_deprecated.patch \
+           file://0001-build-Specify-std-c-11-on-cmdline.patch \
+"
 
 SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
 SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
-- 
2.10.0


