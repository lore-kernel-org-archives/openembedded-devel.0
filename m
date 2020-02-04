Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1A96661172
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 23:41:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z7so264967wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 15:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V2MUSylmweoHdRqS6xde6Bcq2Pn+ny+t4UeulFfk0es=;
	b=Od5QnjMKLVi71YSThzM1rAJ/WjgsNGUESCiuPxtZtGUk0EaTWJTs7ffABbdVUUcksx
	J+3oChPQtmfoE8G+Lp/3j5xYUzBXExEVfprjGC+Suzl4XfzFCegq8s2lRT2U2Kx/sKer
	G316VmhZBh4NcXXrus3kMSEjjpFwCrOFzvYaV4PKXN6pLHLvY0qChmVvZ5PDbudY/QfZ
	hXvYuCKqnbH2oqqiK4bx3g1Qdy6Kn8IUP/uCbpbgLdZWvj2aAPu1FzGi/zXZrhp4pdjl
	YRvq4GSs29rv1NK5G15trJTMv+0JbnLNpTn5GQsq18azQkehTdnLYzGunVn5l5Jb9x8U
	Ed5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V2MUSylmweoHdRqS6xde6Bcq2Pn+ny+t4UeulFfk0es=;
	b=TqRgrqTs3aUE9gU2116ZH5wSoERVFyfBAxvs1FycjcBP8YncW8qCr9vcS2Zyis3vgA
	9OVjkn/nxGU31XITvPy7nT5oWbyU4XFWX4MjTPWcRfn8RGToRbwTDEXzxdXq0LKVL24V
	r6TuxgpvlYQSl6GvwEdMiw7LOyUEFfq7hvWrWZlDya5jZ22fHKj0Xf24ONWr23VYP7rJ
	ojK5mPFkDmpqNVnZk1ajEFktbUPRHL+J796O+FAlbzLZf+8f1NyWx7gAZaGL7/rav895
	AYzy2OfrIch66ZTyu38nmN7++FRWaIKRd5vQqKDBwUeQBHhgyg61WTJv4+Hoq6KwkGFg
	JDAQ==
X-Gm-Message-State: APjAAAWopyO51sWkwuk/XvUZ18J1K0Oxg36vOdY41XPQ1ed7ZgSJpr0f
	aDB8wLDOkbWh79U0C6M/IU/bRgQT
X-Google-Smtp-Source: APXvYqxefHxxvkolZwzIu+7sSFAN10X1aCk6Z/2w76n8k4NySdV5Kb2RHXP3dqKEkxVNfrNZnhAa/g==
X-Received: by 2002:adf:bbcf:: with SMTP id z15mr20471803wrg.266.1580859704310;
	Tue, 04 Feb 2020 15:41:44 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	z11sm31447072wrv.96.2020.02.04.15.41.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 15:41:43 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 00:40:13 +0100
Message-Id: <20200204234013.59800-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] smem: use python 3
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
X-List-Received-Date: Tue, 04 Feb 2020 23:41:44 -0000
Content-Transfer-Encoding: 8bit

There seems to be no user of python-textutils python-shell python-codecs
in the script, so these rdepends are dropped.

On a i.MX6 based machine smem runs with just python3-compression and
its dependencies installed.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../smem/0001-smem-convert-to-python-3.patch  | 161 ++++++++++++++++++
 meta-oe/recipes-support/smem/smem_1.4.bb      |   7 +-
 2 files changed, 166 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch

