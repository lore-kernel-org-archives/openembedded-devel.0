Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHBAl-0001n1-KS
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Mar 2013 11:50:52 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so2147588eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=r/ag4FIbwmpvK12Qxhxgdh8dN2M5xh/w5sSgSsPrk18=;
	b=VCj1HogATY/kWCm5YBvzuCWg4YfRJUPFxNxdgpeISdST1ZA3BRDrhYVitODjKeTntu
	ARv3hzQOfBpuUthxEmtHvBEWItMrnRHXqL63OqyDUc8okbQz+urLW6+1TGr3FmjN14W1
	wfeQvlExat7O7F0TCQreIZDIPZ6eToxiTBVyD1dOfjUPf15D96iEBql4rcDctdD5alWy
	Ts9c+tU2TZ+rgL+61DThDvHKNK5QSM5pOu3d00BlKXEw1kSeyUE0nPOc5o+o8psX/rk6
	NG7nNbup5kcJTGhOVyalFlZ2i1d11OpT46by+KYaISPgy0By4/8ovGyFAR+YMYCYTmi+
	qGTQ==
X-Received: by 10.14.219.129 with SMTP id m1mr36906219eep.16.1363516433067;
	Sun, 17 Mar 2013 03:33:53 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 3sm20702150eej.6.2013.03.17.03.33.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 03:33:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Mar 2013 11:33:32 +0100
Message-Id: <1363516413-32548-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkytIueM3QpCFwsTD886mUBQX7fsgkI+gk+OUlNoBMGGAdkbSp/YLSFeQIZMWX4Luzinn8B
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/2] opencv: enable SSE1/2/3 and SSSE3 when finding '-msse3' in TARGET_CC_ARCH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 10:50:53 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/opencv/opencv_2.4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 77d75da..2114e77 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.ta
 SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
 SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/OpenCV-${PV}"
 
@@ -27,6 +27,7 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  -DWITH_V4L=ON \
                  -DWITH_GTK=ON \
                  -DCMAKE_SKIP_RPATH=ON \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
                 "
 
 inherit distutils-base pkgconfig cmake
-- 
1.8.1.4



