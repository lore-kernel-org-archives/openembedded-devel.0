Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id B7B3B73D17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 15:08:04 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so116215079wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3+1N7+YcN3LjlShjU9+tvTlUCWKIM3Mqise/N3hLhjg=;
	b=CWT+4NHicpJXl3btVTudc1zCAs2JfnVi4PE5oiA3fzSHYCmiD34MNuX3wrHNwHSnL6
	oMjFLhZYh4hoIkzhG8tUxl7jo4F4mHijUjh/1j8GrVEzkzanbafE3qG85tWpp6/bFomu
	xsTNdWlyFnjgCezTxXJorRGdcyFIKFqqBRGcHENi+Wy41ftDO1uXPvjgj4fJTNwdyCcx
	B1ZoOBhlVTvkwIyJF1C0+oTLmyDNFVLZFV25Z2cO26B0J3Mq1dKaO+Sf8P1AteEaNLdl
	Z749RbBmpzU9zsLkRntcWvtIxuCnCXqb93M3vPbsCjWzn5cWdOmSJB8uYDuESnOsnCSm
	9GbA==
X-Received: by 10.181.29.101 with SMTP id jv5mr2194374wid.1.1442761683639;
	Sun, 20 Sep 2015 08:08:03 -0700 (PDT)
Received: from localhost.localdomain (p54AA5F54.dip0.t-ipconnect.de.
	[84.170.95.84]) by smtp.googlemail.com with ESMTPSA id
	pb4sm19390833wjb.8.2015.09.20.08.08.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Sep 2015 08:08:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Sep 2015 17:07:53 +0200
Message-Id: <1442761673-22041-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442761673-22041-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442761673-22041-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH] plymouth: building documatation sometimes fails to download so disable it
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
X-List-Received-Date: Sun, 20 Sep 2015 15:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
| cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| Makefile:622: recipe for target 'plymouth.1' failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index b8c82ed..1fb4443 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.ta
 SRC_URI[md5sum] = "ff420994deb7ea203df678df92e7ab7d"
 SRC_URI[sha256sum] = "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
 
-EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk \
+EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation\
 		  --with-logo=${LOGO} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-system-root-install', '', d)} \
                 "
-- 
2.1.0


