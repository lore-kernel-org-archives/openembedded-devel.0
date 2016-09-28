Return-Path: <oliver.graute@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92A166079E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:41:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w84so5037367wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9my4l8PMLAdx+AvoxOSEyYz0INh5CceFm/olTBtFXcI=;
	b=kWre2Rnf8Bc+17+Lwzq5oNjVo0E2yNNM34kofmoSjtXxI6+DxMaiJZlL756YGvWXg8
	Jhc3rkMNr2RZ8Id/yPHNjAxqSOYZRxmvnEHve70jmTEWzO6ewM8NzwjkCASaru6MWpk8
	xcFt9eQ7FGiTthxps63Uj4J/g6TtyhodhHKiiAvcxJj8fxcEfda+9TYoecv8IEHYdrK8
	WwLBgHle1/Vo9t3zX19KB3XfQU12enyK6oeTsRtF1FSGIgeIELRZdozOcaAgZRErRdD0
	bcN9HclhTdE3rSvmBrZwHzca3GUf8Fwo2Hx+aepmWuyZoSzEDsSOkU3OPt8GEyroQZiV
	BFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9my4l8PMLAdx+AvoxOSEyYz0INh5CceFm/olTBtFXcI=;
	b=ehbcBwKFEnyYCRmAwyjY5JTi6amto0kJY1KDLmw/Ku6EkPrxguPEtyHYEBlu4h8BK6
	QFWaLX7EhiewEPvTcoxQrsa1myKK5VIj7PZpXqKcBF1aCoDqRNSDcNV/vvlQbVrf4JhV
	/QpvnIiWbWGhZds7XtNz9Ax0OqJ5LvJL4WyYC/e+mDt1mQ7G0VA2tndjxB9QGIgXO31Z
	G7uW6XplPXilhYaT4OQEXHWHDQEVU0e3fdFeJxKA3ENIkdxrcjBzdssPNx6tzLX3O9V4
	QBw3ndEBYN1WO3NxgNAB65TnFIBhCS8FxW/0s93DJCAVAhRmqGtC9UmuUeI69QdcF5Px
	4hhA==
X-Gm-Message-State: AA6/9RmxKBP3m6YF3G1rDjZk9gJdvvf/KW4tqvUARZB7Uw7JujZCZH+HI5dj7dW5qinN0g==
X-Received: by 10.28.95.134 with SMTP id t128mr6736376wmb.99.1475055663963;
	Wed, 28 Sep 2016 02:41:03 -0700 (PDT)
Received: from localhost (x55b137ed.dyn.telefonica.de. [85.177.55.237])
	by smtp.gmail.com with ESMTPSA id s9sm7391363wjh.16.2016.09.28.02.41.02
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 28 Sep 2016 02:41:03 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@neuhaus.de>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Wed, 28 Sep 2016 11:40:12 +0200
Message-Id: <1475055612-22443-1-git-send-email-oliver.graute@neuhaus.de>
X-Mailer: git-send-email 1.9.1
Cc: Oliver Graute <oliver.graute@neuhaus.de>
Subject: [meta-networking][PATCHv1] nfacct: added nfacct recipe to meta-networking
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
X-List-Received-Date: Wed, 28 Sep 2016 09:41:06 -0000

this patch adds nfacct to meta-networking
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
new file mode 100644
index 0000000..d92f7c0
--- /dev/null
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "nfacct is the command line tool to create/retrieve/delete accounting objects"
+HOMEPAGE = "http://netfilter.org/projects/nfacct/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRC_URI = "ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2"
+
+SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
+SRC_URI[sha256sum] = "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac465785de5655fbd69"
+DEPENDS = "libnfnetlink libmnl libnetfilter-acct"
+
+EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
+
+S = "${WORKDIR}/nfacct-${PV}"
+
+inherit autotools pkgconfig
+
-- 
1.9.1


