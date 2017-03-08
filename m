Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 276736E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 12:58:30 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n141so10581031qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 04:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jyx06qts6N2JDwFNeTPlBQp2cqmswaw+YCJFEso6wNc=;
	b=mBKoWxaMAQSURcMF+dPGODVECjjfuv8Oj2L6HjDoW9KIHbJfaor4WKu49j3Bar043/
	OecQizJCYjeLnkw2BmUce4pdV94jJuUhiP66cXO+vsNMPLCnxMPV+B82lV0wba+LPmhM
	zM9VGQZ0JF3tgC4oH1Vg3MmFzAD/kPtkY+vgCCSSH5j8L9QWzZdp6rBgF6xTzW+uYVvY
	cNwWyxwhEp54p+IK7nFWSNqjgv9gtTqg7+/dfagjpmFQSe4gVeRrLJTxmhs8vfRJ+D+K
	Mj4TL7Wz3OLHNVATkO2WzXrebVJobzKpYmc3NfcV5Q3R+pcmXcEyRbpUtzFBwLOl63Ym
	DKGw==
X-Gm-Message-State: AFeK/H3HlnPCW72qn3U0PxQ5S3KqGA+8rQcYd65dBlVzkCtA2hnZtgQ4H8IO53Nbx0q0bQ==
X-Received: by 10.55.15.217 with SMTP id 86mr7677268qkp.102.1488977912055;
	Wed, 08 Mar 2017 04:58:32 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q11sm2042956qkh.16.2017.03.08.04.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 04:58:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Mar 2017 07:58:19 -0500
Message-Id: <1488977899-3507-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-idna: update to version 2.5
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
X-List-Received-Date: Wed, 08 Mar 2017 12:58:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-idna.inc                   | 4 ++--
 .../python/{python-idna_2.4.bb => python-idna_2.5.bb}                 | 0
 .../python/{python3-idna_2.4.bb => python3-idna_2.5.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.4.bb => python-idna_2.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.4.bb => python3-idna_2.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index bfcd87c..d099c0f 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c9ba5acd829579492fd5eb306c7a0565"
 
-SRC_URI[md5sum] = "b27328914784bf3e4f6fae16f4b75ba9"
-SRC_URI[sha256sum] = "2a07165f6288f4b920aa8ab4357c1e59073c5d62e048a400510982769e039bd9"
+SRC_URI[md5sum] = "fc1d992bef73e8824db411bb5d21f012"
+SRC_URI[sha256sum] = "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-idna_2.4.bb b/meta-python/recipes-devtools/python/python-idna_2.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.4.bb
rename to meta-python/recipes-devtools/python/python-idna_2.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.4.bb b/meta-python/recipes-devtools/python/python3-idna_2.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.4.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.5.bb
-- 
2.7.4


