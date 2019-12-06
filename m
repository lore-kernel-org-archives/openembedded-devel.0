Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 93C097F977
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g17so5870070wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=n5XYcKa1B+1qo5jOqfhdTv45bzw3pBplgcMOwvLSRbs=;
	b=q3fOp1QLAdKpbB2u0FZvGZdvLtZ29vGis8v7l5njWf60PL0BJD8ODmECTLUKfG8Axy
	CIK1ogg2IRnTJXwMWwoldZL+FihxRIUbQ2Kx2jdpDSmo3ThS88CzNF3h5cN/UNASOz7z
	O7So4M6rQYFB5bVB5YgyenoF9UBtmBEE7ewoME6ZTRTnUtOh6zm7JN4ajkYW5RxtLTOi
	83uPidBdyfnijoAsx321mY78XgMl1lVSmRmZu7WAsB9OlNngMscZ3AiCLaUzgwBPkMU2
	bidYdSPgr6x37D4LaoWxeJzWs1bFPJV1mgIasZpSVu12Qb4hrm4Ut1cN8lJLRpQOTbau
	MZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n5XYcKa1B+1qo5jOqfhdTv45bzw3pBplgcMOwvLSRbs=;
	b=kgRyCtTehSxHVB48X3codSn2HyKrSzek76GptbB5HGPpSB5taTr2fGQLAM1BaJZuw6
	n31otGwpWgTh0aHIxRrHfbywMSnt45/OS3a2uU4IaaeS8igDhiqZvwNpftSIlEEZEx/U
	DvsZK6dUm2/4s6AFt2SNmELaMYfEE91LSpKRDj40kGmAI+FtySlcKmJxVJgp112cUMKM
	sieea6yKYG2JHtLWdOG+aKiS8X8ZCuEtCKujUCuH7bpw3/HHMKB6DtwbSD6FJOLUQlyj
	zWqJSaxSEJ4oqPbulDjnUfxpBCZTUzVRrQzsOhuJcCPcNjU5HQa6ed31tEFIDGuug8PH
	9LDQ==
X-Gm-Message-State: APjAAAVS1NodhTi7H5O+/0pz7lYzj+nL5Q4IImJn5XMwp32GKaQkNF8g
	zrxkB3x1cCscbOnCCDCvM8vC7n0L
X-Google-Smtp-Source: APXvYqxecaVWJ4YvooqkASSMSSBEM2te3MTQt8v8wSjz/zU6K34CT0Eq10T/bcnKdYGQErScznuGrg==
X-Received: by 2002:a05:6000:cf:: with SMTP id
	q15mr12354692wrx.393.1575590967090; 
	Thu, 05 Dec 2019 16:09:27 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:54 +0100
Message-Id: <20191206000912.19841-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/21] libgsf: upgrade 1.14.45 -> 1.14.46
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* there have been no traces that gconf is still necessary
' while at it cleanup recipe

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ....ac-drop-a-copy-paste-of-introspection.m4-m.patch |  0
 .../libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb}  | 12 ++++--------
 2 files changed, 4 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{files => libgsf}/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
rename to meta-gnome/recipes-gnome/libgsf/libgsf/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
index ac36ceb04..049320afc 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
@@ -5,23 +5,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
 
 SECTION = "libs"
 
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
-inherit autotools pkgconfig gnomebase gobject-introspection
+inherit gnomebase gobject-introspection gettext gtk-doc
 
+SRC_URI[archive.md5sum] = "5bc6d1d6394f0ed5a58e8f2e5e4ead7f"
+SRC_URI[archive.sha256sum] = "ea36959b1421fc8e72caa222f30ec3234d0ed95990e2bf28943a85f33eadad2d"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
-SRC_URI[archive.md5sum] = "e45cc8aa9c49516d540b7d7307f755f1"
-SRC_URI[archive.sha256sum] = "5cbc2c0f1dc44d202fa0c6e3a51e9f17b0c2deb8711ba650432bfde3180b69fa"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
 
 EXTRA_OECONF = "\
-    --disable-gtk-doc \
     --with-bz2 \
 "
 
-RDEPENDS_${PN} = "gconf"
-
 FILES_${PN} += "${datadir}/thumbnailers"
-- 
2.21.0


