Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wy9-0004Gg-Uu
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:41 +0100
Received: by wibhj13 with SMTP id hj13so261672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nFWWzD1qoTSw6Z0xhLrh0f+vJz0XjR24+DuXvolPdTo=;
	b=dwGZhaYnTIdyGukNhO//692ZXJBNrswYVQ6d3KkMqXN5+D0nEDzl5qH9oaIxvOxvVz
	udBHsNs79iI7epdUVD2sj3G8NvBb7/ZyW9GiUditCMHMAdZWKrUFBQKSvvFsfqPtSZ5+
	IiOQNITorvvnUyRU/VIrWlE6+aYGirwlZQWPFlpZK3YRUAsIkmuh3X0FY/03oTsp2LOk
	009trSqXumX2fG2btavG7+KYnSXHMtvlZ+xDBlqqiGsyceijiZ25ViuLgbfCsXoKV+rl
	QqsEmT+m/O+dO7okAETL88x4NRTS6rlaR3kCROEPx3+I0+3Y/6biUWdTRKWam5ES5TYP
	TwPw==
Received: by 10.216.134.87 with SMTP id r65mr1056292wei.46.1331288041969;
	Fri, 09 Mar 2012 02:14:01 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.14.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:14:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:54 +0100
Message-Id: <1331288035-9678-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 5/6] cloud9: remove unneded systemd code
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
index 7041527..8a3f206 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 DEPENDS = "libxml2 nodejs-native"
 
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -98,9 +98,6 @@ do_install () {
  install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
  install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
 
- install -m 0755 -d ${D}${systemd_unitdir}/system
- install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system/
-
   install -m 0755 -d ${D}${sysconfdir}/avahi/services/
   install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
 }
@@ -109,7 +106,6 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-FILES_${PN} += "${systemd_unitdir}/system"
 RDEPENDS_${PN} = "nodejs gzip"
 
 inherit systemd
-- 
1.7.6.4



