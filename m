Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC356E510
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:50 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so1012768eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xOfH67BWjNiALaidTCvzhQvo/qdeXK1iQX6ukcrvJK4=;
	b=MP1zVg7leGlQvgJ1xSJTte9xVW5g8CS4WR1jAAnUd8FBI0G/cLsDY6ofP287tObMYa
	6YHkG/pM1taPVgCn+iHe9DFHVbZPe0XHsJQiVCHGkTVde/QMwgubAyMdBTbCgwT4q+PO
	vOH3jr3m1SF8FNdTIozmOhsMrr/Ktq6bkGUOzagykwWXqyX8aHwIIDH5W7qOijIC6IZ0
	+9/mCfDWCfTr1R8LxR28oBR543PiJAcQ8DH5dd4fiq38C+poHWMeCBaaprO/iKEhEkAL
	8NUIg8EE4ryblDo3XYXT2QKO5AWaONMtWibm3hGgktWuUs1Rh18dK9PHTOiK0Wy6Ku4H
	WZRA==
X-Received: by 10.14.93.197 with SMTP id l45mr4421824eef.115.1389806271364;
	Wed, 15 Jan 2014 09:17:51 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm11763182eeg.0.2014.01.15.09.17.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:54 +0100
Message-Id: <277b6014a89220a53eb446aa3ae6fa78d844c34e.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCHv2 4/7] libeflvala: Fix build of tests
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:51 -0000

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
1.8.5.2


