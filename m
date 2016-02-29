Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EB9E67713B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:10:45 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n186so41304932wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zVuNeSsOW735DvqMU2nbp8P7e7fbot++ZBxSfdKVpHw=;
	b=rCC1O1NmSsY8OfTXeS9ARAL6KXuRP/Tvp7NjABeyRO62BZ+EewFNKdJn17BfJLh+S+
	YBZE3fjGCarfJuuEBg4IRTV3Odsi4EUwXZmSURk8IuwgTHFuozz1Uvy4w8Vz3yGko1Ak
	McN7TmEvwoa8VtwOV+MvUf70ZFcT3ftAfSw3DchOM1MDbFxkBX/6XL7AjHfl+qDVJSdf
	UVYLpmOjwXp7/jH+8A8i8UtwmMnoxilUa8u7KgVMFW82H950IgZN0EdvgVgNoyw6oy0c
	36EoPGYE0XzQY8N7vujVBDgTMpfcM7O+ItXcm9EaQVdSrnWv3Wgbjq/q8/4oHFffVpKr
	fKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zVuNeSsOW735DvqMU2nbp8P7e7fbot++ZBxSfdKVpHw=;
	b=ZK1XZgzzecIKdHxvFTvudTF/pyQ1OABgVE+HUQVTaruS2vsNADCmsE9Ro9zG2w00dD
	FBOv9I6dYTj80K5NPjTgl22Lq9PNizCJe1gB/iN944k+e5oz0/HVXqt/LtpqoMo7hcp1
	F8hZcMrn8xvBS+XoWgw/mGHzb6jQCa62vy79WUjLWNCpifB/mNvcxA8UA8VJAdJVaY2x
	w75tcDFJ44MhvNrNAgrI7lYVt/dfO4Gxad4XAdgmnebGBtI5nOtUCoh6aEwd6mvacYRt
	wFuRv8nKqNYDS3YP38wn18023pdnrd9VaGzwonzcW51+xSyBXraBJR0++46uYti30hCY
	iLDw==
X-Gm-Message-State: AD7BkJKoo2V8njcZVA1vltThB98Yrt/g80b7p7MLw6al+Fyiv4Y800VvlJiX/B23qdUVtg==
X-Received: by 10.194.83.42 with SMTP id n10mr14238579wjy.20.1456740646237;
	Mon, 29 Feb 2016 02:10:46 -0800 (PST)
Received: from localhost.localdomain
	(ip-95-222-156-232.hsi15.unitymediagroup.de. [95.222.156.232])
	by smtp.googlemail.com with ESMTPSA id
	di1sm25083313wjc.3.2016.02.29.02.10.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 02:10:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Feb 2016 11:10:11 +0100
Message-Id: <1456740611-32120-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456740611-32120-1-git-send-email-schnitzeltony@googlemail.com>
References: <1456740611-32120-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cppunit: fix loads of host-user-contaminated warnings
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
X-List-Received-Date: Mon, 29 Feb 2016 10:10:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb |  5 +++-
 ...e.am-do-not-preserve-file-flags-when-copy.patch | 31 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch

diff --git a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
index 3e525fe..9420294 100644
--- a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
+++ b/meta-oe/recipes-devtools/cppunit/cppunit_1.13.1.bb
@@ -4,7 +4,10 @@ LICENSE = "LGPL-2.1"
 SECTION = "libs"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-SRC_URI = "http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz"
+SRC_URI = " \
+    http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
+    file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
+"
 SRC_URI[md5sum] = "fa9aa839145cdf860bf596532bb8af97"
 SRC_URI[sha256sum] = "d5b9f3ffc9f1634d75b20b54f48c02e0817bca6afa1d5160b244889d6bff8e0f"
 
diff --git a/meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch b/meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
new file mode 100644
index 0000000..6a20c12
--- /dev/null
+++ b/meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
@@ -0,0 +1,31 @@
+From 9d7ce869607d123cd9837890d71f940c5ced3393 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 29 Feb 2016 07:58:20 +0100
+Subject: [PATCH] doc/Makefile.am: do not preserve file flags when copying
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [cross specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ doc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 8815476..3237499 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -22,7 +22,7 @@ htmldir += $(pkgdatadir)/html
+ html_DATA += $(static_pages) html/index.html
+ 
+ install-data-hook:
+-	cp -pR html/* $(DESTDIR)$(htmldir)
++	cp -R html/* $(DESTDIR)$(htmldir)
+ 
+ # Automake's "distcheck" is sensitive to having files left over
+ # after "make uninstall", so we have to clean up the install hook.
+-- 
+2.5.0
+
-- 
2.5.0


