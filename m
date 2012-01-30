Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrxLq-0008KO-P4
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 20:57:18 +0100
Received: by eekd41 with SMTP id d41so1269723eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6jXFMgTfzXLFyitgIClu4Ft3nhiAVEhvdMyBxEOCfrY=;
	b=nzDvYoeAXQ72d9ulh0RqvoC3xOhHMkBnK1DDQAETBm//PtfyHdtCILXgwRp1xy9JFW
	SnrMOI/tbm15SyYAWdXLX+MdYeTUladgGB/nbnQMNM2XjcrDun/2frnplM+kXhh3BD9k
	zAEZhhJN5kBM/znTsu9TWX2Sh/xUg8bTfMd6I=
Received: by 10.14.16.129 with SMTP id h1mr87630eeh.46.1327952965742;
	Mon, 30 Jan 2012 11:49:25 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b49sm76412730eec.9.2012.01.30.11.49.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 11:49:25 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:47:12 +0100
Message-Id: <1327952832-24292-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 2/3] obexd: update to 0.44
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
X-List-Received-Date: Mon, 30 Jan 2012 19:57:18 -0000

* build tested from scratch
* run tested on netbookpro

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obexd_0.41.bb |   14 --------------
 meta-oe/recipes-connectivity/obex/obexd_0.44.bb |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/obex/obexd_0.41.bb
 create mode 100644 meta-oe/recipes-connectivity/obex/obexd_0.44.bb

diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.41.bb b/meta-oe/recipes-connectivity/obex/obexd_0.41.bb
deleted file mode 100644
index eed01f4..0000000
--- a/meta-oe/recipes-connectivity/obex/obexd_0.41.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "OBEX Server and Client"
-DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
-SRC_URI[md5sum] = "073a10634d19ecebeea93db815857054"
-SRC_URI[sha256sum] = "edfa54f7a08d00f81ababe4267d15ec138e9c80dd76d0493dcff451374dac7be"
-
-inherit autotools
-
-FILES_${PN} += "${datadir}/dbus-1/"
-
diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
new file mode 100644
index 0000000..161057e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "OBEX Server and Client"
+DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
+SRC_URI[md5sum] = "3fb9cb9d7ab119753253ff784235a364"
+SRC_URI[sha256sum] = "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf260171d8f525da758"
+
+inherit autotools
+
+FILES_${PN} += "${datadir}/dbus-1/"
+
-- 
1.7.3.4



