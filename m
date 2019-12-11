Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id E0E9F7FC10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 12:47:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n9so6946500wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 04:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dhQ3SQBtsSMxscr9tE72oTZaotU92/iKZqur5PivruE=;
	b=CAg/ZdW54Y5RlPI3o8mRnASzOrb1/YorgWI/eBFM1EVLh3gsZ17nsA4SKCmRVtgys+
	hg+bE5xs+47frd6/7Xk/OmXewsBh4atNNqflNXy0RDWeuaI2OdXO7kvB+/t7uiQTK0IT
	fW/2BqOsPiasP4sNKDeJoLmhTUi5H6e1TZdjWlMYzWhxiffmauFTe2g6QZjCaw7DOcM8
	j8O04wwrkBPNNQwx5AuAdo2wxcTu5TYprEKO4BBXVWu7giEuj2SRjZvRVNRZxD8C32Sx
	MMonfdiSxBqPnTV+s024rZabmy931igFZuN8jLrPZ4vxYiHOAiEXuKBOsQbWWWMflQfa
	lbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dhQ3SQBtsSMxscr9tE72oTZaotU92/iKZqur5PivruE=;
	b=GC+6rWozifjX0LC+REOD8dIhUY0eV3EiIzAcWC+pLxXWV6HBDKIXvsDXVDIu7u+Kx2
	c84DOqVJrkJWMZyl7JSF0W08y9CnNVNapz0gtwTii27kRjEelFlgYIEbaQ9eFZtnz5sF
	61SCOhq1xm/mMbPohYF2Yw11+BK9TG9ObqLwgOXr1GGoSUoH0XTNhG60eg61SC/sTmLt
	1qa0DHx75YUk/8Dz3hceQRWqTYqec7HSvL06kyIbNedxIfL7MbyoerynZvv6RMWeibzr
	++KjUh9LHXbhKeOU05PPl6hutB0QhN7Vs53F5JzyjOt2lWECAA8FJBC3DeNzcAEJ/9PF
	h2IA==
X-Gm-Message-State: APjAAAVIqQ4xuHAwBV6PG80dTMXT27yWeQDg7nicfldkRtaOtc/dwPUb
	HCewQB6RpJ0o1CEmfrFGoOOpWg+x
X-Google-Smtp-Source: APXvYqzalQgRrhrBLa3PL3BdAcgy1Q9nXi3KqX72g9HTw0s6JhpbhgG3HGXy51I3T7JreSRUzczHxg==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr3506059wmg.163.1576068479390; 
	Wed, 11 Dec 2019 04:47:59 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	w20sm2170038wmk.34.2019.12.11.04.47.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 04:47:58 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 13:46:58 +0100
Message-Id: <20191211124658.54391-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] libsoc: use python3 for python bindings
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
X-List-Received-Date: Wed, 11 Dec 2019 12:47:59 -0000
Content-Transfer-Encoding: 8bit

With python in PACKAGECONFIGS and with the removal of python2 from
host tools the recipe fails to build. Change the recipe to use python3.

libsoc configure uses the host python to detect the used version,
install and use the python3-native package to have the same version
for host and target.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
index 01708df35..8b773aefa 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/jackmitch/libsoc"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e0bfebea12a718922225ba987b2126a5"
 
-inherit autotools pkgconfig python-dir
+inherit autotools pkgconfig python3-dir
 
 SRCREV = "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
@@ -21,7 +21,7 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[disabledebug] = "--disable-debug,,"
 PACKAGECONFIG[allboardconfigs] = "--with-board-configs,,"
 PACKAGECONFIG[enableboardconfig] = "--enable-board=${BOARD},,"
-PACKAGECONFIG[python] = "--enable-python=${PYTHON_PN},,${PYTHON_PN}"
+PACKAGECONFIG[python] = "--enable-python=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN},,${PYTHON_PN} ${PYTHON_PN}-native"
 
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', \
     '${PYTHON_PN}-libsoc-staticdev ${PYTHON_PN}-libsoc', '', d)}"
-- 
2.20.1


