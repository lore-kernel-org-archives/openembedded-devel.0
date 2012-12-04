Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfyHp-0003Gk-RC
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:36:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2422155eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vgy6Wd/tcI4H8Z+/kcZlwkSP0A9rQgi2nyYGByLxiV4=;
	b=pCBSFiaLvMH9S1kpf6VoeTJpV3Qf1HmAFsamko19iMvKZatd3T1CqER3ux4glmOz9X
	QfjJv+WUt7gHkLeHZQ+s3RGaZAPsrweKqZGnqDKv9vstqkFDp6LdyQzFEgIkVrZ4tNvg
	aZDO5V2HJ8qs5MLuUZM7WsaK/81qYtdsoMWsbXn6nln4w5PIudVUL3a/hEvfDYUe+6gW
	cRubFSbrezdp1/Av2H465muCGo1pqtp9eucTRPuef3wlypEKj7HXpbIhQD1LOueKB4GV
	DyLMNPMI+zM+hvPOv8FdsMR0cod15kylDlTNBjcteXpMO7fSkddgILq8gaT7zsAS6lX+
	zYag==
Received: by 10.14.209.193 with SMTP id s41mr52083174eeo.9.1354648907209;
	Tue, 04 Dec 2012 11:21:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm4290436eep.12.2012.12.04.11.21.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 11:21:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:21:29 +0100
Message-Id: <bb2a9b1d288ad58e16ce4cf5ebc25575a5babd4d.1354646880.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<355794a5881513c8e8ef22d76e9224f3149d4d3c.1354646880.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354646880.git.Martin.Jansa@gmail.com>
References: <cover.1354646880.git.Martin.Jansa@gmail.com>
Subject: [PATCH 60/64] python-twisted: fix packaging QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 19:36:11 -0000

* package topfiles and egg-info in PN-core
* fix find call (without braces it removes only last match -name ".h") and
  _epoll.c, _initgroups.c are left in image
* fixes
python-twisted-10.2.0: python-twisted: Files/directories were installed but not shipped
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/top_level.txt
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/dependency_links.txt
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/requires.txt
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/SOURCES.txt
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/PKG-INFO
  /usr/lib/python2.7/site-packages/Twisted-10.2.0-py2.7.egg-info/not-zip-safe
  /usr/lib/python2.7/site-packages/twisted/topfiles
  /usr/lib/python2.7/site-packages/twisted/python/_epoll.c
  /usr/lib/python2.7/site-packages/twisted/python/_initgroups.c
  /usr/lib/python2.7/site-packages/twisted/topfiles/NEWS
  /usr/lib/python2.7/site-packages/twisted/topfiles/README
  /usr/lib/python2.7/site-packages/twisted/topfiles/ChangeLog.Old
  /usr/lib/python2.7/site-packages/twisted/topfiles/CREDITS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
index 1455982..5215dd6 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5"
@@ -19,7 +19,7 @@ inherit setuptools
 
 do_install_append() {
     # remove some useless files before packaging
-    find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" -exec rm {} \;
+    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
 }
 
 PACKAGES += "\
@@ -167,6 +167,8 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
+${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
 "
 
 FILES_${PN}-lore = " \
-- 
1.8.0



