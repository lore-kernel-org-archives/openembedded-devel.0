Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B3AF06B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:47:44 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so1545461wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VMqaRjaI1gSWmhrYfWwCkW16i9gzuuWwPCfHJevf3vY=;
	b=aoMNzUD3MGSWpaJdhdiy5SDMTYhZNOovpOy1b6AV0uXNJ/KDIhGC7ZMc7mTAya/puc
	tuOq8oe5FZnWUeY5w9gRwli5a2yPIgHqw0sIM9zLlPXIxsfzKjydSPPQrfrobfrj/xN4
	x6zRIqv/RkgWHBrpZT029DaTOdr0q0GTuxs/rUBW7q3fBxSvM9+UbJ7BY/9EJC1ITZzd
	+smLnirwOukTJyZzbJywzOXh82abO2nyaeY+MEAyavpjEfIdHos54FY5R8oi/vJ8d356
	GpnvWy/uHyMBEbmefVXzV+jRS6119i99FZE2acIqGqXzUJMDnrDftzwVQOGvpq5vs4I9
	JO5A==
X-Gm-Message-State: ALoCoQmcL8JCAMppDoVVyw5FTmY6tN63n+7CZIQuIxZuvKyOTX6CrbONsAikluuTvXaiZ5H5TY9i
X-Received: by 10.180.11.34 with SMTP id n2mr1639353wib.40.1389782865414;
	Wed, 15 Jan 2014 02:47:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm6016854wiy.3.2014.01.15.02.47.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:47:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:47:32 +0000
Message-Id: <1389782854-14355-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
References: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][meta-oe 3/5] python-nose: remove, migrated to oe-core
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
X-List-Received-Date: Wed, 15 Jan 2014 10:47:45 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb |   14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-nose_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb b/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
deleted file mode 100644
index 083d052..0000000
--- a/meta-oe/recipes-devtools/python/python-nose_1.2.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "nose extends the test loading and running features of unittest, \
-making it easier to write, find and run tests."
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
-SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
-
-S = "${WORKDIR}/nose-${PV}"
-
-inherit distutils
-- 
1.7.10.4


