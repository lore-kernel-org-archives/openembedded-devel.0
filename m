Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 972DC76A33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:35:17 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so70917339wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hupnLpBlipIt1sXDzyJaIOz8rQwb4+fZR2P5VqxAJ04=;
	b=sa2cgSspjMS50SjP29mD+tcERvExwduLpxDDLfajGT4yBZi5hN6ehivWKA3/sBCkiu
	7IUh9vOwa9ZiKfOyv5xCuwCsCbYuEcpBHBibtUh1LxfoFVvNhD1EDR1p6IbO6qO/sgK2
	mAJLaFm6y2TeA7bV0UaayfleMETqGXIpALM8C4fKcq7ezetJgkpJaCurPmo0MxEEFPT/
	uZGVYeuvja/3sSLS4RJv/yqSXZqLJ2dEWJHeOylNjcZoHBw0FRKG+VaGntWEMuahOJbS
	4zQnE1gCG5pFOD3M6D5u3b0aiobs+MG2FpnUmDxxaBprTGD59mGwYQq4xRNf/09eEfp/
	ucwA==
X-Received: by 10.194.192.166 with SMTP id hh6mr38512014wjc.127.1440419717198; 
	Mon, 24 Aug 2015 05:35:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fq15sm23054444wjc.12.2015.08.24.05.35.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:35:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 14:35:20 +0200
Message-Id: <1440419720-32179-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-gnome][PATCH] tracker: remove dependency on gamin
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
X-List-Received-Date: Mon, 24 Aug 2015 12:35:17 -0000

* gamin was removed from oe-core, Ross said it's not dependency of
  tracker anymore:
  https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg42889.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 104e490..d84978d 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager"
+DEPENDS = "file gstreamer dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager"
 
 RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
 HOMEPAGE = "http://projects.gnome.org/tracker/"
-- 
2.5.0


