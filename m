Return-Path: <philip.balister@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5E665C85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:54:00 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id bm13so12736787qab.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=STmODMUa+HB229lSrNkmFl6/PFie1tcxNy59dxC5jY0=;
	b=vbH4Rb+hMMF8OOvkwLVurE/mdWmeYOm35IDHGSEnrcllpECXVyFebniJbf52bM8fJy
	4DB5LIFSO5Ar3xNyvnAhWw70GjydHZ1PoATdTSeVetXS88GKogKtKP3kcwYoEbhJncGK
	77wCcJljjYUSY8zgHM/iJqczN1dj+cyTQHq8EIGv9DkkXCRpOoL54f5fG6i6i1XV2LmC
	g/q7quWCdm/kM6ErftiJduf5ns7NLWJQRaSEsNdd0mokgVUAwuWOnUQyYdnVOyS4q3B6
	Q7C2M3NOjpuJ5iUlA0mbZMibyPjdO/A+1+WeQY+GCUNq1RyY1PrrexHRX7kesB6P1exf
	2j5Q==
X-Received: by 10.140.102.100 with SMTP id v91mr23803705qge.29.1423839242091; 
	Fri, 13 Feb 2015 06:54:02 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-84-240.ronkva.east.verizon.net.
	[108.44.84.240])
	by mx.google.com with ESMTPSA id m5sm2972846qay.2.2015.02.13.06.54.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 06:54:01 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 09:53:53 -0500
Message-Id: <1423839233-19739-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCHv2] python-pyzmq: Add recipe for Python Zero Message Queue bindings.
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
X-List-Received-Date: Fri, 13 Feb 2015 14:54:01 -0000

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
index 0000000..626e29d
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
+    echo [global] > ${S}/setup.cfg
+    echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
+    echo have_sys_un_h = True >> ${S}/setup.cfg
+    echo skip_check_zmq = True >> ${S}/setup.cfg
+    echo libzmq_extension = False >> ${S}/setup.cfg
+    echo no_libzmq_extension = True >> ${S}/setup.cfg
+}
-- 
2.1.0


