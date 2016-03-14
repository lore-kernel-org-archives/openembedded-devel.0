Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D17973174
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:13:43 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id cj11so5312365lbd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gxH0Hc0YN1jUG4kb2kSibAUovA+pzSLYi3othKpNvkw=;
	b=ExXg/l8y3UEx0qZCrfoa3ImZCoMlec+bA1oFv42dmSxhdQrJZyzY6e7jbYYCV2fpKw
	/BmK5FQ/OliMi51bZ4ZiPo5rAvLT/F2kd0vAE4HD4kl9zyBm98lc7g1V51jqJw829SGZ
	ql9Wtw3jEORPZEMDQuPMJP51NP2C0yfufqARISj7UffCijvoVSv4sz2ISbIUAXRYkJjF
	xDC1Nv7ZB++0qyUfrCYTKowiImjYeLQJe1Zqb3GmCwTFjQ8MD3t/vSkVkifEtZlXEbLx
	PdAxMk4xDlMxxYfmhn3iOjPsLCOMW5G80MZfaYb8Z4OUiIirtpzqqsjK25l2ikGerWRy
	pmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gxH0Hc0YN1jUG4kb2kSibAUovA+pzSLYi3othKpNvkw=;
	b=ea1BkH3xq8AzMJgfUoUJxsiGJXHwVf5O7Pzjm6D/NVV5kxgrowOILu9kr77FYmityi
	qEVp5Zf3hJwuiZ4Q5viO9l9yE3CFUvHH+mg0R3dn4ufUdPyQXcq7dLts/F4nvWg+toNn
	QenV+erVfbTxF7VDDr8aF055KKxqpdIIOvzf9VWLEVzcalNmm7VuqIBihBgw15wDCVgM
	I9vqVSlJ0RwC+hAJtEp2Atb1jCvXuUVYJNBDWh5wo10LzC7aSrnjr3Vpy+vha2Khn3J6
	9hpXDW5NlRo9IB+e3XVfJdoGMalPd42Fa45+DHAFGh4oxMeENgHRpLNBahP0INDbNHmu
	5jAQ==
X-Gm-Message-State: AD7BkJL+2woC5i6BDR+VAdMynOT0hpmVVv+Auz3bhNWq5fG6TZIije7tV/Vk65/8ow5LzQ==
X-Received: by 10.25.79.16 with SMTP id d16mr6153320lfb.73.1457957623988;
	Mon, 14 Mar 2016 05:13:43 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	un6sm3516634lbb.18.2016.03.14.05.13.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 05:13:42 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 13:13:37 +0100
Message-Id: <1457957618-32168-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 3/4] opencv: Update to version 3.1
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
X-List-Received-Date: Mon, 14 Mar 2016 12:13:44 -0000

The first major update in 3.0 release series

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (97%)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
similarity index 97%
rename from meta-oe/recipes-support/opencv/opencv_3.0.bb
rename to meta-oe/recipes-support/opencv/opencv_3.1.bb
index 1a34efa7f01f..9fd3b12e3631 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,15 +10,15 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
-SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
 	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
 
-PV = "3.0+git${SRCPV}"
+PV = "3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.0


