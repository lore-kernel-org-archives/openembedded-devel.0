Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3836D6C4A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:35:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b11so401550wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOBOMx13q6YHMYi1Bvq/xzYmBSMWUvP73EIQysrgh1Y=;
	b=mAPKPPZVRE8ocX3Au7CrMU4e077TmLz1AlnT80Q7GEs3I2GT45ALsK+YShnJBFqgb0
	UA8Mig4JojwaThr5DL9FahXSx5CI5Yqz7eTkyDVhaKdUevCHnXiANh5yIhu6KWF2tvTR
	QyBJ5/KO3viWZ/3awSswv8B7a0WyCewsWomcRkoeHIk9bg2R3kGjVVtnJ0lhWyDvLLnR
	uQwSsqYmnCyPMpIhbouLnjNF4l9WtHypf70EwGrJJrF8Stx45CjKZ5MX1nqa4yxKYla9
	hxBmAWmVsJjIKnIqKZw+JiQphKM/UMJAtoGaqb6Cdr4nARU8t5a+YkDs1etEQNuAMFIq
	k4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JOBOMx13q6YHMYi1Bvq/xzYmBSMWUvP73EIQysrgh1Y=;
	b=JJhORw19/gh+zDaLSs9ztfzvPwXF2Dhxup89dztF+B8y4XxaZOepr86yuYN+a/mKeG
	zuyjsuznzclmIUhPsUYgaeG3QW3MmhFJb+Av0bwxpGDg/bJ1pEVs+iZYKPJnM57YyCEp
	ltCDLuMVCvTxNbmzynQPC8lvoJoLuv5UW2/rE0snh/gHsaKbFly4GvxfWB6Bx78zK8ru
	VaTQwq7arGES0MXkC+05EQXNilcz0KJ8fCXH07ldqGtnqtKnjjWCwoemn9HUI6bI0dB+
	Aa5w2GLZxPSr+NvoPwOm6Fv/lbnMTdeKJT+1osmqgx3RmsPDBTdjb9tNM4RMeY3T4uKJ
	MSyQ==
X-Gm-Message-State: AJcUukeML9H+NquDw+lOmpcMUrOtGbDMG0w8bRQtm7cufpw0rLeo/R8J
	+TJobuuevCNea0uKNHX9qwXE8hd2
X-Google-Smtp-Source: ALg8bN4es7pncgnjjSYvDNUxw/ttJ/i7B7t8YDdUo8vh09SeWFmE26LbhmAFiUy34ZtTp8buQGJRhQ==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr26707951wmi.24.1548884120088; 
	Wed, 30 Jan 2019 13:35:20 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F017D32603632896313B27F.dip0.t-ipconnect.de.
	[2003:f0:7f01:7d32:6036:3289:6313:b27f])
	by smtp.gmail.com with ESMTPSA id
	z14sm1418054wrm.48.2019.01.30.13.35.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 13:35:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:35:09 +0100
Message-Id: <20190130213510.18227-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libgit2: Fix install for multilib
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
X-List-Received-Date: Wed, 30 Jan 2019 21:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: libgit2-0.27.4-r0 do_package: QA Issue: libgit2: Files/directories were installed but not shipped in any package:
|   /usr/lib/libgit2.so.0.27.5
|   /usr/lib/libgit2.so.27
|   /usr/lib/libgit2.so
|   /usr/lib/pkgconfig
|   /usr/lib/pkgconfig/libgit2.pc
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

+ reduce 8 spaces by 4

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
index e7f768892..816ae5e2e 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.4.bb
@@ -14,11 +14,12 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE = "\
-        -DTHREADSAFE=ON \
-        -DBUILD_CLAR=OFF \
-        -DSHA1_TYPE="builtin" \
-        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
-        -DBUILD_EXAMPLES=OFF \
+    -DTHREADSAFE=ON \
+    -DBUILD_CLAR=OFF \
+    -DSHA1_TYPE="builtin" \
+    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DBUILD_EXAMPLES=OFF \
+    -DLIB_INSTALL_DIR=${libdir} \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


