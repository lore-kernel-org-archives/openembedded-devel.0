Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E642C6FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 12:28:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r5so10323187wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QyrOFAQKOVt6HuVfLyVs8ENtMLtJ/nv1l+Bhku5UTB8=;
	b=RB6pv8U/hnsKsQ+bhEkVC9B3+wF5jW/9I++hc7s1uk51e1DS466R6x2TyOkogSh0d5
	mhCFq7Ft103Q92RJARSL1N9Ei/XNzH8/MnaE0u6zDL1lMi+oviAoMZkRajeTGbUXt7Dr
	AaLCySjVJ94YGeQbDo8AkpoETtGBhI9TlLlCb0U9Qz2Pze4xwXPlpLtFzO6TM/ElMb3L
	Wg1gcS4FU/jRuZ0lKjVQCY9zPLaCSHvgoRbpWqZhqoRHmvq1sA/nMBBahodXYW7Cuigt
	NfzTJEudR38cyebs3eyykDGQW02lshk59OcVdZ3sqIHbcgK4KjqMHjQXae4JY/9IeLfI
	brhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QyrOFAQKOVt6HuVfLyVs8ENtMLtJ/nv1l+Bhku5UTB8=;
	b=i5W2/DQADliLjbMmFA2K40MbYW3JNt3XeZAVQ6h/WNQ+gA/zAMHkKGyeJXxRRkLnXv
	WVpgn/tN+zJkbWRS7TCRyVhKnjAGPmEEwIfGUtethrfnmE8jBUjkLIn9SkjuLv0qVt+u
	R8sH0ixM4U24Pp4426YYV60FImO1nOC5PgM1ogXLHrfioJ7mt0aRYRwg0vyoDiry8WFA
	J2ly3wIkPeuPSVpab4UljMX0Q06HklNQnxdemYV+gJl0VBVEU/+CH6YBaH+UdMREuzzP
	T7+YeKiMhmGUFlmsgKK3JZNxBGjLp3F0gSO4mgfHHVDf4I3jd8Dz0cHqr3Dlk6q7sxJc
	aipw==
X-Gm-Message-State: ALyK8tISAYmiiHBXHbAGGduf47PBbYrpwMlPYesR3sgXHNy2Ispz6sprXvCBAn+lgAjNrA==
X-Received: by 10.194.79.168 with SMTP id k8mr9452760wjx.52.1465475317155;
	Thu, 09 Jun 2016 05:28:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dj4sm6841458wjc.13.2016.06.09.05.28.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jun 2016 05:28:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 14:29:00 +0200
Message-Id: <20160609122900.12978-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160609122900.12978-1-Martin.Jansa@gmail.com>
References: <20160609122900.12978-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] elementary, evas-generic-loaders: Drop poppler dependency
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
X-List-Received-Date: Thu, 09 Jun 2016 12:28:38 -0000

* elementary doesn't seem to use poppler at all
* add PACKAGECONFIG for poppler in evas-generic-loaders and disable
  it by default as ATM poppler is broken

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary.inc           | 2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
index f0a92df..cec67aa 100644
--- a/meta-efl/recipes-efl/efl/elementary.inc
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a173054a93896e933df53e3382d472c2"
-DEPENDS = "eet-native edje-native elementary-native efreet evas ecore edje eet eldbus ethumb poppler eio"
+DEPENDS = "eet-native edje-native elementary-native efreet evas ecore edje eet eldbus ethumb eio"
 DEPENDS_class-native = "efl-native"
 
 inherit efl gettext
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index 5cd9ec1..d277c11 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -1,20 +1,22 @@
 DESCRIPTION = "Evas generic loaders"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a87563ed30add2b0e3460272d3138a00"
-DEPENDS = "eina poppler librsvg cairo"
+DEPENDS = "eina librsvg cairo"
 
 inherit efl
 
 SRCNAME = "evas_generic_loaders"
 
 EXTRA_OECONF = " \
-    --enable-poppler \
     --enable-svg \
     --disable-gstreamer \
     --disable-libraw \
     --disable-spectre \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[poppler] = "--enable-poppler,--disable-poppler,poppler"
+
 PACKAGESPLITFUNCS_prepend = "split_evas_loader_packages "
 
 python split_evas_loader_packages () {
-- 
2.8.4


