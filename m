Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DF8F071C14
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2017 19:23:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v77so52439127wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2017 11:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oJ0gvH0sk2O84qDzcwfosHNcsIlSQAGaNkErb6wBfeU=;
	b=AW/UC6NYH0+6owBtMqL6i749C6xw+4Dtsd2nWVhggqwtEJ/DFkyBBPu2usiyzUA1DO
	aGClVAj/hwlA2EkUT0uPLku70MV+FpXPb6W58IC48GSkytfD8I4iDMGzdBa8qb+EEwgg
	deoFOvO0Ygc+Zrdh1+IOAHqNc/oKaDJ733WGb/SFAwU+ycokBCcL7Lru2ORlCFmyYDXO
	EUksmbs5Ix5nOAI6IsqUKiSEa3Keef8AmErbYMZWag0ngRYk+k0PVsxnyZNzibThwmpX
	ktN010AHD9X5bmMOwHgC02O1/kb6dXnCMc51ytYMDyDPH3slvc9M+vhEInLjThYaNz0Q
	wgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oJ0gvH0sk2O84qDzcwfosHNcsIlSQAGaNkErb6wBfeU=;
	b=twDB+LoH4t6fvDGt9bY0C6vL/ST12XGLxvZFW2pIlCzQrrAmcsBEr4c+87N7jChyLx
	dv+tSl3QKtSbJpa3gwPrjfRmYT1o+2SMfOxFo2oRSPOhPObnhR0Fv9V6y7E8WXQDCNmY
	estsOnBcXsXaiVzddxMbPlB1SAHyciNgmImiIAqSaheHaVRcuIDf0Cf37T6eL+L40B69
	Iqpy7Onyedz7zrvhGI0nW9fYudWjEY0PeYS9cnbRncmbiJSkaUKgZInyFkEiSWTzxNi7
	yUVyidXUmRU8DvVRyEPgPZNmK00hJXiZmnLd8nN3knDnpf4EKSsK7ffQPRA6YXld6s7L
	8YRw==
X-Gm-Message-State: AIkVDXK5Mk6ApYp6oEDhHRFsVpxGOnyhPVkXJbyZjUSoP8ekrOGMUaPWGdEvuomoF42q8w==
X-Received: by 10.28.16.70 with SMTP id 67mr4683082wmq.142.1485977031404;
	Wed, 01 Feb 2017 11:23:51 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q5sm35774654wrd.32.2017.02.01.11.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 11:23:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2017 20:23:49 +0100
Message-Id: <20170201192350.17594-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH][meta-browser 1/2] chromium: split patch 'Remove hard coded values for CC and CXX'
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
X-List-Received-Date: Wed, 01 Feb 2017 19:23:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jacobo Aragunde Pérez <jaragunde@igalia.com>

Chromium and chromium-wayland recipes cannot share this patch any
more due to diverging code bases. We create a new version of the
patch only for chromium-wayland and revert the existing patch to
its previous state to be used by chromium recipe.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../chromium/chromium-wayland_53.0.2785.143.bb     |  2 +-
 .../Remove-hard-coded-values-for-CC-and-CXX.patch  | 42 ++++++++++++++++++++++
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch | 11 +++---
 3 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch

diff --git a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
index c8aea27..a75918b 100644
--- a/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
+++ b/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb
@@ -6,9 +6,9 @@ DEPENDS += "wayland libxkbcommon"
 
 SRC_URI += "\
         file://chromium-wayland/add_missing_stat_h_include.patch \
-        file://0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
         file://0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
         file://0005-Override-root-filesystem-access-restriction.patch \
+        file://chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch \
 	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
         file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium-wayland/remove-Werror.patch \
diff --git a/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..63de68a
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-wayland/Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,42 @@
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 19:31:47 +0200
+Subject: [PATCH] Remove hard coded values for CC and CXX
+
+In spite of what the comment says, the environment variables do *not*
+override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
+always called. To undo this, remove the change.
+
+Upstream-Status: Pending
+
+The default values cannot be overriden without the patch; upstream
+might be interested in this.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ build/common.gypi | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 7ec5ae2..11e8d1d 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -6027,16 +6027,6 @@
+         ['CXX.host', '<(host_cxx)'],
+       ],
+     }],
+-    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
+-      # Set default ARM cross tools on linux.  These can be overridden
+-      # using CC,CXX,CC.host and CXX.host environment variables.
+-      'make_global_settings': [
+-        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
+-        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
+-        ['CC.host', '<(host_cc)'],
+-        ['CXX.host', '<(host_cxx)'],
+-      ],
+-    }],
+     ['use_goma==1', {
+       'make_global_settings': [
+        ['CC_wrapper', '<(gomadir)/gomacc'],
+-- 
+2.1.4
diff --git a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
index 63de68a..7bc8d14 100644
--- a/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
+++ b/recipes-browser/chromium/files/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -21,7 +21,7 @@ diff --git a/build/common.gypi b/build/common.gypi
 index 7ec5ae2..11e8d1d 100644
 --- a/build/common.gypi
 +++ b/build/common.gypi
-@@ -6027,16 +6027,6 @@
+@@ -6047,16 +6047,6 @@
          ['CXX.host', '<(host_cxx)'],
        ],
      }],
@@ -35,8 +35,9 @@ index 7ec5ae2..11e8d1d 100644
 -        ['CXX.host', '<(host_cxx)'],
 -      ],
 -    }],
-     ['use_goma==1', {
-       'make_global_settings': [
-        ['CC_wrapper', '<(gomadir)/gomacc'],
+     # TODO(yyanagisawa): supports GENERATOR==make
+     #  make generator doesn't support CC_wrapper without CC
+     #  in make_global_settings yet.
 -- 
-2.1.4
+1.9.1
+
-- 
2.10.2


