Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B74077116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 23:05:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r12so389498wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SQbPWYtJZulN7QdjPAguZYeYH8+gfUlzlmvhFlMdJXY=;
	b=E5S0vmZbRdaozwc5KhjieP0EYghNXKssrt0JQEHY2WySCuBiTbP0XsqSm44OvlKj38
	EugjywaQrZ26MlH7YOD+BmOp+LyIX4uqd88Kuqw2f/Hvi1TFSWShwl/pmUUz2xi/eMPc
	QRlkUfZyS9ROAPqioPOW4Us0azkj9faUjvoCCgLrkFIDzJkd3PCrXsOznAqglW6zr0vX
	lmQ3ISbs0skCvnzIvyB/WifQSSDrjz4Oeo4hNC4nWgnaQOibYG/SZEChWVn15hhbWTQ5
	GOTt3e/PapQ+N596vHD//vOWOn3X5pYI84hbyD0T5dlfeEHjgtL4envhtagUHIIMvWGB
	k6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SQbPWYtJZulN7QdjPAguZYeYH8+gfUlzlmvhFlMdJXY=;
	b=eeF4EG1JZq12Y/zo3SO75z1jjHDfaS65j0CJJYx2HeOiDMZKsPDZTcijuUVbp83XYr
	48ot3ywl7ogg1zjVzoolNRT0JEYGHlHr4PuVtXwrTXdtxOWttfBZbbXonhbfXcJyJXoc
	ATgKRBFEseiGaiPg1ILWzt3Aw/EajGBcAHWnyUKfWh5IcpisK1hWk3e3mqpDzNhZXqMU
	zp6+Bq4WvrtaO+ThSZTNmI9lt0JvGGj1JF99ZItQvXkFtLb27QaxI3LjT/3q9RV3n3eg
	fvQlfVWGlnYGCBSy0G9fqZBYzhL0KV/EMHSCFe6raTMiP7tbP6TqJdYx2rmnwhAUmRZ7
	ZVXA==
X-Gm-Message-State: AOPr4FWX/6GfxZI1WhMrKfTc5dFGofpWwQqGG4q5vztW1bgiJUC28njYpS+LWwkfyv25HA==
X-Received: by 10.28.0.87 with SMTP id 84mr19926831wma.68.1463439901829;
	Mon, 16 May 2016 16:05:01 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3536.dip0.t-ipconnect.de.
	[91.10.53.54]) by smtp.googlemail.com with ESMTPSA id
	he10sm36100458wjc.21.2016.05.16.16.05.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 16:05:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 01:04:42 +0200
Message-Id: <1463439882-26273-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
References: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] geany-plugins: initial add 1.27
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
X-List-Received-Date: Mon, 16 May 2016 23:05:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

geany-plugins comes around as a loose collection of modules. I thought about
using PACKAGES_DYNAMIC but this way seems better maintainable:

* a removed plugin will at least complain for license file missing
* a new plugin will complain for unpacked files

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-devtools/geany/geany-plugins_1.27.bb   | 216 +++++++++++++++++++++
 1 file changed, 216 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
