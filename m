Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id DC3006FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:40 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id bc4so50456787lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rg2dclbXhZI4oChAINW+PDbFzOAz5LpbGdeWUNTlahI=;
	b=zZROIjxfzSK9zyKbDAHm6IYm+dSm28IMPi5YPPtSd2gGszltNnSobXbJFoVJjaHZUp
	2UzSIFhzFpZPUxJ2xHySlcGp/GceM38YU0rRv+6gv+Y6/9Ps2/tv2AsF/o9WZjJBlRzP
	8imbwScIw5hq/70TZP0OWhh7xbiSUGf1CeGtObI46zDLukHsSbZ5pZejYT5/7QqK3FXu
	VBO7zOyOvxSK2m20t9fCmK/YRB8eOTElVFY3m22RaH4cIrdcJJx2d8wYfAQSsZ/STstr
	Hd9Gf3Ozix6FplScM+soI7p5jI79huc1fJllQ98FTtUvcXJEhP7vhW40KxmlQJPpAWQc
	TPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rg2dclbXhZI4oChAINW+PDbFzOAz5LpbGdeWUNTlahI=;
	b=QkP8SavQ8fvLoh35i2BKhji9KlEr/a00UT1aFTOZXa3236p5+aEA2OIs7hhaabRJBC
	n9CCd4tzSm4fhwn+e5oU0L8tZoh9OlhiZrUw55LAxbufz+6IXw2KvP9Y/5bB7pBnsZO1
	298Rk0409ZlPAj9x5CveJ+rVFgWZb/KOdR+ZlmicQotWymSDmprY9ZMvwhHiWPUMxH+x
	/dWOhLaqIaVmWX24xJl+Gr0mo/fOUzalcjiUBpLTfaUokWT4gjKqNipegSTiMrjHkTfq
	sIzeIgDpGQmAEaawtnvUDGa5YE7n7BbFRp2rvVMixmuBUgTMJfNpvWdHVpBYBGUSpmdM
	RjCg==
X-Gm-Message-State: AD7BkJLq03v8IHCKpo74HwSn2vldqI1HrLWs2Q8ujD26mQfvMEAgrrZl6qtdjdO/DcKlYg==
X-Received: by 10.112.141.73 with SMTP id rm9mr6234014lbb.57.1459423600612;
	Thu, 31 Mar 2016 04:26:40 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:39 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:30 +0200
Message-Id: <1459423593-4123-5-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 4/7] opencv: Add missing dependencies
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:41 -0000

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


