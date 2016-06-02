Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD70077422
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 12:50:38 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h68so5021594lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UGPc5HYCVrxG06zw21e0oAlP4X18GS4+yMhC73LUjmo=;
	b=m7Br336UFP8HSzEBVNuYis5vp0JEgCxcynw3wrznroYV44W1L7xn5fV4TquBL4RNgw
	3YaXWkzAKkJ8EA/C1sXseIB7Kuqs17ZrZxWaMC3z+ryEXQh5/9u48io/ZzZHOUXku2mc
	ozTKLViqsHCFwAPo+nQOx5gUZRqlu3kSxnzkQ3WaFu7Evcm/ZF6YcbnLQwYsZW/LU9Cs
	F0JEMOyosz1APo62F64AUzAf+NYFkhwRZdsn6Z4d/X9S04xjxkhIEN70QuJhrZJohZVB
	gYf+uJhcOPK7KtZ9vaJACjQ08M+f4I3TE2u3/Tpe/5o5dWB6IfJhNxlc5aF2fKFxO9l8
	lkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UGPc5HYCVrxG06zw21e0oAlP4X18GS4+yMhC73LUjmo=;
	b=NUtUElQMazBUdcw71jYuUNMH6U7vpl7UXmn1D8NUO0vntFaJtFXwXF7MnDn46H1XrT
	JA2IDJIvCmf9XPQ8cf5ibVhuuDdKvamqoLKHpgvyrZJKXar+oTSHf3ZQVc1NE57gC6sw
	bxBgFekhRqAFo51ie5cmy1275ctNLs9lKUAw1KjPpaV1DrK+1HzxPFDzLTqEMv7ROINk
	EiAF+nMAN7ET4ZJ5HjmAwCYiX3d40rF3ou1zi9HD+islpFYklwMB8UjNbPzbBRqaIEPS
	C2yBCob+XqOk+Ms/RQXBzG+W4z0ftZkKJ2J8yCQPWJLl0Kf6aW0q8IlVMAZzJ1TmVITl
	/Wkw==
X-Gm-Message-State: ALyK8tJPbDT2+5CBw9aGPKbikRGD8Ri9V0qK+59WcZhRsdGp0/LIHLpaAsel3sR6oU1DSA==
X-Received: by 10.46.9.83 with SMTP id 80mr3802589ljj.6.1464871838515;
	Thu, 02 Jun 2016 05:50:38 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id z1sm36681lbl.32.2016.06.02.05.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jun 2016 05:50:37 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br,
	Martin.Jansa@gmail.com, koen@dominion.thruhere.net
Date: Thu,  2 Jun 2016 14:49:29 +0200
Message-Id: <1464871769-25990-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1464871769-25990-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1464871769-25990-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Thu, 02 Jun 2016 12:50:39 -0000

PACKAGES content order is important, because it determines the
destination of the files, when the folders overlaps.

Without this patch:

NOTE: Executing RunQueue Tasks
ERROR: QA Issue: non debug package contains .debug directory:
opencv-apps path
packages-split/opencv-apps/usr/share/OpenCV/java/.debug/libopencv_java310.so
[debug-files]
WARNING: QA Issue: opencv-apps: found library in wrong location:
/usr/share/OpenCV/java/libopencv_java310.so
opencv-apps: found library in wrong location:
/usr/share/OpenCV/java/.debug/libopencv_java310.so [libdir]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Fixes: 3132af1d1d15 ("opencv: Fix metapkg dependencies for opencv-java ... ")

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index e6480704a62c..f2614bebe4d6 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -80,8 +80,8 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
-             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)}"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
+             ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
-- 
2.8.1


