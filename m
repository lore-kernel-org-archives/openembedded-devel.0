Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJRng-0005zG-Fq
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 16:51:08 +0200
Received: by pvc30 with SMTP id 30so2490925pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Q1CRAsqUVBshQedyjga8OoSYTBGMl10wynTh5IByK48=;
	b=ZDF0RBqgiJU/046cCbXHYSE80C4c4Udy6dm6x2L3mBsKuQuDx41c99Ty1f3daiGS0l
	8+odGfa+a5vIWiLZZS9k6HLA1IEJ6tcWAsiG/Tz7ZY89N8iihfpwHMqetUhnXHz3oMOs
	xdF1Y+Ple62XPRVIUuIBQBDh2XD84EwXb8E3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=h+AQtbQeVIJHqC/kkk6npS+JBkVm7EWSG69/y7TU/hou0cf/e2dKUEN5pHZ08VuRoo
	qZuDxB+zCVR9dPjRtjAitnfWcYVGNgX7qmhkbjZiy02CKovg9M68tFSFOcmQhyuN3nvX
	khUg8wQo7zkf+2yvKfhTCbgUhZM7m5iw1L8+8=
Received: by 10.68.15.138 with SMTP id x10mr5500204pbc.437.1304952503003;
	Mon, 09 May 2011 07:48:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m4sm4149077pbb.78.2011.05.09.07.48.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 07:48:21 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 07:48:03 -0700
Message-Id: <1304952485-8207-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCHv3 1/3] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 14:51:08 -0000

From: Khem Raj <raj.khem@gmail.com>

Provide additional commentary that should help a bit more

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta-efl/conf/layer.conf   |    6 +++---
 meta-gnome/conf/layer.conf |    6 +++---
 meta-gpe/conf/layer.conf   |    6 +++---
 meta-oe/conf/layer.conf    |   21 ++++++++++++++++++---
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index 85dbacd..272fc04 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -1,8 +1,8 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# We have a conf and classes directory, append to BBPATH 
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "efl-layer"
 BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index c878ecf..902ab8f 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -1,8 +1,8 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "gnome-layer"
 BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
index d250555..6c018b1 100644
--- a/meta-gpe/conf/layer.conf
+++ b/meta-gpe/conf/layer.conf
@@ -1,8 +1,8 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "gpe-layer"
 BBFILE_PATTERN_gpe-layer := "^${LAYERDIR}/"
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 9fa60c1..267616b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -1,9 +1,24 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
-BBPATH := "${LAYERDIR}:${BBPATH}"
+# It really depends on order of the layers appearing in BBLAYERS
+# variable in toplevel bblayers.conf file, where bitbake will search
+# for .inc files and others where bitbake uses BBPATH since it will
+# search the directories from first to last as specified in BBPATH
+# Therefore if you want a given layer to be considered high priority
+# for the .inc and .conf etc. then consider it adding at the beginning
+# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# the recipe contention so the order of directories in BBFILES does 
+# not matter.
+
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer,
+# choosing carefully how this layer interacts with all of the
+# other layers.
+
 BBFILE_PRIORITY_openembedded-layer = "6"
-- 
1.7.4.1



