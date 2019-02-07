Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 294FD6BDD2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 14:40:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j13-v6so80698ljc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YDyza2W/3OvdTzmgWCMPgtlr27qsf1gK3tkXVn7U7CI=;
	b=XD62pvhWk5jEyHvvod+0yQrkQIUCvDafisnxA5B13NFxkBv+kpyN0dSqfh/wt4ChjF
	YIko2LGXjnRlielLcBDgiGivjf+a4ec7Hi6Hb/kpfmA2Xwv1XL3h+IVtFQnzo1/pipdj
	SncF+UmEaz7f9+43yQoiCcszz24+VrMoU1X5AcdeHzzphQNRxzX/R9Bh3OlO/HMS3uzA
	JW2tTByMV59Vs9shmYMldKi4g8xSxK8m8xva8yyK3rm9/5WidA3pd8G/KNLM6sFk0bS0
	LuyBW4Cy+CVIHkEJX+vwX5aGZqQbR8LY3A5E4sjl6HqMCl2GsJ/Nb8PaynD8LC0B/A8V
	us8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YDyza2W/3OvdTzmgWCMPgtlr27qsf1gK3tkXVn7U7CI=;
	b=AspVLWV2z242sdLfh8qHg6A6gnbs329Tt9M+BfGYD7gbDgw29qfBKdv00g2oRlwprM
	F05At0Onq6bpFQI9D9P74707SlPFphU8MGYipsbC0s2gKIjm6PusdTabSSumZMKgogUN
	jRunVlEsh145eML/nrIZ2wwfTNrBemgjY9RHcBl9fcOigMAKK8IgcTwx4KyhcaEw81gJ
	8cg7p/QouV0iNSewy9S9w2HjP+Tr/j4Hs4ndov2ASJ3WaH/M2SLcbTAjfstw4upNXrM/
	tEdD1r+z8nR8A4HA5HXzHAcVEzSjQ2Nf3k7O46EqWza+FapeYD8BGNi++oo1EJZ0Nl+1
	61gQ==
X-Gm-Message-State: AHQUAuaTzn/EauOAzkxbAGd7otom7PyxyMoll2E6QKxbHwOSHyykom5H
	jKvybBzGqIArJZiwDcd04yRBy6Ne
X-Google-Smtp-Source: AHgI3Ib9U/oVhZPO3NOZrJ4D0fMQCa8PKa7ddaOHipelwkmfSpljmDAWRKC/NHL32Jm/KzEXwtOaFw==
X-Received: by 2002:a2e:9b52:: with SMTP id
	o18-v6mr9969129ljj.108.1549550440298; 
	Thu, 07 Feb 2019 06:40:40 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r199sm2221480lfr.77.2019.02.07.06.40.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 06:40:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 15:40:33 +0100
Message-Id: <20190207144033.13950-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3-gevent: update to 1.4.0
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
X-List-Received-Date: Thu, 07 Feb 2019 14:40:40 -0000

This fixes build issues with Python 3.7.

License-Update: added BSD license for one of the source files
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/python/python-gevent.inc | 10 ++++---
 ...etup.py-do-not-query-for-include-dir.patch | 26 +++++++++++++++++++
 ...event_1.2.2.bb => python3-gevent_1.4.0.bb} |  1 -
 3 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
 rename meta-python/recipes-devtools/python/{python3-gevent_1.2.2.bb => python3-gevent_1.4.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
index 13513f219..bc89d104a 100644
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ b/meta-python/recipes-devtools/python/python-gevent.inc
@@ -4,8 +4,9 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
-                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
-                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
+                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
+                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
+                    "
 DEPENDS += "libevent"
 DEPENDS += "${PYTHON_PN}-greenlet"
 RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
@@ -17,10 +18,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
 
 SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
+    file://0002-setup.py-do-not-query-for-include-dir.patch \
 "
 
-SRC_URI[md5sum] = "7f0baf355384fe5ff2ecf66853422554"
-SRC_URI[sha256sum] = "4791c8ae9c57d6f153354736e1ccab1e2baf6c8d9ae5a77a9ac90f41e2966b2d"
+SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
+SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
diff --git a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch b/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
new file mode 100644
index 000000000..7536b71a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
@@ -0,0 +1,26 @@
+From a53ed6b2f967a5f95e69d51cad3f8c120d7df65b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 7 Feb 2019 15:21:15 +0100
+Subject: [PATCH] setup.py: do not query for include dir
+
+As this will return the native python directory erroneously.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 86d6c5a..5d22291 100755
+--- a/setup.py
++++ b/setup.py
+@@ -52,7 +52,7 @@ from _setupares import ARES
+ # Get access to the greenlet header file.
+ # The sysconfig dir is not enough if we're in a virtualenv
+ # See https://github.com/pypa/pip/issues/4610
+-include_dirs = [sysconfig.get_path("include")]
++include_dirs = []
+ venv_include_dir = os.path.join(sys.prefix, 'include', 'site',
+                                 'python' + sysconfig.get_python_version())
+ venv_include_dir = os.path.abspath(venv_include_dir)
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
index 1f172e586..df688e424 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
@@ -1,3 +1,2 @@
 require python-gevent.inc
 inherit setuptools3
-
-- 
2.17.1


