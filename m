Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspm-0002gQ-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so476047eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ux2MpYEqUfy7iScpxean2mc+1PbR9U0OiOCB3iX9LXU=;
	b=PHDR507qrZ/O/2izQBTxIv/81rkk7ywBk8j+P9M78Dsn9r3mLBLGui29zAaAG5eFrv
	YOvtL6j4acuW1mWQDmeTD6bkoEBUcO/WHInqL8Z12CrZQ+gRIRztW4PuQ41CDjXATVY3
	ej5iitRvE0pMmVEqxN229o1+vxhUvnSQjTcXWUTquc4dmHNSXVcIyOIhoTynxirs8nMe
	OHr69aOJKX3yyEbr8J69J+wJr8ylM6wycgges0qhjLGP7FGg7B41tZohws9AN118TQ74
	gFQ+1mta+sY9p4svV/G26sNtA/KtnT8f/CCrtU9Zlt6JXPSS6yfn0Vx1zq4uz53WLk3M
	ZzOA==
Received: by 10.14.223.199 with SMTP id v47mr62410268eep.45.1352721354377;
	Mon, 12 Nov 2012 03:55:54 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:25 +0100
Message-Id: <1352721267-367-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 4/6] gnome-desktop: copy omf.make from ${STAGING_DATADIR_NATIVE} instead ${STAGING_DATADIR}
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* omf.make is installed by gnome-common
* oe-core gnomebase.bbclass adds gnome-common-native to DEPENDS
* error message was:
  | DEBUG: Executing shell function do_configure
  | cp: cannot stat `/home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/share/gnome-common/data/omf.make': No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 44e0171..612e88f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r5"
+PR = "r6"
 
 inherit gnome pkgconfig
 
@@ -16,7 +16,7 @@ DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils"
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
 do_configure_prepend () {
-	cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
+	cp ${STAGING_DATADIR_NATIVE}/gnome-common/data/omf.make ${S}
 	sed -i -e s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in
 }
 
-- 
1.7.6.5



