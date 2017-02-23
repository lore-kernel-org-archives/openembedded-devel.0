Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC6FB73081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:11:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so411345wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 15:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E6xZ5/BMsYsTBtb5Inf6mgWkAFRvderQDn7m7hIOwZ0=;
	b=TMPK6j+WvEzb21mhkf65Pta0FAWkQGgZocxU3Dp6Gdl4HQjbmKMWzk+CDo9zd0KTw0
	5awttVBQNzlT1aH8o2JUOR7l/uwtKZnVGHEj31BfO6q6x8oDzmoFDSLFs7W89GLMjIkb
	Np2btZTTjE0NgFU0YqQO25ALdViNXefo2DyuMzKSNQVHdyRjEoivpjIsLvp7hDxqP5eH
	ZLYuLNtf0h/Mys/g83qBqnHD7gwlG4CBOGlogvLXpNXk/sP6hU+SBS5weVUVsM/1WG+X
	+WhLAOQHCFbH+kriCwOA1KTp/4uiEjlR/U7vNk9XGGjYjF1NCLBSzPBIQMAAxQEpcMO5
	M9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E6xZ5/BMsYsTBtb5Inf6mgWkAFRvderQDn7m7hIOwZ0=;
	b=Jrn92I1DZgoa/hQK+orE2Cr+n/9iuEtahLyRwK5i46mLEjA3HFLAIscvOhiVRMU88L
	Ebxy8xfq7B20aVBSTuz+ib8mN0D7kZZkuUN/xDvZGYk1/g5Jz2ciZwVDsQnpAQdNADb/
	Oi84G0qUIIYUtakANTGywwevugpzdQiKWpHgCU3swP4dr09mnULyp9rJ5y+URQSusjb0
	FknT0TW6IRkbKqmS7qbEZ0MltqeYzItqMX/XaJkuhWGSg4scYF/L11bSxyiiaCSTbA8e
	Er9jUPiyUIiyK3dEweukgMAuHhN49qKk5kumkU1YgDVPjtGnmHdAnqip3aKQx3LMaFjL
	X8Ow==
X-Gm-Message-State: AMke39np2K+xra5QlDUs0UuqWJLsAVxrvSFOHFV1o733QRldkDtJjNJpVbDn2t88jj8UTw==
X-Received: by 10.28.138.147 with SMTP id m141mr42159wmd.57.1487891513107;
	Thu, 23 Feb 2017 15:11:53 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9060D691E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:d69:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	e74sm8273328wmd.2.2017.02.23.15.11.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Feb 2017 15:11:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 00:11:38 +0100
Message-Id: <20170223231138.31516-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH V2] abiword: fix build and unblacklist
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
X-List-Received-Date: Thu, 23 Feb 2017 23:11:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index d021147..48b3c10 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -3,9 +3,22 @@ HOMEPAGE = "http://www.abiword.org"
 SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
-DEPENDS     = "perl-native wv libglade libfribidi jpeg libpng \
-               librsvg libwmf-native gtkmathview asio gtk+ evolution-data-server \
-               ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'redland rasqal', '', d)}"
+DEPENDS  = " \
+    perl-native \
+    gtk+ \
+    gtkmathview \
+    wv \
+    libglade \
+    libfribidi \
+    jpeg \
+    libpng \
+    librsvg \
+    libwmf-native \
+    asio \
+    evolution-data-server \
+    libxslt \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'office-layer', 'redland rasqal', '', d)} \
+"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
@@ -125,5 +138,3 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-
-PNBLACKLIST[abiword] ?= "Depends on blacklisted gtkmathview"
-- 
2.9.3


