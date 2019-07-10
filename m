Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2949C7EF55
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 20:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45kWjD456nzFS
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562792256;
	bh=s3RuY9UqKKI6W7pMhxrxd+qRofPWa2fbmaHTD68XY2U=;
	h=From:To:Subject:Date:From;
	b=MbdKnctsaPicfGvgvpaDFQ569PNNYGJMpCGFjpTJIY6ORFyRxlKL6tSRxYo1LLGi/
	F65PQ71skBwBh3xs3UrAI8x7gr80r/g+fSKd6qw5bszo4INyg6ci1q0sK3qjwdrtXa
	P9+tvOQ88OfUf4NmpwOW/9iMBy0KRzZtUK4a/S+svxULfRgXkYKk4ll88OsV17OiB7
	6vmnlbJRlqwcVhsE3bN2no4zEfDh/5cVBejjzBMi3VgyLfrl+EAjM8isHEj5SZhneN
	Gr1fH/nryLxePIaFGhqTXW1uQkBMi0yDHKNXgNreSBi9lfPAUxhbfto+k1PAYJw+AL
	eqV+EEnym6/nU3JPkREk/4V/eIZtnTxiSvYCauehhBeQcowZAXaVDmia0NsrX8z5U3
	UQCmDGzYCVl0HSbTVY+C5AD9sXpivUXsdO1Or9imKjoNuHaVF4sgtUSoVElfwN+Gi3
	ZaBdXhsOwdhY6ao69vbYQArBpwYWZZT2K2nQ7RXPQ94xiQDvSgGnzG5gjjfQ/7jx+g
	qxNEAp9+rkG7hz5YNuH5XN7rQSbDCAPHu1OKPHw+pLja2dMUVP9KAbaYDmRXfGM/jf
	6d0aDprpo8IIvf3YNrIKURptDYWLj6+4L15t2ZHJCVZlWQtbCWlIJUYyHgeOa95kzv
	RQ6bQQFA0PDbGY2Bv4kVRLts=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 23:57:32 +0300
Message-Id: <20190710205734.12377-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] obex-data-server: Drop bluez4 support
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
X-List-Received-Date: Wed, 10 Jul 2019 20:57:36 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index 715b02352..c201c8651 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX cli
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex"
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex bluez5"
 
 SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
            file://obex-data-server-0.4.6-build-fixes-1.patch \
-- 
2.17.1


