Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723ACC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 18:42:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.63026.1699296131812554547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 10:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=inKvC7YJ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E037886828;
	Mon,  6 Nov 2023 19:42:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699296129;
	bh=5hvbkX0wo110vr2ltKNrFzKuD5NzT1eUl1Xl7s7HmL8=;
	h=From:To:Cc:Subject:Date:From;
	b=inKvC7YJP69OjKzFdeYHmPCGpRrFvNIph2GZMVs9QXGyfi+JlcZjouNe0QyWFkm5Y
	 w5SDDOY9rVamxyY1rzOfq3cUQ9Xu8C71KNy4Z5iLYwVypiJuz8kUi9PfzH3wpC2zyw
	 MiInkYvqzurx/shByRT9c5l6DacCiNezisbnGDzPpfCqZy56fODFL5BlnB5TVlA6JO
	 LhZSOzPVI1kQnStY4pOBrvhw9wazHzEvl6/W6qTVKsBYXU8bQTVrVsXAvDqxtW+JDD
	 BA9Wsk0hB6xY2TyPM9umx1bSYU7iO7JY8cCnyCJM2Kp4Qv48eg49RyaPgBZ+dzjqh5
	 e4BmcTyk+12vw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] glmark2: fix compatibility with python-3.11
Date: Mon,  6 Nov 2023 19:41:56 +0100
Message-ID: <20231106184158.23479-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 18:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106417

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...b-fix-compatibility-with-python-3.11.patch | 76 +++++++++++++++++++
 .../recipes-benchmark/glmark2/glmark2_git.bb  |  5 +-
 2 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-waflib-f=
ix-compatibility-with-python-3.11.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-comp=
atibility-with-python-3.11.patch b/meta-oe/recipes-benchmark/glmark2/file=
s/0001-waflib-fix-compatibility-with-python-3.11.patch
new file mode 100644
index 000000000..c56fa64e5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibili=
ty-with-python-3.11.patch
@@ -0,0 +1,76 @@
+From b85ba8c3ff3fb9ae708576ccef03434d2ef73054 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 14 Jun 2022 09:54:18 +0000
+Subject: [PATCH] waflib: fix compatibility with python-3.11
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-=
api
+
+  open(), io.open(), codecs.open() and fileinput.FileInput no longer
+  accept 'U' (=E2=80=9Cuniversal newline=E2=80=9D) in the file mode. Thi=
s flag was
+  deprecated since Python 3.3. In Python 3, the =E2=80=9Cuniversal newli=
ne=E2=80=9D is
+  used by default when a file is open in text mode. The newline paramete=
r
+  of open() controls how universal newlines works. (Contributed by Victo=
r
+  Stinner in bpo-37330.)
+
+* fixes:
+Waf: The wscript in '/OE/build/luneos-langdale/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glmark2/2021.12-r0/git' is unreadable
+Traceback (most recent call last):
+  File "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-we=
bos-linux/glmark2/2021.12-r0/git/waflib/Scripting.py", line 104, in waf_e=
ntry_point
+    set_main_module(os.path.normpath(os.path.join(Context.run_dir,Contex=
t.WSCRIPT_FILE)))
+    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^
+  File "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-we=
bos-linux/glmark2/2021.12-r0/git/waflib/Scripting.py", line 135, in set_m=
ain_module
+    Context.g_module=3DContext.load_module(file_path)
+                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-we=
bos-linux/glmark2/2021.12-r0/git/waflib/Context.py", line 343, in load_mo=
dule
+    code=3DUtils.readf(path,m=3D'rU',encoding=3Dencoding)
+         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "/OE/build/luneos-langdale/webos-ports/tmp-glibc/work/core2-64-we=
bos-linux/glmark2/2021.12-r0/git/waflib/Utils.py", line 117, in readf
+    f=3Dopen(fname,m)
+      ^^^^^^^^^^^^^
+ValueError: invalid mode: 'rUb'
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/178]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ waflib/ConfigSet.py | 2 +-
+ waflib/Context.py   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
+index 16142a2..87de4ad 100644
+--- a/waflib/ConfigSet.py
++++ b/waflib/ConfigSet.py
+@@ -140,7 +140,7 @@ class ConfigSet(object):
+ 		Utils.writef(filename,''.join(buf))
+ 	def load(self,filename):
+ 		tbl=3Dself.table
+-		code=3DUtils.readf(filename,m=3D'rU')
++		code=3DUtils.readf(filename,m=3D'r')
+ 		for m in re_imp.finditer(code):
+ 			g=3Dm.group
+ 			tbl[g(2)]=3Deval(g(3))
+diff --git a/waflib/Context.py b/waflib/Context.py
+index 8f2cbfb..f3e35ae 100644
+--- a/waflib/Context.py
++++ b/waflib/Context.py
+@@ -109,7 +109,7 @@ class Context(ctx):
+ 				cache[node]=3DTrue
+ 				self.pre_recurse(node)
+ 				try:
+-					function_code=3Dnode.read('rU',encoding)
++					function_code=3Dnode.read('r',encoding)
+ 					exec(compile(function_code,node.abspath(),'exec'),self.exec_dict)
+ 				finally:
+ 					self.post_recurse(node)
+@@ -340,7 +340,7 @@ def load_module(path,encoding=3DNone):
+ 		pass
+ 	module=3Dimp.new_module(WSCRIPT_FILE)
+ 	try:
+-		code=3DUtils.readf(path,m=3D'rU',encoding=3Dencoding)
++		code=3DUtils.readf(path,encoding=3Dencoding)
+ 	except EnvironmentError:
+ 		raise Errors.WafError('Could not read the file %r'%path)
+ 	module_dir=3Dos.path.dirname(path)
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/r=
ecipes-benchmark/glmark2/glmark2_git.bb
index 4976bf690..2b2ff53c7 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,9 +15,10 @@ PV =3D "20191226+${SRCPV}"
 COMPATIBLE_HOST_rpi  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'vc4g=
raphics', '.*-linux*', 'null', d)}"
=20
 SRC_URI =3D "git://github.com/glmark2/glmark2.git;protocol=3Dhttps;branc=
h=3Dmaster \
-           file://python3.patch"
+           file://python3.patch \
+           file://0001-waflib-fix-compatibility-with-python-3.11.patch \
+           "
 SRCREV =3D "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
-
 S =3D "${WORKDIR}/git"
=20
 inherit waf pkgconfig features_check
--=20
2.42.0


