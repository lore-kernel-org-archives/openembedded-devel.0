Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D0E6371AD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 09:38:07 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j18so111294600ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8dagH9cL0FMA33nsCSVq0I2XEj4Ag32uNCJQbn7pdfc=;
	b=CRMy/kQlRAF3dTJQWg7iwnLQs3xa/AWsiJ6M8VhQFbALbb/rKBeceFf73+a49M1IZh
	OjFSLTTZNEw7p3YUCTf+Ixk55gnRVAADNG0PxAUkVzuq7MwIwKCunLUUg6cdPfoCdlkX
	DuHrrsffzlLyOjMnO2PvZN8DIP0+p+7BlDpQ+C8snuhJFBJJH5UFGzkST9nQNcv+wYfb
	BZSqoFLEsFSYCncG/mVX3T+ravqQOhyXbxYoHDk4yEkt5F//4KeLvgT1sELyYK3uggba
	wbRpCxNytU3DtEdwCghU1l9hKFVifLTyxyqrU8cVwuuiFJTa3Jx6L5o2Tnlgh7wrTwH+
	KHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8dagH9cL0FMA33nsCSVq0I2XEj4Ag32uNCJQbn7pdfc=;
	b=eIHUcIaTdiBZX7e7lf0BCGRZ6CvcE+u7CsH1+PJPjExYTx7O55gUBdrlQmq4OmxyL+
	GrwO4Yy1jbQRWvaS6e1LsV3GJqb4amsBruIiTRiUT3R9jlrIfF76W8nkBr/M5u1PY346
	JzdGXtj/Q3kuQrc63jgifnG2H+7hbQr5MTmvPfLnn+iyZFnU/zgllPuHxqXsTanPUxp/
	maGQjEZnTEL7haxCVztuB1cJ06TM025CVC4lNZBZ1Rq6gWFBM3tom1DwhzwVktbzyo00
	C+GalPrrpCiLHG5auzrf87IvYjkgn2bUpaNkmTfO5Vnj9Iz8h6dQSmaEuasUjPXLe7NR
	CCTQ==
X-Gm-Message-State: AMke39m00bI8+WwhoWFXw0YLEpPkuUPgadhkr1yRGBccWYdKW98phXTSwwgHSZdsRzPFd9tc
X-Received: by 10.107.15.104 with SMTP id x101mr7367265ioi.225.1486546687915; 
	Wed, 08 Feb 2017 01:38:07 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DEB3.dip0.t-ipconnect.de.
	[93.232.222.179]) by smtp.gmail.com with ESMTPSA id
	x67sm11039035iod.22.2017.02.08.01.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 01:38:06 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 10:37:41 +0100
Message-Id: <dd0494206e2ad08f5b9e969c94da66fd10c51e9c.1486546542.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 4/4] cryptsetup: enable native compilation
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
X-List-Received-Date: Wed, 08 Feb 2017 09:38:08 -0000

Useful for setting up dm-verity during a build.

"native-sdk" gets added just in case that this may also be used in an
SDK.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
index d560625..38470ac 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
@@ -32,3 +32,5 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
 "
 
 EXTRA_OECONF = "--enable-static"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

