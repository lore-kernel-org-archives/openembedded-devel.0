Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id AEBAD78637
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y9so10774721wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OjkD10e2Fx+ay8Cs0KYuS+wVspW3AKMgztvdyrXB43I=;
	b=qENy6WUG360jqojT3yDElXajii+ejlE7cShKXipKHSF7M2R2fLiAhVwWoaDdgt9Ia/
	LMgI7Rejv7tzjtJ2KirUQQLCsgzg1DzUspexDnv4h8EjvAgGF9crPnMO9J63ektN+IcR
	1qP1BD7cS100R2DTEUyyg+QpUMZ3KyCJF9+QG4fcXe56Xhnd6m2xitrOzHg1/+4QL/Ee
	X7SnEJFpmx+GKVfJp23RecbVxi4faKNrr0Y/6tPvOeTdpeiJQgiRFGGBBmUq8eaE/tlk
	7JT1cAmujn8R4N4sAz86xSVGWJBsC+Q5Jzeo/Cpyt/EgsPEbl+gEqQnaGJSZ3MkSeK+Q
	Eexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OjkD10e2Fx+ay8Cs0KYuS+wVspW3AKMgztvdyrXB43I=;
	b=QtQZOkaaU+XBKHBp9WUsNwR8nlNHraWSAfqGPK1+E2D0nhphxm7UTgJ0090XN6rufn
	Flotp2QvxS5Z3YpuqIdLcUT2P69Mh1vnWA8gdDBnZA3q2LTa2O2gxTiO4gvRoXn/rnFa
	Rt35FpvCnRs5a/E8leMaeogcNDzVcq5ppnB+CGGAsVsgbJGMfFKjvfp+hlxmGP2AEfaF
	n36C3stODjZd04Wh1AgivpQ+OHnCERAKU5kUQvWb2+M2X/JKPGz6cCimpKxakTKAGtzH
	+AgXJwsvsPVmsZ+amx1l9aMyCpfRP02ptXIiUe2ampWetoIKanzfxqgp1M3S2yNj0ng7
	oYFw==
X-Gm-Message-State: AJaThX7r9Gj9ujMk3/PpjSmghfK+5sx1Afw9PlhAxgX5kY8Dxm6K3lzP
	MSY/oP0/UCcDVzJzsJAGOR3qfA==
X-Google-Smtp-Source: AGs4zMZEAg0CYUsHET7MtPjLAwa/tykyIq3Q96LoB7kF/0phaBI8J7w0sjGKOvdnNRx0pK/GKspaig==
X-Received: by 10.223.184.125 with SMTP id u58mr2979192wrf.33.1510407004548;
	Sat, 11 Nov 2017 05:30:04 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:40 +0100
Message-Id: <20171111132950.12570-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 03/13] gphoto2: update 2.5.8 -> 2.5.14
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

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