diff --git a/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch b/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
new file mode 100644
index 000000000..85f35be44
--- /dev/null
+++ b/meta-oe/recipes-support/smem/smem/0001-smem-convert-to-python-3.patch
@@ -0,0 +1,161 @@
+From 5535a524f6db57c0b2e4a539db733fd9e840c97e Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Mon, 3 Feb 2020 21:04:42 +0000
+Subject: [PATCH] smem: convert to python 3
+
+Upstream-Status: Pending
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ smem | 41 ++++++++++++++++++++++-------------------
+ 1 file changed, 22 insertions(+), 19 deletions(-)
+
+diff --git a/smem b/smem
+index 0cbd925..577d27b 100755
+--- a/smem
++++ b/smem
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # smem - a tool for meaningful memory reporting
+ #
+@@ -21,7 +21,10 @@ class procdata(object):
+     def _list(self):
+         return os.listdir(self.source + "/proc")
+     def _read(self, f):
+-        return file(self.source + '/proc/' + f).read()
++        afile = open(self.source + '/proc/' + f)
++        ret = afile.read()
++        afile.close()
++        return ret
+     def _readlines(self, f):
+         return self._read(f).splitlines(True)
+     def _stat(self, f):
+@@ -209,7 +212,7 @@ def fromunits(x):
+     s = dict(k=2**10, K=2**10, kB=2**10, KB=2**10,
+              M=2**20, MB=2**20, G=2**30, GB=2**30,
+              T=2**40, TB=2**40)
+-    for k,v in s.items():
++    for k,v in list(s.items()):
+         if x.endswith(k):
+             return int(float(x[:-len(k)])*v)
+     sys.stderr.write("Memory size should be written with units, for example 1024M\n")
+@@ -240,7 +243,7 @@ def pidtotals(pid):
+     maps = pidmaps(pid)
+     t = dict(size=0, rss=0, pss=0, shared_clean=0, shared_dirty=0,
+              private_clean=0, private_dirty=0, referenced=0, swap=0)
+-    for m in maps.iterkeys():
++    for m in maps.keys():
+         for k in t:
+             t[k] += maps[m].get(k, 0)
+ 
+@@ -296,7 +299,7 @@ def showpids():
+         )
+     columns = options.columns or 'pid user command swap uss pss rss'
+ 
+-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
+ 
+ def maptotals(pids):
+     totals = {}
+@@ -307,7 +310,7 @@ def maptotals(pids):
+         try:
+             maps = pidmaps(pid)
+             seen = {}
+-            for m in maps.iterkeys():
++            for m in maps.keys():
+                 name = maps[m]['name']
+                 if name not in totals:
+                     t = dict(size=0, rss=0, pss=0, shared_clean=0,
+@@ -361,7 +364,7 @@ def showmaps():
+         )
+     columns = options.columns or 'map pids avgpss pss'
+ 
+-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
+ 
+ def usertotals(pids):
+     totals = {}
+@@ -383,7 +386,7 @@ def usertotals(pids):
+         else:
+             t = totals[user]
+ 
+-        for m in maps.iterkeys():
++        for m in maps.keys():
+             for k in t:
+                 t[k] += maps[m].get(k, 0)
+ 
+@@ -419,7 +422,7 @@ def showusers():
+         )
+     columns = options.columns or 'user count swap uss pss rss'
+ 
+-    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
++    showtable(list(pt.keys()), fields, columns.split(), options.sort or 'pss')
+ 
+ def showsystem():
+     t = totalmem()
+@@ -460,14 +463,14 @@ def showsystem():
+               'area not reclaimable'))
+ 
+     columns = options.columns or 'area used cache noncache'
+-    showtable(range(len(l)), fields, columns.split(), options.sort or 'order')
++    showtable(list(range(len(l))), fields, columns.split(), options.sort or 'order')
+ 
+ def showfields(fields, f):
+     if f != list:
+-        print "unknown field", f
+-    print "known fields:"
++        print("unknown field", f)
++    print("known fields:")
+     for l in sorted(fields.keys()):
+-        print "%-8s %s" % (l, fields[l][-1])
++        print("%-8s %s" % (l, fields[l][-1]))
+ 
+ def showtable(rows, fields, columns, sort):
+     header = ""
+@@ -518,10 +521,10 @@ def showtable(rows, fields, columns, sort):
+         return
+ 
+     if not options.no_header:
+-        print header
++        print(header)
+ 
+     for k,r in l:
+-        print format % tuple([f(v) for f,v in zip(formatter, r)])
++        print(format % tuple([f(v) for f,v in zip(formatter, r)]))
+ 
+     if options.totals:
+         # totals
+@@ -533,8 +536,8 @@ def showtable(rows, fields, columns, sort):
+             else:
+                 t.append("")
+ 
+-        print "-" * len(header)
+-        print format % tuple([f(v) for f,v in zip(formatter, t)])
++        print("-" * len(header))
++        print(format % tuple([f(v) for f,v in zip(formatter, t)]))
+ 
+ def showpie(l, sort):
+     try:
+@@ -605,7 +608,7 @@ def showbar(l, columns, sort):
+ 
+     pl = []
+     ind = numpy.arange(len(l))
+-    for n in xrange(len(rc)):
++    for n in range(len(rc)):
+         pl.append(pylab.bar(ind + offset + width * n,
+                              [x[1][rc[n]] for x in l], width, color=gc(n)))
+ 
+@@ -682,7 +685,7 @@ try:
+         showsystem()
+     else:
+         showpids()
+-except IOError, e:
++except IOError as e:
+     if e.errno == errno.EPIPE:
+         pass
+ except KeyboardInterrupt:
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
index 947c47b0f..4728e6b79 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -9,7 +9,10 @@ SECTION = "Applications/System"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://www.selenic.com/${BPN}/download/${BP}.tar.gz"
+SRC_URI = " \
+    http://www.selenic.com/${BPN}/download/${BP}.tar.gz \
+    file://0001-smem-convert-to-python-3.patch \
+"
 SRC_URI[md5sum] = "fe79435c3930389bfdb560255c802162"
 SRC_URI[sha256sum] = "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
 
@@ -24,7 +27,7 @@ do_install() {
         install -m 0755 ${S}/smemcap ${D}${bindir}/
         install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
 }
-RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codecs"
+RDEPENDS_${PN} += "python3-compression"
 
 PACKAGES =+ "smemcap"
 
-- 
2.20.1


