Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SNKLz-000869-7x
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 10:47:07 +0200
Received: by lagw12 with SMTP id w12so748160lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=u5Hr26EtCMIDBxeUPa3QWqlW8aMjNWa6r9Kc52rV3Ek=;
	b=Qx+TXqYim5C9BH8CgDV6sB/zSapQzpLqrKe1vxp2B/YJ/OLg3SdTOCECQRqXG26MiQ
	zmhc41yNZwjEFgS+UVayIBZLgO7zLgOIsgWoba+3pEV5EOuVwqxUWI7tfE3nt/ixV2P6
	TvxsTN84nfJe4OZ8/q8EVla50TH8TRihwXokLhBRdbPiXjwL70cb2iH+OYjQlkC9mKKV
	Jhu3DFk3Lk3fkC1bYguSWUYxyWTh0cQfJjvc7sNKTfYQ3WYsXDnIOU8lSg1TRhuVuTJp
	CyF8K84UNd4DTgvuTaE3DXciri0CGZPVDQgJ/xMtXuRawdH15ngMXjH/GStFIqwyk29f
	n61w==
Received: by 10.152.147.161 with SMTP id tl1mr3183485lab.15.1335429450403;
	Thu, 26 Apr 2012 01:37:30 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com ([84.49.231.147])
	by mx.google.com with ESMTPS id oi3sm2394428lab.12.2012.04.26.01.37.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 01:37:29 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 22:35:45 +0200
Message-Id: <1335472546-9653-2-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
References: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
Subject: [meta-oe] Recipe for Synergy 1.3.8
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
X-List-Received-Date: Thu, 26 Apr 2012 08:47:07 -0000

---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
new file mode 100644
index 0000000..83d8983
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy.googlecode.com"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
+LICENSE = "GPLv2"
+SECTION = "x11/utils"
+
+DEPENDS = "libx11 libxtst"
+PR = "r0"
+
+SRC_URI = "http://synergy.googlecode.com/files/synergy-1.3.8-Source.tar.gz"
+
+S = "${WORKDIR}/${PN}-${PV}-Source"
+
+inherit cmake siteinfo
+
+do_install() {
+	install -d ${D}/usr/bin
+	cp ${S}/bin/synergy* ${D}/usr/bin/
+}
+
+SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
+SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
-- 
1.7.9.5



