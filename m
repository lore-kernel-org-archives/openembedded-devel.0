Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3059601A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:23:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5MENfLB026268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 07:23:41 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 07:23:40 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Jun 2017 10:23:34 -0400
Message-ID: <1498141414-32154-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] twisted: add support to build for python3
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
X-List-Received-Date: Thu, 22 Jun 2017 14:23:41 -0000
Content-Type: text/plain

The work on twisted to ensure python3 compatability is nearing
completion, as per their python3 tracker page:
  https://twistedmatrix.com/trac/milestone/Python-3.x

Create a common .inc file and a new python3-* recipe to match other
python3 packages.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-twisted.inc     | 244 +++++++++++++++++++++
 .../python/python-twisted_13.2.0.bb                | 243 +-------------------
 .../python/python3-twisted_13.2.0.bb               |  67 ++++++
 3 files changed, 312 insertions(+), 242 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-twisted.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
new file mode 100644
index 0000000..d734e03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -0,0 +1,244 @@
+DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
+Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
+(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
+HOMEPAGE = "http://www.twistedmatrix.com"
+
+#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
+
+SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
+SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
+
+PYPI_PACKAGE = "Twisted"
+PYPI_PACKAGE_EXT = "tar.bz2"
+
+do_install_append() {
+    # remove some useless files before packaging
+    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
+}
+
+PACKAGES += "\
+    ${PN}-zsh \
+    ${PN}-test \
+    ${PN}-protocols \
+    ${PN}-conch \
+    ${PN}-lore \
+    ${PN}-mail \
+    ${PN}-names \
+    ${PN}-news \
+    ${PN}-runner \
+    ${PN}-web \
+    ${PN}-words \
+    ${PN}-flow \
+    ${PN}-pair \
+    ${PN}-core \
+"
+
+PACKAGES =+ "\
+    ${PN}-src \
+    ${PN}-bin \
+"
+
+RDEPENDS_${PN} = "\
+    ${PN}-bin \
+    ${PN}-conch \
+    ${PN}-lore \
+    ${PN}-mail \
+    ${PN}-names \
+    ${PN}-news \
+    ${PN}-runner \
+    ${PN}-web \
+    ${PN}-words \
+"
+
+RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-test = "${PN}"
+RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-lore = "${PN}-core"
+RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-names = "${PN}-core"
+RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-words += "${PN}-core"
+RDEPENDS_${PN}-flow += "${PN}-core"
+RDEPENDS_${PN}-pair += "${PN}-core"
+RDEPENDS_${PN}-dbg = "${PN}"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+
+FILES_${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
+"
+
+FILES_${PN}-protocols = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
+"
+
+FILES_${PN}-zsh = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
+"
+
+FILES_${PN}-conch = " \
+    ${bindir}/ckeygen \
+    ${bindir}/tkconch \
+    ${bindir}/conch \
+    ${bindir}/conchftp \
+    ${bindir}/cftp \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
+"
+
+FILES_${PN}-core = " \
+${bindir}/manhole \
+${bindir}/mktap \
+${bindir}/twistd \
+${bindir}/tap2deb \
+${bindir}/tap2rpm \
+${bindir}/tapconvert \
+${bindir}/tkmktap \
+${bindir}/trial \
+${bindir}/easy_install* \
+${bindir}/pyhtmlizer \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
+${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
+"
+
+FILES_${PN}-lore = " \
+${bindir}/bookify \
+${bindir}/lore \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_lore.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/lore \
+"
+
+FILES_${PN}-mail = " \
+${bindir}/mailmail \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
+"
+
+FILES_${PN}-names = " \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
+"
+
+FILES_${PN}-news = " \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
+"
+
+FILES_${PN}-runner = " \
+${libdir}/site-packages/twisted/runner/portmap.so \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
+"
+
+FILES_${PN}-web = " \
+${bindir}/websetroot \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
+"
+
+FILES_${PN}-words = " \
+${bindir}/im \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
+"
+
+FILES_${PN}-flow = " \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
+
+FILES_${PN}-pair = " \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
+"
+
+FILES_${PN}-dbg += " \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
+"
+
+RDEPENDS_{PN}-src = "${PN}"
+FILES_${PN}-src = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
+"
diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
index 071106e..3b45110 100644
--- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -1,245 +1,4 @@
-DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
-Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
-(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
-HOMEPAGE = "http://www.twistedmatrix.com"
-
-#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
-
-SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
-SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
-
-PYPI_PACKAGE = "Twisted"
-PYPI_PACKAGE_EXT = "tar.bz2"
 inherit pypi setuptools
-
-do_install_append() {
-    # remove some useless files before packaging
-    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
-}
-
-PACKAGES += "\
-    ${PN}-zsh \
-    ${PN}-test \
-    ${PN}-protocols \
-    ${PN}-conch \
-    ${PN}-lore \
-    ${PN}-mail \
-    ${PN}-names \
-    ${PN}-news \
-    ${PN}-runner \
-    ${PN}-web \
-    ${PN}-words \
-    ${PN}-flow \
-    ${PN}-pair \
-    ${PN}-core \
-"
-
-PACKAGES =+ "\
-    ${PN}-src \
-    ${PN}-bin \
-"
-
-RDEPENDS_${PN} = "\
-    ${PN}-bin \
-    ${PN}-conch \
-    ${PN}-lore \
-    ${PN}-mail \
-    ${PN}-names \
-    ${PN}-news \
-    ${PN}-runner \
-    ${PN}-web \
-    ${PN}-words \
-"
+require python-twisted.inc
 
 RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
-RDEPENDS_${PN}-test = "${PN}"
-RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-lore = "${PN}-core"
-RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-names = "${PN}-core"
-RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
-RDEPENDS_${PN}-words += "${PN}-core"
-RDEPENDS_${PN}-flow += "${PN}-core"
-RDEPENDS_${PN}-pair += "${PN}-core"
-RDEPENDS_${PN}-dbg = "${PN}"
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-
-FILES_${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
-"
-
-FILES_${PN}-protocols = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
-"
-
-FILES_${PN}-zsh = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
-"
-
-FILES_${PN}-conch = " \
-    ${bindir}/ckeygen \
-    ${bindir}/tkconch \
-    ${bindir}/conch \
-    ${bindir}/conchftp \
-    ${bindir}/cftp \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
-"
-
-FILES_${PN}-core = " \
-${bindir}/manhole \
-${bindir}/mktap \
-${bindir}/twistd \
-${bindir}/tap2deb \
-${bindir}/tap2rpm \
-${bindir}/tapconvert \
-${bindir}/tkmktap \
-${bindir}/trial \
-${bindir}/easy_install* \
-${bindir}/pyhtmlizer \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
-${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
-"
-
-FILES_${PN}-lore = " \
-${bindir}/bookify \
-${bindir}/lore \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_lore.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/lore \
-"
-
-FILES_${PN}-mail = " \
-${bindir}/mailmail \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
-"
-
-FILES_${PN}-names = " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
-"
-
-FILES_${PN}-news = " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
-"
-
-FILES_${PN}-runner = " \
-${libdir}/site-packages/twisted/runner/portmap.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
-"
-
-FILES_${PN}-web = " \
-${bindir}/websetroot \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
-"
-
-FILES_${PN}-words = " \
-${bindir}/im \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
-"
-
-FILES_${PN}-flow = " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
-
-FILES_${PN}-pair = " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
-"
-
-FILES_${PN}-dbg += " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
-"
-
-RDEPENDS_{PN}-src = "${PN}"
-FILES_${PN}-src = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
-"
diff --git a/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
new file mode 100644
index 0000000..98016cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
@@ -0,0 +1,67 @@
+inherit pypi setuptools3
+require python-twisted.inc
+
+RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
+
+FILES_${PN}-core_append += " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init__*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/notestplugin*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/testplugin*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_ftp*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_inet*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_manhole*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_portforward*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_socks*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_telnet*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_trial*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_core*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_qtstub*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_reactors*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/cred*.pyc \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/dropin*.cache \
+"
+
+FILES_${PN}-names_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_names*.pyc \
+"
+
+FILES_${PN}-news_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_news*.pyc \
+"
+
+FILES_${PN}-protocols_append += " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc \
+"
+
+FILES_${PN}-conch_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_conch*.pyc \
+"
+
+FILES_${PN}-lore_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_lore*.pyc \
+"
+FILES_${PN}-mail_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_mail*.pyc \
+"
+
+FILES_${PN}-web_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_web*.pyc \
+"
+
+FILES_${PN}-words_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_words*.pyc \
+"
+
+FILES_${PN}-flow_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_flow*.pyc \
+"
+
+FILES_${PN}-pair_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_pair*.pyc \
+"
+
+FILES_${PN}-runner_append = " \
+  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_runner*.pyc \
+"
-- 
2.7.4


