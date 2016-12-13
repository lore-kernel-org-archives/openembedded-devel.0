Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD63A71E14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:20 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id o20so212547lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=A4XMydRdPgO0ryyIgxHlJBeOCJLVl3xNI//z1FA0gW8=;
	b=OQN/LkvcI9wsEk1aZMpo1Er/1OQe49/cqcugj8D48gBWCYSI6amkQ8yloaxy/LeEI1
	RXhNASZkJY7NO1ppyhsUiDoSMahiXoc4bTiJIUVbaULQ3y0k01u7AdVI2ivk+OPHFwUM
	pWUbd7YnyeHAsrObz/6b6T/wjwXpHc/Ag9o6rZ8FmZ3E1whn2IodoBRhxsDZ1tSoeqBb
	ymE5uD4V7wf/q2H7r1JbUOe4kxJYY9Yq1F9LGJq3nsSAQlk1DDhtldkhJ3GwUA8GEuQo
	j+i9mavmjdAwQqDW8DZtkrueu48pUgP8NopGsi9ES95rQFzYQh2Nz15aSe8eI1XrymrK
	p0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A4XMydRdPgO0ryyIgxHlJBeOCJLVl3xNI//z1FA0gW8=;
	b=SPtyr38He/CwYG4JFTnxM7tKxnfAhkSFBauvUcBGi9mo45yp4XgrfjcaNmdSFcbtNh
	6YInZREoqnEKiPZOJLIyuCHhhLIndYNz7fA50joMbuelU3TtdI6+yEyrfGdNTPbcWrsk
	UMKTR12OwhZ9sdTMjWchOHzaLLd/HbkBusoOznGms07MVwF3lHfD2WkyCdU5LBKQ+QI6
	BQhquvm9uBw7wXX221NhfDtzFhku9dvC4X9u8TZudAAnB/lIBEaYuadN5H5WqQjSzEco
	yVu6dNPKsgw2N6kcdv9VAZTjiNBAQgMMFuCaQs5B56PMC8qeMEdW6dgShO8qu9NpqIpf
	M6Dw==
X-Gm-Message-State: AKaTC00uMCQYXjC5dzVwc7TFGONPH3BTw6kNOfhMA3JFskxmPhQFk00Ti0hlNYCTEKHgIw==
X-Received: by 10.46.71.15 with SMTP id u15mr39819546lja.74.1481672781322;
	Tue, 13 Dec 2016 15:46:21 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:20 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:11 +0100
Message-Id: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH v2 1/8] opencv: Update repository location
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:20 -0000

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


