Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 018C777F38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:33 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id i127so474237wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+3vnObnOv3B2rhDlPy9iAzyaZ1he3nzdm01kn597LqI=;
	b=ho8YQmZHUlS3V0LjUEtmZ1s5YQjpObVbv6Ba3QTY0ZJTiCSQ5LXCxu/V0PDU3Gl7pl
	WgKJAA8mfYUh7VXHiKcCaZnXpNhF7jb/sz7tXtBu2tpEfplQqkiA7fhfxfjjUnINY896
	rb4EWeSFZjxfzuF4YkdNV55CKkRW/yz5SBV6aN9xcWQE1UWAy95tMsWPoRCbBUFh2rRd
	0Tdq7CIYMp/76BLZgyliSZdHz0YjvRGA8VVtxvEKgEFO2dWWTwNb9Wb4E2xmz6m3F5Mz
	4It3U3btRHGvvdptawuvxiiOzl74mJECspzOvCT6ZjOtlVpBhqtwr7LqDlJY2UpTJJWC
	eH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+3vnObnOv3B2rhDlPy9iAzyaZ1he3nzdm01kn597LqI=;
	b=ng4L2Dqp6/9n33iX2u/XqlZzOZh5KcI4Fue4EjGMw1UcNmJGacc9E6alpaUW4uhgIk
	drT6tbKl4Icz6ZfcuS5ZMunBLX0ecwCus7ceJJXEHdp2lyr7FU22a1vranG+oA2jCABW
	b9v3/IU7J3GduSAN0PgGA3VHvZUSQFhHdkR2ehXYVyLtMb0Z1vCn2pJlXef7c3OO9yJ6
	aHjKR7g9U8CLXMpD78+76uENTuWueoQE9BTxUvfj1SeKvlB+w1H/JhUjDEpmaBv9L1lT
	QdC1cHCM4bxTIc0I1U1TiwfJyDknvauXubPyTzEMMoDxUG9GLTfyuf+ZeRRFTDnXDXPR
	rosg==
X-Gm-Message-State: AKS2vOzXfB3E3rWYQOFx1JxJKWJRfXNAzBs0Z56aMwaipVvb7axASaZN
	z/s+C4fLeFJ9J8538Qo=
X-Received: by 10.28.45.133 with SMTP id t127mr103wmt.107.1498489894392;
	Mon, 26 Jun 2017 08:11:34 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:17 +0100
Message-Id: <20170626151117.6221-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 8/8] meson: set native tool flag variables
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:34 -0000

As well as setting CC/CXX, export CFLAGS/CXXFLAGS and so on.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index b5b2b3b7e..7eeff4210 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -10,9 +10,13 @@ do_configure[cleandirs] = "${B}"
 MESON_SOURCEPATH = "${S}"
 
 # These variables in the environment override the *native* tools, not the cross.
+export CPPFLAGS = "${BUILD_CPPFLAGS}"
 export CC = "${BUILD_CC}"
+export CFLAGS = "${BUILD_CFLAGS}"
 export CXX = "${BUILD_CXX}"
+export CXXFLAGS = "${BUILD_CXXFLAGS}"
 export LD = "${BUILD_LD}"
+export LDFLAGS = "${BUILD_LDFLAGS}"
 export AR = "${BUILD_AR}"
 export PKG_CONFIG = "pkg-config-native"
 
-- 
2.11.0


