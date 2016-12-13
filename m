Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF5571E29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:08 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 96so1230935lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=A4XMydRdPgO0ryyIgxHlJBeOCJLVl3xNI//z1FA0gW8=;
	b=LpoWcCh+CAOLFL958WKaSooA3wKeV2aI4nOXV83gLe2DHtP9nehVw6kf2qvE/LvWEc
	TWFD7vmPQLLEXGKydtuQ3o6CSX2StXsbbZTOfyIw1h4uD5N90As5D3xfZtdPSUKad9zR
	YGoeZ/kwM57cYcR3QSF8VBuqa3xCYF4gf0eLuXmWmDo5Q5x4XC7ys+X4EpRe41Yp0UXY
	aWhhsT9Wu8hI+VdEu2IVFhTd5sWjGSB0mC9nyPfeuPcJsHz46gutxYTpajPnfmhrMUsf
	qFVN8sFJWtPW9tVI8K/MC3fnYGnqIgs74Cax1gWnAld5csXthF213of6GWtPcX3auAiX
	FSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A4XMydRdPgO0ryyIgxHlJBeOCJLVl3xNI//z1FA0gW8=;
	b=jG6xJAbXmjcXZL/WoKkhHYcrtjqOM9p4Qf5olCTJMejfzR5VEO7zl5HNMee0oty3Gt
	reksz0nm5anuFugL24VoL5YaDplO4uy0KqF1qKWrlsntwN0tus4K+jReJEL/FXtKWwTg
	a5l3WK8qs01dmjwBg0dHLbchEvDg1mKyvi4wP4Dgr/JqQr/mHWYPc+sK4HDkuHcWfwh6
	GrjYU2HP/sCwdFpjwFt2WJdOqAFmowPO1TQ8tsjrm0rw+g8zdXtFCnRpIqGo5MpeRn2i
	SCCJ7aF2fi0rqkS69ksMJXpSNur4wHB75q7TDTYOPsHZp3L2qM8b8u9L0pPhdqXiygqa
	QIvw==
X-Gm-Message-State: AKaTC005yMA79ycPaW4LFxC5Ua/MjR/0vWrP19uZA6+x6JKtoiYm6jDayoRRJZSieWfI1w==
X-Received: by 10.25.24.98 with SMTP id o95mr32032178lfi.4.1481663049616;
	Tue, 13 Dec 2016 13:04:09 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:08 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:03:57 +0100
Message-Id: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/8] opencv: Update repository location
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:09 -0000

All opencv repos are now on github.com/opencv

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index a0dd98131777..fa2fdb6e6c31 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -16,9 +16,9 @@ SRCREV_party3 = "81a676001ca8075ada498583e4166079e5744668"
 IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
 
 SRCREV_FORMAT = "opencv"
-SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-    git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
-    git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
+    git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
+    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixgcc60.patch \
     file://fixpkgconfig.patch \
-- 
2.10.2


