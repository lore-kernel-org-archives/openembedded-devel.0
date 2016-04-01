Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD0276F8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:39 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id c62so90149663lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rg2dclbXhZI4oChAINW+PDbFzOAz5LpbGdeWUNTlahI=;
	b=ZlIJraVwO7G0oKYFHHc0uUynkNlw+JudcV8IrbKBFzLPYeqVMhU9LD+6ZwDXP8dDJ0
	Y81kHOEzjbmCOlx8tRl51szIuvF9Uj+DtMj/Lg5g49w1bD1VuB0GSMjgvIAOqbThafzB
	2FdAxqTAqt86vTCm2YwzIZrvo1xGa8PV3j9kW+lCIkflc8cZyoN7w8gfT40tEbHP+2mF
	Kvz+oBNIUgyAwYaqHql/Ify29Aqcq6NqQCPENcIVa8EB+J3bHnZPa4B9k0JSDgTx5UL/
	oYY0W5k2kXIXndaDsB4EKLrsO1NAjJIcgFzSdeiICC7qqZR21jQfdi5trTEo6UY4qE1A
	Jtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rg2dclbXhZI4oChAINW+PDbFzOAz5LpbGdeWUNTlahI=;
	b=Y7U8VX7BTH9BE41bLScNpwr87zSZwryFkj4Pg5lctRzgB8mvaNJLUXBX1BzBibOySh
	0vSSv2fqo3abefHC9brwms8b4tlhPN0F9N9crHPg1ZoFpiRyrXMYF4ycA8zB3OOkzCH9
	Xsv95zcRu/LiXwpETobAl1voavGlZs/UadZrAJr++/0bVjj2LSdV1bll19M3eh/Wu8R8
	iLFE4uWLv+IjkzP2HSIHj2J66tktuqxYo5Jlzz3BIkaZln1ImttdOGiMMrQLJOu3z+qn
	l0oGj6L0oOr3Hdglos9v4fordc9ssPBzOVVFrLRxVf4rRNB0+cjBxY9J5iFBkaH/V8g7
	Mo5g==
X-Gm-Message-State: AD7BkJLJkO6OiCm/KU1dnKFV/gWl1Qyhc7qxKK6fBYLRXp5Nm7gDAXA3e+GxTvX/b/6Xew==
X-Received: by 10.25.156.196 with SMTP id f187mr2834206lfe.150.1459546599717; 
	Fri, 01 Apr 2016 14:36:39 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:38 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:27 +0200
Message-Id: <1459546590-9513-5-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 4/7] opencv: Add missing dependencies
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:39 -0000

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
index 6f0c83829809..de6d8d9fe345 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp libgphoto2 protobuf protobuf-native"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
-- 
2.8.0.rc3


