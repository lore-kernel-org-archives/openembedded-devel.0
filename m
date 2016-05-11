Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF17E605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 22:22:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e201so12185676wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Njnjia6bbE+nTnrZ7cMRYfG+UTneAhnT8jxBdlnpzbY=;
	b=nJVfYS0C/OrjHLENg3EG7GgVzNPj0ei4sWua4tJBW5T5a9o2WtsHSeqZdHaMYfWi8r
	W/cNAM6+WcRJ2oLvTvUTQnmZ3Kd3ncrALDumcQdTTh2XnvVuUI2XCmwe0LJi60/ml1yN
	UdC4vpvW+uX/36IQNB6ppGqw2ife+Uncuc9UO2v93uDp92b7ve9SORsyB+RY3iscYIjn
	NSbm1sgRH7FY5tdzw0LF3PYhfGPJwhictiCO1GcTmdh2lmutVgcHuABVeJEFcLnGOoz8
	sVONubIIUVgLG3NYG6G+pKxQE9UnIm4nn/OKobmBpRT+dlpSvVmURGfR6RKiukSCnPfi
	FLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Njnjia6bbE+nTnrZ7cMRYfG+UTneAhnT8jxBdlnpzbY=;
	b=g5mKRbOOjEeZ2E+A508EfNwaBSV9WMHF3QwW2qYBOzOCKaTWRgKAJzrRr/D47LpcPO
	KDuVy3+LeXHHJ68uHN98c++sJwpciIaaw4Xm6b0yoxsSA2+EjpX19sgMXG47YjXt5kxh
	dt2+zoPTTZs4if1aoiH4nlMU2n91iCuYb1Io+qLA+smtGJkwkqqqt1G/H9tLdrSsoeIk
	v8wtCy96nRumGiTlejpD7VzrycDtjkEVjEQMxFL2/wseeId3Xq1BTHhShrIyjeHIUw93
	8nhwx2ryqfHdxvr/XId7oopCS0DEgHJWsXwu8U+UvuFMgRKhViMwMTU6PSm3n9TxZAyt
	+71Q==
X-Gm-Message-State: AOPr4FX7sqG0B3nvcA53lsGZ60nJHLWAOA6BS6dhrebJO3YqUDmo+jX0cnHzkc21yuAx1g==
X-Received: by 10.28.22.65 with SMTP id 62mr2573734wmw.32.1463005365833;
	Wed, 11 May 2016 15:22:45 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host175-222-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.222.175]) by smtp.gmail.com with ESMTPSA id
	b15sm37888695wmd.1.2016.05.11.15.22.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 15:22:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2016 00:22:40 +0200
Message-Id: <1463005360-9294-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Subject: [meta-oe][PATCH] obexftp: mark as compatible with bluez5
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
X-List-Received-Date: Wed, 11 May 2016 22:22:46 -0000

Fix opie-image:
ERROR: Nothing PROVIDES 'obexftp'
ERROR: obexftp was skipped: Recipe is blacklisted: bluez5 conflicts with
 bluez4 and bluez5 is selected in DISTRO_FEATURES

Somehow on 2015-05-11 obex* had been blacklisted and on the same day Dmitry
sent the patches #93471 and #93473.
Openobex was then fixed (bluez 4 vs. 5 ) with commit id
3d6d36d24b9d8baa92ecd2a5a7657b56f00383b0.

Originally
Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
index fcd447c..b6bdfb7 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb
@@ -4,9 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS += "openobex"
 
-# Depends on openobex
-PNBLACKLIST[obexftp] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
-
 SRC_URI = "http://sourceforge.net/projects/openobex/files/obexftp/${PV}/obexftp-${PV}.tar.bz2 \
            file://Remove_some_printf_in_obexftpd.patch "
 
-- 
1.9.1


