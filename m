Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 377C176710
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:43 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id g184so15797970lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A6m8H0Z+kypsMV1YKDsHvn0vsqyDW63Crl+fzCbdFKs=;
	b=ZXHDXAZa0TnGWSWfSKqtmWpRzKVBBbQWkwqQhlTKZ2+nU1ocSqRTjQWf2ek5ZEJC1O
	EwvE78cp0tKnTWV0kKwRCyT7wA89Bxrv/PmKOjyIi1JScObw5JqaG0WJoI9D7RE8SC+B
	q8HKGMx8DL0MT9alhR2OKfmuimfWRj0oIDyP2aPJTYhmvH+yBeoBs6X8RkitHr7NJM2a
	ouop81IOxynUY2OsdZrRzsdaKVycVQEuSWRIIyC4vwKseot32ozbdXPeg64sB0k9OFYT
	TQdfOaioT4mM2rYrQHh4Cy510cLBL+YSczAhE7TIAk2yC3kfPDlZlRjOdMDN7dU1XKc0
	FvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A6m8H0Z+kypsMV1YKDsHvn0vsqyDW63Crl+fzCbdFKs=;
	b=YNppP67OS92zV0zUAcq/a1LIsXgcUasaqEtYawXDumtN66L9gpnzRqpR1ZmGU49Vdq
	HP2A7lzTYcREdIVES9m+s9aIu01ZpDNdiHF7oa1VVrAVRKzG0RBL73L0aF314IQksl2o
	58dhUX885TZGN3amZpflLO5lPr+IzGStfC14q93TDTUi+pyQJb6BCj4O/HtjtmhJALYk
	55jZ2z/p1RcZzkXBV7vVz/rDHX+kx1zeUr6PdqmUj34QQyYdo++VdnqnAQrBvFlstsLr
	aco4CefuUVXrAiBa94nHyAzj9Bvs1ZbOCOSrWhVno1p6pMnj3gCNSjn7euWiTs2GXO2Q
	L61w==
X-Gm-Message-State: AD7BkJL1XCTGbwqc1swDdOG6asmaH7EW+WFe3gNFSZfk3uqUg6pJyenK8Va/8bTwQYUMsg==
X-Received: by 10.25.209.73 with SMTP id i70mr563488lfg.0.1459546604274;
	Fri, 01 Apr 2016 14:36:44 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:43 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:30 +0200
Message-Id: <1459546590-9513-8-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 7/7] opencv: Remove blacklist
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:44 -0000

Opencv 3.1 builds fine with ffmpeg.

ricardo@neopili:~/curro/qt5022/oe/openembedded-core/build$ bitbake
opencv
Loading cache: 100%
|############################################################################|
ETA:  00:00:00
Loaded 2018 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.29.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-testing"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:300f858ba07c938427ccd05a3d7220027a03d461"
meta-oe           = "master:29462f7161b346dbc2ea00830da869a0a1c35fb9"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1242 tasks of which 1228 didn't need to
be rerun and all succeeded.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index b89fbbb214f6..3501db6d16ab 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -146,5 +146,3 @@ do_install_append() {
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
 
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.8.0.rc3


