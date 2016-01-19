Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9176AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 14:46:27 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 123so94484435wmz.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 06:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GGoLqATXynNKN3B9T2+cyHQWd0Bvy/JLBVADkpaLb3U=;
	b=nVknGrjUYQuZl/4rpz5a1XYHV+WQXuDvnnECh9rNKEU1/604gYdi+MQ5+pIqLWDX2l
	wC4PAyH5FJt+Qdf4JuKUoPPk/j1+K8OSm0VLUwvomiaiMdn+hki51veQapFTpLBsjN60
	xxEndceTPBIl8HUIKcstbtYdvxNz44Fvq2gkRKKUtcOs4sKJ+FF0zRnqt2QqN6vqkdPO
	63KfVmQxufds/FCEXSJTzP8RFXkWccdSXg6GpQaYfUYNJSPKRIi5ZSu0cr38zSN21Gz/
	EpoS6kyPaTV+LQmI2ATAWAgrwZZiVOu8GkJOKjxuS4LCoCahDUK2uLehP3+MxsAnnZAY
	jlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GGoLqATXynNKN3B9T2+cyHQWd0Bvy/JLBVADkpaLb3U=;
	b=hThTWlqAvPMDyfxZaINQIIB9SDHOeVgVchkbrDDtpGGn1nnoA6QxsXzHpKqy6hdpiB
	DDRfkoe9NvAds4/vBCEp18qu/xc881Ikjdt0b5D23/Wd7GgD8qObaia/Tlzo0uXWuWUW
	Dhd5vXKzxsZhGozF4ofnYPAb9QBkBhxTROfZYLEQv3gIvDYpWAsPqwjAC4znf4Cg+4Sx
	QYxUIBA4RFCNkLjgPtzjE7jcMJeoMmid3xSY5uRTF3bdLIFqhrW4zkCQa/q5xqHdM6/h
	yFnDFH0cDyYhp90n5H9B4Uc5zoqBkzy8jg62f1w2oLVq2DtOivKo71J3fanHPIKBdcsF
	QVpQ==
X-Gm-Message-State: AG10YOStRti7mLHuUdK7aFl/FIHRkg6wYnRpNVmtwhX8ouiywlB9tv7Lueg4vTOmqHIF7g==
X-Received: by 10.28.101.131 with SMTP id z125mr18746674wmb.60.1453214788526; 
	Tue, 19 Jan 2016 06:46:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lh1sm28665562wjb.20.2016.01.19.06.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 06:46:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2016 15:47:49 +0100
Message-Id: <1453214869-23504-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe] telepathy-glib: update python-native-runtime dependency
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
X-List-Received-Date: Tue, 19 Jan 2016 14:46:30 -0000

* it was renamed in oe-core with:
  commit 8a474057d86b3ebf6271656d6b9adf384ea9ad6d
  Author: Ed Bartosh <ed.bartosh@linux.intel.com>
  Date:   Wed Jan 13 10:03:04 2016 +0200

    bitbake.conf: rename python-native-runtime

    The code in native.bbclass adds -native suffix to the package
    names that don't have it.

    Renamed python-native-runtime -> hostpython-runtime-native to avoid
    mangling it and to conform with the naming convetion for native
    packages.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
index 6b8c20c..e6938f1 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Telepathy Framework glib-base helper library"
 DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
+DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt-native"
 LICENSE = "LGPLv2.1+"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-- 
2.7.0


