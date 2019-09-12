Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDEF7E502
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:11:43 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id r134so20567905lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jlthlWUcbPtOPncpqvPJcslCldaMPQhfov9uiudWUzg=;
	b=aI8d2G8ovUTTR42viXtDmakwe10NserW1yGncKv997FjxXJCCmssMlim4HwMP0OolX
	P6LWTX5eEKqA6Kbc3FhJYnCaStqkJCOwPNekS8nXBnMLOhVykUYDYe8zSaei6C0BlNJV
	jaXoa6fqrhmXPiamMJsYYp9U87TEsZp3r9QKQCAa70uHhV0sUEIN5vt7GCn3BOG28my4
	Xgw0PvzCSbbD7emV0XOQJdXx+3j9a/tsmDqHd6tlv/m9RcFPvlu5GYaRL2cdZH4OiwU7
	s+Bucyj3vcj4eI202oTSdLau05z5ZmT+r1KHz8c/Jci9SOdeCfJD/4xlFOaTaEw0vfC6
	s8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jlthlWUcbPtOPncpqvPJcslCldaMPQhfov9uiudWUzg=;
	b=dg+O9cadYhcc/aoBdPyP0pyT7ASh4WbFcRu1Qa5tirABdIGbBIiCwzo8iI1oaGtd1a
	TmuN1OmVc0lFWatlGEhpgMv1tUO8vrxUnOG2DR3drmDBJJ9m3mcC9Kt38A1Y/5gMvF7q
	wtIBVvAKcMpsazwUgACAVfcuAnEw9Xg9pWYZRxu0C/OSHn63NkL7DTEhTgxTzHXGyDZS
	lIATZqyyTg/qnad6Zno9cbPOXMWdUyZfkawCw05jRobl+w5QNVpft7n+rtXsbp1ZAou7
	iOX/hY9E1vvXmVVHjgg/m0mC4hgPMyVq71ByebcybLecJlnx2ne9oBhORf4iGmMUThq8
	dIxA==
X-Gm-Message-State: APjAAAWqz1pWZ9PeekcHC98n58VvVZg3dqrM1sXU2Sxt1URJoE5JuhIh
	fMgnuovqYQIVePtsMiCAPBLhXZW/A7A=
X-Google-Smtp-Source: APXvYqwIDt308WSgRrdGMSe4GANejIJOrm4o9/AhK6IOOzwefxrKH5bZ88u5EOplp9fmRBeOg/PFnA==
X-Received: by 2002:a19:6556:: with SMTP id c22mr13710183lfj.90.1568326303708; 
	Thu, 12 Sep 2019 15:11:43 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	126sm7777996lfh.45.2019.09.12.15.11.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:11:43 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:11:41 +0200
Message-Id: <20190912221141.9609-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libuv: update to 1.32.0
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
X-List-Received-Date: Thu, 12 Sep 2019 22:11:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libuv/{libuv_1.27.0.bb => libuv_1.32.0.bb}               | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.27.0.bb => libuv_1.32.0.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb
index 6fd0339c5..c7fa3c10f 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb
@@ -4,8 +4,9 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "a4fc9a66cc35256dbc4dcd67c910174f05b6daa6"
-SRC_URI = "git://github.com/libuv/libuv"
+SRCREV = "697bea87b3a0b0e9b4e5ff86b39d1dedb70ee46d"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


