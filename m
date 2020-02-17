Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12B8B61514
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 16:39:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c84so19189783wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VjOLU2vCu5+354J8/LSeMG/Wzby+IugnI1IlxU+bu9w=;
	b=O/gHnGB64vdw6+TePLtkh8kN2DSExN370RFXmcxa1dTPS4KtK+h1rcHZ+HC56v/RLJ
	BTlNda4JKTUktQnQol2YzvsopzgSuRxbGntXuHG+ONkgPxV22OrxYlJxepIkpeFWKy2w
	6Ii9ly7d4WLjAVTvf0lfwCcdPSBZYJGxJPXjGF4Tzl/sUNsooGQcKjLQ9/5AqlLQGCVu
	QPmLFcVqGVXvEutMhxqO52sJ8BAKPx1DaJrkSex6q02/Z+CtnwyhPajE6nA8jFCgVP7E
	Xsb7BKhu7RQwkDLX4fxDarfQgXZNn+5rFNtSv224D2j7L/uArwIqwH6d62Fc1w7bCVA7
	1IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VjOLU2vCu5+354J8/LSeMG/Wzby+IugnI1IlxU+bu9w=;
	b=S4zUPZUI26DHo5XLt8kjk+kqTcdDq+pErcuICu6KFVc8ADkymX/2EkXzinQvUle9gg
	2Bv7/KXMr7tfZp9YEPEpKPl27HTTjOhH2aHgKz4ddPyJY0slUjcpeYSBxxoWn10XqPkb
	I+nZ3m7iW1CQibsn+jXem+/Fln2eqe3+8d0lSS2X04vllfIqpmbhXKLTqGjzEMy0t6K/
	Li3MOY7DqhbyLnQuh59gW9mso5nqw8HOzatlr/EpI0m+HjsCaYI1SVGx/P2+dj9YV+0Q
	gshjmLaq0Rcjk2yoHJM3QfshO4D5yJXLQ4fr9yw2OtssEszLMXKLdPd6029OTI/ZFcfd
	v4Ig==
X-Gm-Message-State: APjAAAXa8mHlkVSqyk4sajeQYbrNT+VMr7hpCj9YhzRvxvEWCPiPZgBc
	R/9J1Vm0spXhFXWfcoyBlwym138=
X-Google-Smtp-Source: APXvYqxKT9K59KPcqOHbxt3QuJTS+PM4GvkBXY4fYVaX/KBcSOm0hLw9L5l/vAf+lphMaD6MuBbW/g==
X-Received: by 2002:a1c:e28a:: with SMTP id
	z132mr22360908wmg.157.1581957582298; 
	Mon, 17 Feb 2020 08:39:42 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	s65sm1242289wmf.48.2020.02.17.08.39.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:39:41 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 17:39:37 +0100
Message-Id: <20200217163937.29925-4-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217163937.29925-1-viktor.rosendahl@bmw.de>
References: <20200217163937.29925-1-viktor.rosendahl@bmw.de>
Subject: [meta-oe][PATCH 3/3] lcov: Add missing missing RDEPEND and enable nativesdk
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
X-List-Received-Date: Mon, 17 Feb 2020 16:39:42 -0000

From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>

It seems like geninfo is depending on gcov-symlinks, so it should be
added here. Also, lcov is useful in SDKs, so let's enable the building
of native and nativesdk packages.

Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 484b1af5f..14718184b 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} += " \
     gcov \
+    gcov-symlinks \
     libjson-perl \
     libperlio-gzip-perl \
     perl \
@@ -58,3 +59,4 @@ do_install() {
     oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
 }
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


