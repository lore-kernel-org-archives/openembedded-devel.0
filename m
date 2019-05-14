Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 76DD67DF23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 14:49:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w33so23264359edb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eIZ2svRhpSuUxLs8waZPmOQm9du9V9VzGx18PLVVzpI=;
	b=vpB0suA0Z59r6b1+efThvIKSqhmTslMqEGRCmiH1C4RnpAQszpolprG79inK5Peuai
	eNkVIdyKEIk+K/gdOUPpzrXMWljiOsqy3SRM/uLCtv2+LjWZS5kZ565ZkBs6DagPnrcX
	EH8SZhOA/EsWelHEi7bv97iTM3dOq2sSkbZqRIhdonYSA/aGEuZN+h1HS4+1FKIkOU31
	jrJKvec0yqY0VgUxNGqZtvuQXohY1gicUE0HwVqaDdiQEJDrD4M95ro9iCbqx6MTVECC
	XDu1Euf0XMWRd264XQQWUYDh4L9UCe7OxZo0dU5lEhJcje1jkKxqrR9LA8EN4YM8KYog
	5D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eIZ2svRhpSuUxLs8waZPmOQm9du9V9VzGx18PLVVzpI=;
	b=ijmLXgA5z5qQQeQSP8l5dnm8SMBoknSFSTVJF46QFa0sz52Z1Fs5GlwQZsPEsgEeXO
	XvUFm2vmdV03gNf8IFuf7/TnRGGKLyPVBt6WOF7wxkFEaE4m/Pc4ZSWKlAhB/VPzt4Xp
	ispFTHzQv2G3GwZNZmtb/bgOTjQYAm+d6/tdPf0JU9ypnS6nu+Gw6/FAo/5Dg0jLGaA2
	KXghqRXvSuHxWLCgnAYNRTWWvH2Y5tfJjseHQaXUHG6i1JQAzKLWwzJBlgykCyqqdJiu
	D0qRC6i0HKhSDjpSYn797WpGpy+i/xxqV/NXesfzB9/bHjZiULUYR+NNR7Oy8M7H21Fb
	DERA==
X-Gm-Message-State: APjAAAUIdCtnYO826lW2eECQCa+oioGvgFdK3EvaawaYzH8bFM/IbcjZ
	9Nl2NdiYq25s+laCAXWW+LJhfMWeGz8=
X-Google-Smtp-Source: APXvYqwO98jf2/8WWNaiTNTGdKCMeC3iLFKf1eQRgp9FyslwIPbvngnumkHu+HnfX/j9zKxmhBUieg==
X-Received: by 2002:a17:906:1f51:: with SMTP id
	d17mr27906890ejk.290.1557845387712; 
	Tue, 14 May 2019 07:49:47 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m16sm771828ejj.57.2019.05.14.07.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 07:49:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2019 16:49:43 +0200
Message-Id: <20190514144943.23731-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ell: remove recipe
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
X-List-Received-Date: Tue, 14 May 2019 14:49:48 -0000

ELL is now part of openembedded-core.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-core/ell/ell_0.17.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb

diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
deleted file mode 100644
index 27f11cfbe..000000000
--- a/meta-oe/recipes-core/ell/ell_0.17.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-
-do_configure_prepend () {
-    mkdir -p ${S}/build-aux
-}
-
-DEPENDS = "dbus"
-- 
2.17.1


