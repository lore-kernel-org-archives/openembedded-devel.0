Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2BA7711C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:19 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10429351wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=roHNG+wI+jaf38GMctyj2KRsDQbk218oCt41rGnSXjQ=;
	b=Pl/4fCQSyZgFUe60nnTFGde4R/Pz2YYJLwPIRltHnFlc5HbC1W4cud5UktQnNkMuyz
	gC6lcuOrnTJaicaQtZTHAc986D02tqyPj6p/JHnKbc1UxRyHOeSGrbLA+6IzBvgV5E66
	wnCy6vEuU/Edesw62vdLTB0kDE+MSK7UmTvwtK50GiwDQBVFQj0IMV1gXM68p+01lkGw
	MlMtw6l05BF5rmbog3zmxBPUY0p1jcGUBUdGX/+E+0Wq6emH8gT9JKeHUL6reeV3Rs9S
	B5BH2KpxMyFRTAQfn8jByk3MlSzxNn/n1JKpUuNYszk6NyXTQ/jns/R8R+OLtILNO2Pi
	CL+w==
X-Received: by 10.28.23.66 with SMTP id 63mr2950199wmx.4.1446207259739;
	Fri, 30 Oct 2015 05:14:19 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:36 +0100
Message-Id: <1446207225-15386-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/13] gparted: update to 0.24.0
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Depending on gnome-doc-utils-native fixes (detected when building from scratch):

| gnome-doc-utils.make:63: error: HAVE_GNOME_DOC_UTILS does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:133: error: ENABLE_SK does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:182: error: ENABLE_SK does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| ...
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gparted/{gparted_0.23.0.bb => gparted_0.24.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.23.0.bb => gparted_0.24.0.bb} (70%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
similarity index 70%
rename from meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index 0705439..d77d1ed 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit autotools pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5901dca33ced32213cccb13a2713dea8"
-SRC_URI[sha256sum] = "7fd1dddf29814c2982f55ab765b8918561e1b5dabf792012c66b4d3ba25da754"
+SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
+SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
 
-DEPENDS = "glib-2.0 gtkmm parted"
+DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils-native"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-doc"
 
-- 
2.1.0


