Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD50078526
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:39:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 33so4020217qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jrfQG7Qpy0yYGx4y6tFmMSfIgsd18HvYz9LP8feV+84=;
	b=g/1hNIRmHSJ93mVURDetF8T1aogDW3E5zw+1mT88vM/9h49IRS2erOtpBHzeu3Hsbv
	noenuMGeWG2+ToW7r7Oh6LgriLwz9MewcT/S+d1Sz63fIOLYspjokPwR0qsxewFdRvM3
	I7hVd4PP1HTLKlSxAqGEt18YnYtXh6AsJe+6v1/miQPRKXGyyhHSagO7WeOElUVHdrqC
	BWt8LoyMFcp1LbSLGzT5u8WMlsE0W/FFGkdbcYE4ofZEYnIpAr9T2L5pnAKP9kS8mLIf
	XPmBC7e2bgv+XhWaGES6icYwdDks1Ca+CV6RlcXeBaOmxwwNcafsn96YQQz+BhlNBjG3
	5XlQ==
X-Gm-Message-State: AKGB3mL9ESzwRu+e3bQyv2zfLddaFD7eXA/cuihGMiPnY/YF0/A3hMIw
	z6CMUlGoBb89FvQEIPpEBniZixrx
X-Google-Smtp-Source: ACJfBotcRUcsV5IET/8SUnOHOt0U7kK6wuK8f1/mlyp8M42vmD6WzHy+jjFoxZvkPhYSnXYgUS+ZeQ==
X-Received: by 10.200.54.139 with SMTP id a11mr3838824qtc.325.1515019184573;
	Wed, 03 Jan 2018 14:39:44 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s41sm1241142qtk.37.2018.01.03.14.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:39:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:39:34 -0500
Message-Id: <1515019174-24971-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515019174-24971-1-git-send-email-derek@asterius.io>
References: <1515019174-24971-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python-jsonpatch: update to version 1.21
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
X-List-Received-Date: Wed, 03 Jan 2018 22:39:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonpatch.inc              | 4 ++--
 .../python/{python-jsonpatch_1.20.bb => python-jsonpatch_1.21.bb}     | 0
 .../python/{python3-jsonpatch_1.20.bb => python3-jsonpatch_1.21.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.20.bb => python-jsonpatch_1.21.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.20.bb => python3-jsonpatch_1.21.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
index 8653de9..838dbe3 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi
 
-SRC_URI[md5sum] = "b82b9ecad4cdef86bf0b88cbdbf7a8b9"
-SRC_URI[sha256sum] = "b12594a0cfe634bdd2a5c027250af2dd84932d493568e88ae722871edc3eb02d"
+SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
+SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8caad7f34724cb1ea26b27547fd974f1a2153"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.20.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
-- 
2.7.4


