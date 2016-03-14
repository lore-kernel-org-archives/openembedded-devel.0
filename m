Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3D54F72DC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:13:42 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id x1so235904601lbj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Gcag06ZK1/i2IV4iQ3fD6Nbzp5/eUdBbUEmo2sJuxI=;
	b=gHWjhP0qO2/cRogIXZV92xJme7+ohWXMoQ9GpLhaoAOu5FrmGrOlM1uR+bMt3Lilbe
	5gUvRsL2GIuUReVdd2z4jGl1V5B9fbeUu4E+/vJadduJVPxkOrsyBBx4wqtWcHDTmwRH
	ydVbeVN4WvhYiiPryMhFIbpj7uk4inyEflYL40fNBlH4zKfsBe/vPpApdgjtEJlXDl1S
	h3lAHcXdskMxdH82+w6yzPmUCxuu3p++a9yHsnTgMIRXvCKrnVqeWGaE87Iv/SaPbUmw
	04xbuZqdHCtgp9lwsvTKxD6QnQqUC4tlx+RCzD9paXoaIe5RkucQNfpU2KqzOW6uOf1E
	7nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Gcag06ZK1/i2IV4iQ3fD6Nbzp5/eUdBbUEmo2sJuxI=;
	b=FuVXmZEIeW9KYU7NjKFLHEMhOTajdtNpINMl6/fab3S5cGMMKhyHXR4bAcsvqFPIlh
	v35hVBpxmdVNG4Jk0xrrmxWdnJFhjgRi/fl1/USc+e2emWenIsb3x+8GWQQakefbdwYI
	kvBqbyneXA+bHs9a+dMKt2/RUdS+7POvfr8XkeTcJbzlo10mFRFhMDNQOZOiqrmV7Gcd
	tM2SHBl5qlVlbX/kbCl+7Qo0kfdBsRYaAhaQLCGRSqymahD4yLPBDNqhuLzaoTZT8fyH
	T0VrWxuLMd2cPuYsTQLfUfYlnnubJaqfq2dhO0ITMEOg//a5EJnzhuH7wit8nAbWloCT
	pGhg==
X-Gm-Message-State: AD7BkJLu3fkCGeoJnWdgTRjTi7+MAZOOvYd9zBPOt3u9i0DjaLDwYliVGJxYEXfcYRpFZg==
X-Received: by 10.25.23.94 with SMTP id n91mr6006566lfi.3.1457957622516;
	Mon, 14 Mar 2016 05:13:42 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	un6sm3516634lbb.18.2016.03.14.05.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 05:13:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 13:13:36 +0100
Message-Id: <1457957618-32168-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 2/4] opencv: Remove blacklist
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
X-List-Received-Date: Mon, 14 Mar 2016 12:13:42 -0000

Version 3.0 builds fine with ffmpeg v3

[ 32%] Building CXX object
modules/videoio/CMakeFiles/opencv_videoio.dir/src/cap_ffmpeg.cpp.o
DEBUG: Shell function do_compile finished

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index f6c4ca8fac16..1a34efa7f01f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -130,7 +130,4 @@ do_install_append() {
 
     install -d ${D}${datadir}/OpenCV/samples/bin/
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
-}
-
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
+}
\ No newline at end of file
-- 
2.7.0


