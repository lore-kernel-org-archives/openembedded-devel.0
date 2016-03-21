Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C6BCF62135
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:31:35 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l68so115869673wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2zybOzPEin+zdeS5d5fByzbU/MUsckgOgfLxDYYSZHg=;
	b=dFwQpti9c74L7H23cjtlKNTCdDCMVaa6YhtYlWZ0UsffczidGg5FvaiFFj97qrmE94
	7rRq7J7ftyIEXcHOWzjjtdKEuKSmDII9G9mGDNdLYfoUYyhRdWPSNoOY+DstntjNw33E
	Ec53LajRYQGszrnl2+v1JKAv7DYSYYOQQp9S56D/6VpBPZifPgRzru/XJUSxOtV8ceEN
	01mydyiXcrQIQOB+WLumsKcUgCYxd5hN++NTN7QaNVNEypBhUV/vl1A6i1SCL0gdpwZG
	FzDjlP5jxKXI/2z7/mQI4X8bGc85TQuKzoc3DMfuyMtMpX6e/uB7PwYQJrg9b4PW1t0y
	rG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2zybOzPEin+zdeS5d5fByzbU/MUsckgOgfLxDYYSZHg=;
	b=CzEGqg6P4PFFMRHiFvSis2fLV2iw6g162grS13nQ7v4goUI6J2Ro+FOxlFAMVybieA
	NLz69RXAkJRm4wRyIPhSMD5H+A3CnazYW/i6RUaT3JrmDdDSsn9G7N3wOCI+hFFUog/8
	30u0EMhBGUc4ktZ6F7HBw8IQXrwt9o++cbxbJieMMlf1lpUof6gaN5eCKBOsyD/yDED5
	lQVubDdaj6GJAHdYUERGkWvpOePUZ/BhK1TeSGLtGNKVlLXkNeLplZ1xAPeiulQF+aJJ
	eRZbNB64OAEbEXwOniRMI0CwL9EtQFmHviQSSSWhRLXPPUdjYh+0/RwG56QKMH1CenfY
	vM0w==
X-Gm-Message-State: AD7BkJKTHWIcvZKO0CIuHZbMqzMqfa24IBMc9hDJHW0Fql5lKYSUfQ9GJ/5FZ6+ZcA6XRw==
X-Received: by 10.194.242.202 with SMTP id ws10mr29495383wjc.3.1458556295589; 
	Mon, 21 Mar 2016 03:31:35 -0700 (PDT)
Received: from neopili.newtec.com ([81.27.221.125])
	by smtp.gmail.com with ESMTPSA id
	j18sm11833780wmd.2.2016.03.21.03.31.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Mar 2016 03:31:34 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 11:31:36 +0100
Message-Id: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Mon, 21 Mar 2016 10:31:36 -0000

opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
libgphotoport, but it isn't a build dependency, missing libgphoto2 in
DEPENDS or PACKAGECONFIG? [build-deps]
opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
libgphoto2, but it isn't a build dependency, missing libgphoto2 in
DEPENDS or PACKAGECONFIG? [build-deps]
opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-dnn rdepends on protobuf,
but it isn't a build dependency, missing protobuf in DEPENDS or
PACKAGECONFIG? [build-deps]

Credit-to: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 87338cad4a4b..e9e85fe2af0a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp libgphoto2 protobuf"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
-- 
2.7.0


