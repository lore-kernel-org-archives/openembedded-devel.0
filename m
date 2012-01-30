Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rrz7w-0005ip-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 22:51:04 +0100
Received: by eaal12 with SMTP id l12so1293350eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 13:43:11 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.213.4.148 as permitted sender) client-ip=10.213.4.148; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.213.4.148 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.213.4.148])
	by 10.213.4.148 with SMTP id 20mr3940223ebr.143.1327959791730 (num_hops
	= 1); Mon, 30 Jan 2012 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fQiKhA/uYzh53Gyxj11Zi0UooZiZqbHEjtGhEzzmLbM=;
	b=MKO25fe0IMPmvRmGNkG8pPj+qd++O5fghH7WalT5iDFMvoGD5S36rNxMqNExr5700f
	VW24eGiHiGnxfSJwenzZUry+sXcZ31ULa1LCuH1l+AXnCPcLhIMgCHRr/IE1reSu/kHk
	Pftd+Yx0zFpSeIp8UAhDC3LxiE0KiWRK0zJoU=
Received: by 10.213.4.148 with SMTP id 20mr2997042ebr.143.1327959791615;
	Mon, 30 Jan 2012 13:43:11 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id y54sm77603521eef.8.2012.01.30.13.43.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 13:43:11 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 22:41:07 +0100
Message-Id: <1327959667-24833-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH v2] obexd: update to 0.44 and put obex-client into separate package.
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
X-List-Received-Date: Mon, 30 Jan 2012 21:51:04 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obexd_0.41.bb |   14 --------------
 meta-oe/recipes-connectivity/obex/obexd_0.44.bb |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 14 deletions(-)
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
index 0000000..24edb9d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
@@ -0,0 +1,17 @@
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
+PACKAGES =+ "obex-client"
+
+FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
+FILES_obex-client = "${libexecdir}/obex-client \
+                     ${datadir}/dbus-1/services/obex-client.service"
-- 
1.7.3.4



