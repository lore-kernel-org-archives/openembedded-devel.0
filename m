Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi82-0002oS-CC
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:59 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5QQyF/B9Lwpb/uDAqhCP6qEHCwMvJEolrS432KERplE=;
	b=w2Znl1E1HG+Wz5Y1a8m7Oq4w2DJEBS3cSduIkrwakwHbM7fKG6nmHPAnrn9xgaX1OK
	P/vaB8gvHuNRsAo2UTMrQnGaEHZeU+9hIjRR7uaFDNo50RSPa8TGWQbGpgjRrMW1NCw9
	kzz/U6CIyZKfyXlxq6wUBuo1gD7XOBaRSjL5kLtdCESDHfCd6eL8tHjCw2gQ2Y1F9H+2
	WjvLLf03esjqXaCjR2x2PHwo395J3dBZ0pLXNxU7V5DVb3iAvNrFgdsLcHs4TtzJBeFH
	qo0FV9v08ktQDUjjnfi0uiTQ1toJoKcjQXwpdKl6TsL0RplsgAwQhBcPFbiACiPJT0B+
	0MOQ==
Received: by 10.14.225.194 with SMTP id z42mr36045792eep.22.1354586798469;
	Mon, 03 Dec 2012 18:06:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm34816957eeo.8.2012.12.03.18.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:24 +0100
Message-Id: <e2096cd36e37eb34f124fe05a71653df09e08c9d.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 51/58] tangogps: fix doc instalation
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
X-List-Received-Date: Tue, 04 Dec 2012 02:33:48 -0000

* incorectly installs doc to /usr/doc and isn't picked by FILES_
tangogps-0.99.4: tangogps: Files/directories were installed but not shipped
  /usr/doc
  /usr/doc/tangogps
  /usr/doc/tangogps/INSTALL
  /usr/doc/tangogps/NEWS
  /usr/doc/tangogps/TODO
  /usr/doc/tangogps/README
  /usr/doc/tangogps/ChangeLog
  /usr/doc/tangogps/AUTHORS
  /usr/doc/tangogps/COPYING

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index 1fb7633..546abbc 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -5,7 +5,7 @@ SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ sqlite3 libexif libsoup-2.4 bluez4"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz \
            file://remove.unused.header.patch \
@@ -17,3 +17,7 @@ SRC_URI[sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec
 inherit autotools pkgconfig gconf
 
 RRECOMMENDS_${PN} = "gpsd"
+
+do_install_append() {
+	mv ${D}${prefix}/doc ${D}${datadir} || true
+}
-- 
1.8.0



