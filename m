Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B52E376785
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:41 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so64178797wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DW0h/h54tOgnypLZwozPUBCR23OKcDUM27z1E/OSj+8=;
	b=SD6SkGIthcFIGHSpL8QQFiIyD3BvIX5Kq3laB6CI1x+kDWePczyi9r0wUDBWfg64SA
	/j4TBmXNd+iSLSEb7cCqD2Eqm89Lq9tVVEUW/49F0XRc3C+YwnJKn180UT/uUwkF/dch
	JjJGcgqUwt1U5sfX6EoK1ZFpHUIUFX3CyU+J7mkyI5XlvzV2Yr7A0ZEVZ+L34GmG6pOM
	GO8a5N6XnBkgTso0hxsatbQzd0Lf/ffWLmhUDTWadwutl22hlGRkCzOz63Qs75t9iTf3
	jWGgvrRkR9OB4LbZvP9FJ77q1UDGycXoXxIOFi23d0L4foeIeaDT1hZded9mwd/i/7/e
	69Bg==
X-Received: by 10.180.74.167 with SMTP id u7mr26338905wiv.44.1439754401459;
	Sun, 16 Aug 2015 12:46:41 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:40 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:20 +0200
Message-Id: <1439754023-13290-6-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 5/8] firefox: stop using variable for local files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2015 19:46:43 -0000

Local file names are constant, so don't use ${PN} and friends to
construct them.
Fixes SRC_URI fetching a file with ${BPN} while installing it with ${PN}.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 8a99b77..07226ff 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -8,8 +8,8 @@ LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
 
 SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
-           file://mozilla-${BPN}.png \
-           file://mozilla-${BPN}.desktop \
+           file://mozilla-firefox.png \
+           file://mozilla-firefox.desktop \
            file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
            file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
            file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
@@ -94,8 +94,8 @@ do_install() {
 	oe_runmake DESTDIR="${D}" destdir="${D}" install
 	install -d ${D}${datadir}/applications
 	install -d ${D}${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/mozilla-${PN}.desktop ${D}${datadir}/applications/
-	install -m 0644 ${WORKDIR}/mozilla-${PN}.png ${D}${datadir}/pixmaps/
+	install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
+	install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
 	install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
 	rm -f ${D}${libdir}/${PN}/TestGtkEmbed
 	rm -f ${D}${libdir}/${PN}/defaults/pref/firefox-l10n.js
-- 
1.8.4.5


