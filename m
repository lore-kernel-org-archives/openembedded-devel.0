Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17c-00005T-TZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:50 +0200
Received: by mail-ee0-f51.google.com with SMTP id e51so3360327eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=W9GPceWiD1T0gOQbxsFpAzR4ERZIDJtnk1FUEyTZORY=;
	b=vc/NKCMrE10Mpt8EZjI3HIciS9eM4oVU0ZA/wLLdONfGB9m9hsSJapykgh24feb9W+
	DXp2So2spFa1JcH279/ZuBXL5pC9EIo7eEcIkPM79PoXVXO4HX69mBctaDcb99w3GPVF
	IgEKCt1zwfme7hHCyKPmKWNcUDrGl8p0f1eOa8r9ZFnjwk+KpDpw/iyh+jCY73xQVhNh
	BcM4yZsatgHIjMlOqflNpfDAnUsuw1QyrFpEwLYIlTyFnBtanqr9sa/KnfNWuHhbajkA
	IW64G74PtEMxkAksMT2aMT1UGIkL4E2Ef58fo4CLvUET3PH+AWnd8zmGJq+ps1MZsm/e
	9bkA==
X-Received: by 10.15.35.71 with SMTP id f47mr114645526eev.15.1368959250649;
	Sun, 19 May 2013 03:27:30 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:07 +0200
Message-Id: <1368959233-28288-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 05/11] pangomm: update to 2.34.0
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
X-List-Received-Date: Sun, 19 May 2013 10:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../pango/{pangomm_2.28.2.bb => pangomm_2.34.0.bb} |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.28.2.bb => pangomm_2.34.0.bb} (76%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
similarity index 76%
rename from meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
index 4419113..4f293ff 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
@@ -4,15 +4,13 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r2"
-
 DEPENDS = "mm-common cairomm glibmm"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.bz2"
-SRC_URI[md5sum] = "005a474863495d3c6267429a80da6cf2"
-SRC_URI[sha256sum] = "ec1d97245eada5cf18d0e7af3f6e31498f25623b4a354589d631d2dff92fd88f"
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
+SRC_URI[md5sum] = "2c702caede167323c9ed9eed2b933098"
+SRC_URI[sha256sum] = "0e82bbff62f626692a00f3772d8b17169a1842b8cc54d5f2ddb1fec2cede9e41"
 
 inherit autotools
 
-- 
1.7.4.4



