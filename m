Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8D66AC7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 16:01:35 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so12169791wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2014 09:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mRr4bKZOi7pcMIS2Pefdkyo2inwQSoCJF/xhZOUqazs=;
	b=c0Z3Vrz+0epCaT9+7jHwwL96rVJhzGUZCLu+s6Jr870LPIeXMb6qHx3mDT/JfxpWlN
	Zsq0106mVpJ3wQyT9aabpunRCH+Laa8eLR1PUNdyynLoJrz2fZEGzazy/c2GQKcPBpQc
	INAoAyUC7bIDczhi3DVKylbVF6Ai6JpG99CIlRu+uK6u6NiyMnBRf76KDgUGqovwnk4q
	NpGn8miqyYrOUXfLsxrNI6eQo7vj4avfIr9IeYKoQ5K9a5HEwhbhmyEiK3z++ZzvNZR0
	p1zp+L+zFlpXOgEt85wKZC3DCFxEbcUVxJYJ/zC9bNaIczMtx40gvIO6jR02nazDvOcH
	yGhg==
X-Gm-Message-State: ALoCoQkW+J/lnF7YdvjKM+LgT9VEbpXk6RsKevu3Gqx+0zKCfCfrjxlCRTYPaV8cmnCC2v0x97Lt
X-Received: by 10.180.89.193 with SMTP id bq1mr57264458wib.81.1404489690503;
	Fri, 04 Jul 2014 09:01:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f6sm69829321wja.25.2014.07.04.09.01.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jul 2014 09:01:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jul 2014 17:01:21 +0100
Message-Id: <1404489682-30529-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1404489682-30529-1-git-send-email-ross.burton@intel.com>
References: <1404489682-30529-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] poppler: use PACKAGECONFIG to control graphics formats supported
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
X-List-Received-Date: Fri, 04 Jul 2014 16:01:38 -0000

Add explicit PACKAGECONFIG statements for JPEG, PNG and TIFF.  libpng wasn't
previously a direct build dependency but is pulled in via GTK+.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index bdd4144..a192882 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -8,10 +8,15 @@ SRC_URI = " \
 SRC_URI[md5sum] = "49d55921ce795778c7231fe9f2fe923b"
 SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1dce13b"
 
-DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff lcms"
+DEPENDS = "fontconfig zlib gtk+ cairo lcms"
 
 inherit autotools pkgconfig gtk-doc
 
+PACKAGECONFIG ??= "jpeg png tiff"
+PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
+PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
+PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
+
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
-- 
1.7.10.4


