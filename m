Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE6765CBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 22:36:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b187so218419wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LRYFKbZwR/1xWwMJbQQfRGgS46STwfO7CWDjhHcE1Ds=;
	b=MP1gIY2ME9Nqa7LUp4VwatcQzVkYvwWrxFS8HaF/8Y4luvcKN1g3P2ivuFMJA1uRG/
	Pm1RFDCAFb7z6jmO3sOUvqJFPgf46DPepzvjcVUCFCWu4pGmb9iZ038j7/KFWINfbDtG
	6Ph6qa08dqEJ/ty4TKbLJdMNlu2kVU/wRmSW5EJY0nCQCxMH3byz645OsuZy/8cdJKB9
	OX/zMkB91k+2/hCfWP4WZqXmGEw1u2dTsuxcuQLW9rCkaQ/kw0e4q88o2X6u+mdw2CGq
	MZCTNj5NyGt1foXJIeexnG3FPKEqcVptiX9UZObCl6cVwYixhOI1W5t1Mcroh2THsvSb
	/W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LRYFKbZwR/1xWwMJbQQfRGgS46STwfO7CWDjhHcE1Ds=;
	b=dzx/QAsi5/3AasI5Iso6MJpQAh2aqIYkM0vDqb4VjuGuBjHVobX4Ciz23gK2Exq5Kx
	2KdMoDTTVT7evuYngKLjmoAxyxIeA/Sln+ewIuItZgQjcIrj/aJcW4DhPVqpydg+QZH+
	xMkmqv0VVxsoVRsDOw/eiH4uch0nQhP2SUo3NTy7amKkYcSG4jtc0Ym4K+aUWgSUecW/
	mZgP+bvVJEVr/CU3RzYNg+1g5tq+LLNlo1XrAR+dUrcAnR0rXEvMns/YtR6ZPOHbfMxL
	b4XFsc4P+CD+K+7v50AKhQcWHo3AfGrkeR09nFY0rYAKrnLw2GXmuTycN84/wgEf6jsN
	psXg==
X-Gm-Message-State: AE9vXwONfyTwjWdxdydb95eE4DkAgKRvbB5vjWnFpgwPAC0oeS+z9yNHhOu3k6pTWLjFIA==
X-Received: by 10.194.8.226 with SMTP id u2mr198062wja.153.1473374204061;
	Thu, 08 Sep 2016 15:36:44 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3574.dip0.t-ipconnect.de.
	[91.10.53.116]) by smtp.googlemail.com with ESMTPSA id
	d62sm267938wmd.7.2016.09.08.15.36.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 15:36:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 00:36:22 +0200
Message-Id: <1473374183-3022-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473374183-3022-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473374183-3022-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] geany-plugins: unblacklist / fix known bugs / update to 1.28
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
X-List-Received-Date: Thu, 08 Sep 2016 22:36:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* The python LICENSE_DEFAULT snippet was stolen at [1]
* disable plugins not builing due to missing- or not properly detected
  dependencies

