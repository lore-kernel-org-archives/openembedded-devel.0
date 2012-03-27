Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCWCH-0006gt-Qa
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 15:12:25 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr12so4394229wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=cO4cMSDUCOVAJp48Zwqufjt3uIz7SrKkI4ToYhMzdaA=;
	b=t5DFm7ASCInaz3tGSfs90isNlJsAMaBtX7dDSvfrQGhTz1AuKK4d0xjggnjjtwkc8g
	y1baAvSP4Cl3h+hU04Zy88SWnFggDU9SbmmE+edeaZcSD4bwqGxqd52hDGgvlgLJ07wg
	2A6kSLqDea4LAW+w2jkeMTlhifZLRGfyc37n4ppgPL4opM6fe/JIMK6JEE4J/pokxuVT
	unr1zbUPoVCCxudqiOVH3YcEh7eBGWm1IlXFvMh4Joq/GtVGIIsVO8guwz5mTKUN9Umb
	3fLsgwiPwQy7vLK66ruDZV4y+qaKf3ps/ANGjnbg5qr6EkyYNR56yTxalhp4WpxaYY5G
	QEkA==
Received: by 10.180.102.3 with SMTP id fk3mr27605202wib.9.1332853407248;
	Tue, 27 Mar 2012 06:03:27 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id 6sm12618089wiz.1.2012.03.27.06.03.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 06:03:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 15:03:18 +0200
Message-Id: <1332853398-9501-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] obexd: fix QA warnings
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
X-List-Received-Date: Tue, 27 Mar 2012 13:12:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix the following warnings:
WARNING: For recipe obexd, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/lib
WARNING:   /usr/lib/obex
WARNING:   /usr/lib/obex/plugins

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/obex/obexd_0.44.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
index 24edb9d..c53bfdc 100644
--- a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
+++ b/meta-oe/recipes-connectivity/obex/obexd_0.44.bb
@@ -4,12 +4,19 @@ DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
+PR = "r1"
+
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
 SRC_URI[md5sum] = "3fb9cb9d7ab119753253ff784235a364"
 SRC_URI[sha256sum] = "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf260171d8f525da758"
 
 inherit autotools
 
+do_install_append() {
+    # remove empty plugins dir
+    rm -rf ${D}${libdir}
+}
+
 PACKAGES =+ "obex-client"
 
 FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
-- 
1.7.6.5



