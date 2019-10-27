Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id B4E107FA86
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q13so7959303wrs.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XORwNvuyiqFaQ72pno/Fvt45kVQfIF5TvSokVntGLns=;
	b=BB6NvPJeKP1PZniKcgBPYTENeABj9YThpadWF/GLxMVDccjCK0ra+Cqe3DO1uWMjS9
	YZw269FKcqGc5ofSkfWT1995d2bB813w8v3dZ+rib3+kQEZxu/Cvg272xlNZMEAnOFol
	T/PGW75NwFZydFWuCZY8wNttozeWCr69FManS9wxWjltce5RHzhX5P0KBMjF4V0+92wl
	ma9pNOCw91pD1437Te/OuWMPx9NnDe88Nm9yJXD2pHH1N7IWQTuc1CluQkDcqOMaZFNm
	n7NoiDdWBIvWyl59zhFqeLlifZMESUgLTsX3ZkeZRaIye8eLOyr+lucz12p4n24KLnEm
	QpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XORwNvuyiqFaQ72pno/Fvt45kVQfIF5TvSokVntGLns=;
	b=g+jZ9DcgvUPZM4Iosfjbjg0egW/dFs7Gul30rr5OzemoPb5rcMGVMHeN/oJHIcp6V9
	8bcjLPAeBmSLxf3FOiCUhtPb8TDIj1xrSKAqPTpQucay3KDfebbFIsEO8r69asbfvnSQ
	jc0tBVMeYpksNyd2hJ2bzJr9CkZoYqH/0KPuZDa+7cJ1LUu0Fr+AF+L0hYxDs7EXwkFk
	8Ggq/667Oe+TKs18usUejIPCxFoFSeRVE8OuRlwjp39H65Tci131OVQ+iy9ijw6pNRMt
	IDo0HQqSuPCBUSlKL3kw+AaQqvpdq7H5cfr5kLMsdh5P8A5zLVdGY9PmpTc570qjhOwP
	fQYw==
X-Gm-Message-State: APjAAAXQuSKVLi2+jOpA17Q1I2VKYcoSOs/JBj8+sIAxK/NOC7MQOwdn
	vRhhU4eXj//sqjxcJMC/sESqRtVe
X-Google-Smtp-Source: APXvYqxxSyfd94Vc4EkFCj2m8yMx1F4KqN3l2bf8lNLOkZr12JN/L84aGym7txSTqxZ9dKRadJDd/Q==
X-Received: by 2002:adf:f087:: with SMTP id n7mr12331904wro.1.1572219362276;
	Sun, 27 Oct 2019 16:36:02 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:30 +0100
Message-Id: <20191027233545.4146-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/19] yelp: use itstool.bbclass
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
index 13c4e52bf..f6311965e 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
 "
 
-inherit gnomebase autotools-brokensep gsettings gettext gtk-doc
+inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc
 
 SRC_URI[archive.md5sum] = "776e29bd16424c8712cbf340cfe6429b"
 SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513bd0be77a7bd045"
@@ -12,7 +12,6 @@ SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513
 DEPENDS += " \
     libxml2-native \
     glib-2.0-native \
-    itstool-native \
     gtk+3 \
     appstream-glib \
     libxslt \
-- 
2.21.0


