Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id F1B3B782A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:51 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l1so4530611wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8ZAHwmo/BGocCgdu48b7FI1H7sOsJQbbzliRUWNIbW8=;
	b=mvCiv43rQwzj7W8uyBSqGO2gB5/DmsKCHmcmFmeAVQvG710JgNuJnPHKalo2Kcai8R
	OhxugGxxggyzFB0/fsp1cvyPa13tHqgJb/kAvOBVcvK2EzH3JWpcuHZRLGGwsNOzR3ZF
	6/pGAakTqKnywAhmspae7TI/khnuRUOFpD1qswN+7I+Cnna+9gaPH83+loi5umwnNha/
	KFTO+IxW/RAOCkrGy0MeombtLKczBgw5EJiVypJ/YFvS4ISPWhMpXEk36CRCBy8FEf0G
	VcQHyOtLQUiDNqiMwGUw/iByEqfirskfRCM/Zk6lNzGILMjFZiqOqElsDwG59qoOmfZ2
	dQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8ZAHwmo/BGocCgdu48b7FI1H7sOsJQbbzliRUWNIbW8=;
	b=Pr9PCgz8+U9rj4TI5Fal5QOkZmLWzsocbhW0rzgOK7Bb9ij7K4eS3UNdP6JoatXO4O
	sGQSzjy8htyEtvsxkRD4FkX406xdK99KIoNyDAv2iFMOCM0OHriHeZoXBpemFnlRPUqF
	H07dUg71R8LuAegi3L5Ulg6SuB980wWpcqjkALrIC3eBlc5lPeKYpgVOQrbyhzF+GAur
	TyonkhfYf03WpntzN1xQ7mwFAfMTycoVasNcL/n5S4dTjIUUFZYN0stC6VjTpIah9r7e
	vFjBafSnYiEA+OLZHn5sQs7EKkQy8UFfwaIyFYhiD7Yamd8AH26Z0IwDihF9oejyIelb
	Gbvw==
X-Gm-Message-State: AMCzsaWK2Tl947gZHKZvnojrdKWfmhXYFg6v2bOt/zCqMOpCPEBfUTcD
	oHB2gerQxrfUuKfYQXJv49LNzQ==
X-Google-Smtp-Source: ABhQp+QNCgSiO5HP1qfD1/7hc1wylb9fZGjev9ZdshK8wpfhNflROnq4Ew2pw9cDL6kegt35qydBbQ==
X-Received: by 10.223.168.66 with SMTP id l60mr2381498wrc.144.1509618712312;
	Thu, 02 Nov 2017 03:31:52 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:23 +0100
Message-Id: <20171102103129.3703-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] gphoto2: update 2.5.8 -> 2.5.14
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-configure.ac-remove-AM_PO_SUBDIRS.patch                      | 0
 .../0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch           | 0
 .../recipes-graphics/gphoto2/{gphoto2_2.5.8.bb => gphoto2_2.5.14.bb}  | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0001-configure.ac-remove-AM_PO_SUBDIRS.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2-2.5.8 => gphoto2}/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch (100%)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.8.bb => gphoto2_2.5.14.bb} (79%)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2-2.5.8/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2-2.5.8/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
rename to meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2-2.5.8/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch
similarity index 100%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2-2.5.8/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch
rename to meta-oe/recipes-graphics/gphoto2/gphoto2/0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb
similarity index 79%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb
rename to meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb
index 62d283b..75ad7f4 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch \
 "
 
-SRC_URI[gphoto2.md5sum] = "bae369aee6881e590c5c91bdbb11a5f8"
-SRC_URI[gphoto2.sha256sum] = "a9abcd15d95f205318d17e3ac12af7ce523d2bc4943709d50b0a12c30cc5ee4d"
+SRC_URI[gphoto2.md5sum] = "6c6a21b5e879330cdd71ef92dce36399"
+SRC_URI[gphoto2.sha256sum] = "9302d02fb472d4936988382b7277ccdc4edaf7ede56c490278912ffd0627699c"
 
 inherit autotools pkgconfig gettext
 
-- 
2.9.5


