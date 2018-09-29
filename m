Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 460DE799B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:16:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j8-v6so6428539pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=VCGzPq+sXzz8G9DVh5qwqpnX28upK01v3VtqN8P4acI=;
	b=to/6Zj++zVrHef6yBu/hdZbljBKCeBS9fPRactqGxzbmDBI1MuXyonqgXhGrsUagAa
	5Ip1eqXhAJd/aY0jbYUHCcWmyzf+XwXR7dXBXbyIj48+hkOrw7v3M+vow95LWhQTZneK
	ZHrtoogHhWJ4KijkBlZAJ2S9EjVjkaXRmyubqG/N7P2UvmW4rrfHGFphZaTETc2OMsrV
	Ce3s0BdDO3as48+5F4qb4Odjb5qFBH8mHlHjEqz7ik4a53tMxON+ESfEwPg1x8Z7d9eI
	UFwn0b1K5txT4kScBzS/Y/wXm1I8gi3RFW/qdDpJCT8RydIMZ7hvyu419IfmH2+aSlnl
	eHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VCGzPq+sXzz8G9DVh5qwqpnX28upK01v3VtqN8P4acI=;
	b=WeZg83b9dob3A2aT8nZOLmcWAa+S0jhdv2jqHG+d45Vqn1sbQdOwCBJrLPUvui4hqc
	UblEFKnCr1eSqMrlj8Zz2e7oqP31r9FQ+jhuDyHXe8PowuQthufluOqUcZ1lGTlo4+rt
	MrLm7hcnXvKZYIVXXfr6Ca8kE0M7f2eGnkHdvc82q6fsfpdWDYm/X+qaxwL1ttjxqNWZ
	0jxaBte/ZLXrbuSnbo9l71pTCrxDctDzMb3hWus7kQ9qzLoNlD3e+zQfa5wvv19SMsZE
	ZqVW9fKDAHO6wamw0Bjd0lDllWqYFBfwBqEYt9lDRTz791f+SnlTqGtwuxSQAD+NfecQ
	k6UA==
X-Gm-Message-State: ABuFfoh7TZMeOt+Ii1Y/0f9a0AhG6QtRI19V+TgTaDTMZWrVRVAjasdG
	SnKB3JL65u6Gwc0PbLk4dy0=
X-Google-Smtp-Source: ACcGV60QfGOYus6qDiXWmhaFh+SygRiDK4nEVCtMVi4/KJnm2VUMsELGhV5PGY3UTNiMnRt6+kKqJQ==
X-Received: by 2002:a63:d0e:: with SMTP id
	c14-v6mr3733803pgl.281.1538244994457; 
	Sat, 29 Sep 2018 11:16:34 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	o20-v6sm17445579pfj.35.2018.09.29.11.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 11:16:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 11:16:32 -0700
Message-Id: <20180929181632.22446-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] libldb: fix yocto-check-layer
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
X-List-Received-Date: Sat, 29 Sep 2018 18:16:33 -0000

ERROR: Nothing RPROVIDES 'samba' (but /home/akuster/oss/maint/meta-openembedded/meta-networking/recipes-support/libldb/libldb_1.4.1.bb RDEPENDS on or otherwise requires it)
samba was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)

add ditrocheck for pam in libldb

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index 99e62f66b..3c7e5455e 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -35,7 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
 SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
 SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
 
-inherit waf-samba
+inherit waf-samba distro_features_check
+REQUIRED_DISTRO_FEATURES = "pam"
 
 S = "${WORKDIR}/ldb-${PV}"
 
-- 
2.17.1


