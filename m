Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D35B960CD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 16:32:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so3502542wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 08:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iQaXiUXUERjuw4LQol6Dcc6NlCaSNEvIGPUZ8yGbWzg=;
	b=lEfcv98M69PfBy4Vn6Fd7uAS9edk/vKrXWj8Ifz4XJFnMxTOp6/KrMGNWmiNDP19DL
	zCfOjSlLzTw/dxZIW1VYmPN+uv9NLFhsZKf7svqVQFQ+rlsw1+cudmYJ2Xg7w5ho/Dbr
	PWBuN39cOZpcuRjWDU8v9DAi2NFP5CHyyst6miKllbVzMYEKEP+mXMyIKfHWehsCfKCL
	tiu+GbzWY0vzd6huS1PmqpfJWWDgLUPskkVd3qhXb+cBL8En4DCdLCY5zkHs0iydGbOv
	xNBPXsoxQTkJnKQ8fsZXX1PqJOBr8wcb0eEhr2yY+Y3WNfx2uk1qCT+x4+IrLXaGVsGN
	TyPg==
X-Gm-Message-State: APjAAAXFtdOVvxti7UzpWaZf9QPsbaswtBHoUM1KlUgL+enl8rSRneg9
	+7FMpbCreY0LcnRD+hJKGBCQCoov
X-Google-Smtp-Source: APXvYqyLijwYH3mQyRI/NbyXbkW4JIY14CvmJH3xXw6DJFCI5NwHTIrnnv3T3r/JIUvvY67hh08+9w==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr31439411wrt.229.1580920372345;
	Wed, 05 Feb 2020 08:32:52 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s139sm110026wme.35.2020.02.05.08.32.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 08:32:51 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 16:32:49 +0000
Message-Id: <20200205163249.19668-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200205163249.19668-1-git@andred.net>
References: <20200205163249.19668-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][master-next][PATCH 2/2] smem: update to v1.5 (python3 compatibility)
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
X-List-Received-Date: Wed, 05 Feb 2020 16:32:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

smem generally works using the upstream code, but
the --source argument still throws exceptions - add
a patch to resolve those as well.

There is no release on the downloads URL, but a tag
in mercurial - so this now downloads the snapshot that
tag is pointing to.

Signed-off-by: André Draszik <git@andred.net>
---
 ...ix-support-for-source-option-python3.patch | 53 +++++++++++++++++++
 .../smem/{smem_1.4.bb => smem_1.5.bb}         | 20 +++++--
 2 files changed, 68 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
 rename meta-oe/recipes-support/smem/{smem_1.4.bb => smem_1.5.bb} (56%)

diff --git a/meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch b/meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
new file mode 100644
index 000000000..5c1be5a0a
--- /dev/null
+++ b/meta-oe/recipes-support/smem/smem/0001-smem-fix-support-for-source-option-python3.patch
@@ -0,0 +1,53 @@
+From 3ff78f1f00973393d1a7ee4e467a2bacf1c807f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Wed, 5 Feb 2020 16:14:21 +0000
+Subject: [PATCH] smem: fix support for --source option (python3)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Using --source doesn't work without this patch:
+Traceback (most recent call last):
+  File "./smem", line 727, in <module>
+    showpids()
+  File "./smem", line 299, in showpids
+    showtable(pt.keys(), fields, columns.split(), options.sort or 'pss')
+  File "./smem", line 519, in showtable
+    mt = totalmem()
+  File "./smem", line 118, in totalmem
+    _totalmem = memory()['memtotal']
+  File "./smem", line 193, in memory
+    m = f.match(l)
+TypeError: cannot use a string pattern on a bytes-like object
+
+python3's tarfile returns bytes, whereas all of the rest of
+the code assumes str.
+
+Fix the tarfile usage to convert to str before returning the
+results.
+
+Signed-off-by: André Draszik <git@andred.net>
+Upstream-Status: Inappropriate [upstream wants to support python2 & python3]
+---
+ smem | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smem b/smem
+index 46a3189..54d40dd 100755
+--- a/smem
++++ b/smem
+@@ -90,9 +90,9 @@ class tardata(procdata):
+                 d,f = ti.name.split('/')
+                 yield d
+     def _read(self, f):
+-        return self.tar.extractfile(f).read()
++        return self.tar.extractfile(f).read().decode()
+     def _readlines(self, f):
+-        return self.tar.extractfile(f).readlines()
++        return [l.decode() for l in self.tar.extractfile(f).readlines()]
+     def piduser(self, p):
+         t = self.tar.getmember("%d" % p)
+         if t.uname:
+-- 
+2.23.0.rc1
+
diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
similarity index 56%
rename from meta-oe/recipes-support/smem/smem_1.4.bb
rename to meta-oe/recipes-support/smem/smem_1.5.bb
index 947c47b0f..90db9c3f3 100644
--- a/meta-oe/recipes-support/smem/smem_1.4.bb
+++ b/meta-oe/recipes-support/smem/smem_1.5.bb
@@ -9,9 +9,16 @@ SECTION = "Applications/System"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://www.selenic.com/${BPN}/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "fe79435c3930389bfdb560255c802162"
-SRC_URI[sha256sum] = "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
+HG_CHANGESET = "98273ce331bb"
+SRC_URI = "https://selenic.com/repo/${BPN}/archive/${HG_CHANGESET}.tar.bz2;downloadfilename=${BP}.tar.bz2 \
+           file://0001-smem-fix-support-for-source-option-python3.patch"
+SRC_URI[md5sum] = "51c3989779360f42b42ef46b2831be3a"
+SRC_URI[sha256sum] = "161131c686a6d9962a0e96912526dd46308e022d62e3f8acaed5a56fda8e08ce"
+
+UPSTREAM_CHECK_URI = "https://selenic.com/repo/smem/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/${BPN}-${HG_CHANGESET}"
 
 do_compile() {
         ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
@@ -21,12 +28,15 @@ do_install() {
         install -d ${D}/${bindir}/
         install -d ${D}/${mandir}/man8
         install -m 0755 ${S}/smem ${D}${bindir}/
+        sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' ${D}${bindir}/smem
         install -m 0755 ${S}/smemcap ${D}${bindir}/
         install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
 }
-RDEPENDS_${PN} += "python-textutils python-compression python-shell python-codecs"
 
-PACKAGES =+ "smemcap"
+RDEPENDS_${PN} = "python3-core python3-compression"
+RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
+
+PACKAGE_BEFORE_PN = "smemcap"
 
 FILES_smemcap = "${bindir}/smemcap"
 
-- 
2.23.0.rc1


