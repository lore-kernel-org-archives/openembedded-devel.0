Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id BA5216EA39
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:41 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2716894eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=nd5zEYbKbJeDF2XhkXdADLd6q6XElIf69auLc6RhvVw=;
	b=PGAmUhRzf113e7biWb5El3Xbg8InDwS6oDRs773JECbRm/325tEMBOSHRd38ZsgJu4
	AScxVZULtkubsJ2b6vbdtzJ+UzSzzfNHcRdHufe1+bxQIJskhw/4kpnNjLJ9BVSpjN4f
	9CPNi/JDfNcj9y5zVWnOF5xMFCcxp23wJrvpl0i0obEJntoBDfgUG1xnBjpwRTvc+21J
	DbtnXGojqp3cVmqQFFRf3J5GJaWiVZaNZiG80fLnbjXE5Op46lo6nE4tAB26KcVRdnou
	TaQ052J+UuEn1qRyvu6+m3OBhdDyD+mL9U0BmKl3USufFH1c+WAxL4wNQrIph+yh8+Wj
	wHhg==
X-Received: by 10.14.175.131 with SMTP id z3mr284533eel.65.1391240082484;
	Fri, 31 Jan 2014 23:34:42 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm46491685eef.16.2014.01.31.23.34.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:13 +0100
Message-Id: <8316209b9b517d12e60ce2fdb612eb645b4f300a.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 17/20] libeflvala: Fix build of tests
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2014 07:34:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/libeflvala/disable.eina.test.patch         | 44 ++++++++++++++++++++++
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch

diff --git a/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch b/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
new file mode 100644
index 0000000..84be133
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/libeflvala/disable.eina.test.patch
@@ -0,0 +1,44 @@
+It causes testeina.c build to fail linking to internal eina_.*_{init,shutdown} symbols
+as reported in:
+http://lists.alioth.debian.org/pipermail/pkg-fso-maint/2010-May/003056.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr vala/tests/testeina.vala ../../../arm920tt-oe-linux-gnueabi/libeflvala/1_2011.01.13.1+svnr82070-r2/vala/tests/testeina.vala
+--- vala/tests/testeina.vala	2014-01-13 16:16:53.984999035 +0100
++++ ../../../arm920tt-oe-linux-gnueabi/libeflvala/1_2011.01.13.1+svnr82070-r2/vala/tests/testeina.vala	2010-02-26 09:02:06.000000000 +0100
+@@ -153,22 +153,22 @@
+ 
+ void test_eina_benchmark()
+ {
+-    assert( Eina.Module.init() );
+-    assert( Eina.List.init() );
+-    assert( Eina.Array.init() );
+-    assert( Eina.Benchmark.init() );
+-    assert( Eina.Mempool.init() );
++//  assert( Eina.Module.init() );
++//  assert( Eina.List.init() );
++//  assert( Eina.Array.init() );
++//  assert( Eina.Benchmark.init() );
++//  assert( Eina.Mempool.init() );
+     var b = new Eina.Benchmark( "test", "test");
+     assert( b.register( "bogus", spec_one, 0, 100, 5 ) );
+     unowned Eina.Array<string> result = b.run();
+     assert( result.count_get() == 2 );
+     result = null;
+     b = null;
+-    assert( Eina.Mempool.shutdown() );
+-    assert( Eina.Benchmark.shutdown() );
+-    assert( Eina.Array.shutdown() );
+-    assert( Eina.List.shutdown() );
+-    assert( Eina.Module.shutdown() );
++//  assert( Eina.Mempool.shutdown() );
++//  assert( Eina.Benchmark.shutdown() );
++//  assert( Eina.Array.shutdown() );
++//  assert( Eina.List.shutdown() );
++//  assert( Eina.Module.shutdown() );
+ }
+ 
+ //===========================================================================
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 1eb9c13..ab37a68 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -13,6 +13,7 @@ SRCNAME = "vala"
 inherit e-base autotools pkgconfig vala
 
 SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};protocol=http \
+    file://disable.eina.test.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
1.8.5.3