[1] https://github.com/MentorEmbedded/meta-mentor/pull/843/commits/d85285792fad41d80e7862cc276dfc22ddb06fde

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...geany-plugins_1.27.bb => geany-plugins_1.28.bb} | 101 +++++++++++++++------
 1 file changed, 71 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.27.bb => geany-plugins_1.28.bb} (76%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
similarity index 76%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
index 2347af1..781287a 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
@@ -1,15 +1,32 @@
 DESCRIPTION = "A fast and lightweight IDE"
 HOMEPAGE = "http://plugins.geany.org/"
-# majority's default
-LICENSE = "GPLv2"
 
-DEPENDS = "geany lua libxml2 libsoup-2.4 vte enchant intltool-native libassuan gpgme"
+LICENSE_DEFAULT = "GPLv2"
+LICENSE = "${LICENSE_DEFAULT} & BSD-2-Clause & GPLv3"
+
+python () {
+    for plugin in d.getVar('PLUGINS', True).split():
+        if 'LICENSE_%s' % plugin not in d:
+            d.setVar('LICENSE_' + plugin, '${LICENSE_DEFAULT}')
+}
+
+DEPENDS = " \
+    geany \
+    libxml2 \
+    libsoup-2.4 \
+    enchant \
+    intltool-native \
+    libassuan \
+    gpgme \
+    vte9 \
+    libgit2 \
+"
 
 inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "31e4aa4b771a4ff8ccfd74efe7ba7b44"
-SRC_URI[sha256sum] = "03195a0b7a361ddb2ee4138f46fa87b6d9b9801ff00657456ab9c8b8908c0ce0"
+SRC_URI[md5sum] = "54ad042b6f91ff8e7a497c22faa2db4b"
+SRC_URI[sha256sum] = "b13471e0a4cb76d04a96bb21c965087b50c16390edee0c6b3bbd920d8ac17745"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
@@ -54,11 +71,13 @@ LIC_FILES_CHKSUM += "file://defineformat/COPYING;md5=751419260aa954499f7abaabaa8
 FILES_${PN}-defineformat = "${libdir}/geany/defineformat.so"
 RDEPENDS_${PN}-defineformat = "${PN}"
 
-PLUGINS += "${PN}-devhelp"
-LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
-LICENSE_${PN}-devhelp = "GPLv3"
-FILES_${PN}-devhelp = "${libdir}/geany/devhelp.so"
-RDEPENDS_${PN}-devhelp = "${PN}"
+# no gnome devhelp in some common layer
+EXTRA_OECONF += "--disable-devhelp"
+#PLUGINS += "${PN}-devhelp"
+#LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+#LICENSE_${PN}-devhelp = "GPLv3"
+#FILES_${PN}-devhelp = "${libdir}/geany/devhelp.so"
+#RDEPENDS_${PN}-devhelp = "${PN}"
 
 PLUGINS += "${PN}-geanyctags"
 LIC_FILES_CHKSUM += "file://geanyctags/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -91,10 +110,12 @@ LIC_FILES_CHKSUM += "file://geanylipsum/COPYING;md5=4325afd396febcb659c36b495331
 FILES_${PN}-geanylipsum = "${libdir}/geany/geanylipsum.so"
 RDEPENDS_${PN}-geanylipsum = "${PN}"
 
-PLUGINS += "${PN}-geanylua"
-LIC_FILES_CHKSUM += "file://geanylua/COPYING;md5=4325afd396febcb659c36b49533135d4"
-FILES_${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
-RDEPENDS_${PN}-geanylua = "${PN}"
+# no lua: max supported version is 5.2
+EXTRA_OECONF += "--disable-geanylua"
+#PLUGINS += "${PN}-geanylua"
+#LIC_FILES_CHKSUM += "file://geanylua/COPYING;md5=4325afd396febcb659c36b49533135d4"
+#FILES_${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
+#RDEPENDS_${PN}-geanylua = "${PN}"
 
 PLUGINS += "${PN}-geanymacro"
 LIC_FILES_CHKSUM += "file://geanymacro/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -122,10 +143,12 @@ LICENSE_${PN}-geanyprj = "GPLv3"
 FILES_${PN}-geanyprj = "${libdir}/geany/geanyprj.so"
 RDEPENDS_${PN}-geanyprj = "${PN}"
 
-PLUGINS += "${PN}-geanysendmail"
-LIC_FILES_CHKSUM += "file://geanysendmail/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
-FILES_${PN}-geanysendmail = "${libdir}/geany/geanysendmail.so"
-RDEPENDS_${PN}-geanysendmail = "${PN}"
+# no gnome pygtk
+EXTRA_OECONF += "--disable-geanypy"
+#PLUGINS += "${PN}-geanypy"
+#LIC_FILES_CHKSUM += "file://geanypy/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+#FILES_${PN}-geanypy = "${libdir}/geany/geanypy.so"
+#RDEPENDS_${PN}-geanypy = "${PN}"
 
 PLUGINS += "${PN}-geanyvc"
 LIC_FILES_CHKSUM += "file://geanyvc/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
@@ -137,11 +160,24 @@ LIC_FILES_CHKSUM += "file://geniuspaste/COPYING;md5=bfc203269f8862ebfc1198cdc809
 FILES_${PN}-geniuspaste = "${libdir}/geany/geniuspaste.so ${datadir}/${PN}/geniuspaste"
 RDEPENDS_${PN}-geniuspaste = "${PN}"
 
+PLUGINS += "${PN}-git-changebar"
+LIC_FILES_CHKSUM += "file://git-changebar/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-git-changebar = "GPLv3"
+FILES_${PN}-git-changebar = "${libdir}/geany/git-changebar.so"
+RDEPENDS_${PN}-git-changebar = "${PN}"
+
 PLUGINS += "${PN}-lineoperations"
 LIC_FILES_CHKSUM += "file://lineoperations/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-lineoperations = "${libdir}/geany/lineoperations.so"
 RDEPENDS_${PN}-lineoperations = "${PN}"
 
+# no markdown - avoid floating dependencies
+EXTRA_OECONF += " --disable-peg-markdown"
+#PLUGINS += "${PN}-markdown"
+#LIC_FILES_CHKSUM += "file://markdown/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+#FILES_${PN}-markdown = "${libdir}/geany/markdown.so"
+#RDEPENDS_${PN}-markdown = "${PN}"
+
 PLUGINS += "${PN}-multiterm"
 LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 FILES_${PN}-multiterm = "${libdir}/geany/multiterm.so"
@@ -174,16 +210,21 @@ LIC_FILES_CHKSUM += "file://projectorganizer/COPYING;md5=c107cf754550e65755c4298
 FILES_${PN}-projectorganizer = "${libdir}/geany/projectorganizer.so"
 RDEPENDS_${PN}-projectorganizer = "${PN}"
 
-PLUGINS += "${PN}-shiftcolumn"
-LIC_FILES_CHKSUM += "file://shiftcolumn/COPYING;md5=751419260aa954499f7abaabaa882bbe"
-FILES_${PN}-shiftcolumn = "${libdir}/geany/shiftcolumn.so"
-RDEPENDS_${PN}-shiftcolumn = "${PN}"
-
 PLUGINS += "${PN}-scope"
 LIC_FILES_CHKSUM += "file://scope/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 FILES_${PN}-scope = "${libdir}/geany/scope.so"
 RDEPENDS_${PN}-scope = "${PN}"
 
+PLUGINS += "${PN}-sendmail"
+LIC_FILES_CHKSUM += "file://sendmail/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-sendmail = "${libdir}/geany/sendmail.so"
+RDEPENDS_${PN}-sendmail = "${PN}"
+
+PLUGINS += "${PN}-shiftcolumn"
+LIC_FILES_CHKSUM += "file://shiftcolumn/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-shiftcolumn = "${libdir}/geany/shiftcolumn.so"
+RDEPENDS_${PN}-shiftcolumn = "${PN}"
+
 PLUGINS += "${PN}-spellcheck"
 LIC_FILES_CHKSUM += "file://spellcheck/COPYING;md5=4325afd396febcb659c36b49533135d4"
 FILES_${PN}-spellcheck = "${libdir}/geany/spellcheck.so"
@@ -204,11 +245,13 @@ LIC_FILES_CHKSUM += "file://updatechecker/COPYING;md5=4325afd396febcb659c36b4953
 FILES_${PN}-updatechecker = "${libdir}/geany/updatechecker.so"
 RDEPENDS_${PN}-updatechecker = "${PN}"
 
-PLUGINS += "${PN}-webhelper"
-LIC_FILES_CHKSUM += "file://webhelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
-LICENSE_${PN}-webhelper = "GPLv3"
-FILES_${PN}-webhelper = "${libdir}/geany/webhelper.so"
-RDEPENDS_${PN}-webhelper = "${PN}"
+# no webkit - lasts ages and is not properly detected
+EXTRA_OECONF += " --disable-webhelper"
+#PLUGINS += "${PN}-webhelper"
+#LIC_FILES_CHKSUM += "file://webhelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+#LICENSE_${PN}-webhelper = "GPLv3"
+#FILES_${PN}-webhelper = "${libdir}/geany/webhelper.so"
+#RDEPENDS_${PN}-webhelper = "${PN}"
 
 PLUGINS += "${PN}-xmlsnippets"
 LIC_FILES_CHKSUM += "file://xmlsnippets/COPYING;md5=4325afd396febcb659c36b49533135d4"
@@ -218,5 +261,3 @@ RDEPENDS_${PN}-xmlsnippets = "${PN}"
 PACKAGES =+ "${PLUGINS}"
 RDEPENDS_${PN} = "${PLUGINS}"
 ALLOW_EMPTY_${PN} = "1"
-
-PNBLACKLIST[geany-plugins] ?= "Causes multiple QA errors and LICENSE warnings"
-- 
2.5.5


