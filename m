Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlY3-0007YZ-9e
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:15 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=NMmLxnYjNiYtkeo9AJulYJtqpqbCJwSI9tw+gN5KeKk=;
	b=ITJHwfPxyezVM9kP6l6XQfPugWsa7hdNV0mFhf6rr79Fy7dnszXNexxG0zZNnKSasH
	o/ysa/3dh6wiKw/hBCUAKhyzow/Y85MFOeH0L9DTgWrv/506lqJj7C+bE2p3iwQWsISl
	5IHMHPpHM36RQ8mwTbp7I//qwibR3lK9VMS2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d1Vv3dNVxUM02CEUc971RvPKJ2iXA4n3thcdZHR7hj/Csx/8el++TqauE5BRcs89jy
	AhWq3fSS56A/ULUZZIw/m0ZXnE4afKS6vaKNLT1XHBPRnUdtoKcExGp0MNhMOFF/4/Z0
	nNl65JDQ3Hjpls26BlLVrkg0dSQWsnjX4gIQo=
Received: by 10.223.5.212 with SMTP id 20mr4734913faw.40.1306696690242;
	Sun, 29 May 2011 12:18:10 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q10sm498437fan.8.2011.05.29.12.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:19 +0200
Message-Id: <5883891cc16ab0372b9c16838da7bf6020478b8d.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/16] gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb |   24 +++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb

diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
new file mode 100644
index 0000000..7660ad9
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
@@ -0,0 +1,24 @@
+SECTION = "libs"
+LICENSE = "GD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
+DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
+DEPENDS = "freetype libpng jpeg zlib"
+PR = "r4"
+
+SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
+SRC_URI[md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
+SRC_URI[sha256sum] = "dd7c1795271221b9237769b96b8cec7fbdc5db7b8954d864ead51fc1296a6ac8"
+
+S = "${WORKDIR}/gd-2.0.36RC1"
+
+inherit autotools binconfig gettext
+
+EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
+                  --with-png=${STAGING_LIBDIR}/.. \
+                  --with-jpeg=${STAGING_LIBDIR}/.. \
+                  --with-freetype \
+                  --without-fontconfig \
+                  --without-xpm \
+                  --without-x"
+
+EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
-- 
1.7.5.rc3