new file mode 100644
index 0000000..08f79bb
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
@@ -0,0 +1,216 @@
+DESCRIPTION = "A fast and lightweight IDE"
+HOMEPAGE = "http://plugins.geany.org/"
+# majority's default
+LICENSE = "GPLv2"
+
+DEPENDS = "geany lua libxml2 libsoup-2.4 vte enchant intltool-native libassuan gpgme"
+
+inherit autotools pkgconfig gtk-icon-cache
+
+SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "31e4aa4b771a4ff8ccfd74efe7ba7b44"
+SRC_URI[sha256sum] = "03195a0b7a361ddb2ee4138f46fa87b6d9b9801ff00657456ab9c8b8908c0ce0"
+
+FILES_${PN} += "${datadir}/icons"
+FILES_${PN}-dev += "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
+
+PLUGINS += "${PN}-addons"
+LIC_FILES_CHKSUM += "file://addons/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-addons = "${libdir}/geany/addons.so"
+RDEPENDS_${PN}-addons = "${PN}"
+
+PLUGINS += "${PN}-autoclose"
+LIC_FILES_CHKSUM += "file://autoclose/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-autoclose = "${libdir}/geany/autoclose.so"
+RDEPENDS_${PN}-autoclose = "${PN}"
+
+PLUGINS += "${PN}-automark"
+LIC_FILES_CHKSUM += "file://automark/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-automark = "${libdir}/geany/automark.so"
+RDEPENDS_${PN}-automark = "${PN}"
+
+PLUGINS += "${PN}-codenav"
+LIC_FILES_CHKSUM += "file://codenav/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-codenav = "${libdir}/geany/codenav.so"
+RDEPENDS_${PN}-codenav = "${PN}"
+
+PLUGINS += "${PN}-commander"
+LIC_FILES_CHKSUM += "file://commander/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-commander = "GPLv3"
+FILES_${PN}-commander = "${libdir}/geany/commander.so"
+RDEPENDS_${PN}-commander = "${PN}"
+
+PLUGINS += "${PN}-debugger"
+LIC_FILES_CHKSUM += "file://debugger/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-debugger = "${libdir}/geany/debugger.so ${datadir}/${PN}/debugger"
+RDEPENDS_${PN}-debugger = "${PN}"
+
+PLUGINS += "${PN}-defineformat"
+LIC_FILES_CHKSUM += "file://defineformat/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-defineformat = "${libdir}/geany/defineformat.so"
+RDEPENDS_${PN}-defineformat = "${PN}"
+
+PLUGINS += "${PN}-devhelp"
+LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-devhelp = "GPLv3"
+FILES_${PN}-devhelp = "${libdir}/geany/devhelp.so"
+RDEPENDS_${PN}-devhelp = "${PN}"
+
+PLUGINS += "${PN}-geanyctags"
+LIC_FILES_CHKSUM += "file://geanyctags/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanyctags = "${libdir}/geany/geanyctags.so"
+RDEPENDS_${PN}-geanyctags = "${PN}"
+
+PLUGINS += "${PN}-geanydoc"
+LIC_FILES_CHKSUM += "file://geanydoc/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-geanydoc = "GPLv3"
+FILES_${PN}-geanydoc = "${libdir}/geany/geanydoc.so"
+RDEPENDS_${PN}-geanydoc = "${PN}"
+
+PLUGINS += "${PN}-geanyextrasel"
+LIC_FILES_CHKSUM += "file://geanyextrasel/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanyextrasel = "${libdir}/geany/geanyextrasel.so"
+RDEPENDS_${PN}-geanyextrasel = "${PN}"
+
+PLUGINS += "${PN}-geanyinsertnum"
+LIC_FILES_CHKSUM += "file://geanyinsertnum/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanyinsertnum = "${libdir}/geany/geanyinsertnum.so"
+RDEPENDS_${PN}-geanyinsertnum = "${PN}"
+
+PLUGINS += "${PN}-geanylatex"
+LIC_FILES_CHKSUM += "file://geanylatex/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanylatex = "${libdir}/geany/geanylatex.so"
+RDEPENDS_${PN}-geanylatex = "${PN}"
+
+PLUGINS += "${PN}-geanylipsum"
+LIC_FILES_CHKSUM += "file://geanylipsum/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-geanylipsum = "${libdir}/geany/geanylipsum.so"
+RDEPENDS_${PN}-geanylipsum = "${PN}"
+
+PLUGINS += "${PN}-geanylua"
+LIC_FILES_CHKSUM += "file://geanylua/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-geanylua = "${libdir}/geany/geanylua.so ${libdir}/${PN}/geanylua/*.so"
+RDEPENDS_${PN}-geanylua = "${PN}"
+
+PLUGINS += "${PN}-geanymacro"
+LIC_FILES_CHKSUM += "file://geanymacro/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanymacro = "${libdir}/geany/geanymacro.so"
+RDEPENDS_${PN}-geanymacro = "${PN}"
+
+PLUGINS += "${PN}-geanyminiscript"
+LIC_FILES_CHKSUM += "file://geanyminiscript/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-geanyminiscript = "${libdir}/geany/geanyminiscript.so"
+RDEPENDS_${PN}-geanyminiscript = "${PN}"
+
+PLUGINS += "${PN}-geanynumberedbookmarks"
+LIC_FILES_CHKSUM += "file://geanynumberedbookmarks/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanynumberedbookmarks = "${libdir}/geany/geanynumberedbookmarks.so"
+RDEPENDS_${PN}-geanynumberedbookmarks = "${PN}"
+
+PLUGINS += "${PN}-geanypg"
+LIC_FILES_CHKSUM += "file://geanypg/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+FILES_${PN}-geanypg = "${libdir}/geany/geanypg.so"
+RDEPENDS_${PN}-geanypg = "${PN}"
+
+PLUGINS += "${PN}-geanyprj"
+LIC_FILES_CHKSUM += "file://geanyprj/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-geanyprj = "GPLv3"
+FILES_${PN}-geanyprj = "${libdir}/geany/geanyprj.so"
+RDEPENDS_${PN}-geanyprj = "${PN}"
+
+PLUGINS += "${PN}-geanysendmail"
+LIC_FILES_CHKSUM += "file://geanysendmail/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanysendmail = "${libdir}/geany/geanysendmail.so"
+RDEPENDS_${PN}-geanysendmail = "${PN}"
+
+PLUGINS += "${PN}-geanyvc"
+LIC_FILES_CHKSUM += "file://geanyvc/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-geanyvc = "${libdir}/geany/geanyvc.so"
+RDEPENDS_${PN}-geanyvc = "${PN}"
+
+PLUGINS += "${PN}-geniuspaste"
+LIC_FILES_CHKSUM += "file://geniuspaste/COPYING;md5=bfc203269f8862ebfc1198cdc809a95a"
+FILES_${PN}-geniuspaste = "${libdir}/geany/geniuspaste.so ${datadir}/${PN}/geniuspaste"
+RDEPENDS_${PN}-geniuspaste = "${PN}"
+
+PLUGINS += "${PN}-lineoperations"
+LIC_FILES_CHKSUM += "file://lineoperations/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-lineoperations = "${libdir}/geany/lineoperations.so"
+RDEPENDS_${PN}-lineoperations = "${PN}"
+
+PLUGINS += "${PN}-multiterm"
+LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+FILES_${PN}-multiterm = "${libdir}/geany/multiterm.so"
+RDEPENDS_${PN}-multiterm = "${PN}"
+
+PLUGINS += "${PN}-overview"
+LIC_FILES_CHKSUM += "file://overview/overview/overviewplugin.c;beginline=4;endline=20;md5=1aa33522916cdeb46cccac0c629da0d0"
+FILES_${PN}-overview = "${libdir}/geany/overview.so ${datadir}/${PN}/overview"
+RDEPENDS_${PN}-overview = "${PN}"
+
+PLUGINS += "${PN}-pairtaghighlighter"
+LICENSE_${PN}-pairtaghighlighter = "BSD-2-Clause"
+LIC_FILES_CHKSUM += "file://pairtaghighlighter/COPYING;md5=d6d927525a612b3a8dbebc4b2e9b47c1"
+FILES_${PN}-pairtaghighlighter = "${libdir}/geany/pairtaghighlighter.so"
+RDEPENDS_${PN}-pairtaghighlighter = "${PN}"
+
+PLUGINS += "${PN}-pohelper"
+LICENSE_${PN}-pohelper = "GPLv3"
+LIC_FILES_CHKSUM += "file://pohelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+FILES_${PN}-pohelper = "${libdir}/geany/pohelper.so"
+RDEPENDS_${PN}-pohelper = "${PN}"
+
+PLUGINS += "${PN}-pretty-printer"
+LIC_FILES_CHKSUM += "file://pretty-printer/src/PrettyPrinter.c;beginline=1;endline=17;md5=1665115c2fadb17c1b53cdb4e43b2440"
+FILES_${PN}-pretty-printer = "${libdir}/geany/pretty-printer.so"
+RDEPENDS_${PN}-pretty-printer = "${PN}"
+
+PLUGINS += "${PN}-projectorganizer"
+LIC_FILES_CHKSUM += "file://projectorganizer/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-projectorganizer = "${libdir}/geany/projectorganizer.so"
+RDEPENDS_${PN}-projectorganizer = "${PN}"
+
+PLUGINS += "${PN}-shiftcolumn"
+LIC_FILES_CHKSUM += "file://shiftcolumn/COPYING;md5=751419260aa954499f7abaabaa882bbe"
+FILES_${PN}-shiftcolumn = "${libdir}/geany/shiftcolumn.so"
+RDEPENDS_${PN}-shiftcolumn = "${PN}"
+
+PLUGINS += "${PN}-scope"
+LIC_FILES_CHKSUM += "file://scope/COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+FILES_${PN}-scope = "${libdir}/geany/scope.so"
+RDEPENDS_${PN}-scope = "${PN}"
+
+PLUGINS += "${PN}-spellcheck"
+LIC_FILES_CHKSUM += "file://spellcheck/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-spellcheck = "${libdir}/geany/spellcheck.so"
+RDEPENDS_${PN}-spellcheck = "${PN}"
+
+PLUGINS += "${PN}-tableconvert"
+LIC_FILES_CHKSUM += "file://tableconvert/COPYING;md5=6753686878d090a1f3f9445661d3dfbc"
+FILES_${PN}-tableconvert = "${libdir}/geany/tableconvert.so"
+RDEPENDS_${PN}-tableconvert = "${PN}"
+
+PLUGINS += "${PN}-treebrowser"
+LIC_FILES_CHKSUM += "file://treebrowser/README;beginline=67;endline=67;md5=52f90857fd1a9672111e472dd056a0d8"
+FILES_${PN}-treebrowser = "${libdir}/geany/treebrowser.so"
+RDEPENDS_${PN}-treebrowser = "${PN}"
+
+PLUGINS += "${PN}-updatechecker"
+LIC_FILES_CHKSUM += "file://updatechecker/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-updatechecker = "${libdir}/geany/updatechecker.so"
+RDEPENDS_${PN}-updatechecker = "${PN}"
+
+PLUGINS += "${PN}-webhelper"
+LIC_FILES_CHKSUM += "file://webhelper/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE_${PN}-webhelper = "GPLv3"
+FILES_${PN}-webhelper = "${libdir}/geany/webhelper.so"
+RDEPENDS_${PN}-webhelper = "${PN}"
+
+PLUGINS += "${PN}-xmlsnippets"
+LIC_FILES_CHKSUM += "file://xmlsnippets/COPYING;md5=4325afd396febcb659c36b49533135d4"
+FILES_${PN}-xmlsnippets = "${libdir}/geany/xmlsnippets.so"
+RDEPENDS_${PN}-xmlsnippets = "${PN}"
+
+PACKAGES =+ "${PLUGINS}"
+RDEPENDS_${PN} = "${PLUGINS}"
+ALLOW_EMPTY_${PN} = "1"
-- 
2.5.5


