Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 589007F9DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:42:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id c14so23346464wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ek/VX6P6DBQLXLQpxWcwvU4WK96rV7K3nlhNXr5acs8=;
	b=DGQ6S9CFXA2Qbk3OLyRrxp+qaD5hRHj1kmmrhXilSwH9/1N0sJ7rPZTplKIVQGYkOU
	HNdwLXbbuu6/fTjQZ0mO3Zo+rJDY530zzvkStaZJWb3E0d1rfTcPFiGajvCC+XYXqw2Y
	/e3v26uNzw6Ju+zcVVUcpiBtTjHQxSZGX1g21bCgaUyQpvwLVXS4or+mfmSFByoHA1qE
	X7o7nyy9LNDvZCte9bLC8Xy162Z78PPc5U3GoIxdTySUaKWFWAqsf5UMOupPv2U5gtEH
	KqUI6l/++uLT1ZahKSs1aDy716lcdvyLz/JXDWSMlLcxB4wJ58xv4Ie1UfIlDsIkCGYv
	deSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ek/VX6P6DBQLXLQpxWcwvU4WK96rV7K3nlhNXr5acs8=;
	b=deiisNDViK2eCwHwqfAgBy925DG55CEACTZQDO57J3Dbw2GQYM2c5jvjW0iItvLO/P
	NhW0oeEvEp0lfGJrY8ogExB/IdeUhG+P6zrjCNOfxY9zdFTB5GfkLeDKbE2UeZfAdsAJ
	Nrx5OBK7acHBkBEt+LywYpU6pDY9ZGPE0sb29PwZJgB6oMGbnYfL8AGFulstfCYi6vIO
	usMb/6KyWgVF7tAduEqEkzOFxLqNHAyjNiQ1lX7/toXYZhMGri7izK9sJdQU5ix9ApMK
	QU+amGa32R0aYOCJx8oVbX2So8HPxFNob/S61dKKf22XCxpvXfdjmOP+ZKGBqb35ePhY
	4lNw==
X-Gm-Message-State: APjAAAVsYBwNYNj4yeERLIXk1j2yK09oRUrC5Ws1IxJHvqZrTmMm3Aqt
	9XDrMiWVmFPNSKxYHev+X2ESBLv1
X-Google-Smtp-Source: APXvYqwr3hc1PF8itEL+oIslGzj9cEWKmjUcKVhXDBoHQfyog9Q8FTidmVnCGHxo84yjeh6Ie370Cg==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr4068848wrn.155.1579279347626; 
	Fri, 17 Jan 2020 08:42:27 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	s8sm33594583wrt.57.2020.01.17.08.42.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 08:42:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:42:17 +0100
Message-Id: <20200117164217.11435-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200117164217.11435-1-schnitzeltony@gmail.com>
References: <20200117164217.11435-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fontforge: rework for python3
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
X-List-Received-Date: Fri, 17 Jan 2020 16:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* python3native is necessary because configure asks for version. If it uses
  host's version python modules might be installed in wrong paths
* checked: ${PN}-python is packed properly
* while at it remove uneccessary (wrong) line: there is no ${PN}-python-dbg

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index fe7601d83..c12d01e2d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=d042f3d2a8fd7208b704a499168e3c89 \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gettext-native"
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native"
 DEPENDS_append_class-target = " libxi"
 
-inherit autotools pkgconfig pythonnative features_check gettext gtk-icon-cache mime mime-xdg
+inherit autotools pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
@@ -31,8 +31,6 @@ EXTRA_OECONF_append_class-native = " with_x=no"
 
 PACKAGES =+ "${PN}-python"
 
-RPROVIDES_${PN}-dbg += "${PN}-python-dbg"
-
 FILES_${PN} += " \
     ${datadir}/appdata \
     ${datadir}/metainfo \
@@ -40,7 +38,7 @@ FILES_${PN} += " \
 "
 
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${BPN}/python"
-RDEPENDS_${PN}-python = "python"
+RDEPENDS_${PN}-python = "python3"
 
 # for e.g kde's oxygen-fonts
 BBCLASSEXTEND = "native"
-- 
2.21.1


