Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B1961727E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:23 +0000 (UTC)
Received: by wgen6 with SMTP id n6so128253104wge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2bfRhyGUYy2OQIb6LUSNlaIyv8sFan/dpXnIr2SeP8U=;
	b=XLiBOhewDTfamKuq8knbGbC2fXuocHtgx4v73kzLwP5I+crnMfoAZ11FBFALjkk5SO
	mU+6eXTWKHzMQCA2RanoPZPyAd1pD6GuLQ3JzMkTHmqHVFkCynz/bNJPdu4p/7GZ+ju/
	uSXKClRJTNral9MRcefLki9biTwJ5l7hfNrvfJhiNsEDBTgQiJp0PAClJYmpg8kf6bi7
	sKOVCWM+lUrGF9UFeX+120dk1xIoZTNP25/0AgV2HJ6LvKa5GcIqplWvsVaviZjKMJBC
	s29/YfaDz8jmBJqymhMwK9m+GsvTtXVIl2PZw5osVqQMA/vhQnjcHwA15XjKLNx1jQea
	sn1g==
X-Received: by 10.194.77.44 with SMTP id p12mr26111447wjw.1.1430165604645;
	Mon, 27 Apr 2015 13:13:24 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:24 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:13:04 +0200
Message-Id: <1430165584-5634-10-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 09/10] java-test-image: remove busybox-hwclock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 20:13:26 -0000

busybox-hwclock fails installing for me and I don't see the point for leaving
it in the image. So I removed it.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-images/images/java-test-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-images/images/java-test-image.bb b/recipes-images/images/java-test-image.bb
index eb9f253..22c7bdf 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -5,7 +5,7 @@ inherit core-image
 IMAGE_LINGUAS = " "
 
 
-IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd busybox-hwclock \
+IMAGE_INSTALL = "busybox modutils-initscripts initscripts opkg udev sysvinit netbase base-files base-passwd \
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
                  openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm openjdk-7-vm-cacao \
                  openjdk-6-jre openjdk-6-vm-zero openjdk-6-vm-jamvm openjdk-6-vm-cacao \
-- 
1.9.1


