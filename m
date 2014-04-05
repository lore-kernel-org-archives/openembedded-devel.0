Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF01E6084B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Apr 2014 09:03:46 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h18so1874193igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2014 02:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZO/052j54ekNKSzubIkFnmOiWRgr/q1CQR6YOXMUoVU=;
	b=FEJGoQ9+XBAOt9mT8C+4s3I6ZH5qOcW318sAEHKNeq4TRZcL6gdYL2fq+cos5TzlpS
	9DhF3sMQvK8v/CURoIYwPvxPdD5ABVXSVZbfLbfUjAEy9MQ8r1XF1MnhmEk/M0S5FjWE
	nIRPIOm7bQiToC650l/f5PFFyD9UkmYtWRFpMtzuF/334xY7Xl/BoU+7o5sh4GjYgIQI
	pyKewBkaZSAkBn8u5Jm5hG6Eh2UDmku6PxySS4GLlxDivo1sy6256YsV0jr6Df/5qzwe
	lQXPm7w20LFWNRglBH+jro2zyQrKwSr9M30mucFOCgeMy9PviTq/hsAUH0BppqmEA05Z
	I55g==
X-Gm-Message-State: ALoCoQlWSaTUELVwtG23qvDb9Hf3ysQxXmMXqnjuHvvJ7NTVcanpNWBjIULYtusAVh86wkYMzWL7
X-Received: by 10.50.43.165 with SMTP id x5mr8542829igl.40.1396688627040;
	Sat, 05 Apr 2014 02:03:47 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id vu3sm12604446igc.6.2014.04.05.02.03.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Apr 2014 02:03:46 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Apr 2014 05:03:07 -0400
Message-Id: <1396688588-5440-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Ulf Samuelsson <ulf@emagii.com>, patches@linaro.org
Subject: [meta-xfce][PATCH] xfconf: remove unrecognized configure option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Apr 2014 09:03:48 -0000

This option was causing a QA warning:

    NOTE: QA Issue: xfconf: configure was passed unrecognised options: --with-sysroot

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index aa6ad2c..bb8c337 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -7,7 +7,6 @@ DEPENDS = "dbus-glib libxfce4util perl"
 inherit xfce
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
-EXTRA_OECONF += "--with-sysroot=yes"
 
 SRC_URI += "file://0001-Simplify-checks.patch"
 SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
-- 
1.9.0


