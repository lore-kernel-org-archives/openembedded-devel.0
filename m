Return-Path: <dev@codyps.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFDC71AE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 15:25:19 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id o1so4920477ito.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1Z6f2fwDQH93iZwIeRA4mX+qsq6uvePol2M9QL+I8/M=;
	b=WmCuF+CCBWIH8yUtSRsUOq1DcGJHy3CxIenp/PVPrGwO0N6GKF5AZJSeLK5L/8V0Cp
	QI7JEkkiLd8BhI7RgT6dnBz6ER27f0c+jckxR2gdruZxX3fjUP0HWRjzDra+BbAHtP85
	DRTViRpA2Qk+CFlARhosb4O4AzqtVgSSWg+zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Z6f2fwDQH93iZwIeRA4mX+qsq6uvePol2M9QL+I8/M=;
	b=lDAyC22jvBhRtsnTdZzDKMelETQoHAy5rIv+lR0O3j6rESh4tL3e2IUB0ZBvigKv0R
	+Xql2oEJjicWVLDQv3IxvH4d9Jeb4eVMwhJNwUKHRXQArtDl/FFmuhc4aClj/WRHxgun
	tEAwVFL/GiPXuygjs/zWbglEwIYT9er+VKzPQRDL4J88+Vi6C6S1A4bdkigjP/ZDVWA1
	KBTlgPW3ADt7x8WYUSgs/OkO5nza2eYBg+M2d1uOaxysKsmxaUYC+JLrGhs3DrSMBYTj
	NK6xoOZGycVy9Ul3WxtMDRPcH1h5DQ5/2inXKLKFnaUOSd+mM8tTo3nlmMLS0Glnfkq5
	OXpA==
X-Gm-Message-State: AKaTC020cl+Xq63RJjqZWAfmKvrhNrMJKQ4M0jCMSV3dIYy3AAqIfr0IEkrqnGw7pH1nAw==
X-Received: by 10.107.153.134 with SMTP id b128mr257351ioe.160.1479482720811; 
	Fri, 18 Nov 2016 07:25:20 -0800 (PST)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	e202sm3118847ioe.27.2016.11.18.07.25.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 07:25:20 -0800 (PST)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2016 10:25:13 -0500
Message-Id: <20161118152513.31194-1-dev@codyps.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-java][PATCH] openjdk-7: ignore the readdir_r deprecation already ignored in openjdk-8
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
X-List-Received-Date: Fri, 18 Nov 2016 15:25:19 -0000

Without this, icedtea7-native (used to bootstrap openjdk) fails to build on my
host system due to deprecation warnings being treated as errors.

I haven't observed the same issue with openjdk-7 itself, but it seems likely to
affect it as well, so I've added the -Wno-error flag there too.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++++
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index 0685729..fe18ee5 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -113,3 +113,7 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-jdk-unzip.patch \
 	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
+
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index 711f572..eba353e 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -64,3 +64,7 @@ DISTRIBUTION_PATCHES = "\
 "
 
 export DISTRIBUTION_PATCHES
+
+# readdir_r was deprecated in glibc-2.24. Ignore the error for now
+# NOTE: When updating the recipe, please check if this is still needed
+CFLAGS_append = " -Wno-error=deprecated-declarations"
-- 
2.10.2


