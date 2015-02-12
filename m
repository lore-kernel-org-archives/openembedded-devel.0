Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 009FA606E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 14:36:42 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f51so8135805qge.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=9CySQogmr8U6LddgXKu5DYK3p2UpbA2XC2EnM3zZBso=;
	b=kI39Yht57DmDkjf1lQr3lX3QMOYJJ6fF0T5T9Wigg5Sb+uvEBWoBwTyM3SD6Jedr9v
	YowLIgmt1PwnT3agpabHiaVEFFWbAkg3la6Kx/ZzOkIRDtjBdiYQSnfy5aFXeoJgI1fG
	8JQ8jteXG7141my8NL7s8gwVYXrCIrzxoCJGqINNGuYbC1R0+vNwIYdqseug20nSaAmh
	BZIj0D7EkbX/X+4F4XdHafjKBxZps45hLYegRv6B+L/enIlnZRoCTYvYZOo3iFGVm+B7
	uDaKYw413YozA2Jle3IPJNN3ES1OqABxLkQcyO3rTzlN1Q0+m4qtI+UVnNKZ29QMt8x0
	CyvQ==
X-Received: by 10.140.94.6 with SMTP id f6mr10868454qge.38.1423751803235;
	Thu, 12 Feb 2015 06:36:43 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-84-240.ronkva.east.verizon.net.
	[108.44.84.240])
	by mx.google.com with ESMTPSA id c9sm4138867qas.37.2015.02.12.06.36.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 06:36:42 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 09:36:38 -0500
Message-Id: <1423751798-25797-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-pyzmq : Add recipe for Python Zero Message Queue bindings.
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
X-List-Received-Date: Thu, 12 Feb 2015 14:36:44 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python/python-pyzmq/club-rpath-out.patch       | 26 +++++++++++++++++++++
 .../recipes-devtools/python/python-pyzmq_14.5.0.bb | 27 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
new file mode 100644
index 0000000..2dc3b73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -0,0 +1,26 @@
+diff --git a/setup.py b/setup.py
+index 62df445..1fdbdeb 100755
+--- a/setup.py
++++ b/setup.py
+@@ -213,12 +213,6 @@ def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
+                 pass
+                 # unused rpath args for OS X:
+                 # settings['extra_link_args'] = ['-Wl,-rpath','-Wl,$ORIGIN/..']
+-            else:
+-                settings['runtime_library_dirs'] += ['$ORIGIN/..']
+-        elif sys.platform != 'darwin':
+-            settings['runtime_library_dirs'] += [
+-                os.path.abspath(x) for x in settings['library_dirs']
+-            ]
+     
+     return settings
+ 
+@@ -592,8 +586,6 @@ class Configure(build_ext):
+                 pass
+                 # unused rpath args for OS X:
+                 # settings['extra_link_args'] = ['-Wl,-rpath','-Wl,$ORIGIN/../zmq']
+-            else:
+-                settings['runtime_library_dirs'] = [ os.path.abspath(pjoin('.', 'zmq')) ]
+         
+         line()
+         info("Configure: Autodetecting ZMQ settings...")
diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
new file mode 100644
index 0000000..8b921b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
+HOMEPAGE = "http://zeromq.org/bindings:python"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e"
+DEPENDS = "zeromq"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pyzmq/pyzmq-${PV}.tar.gz \
+           file://club-rpath-out.patch \
+"
+SRC_URI[md5sum] = "8d3351a8ca2ca2a272a3f96bcb963e41"
+SRC_URI[sha256sum] = "5d6e045634456cf5496f50871fd3e3a5ede2b90433284dbfe985bb67c97f77bd"
+
+S = "${WORKDIR}/pyzmq-${PV}"
+
+inherit setuptools pkgconfig
+
+FILES_${PN}-dbg =+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.debug"
+
+do_compile_prepend() {
+	echo [global] > ${S}/setup.cfg
+	echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
+	echo have_sys_un_h = True >> ${S}/setup.cfg
+	echo skip_check_zmq = True >> ${S}/setup.cfg
+	echo libzmq_extension = False >> ${S}/setup.cfg
+	echo no_libzmq_extension = True >> ${S}/setup.cfg
+}
-- 
2.1.0


