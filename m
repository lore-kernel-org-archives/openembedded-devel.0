Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylK-0001l8-EX
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:54 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+8GE+/byDY9AAeSSW/9+wBBbFrBOyVWPcHw3OaqaV2I=;
	b=jhmtMQ8iIflGnbjiga3eqM81NkikCMd8OkivC8Bhnhd04SwjXF+Adk0YhpXGF2IvHF
	bJ+f26I1n7sbSSkHEDPb6ph/wlEkgpYROojyjJ482tAFo70t6MseYHnWYn52CIrWGqq+
	pXfENr49ckgMi58NpZk2oSet7APbHq4xDoa4W0Zj7+3zxooxnUeBR7dOStjB2H6pEeoj
	++g3njCgC9yO5Jca7L8acRdSAIvy+EKJbO2A2aKwnX2O3tLE8UxGJWHAy7q6UldQyf5e
	ZqrBB5FNwp8NOaIirs3Q+YHh7HbiOxJWzI737TbH3sfPO7zkN286UEe9rVgLh2q0u++G
	heEA==
Received: by 10.205.135.146 with SMTP id ig18mr155417bkc.80.1347977656716;
	Tue, 18 Sep 2012 07:14:16 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:44 +0200
Message-Id: <1347977601-28665-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 03/40] xfce4-dev-tools: update to 4.10.0 and oe-stylize a bit
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ev-tools_4.8.0.bb => xfce4-dev-tools_4.10.0.bb} |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.8.0.bb => xfce4-dev-tools_4.10.0.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
index ce21bf0..1955fcc 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
@@ -3,12 +3,15 @@ HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "glib-2.0"
 
-PR = "r2"
+inherit autotools
 
 BBCLASSEXTEND = "native"
 
-inherit autotools
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "372b74f432e7e02d946c2ea9d3de2805"
+SRC_URI[sha256sum] = "f79649bbfbbf16881494ee9f67035063765aec12e23ab9bac31de2c8a4f32bf8"
 
 do_install_append() {
        install -d ${D}${datadir}/aclocal
@@ -16,7 +19,3 @@ do_install_append() {
 }
 
 FILES_${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
-
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "9591299c49d92d00ba47974c42a735fa"
-SRC_URI[sha256sum] = "7a1457e9dc839cb121a48e5c53c483ce02a3a5dbaf09376794a13bafe4194815"
-- 
1.7.6.5



