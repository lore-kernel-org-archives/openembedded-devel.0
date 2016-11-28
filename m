Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8A7606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 21:16:20 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so6966487pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WtywMvBmpMkxE9oJzB2bP4Yv2HlcvG1vr0uUDwFwDWM=;
	b=R6PD9UlwrYE+yMqPd6x0RkRqXWtzNad+eeCQiYh8CCcn8c6NltWzPNQKsCCxoQBmsz
	hjantYOk/PU0nGsMtj0GM5KLWmhHrT9jTzQIv0MKCssNoYi31y/kt1Ij4qYDSx+v1Zcq
	bEAw3+9AgOCW9lNRglrBzYh32i1t0yxqjUL0XBPxJ8eShCg89vjwNHJQCFPFGQEmo1jn
	a3YerWC7NBzDNWbQds1CKfBD0mU1NBMlZKd/b8a0FH7cOrdVThBMghCeqXjGuHjoT3MA
	I8lxe/qY1EQICCogZQow5U2hAc8/aGJ5Noyit/Oopcv/cB7qzFWUn7ikd6QE+zmJ4EsH
	nbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WtywMvBmpMkxE9oJzB2bP4Yv2HlcvG1vr0uUDwFwDWM=;
	b=F1osEmAypCdZIOCvcy8UJt6Rz3AP6TnrCqmafo1EjGAP7aPbP80UoNCeZx9YjJfMn1
	jvKzrpVpb6897KD/2GN30+lFP8epa86YiZg2htT/pTzGPUfz4EtPgJY9WlylXl6zsN52
	hMYmTRy7gggO9O+uqFOiE2kPAAfZ4V4JF6zv4AKUuR/2RjhGl+y0bb9qMp4Q52d2J5fi
	ccaZ3+Q7HVcL2pikSjU3ll7bz+CnUZRwTwxVzWTQbIQvAJJhuPNhuJA3PMuK3UvMGXi0
	PUWFRhF88cKuy1oP0NdgkBg0yCS51M4ifXRgn7uwRXwK9mqtGUtd7wtKtXBPyEu2SRbw
	+SoA==
X-Gm-Message-State: AKaTC03C/UynpZ3uDYa+O4PMSt5A+xhEP9JgXDhl6Gp4KjXasVQqmUjOfGTfexHyomAt5Q==
X-Received: by 10.84.202.12 with SMTP id w12mr54525748pld.156.1480367782181;
	Mon, 28 Nov 2016 13:16:22 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v82sm89405438pfi.6.2016.11.28.13.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 13:16:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 13:16:16 -0800
Message-Id: <20161128211616.2710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] jsoncpp: Remove unused patch
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
X-List-Received-Date: Mon, 28 Nov 2016 21:16:22 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-jsoncpp-rename-features-header-file.patch | 152 ---------------------
 1 file changed, 152 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
deleted file mode 100644
index f1397ea..0000000
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-Issue: Build error in TDK DS_stub
-
-In file included from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/c++config.h:426:0,
-                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/string:38,
-                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/value.h:12,
-                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/json.h:10,
-                 from ./include/DeviceSettingsAgent.h:15,
-                 from src/DeviceSettingsAgent.cpp:13:
-/home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/os_defines.h:44:19: error: missing binary operator before token "("
- #if __GLIBC_PREREQ(2,15) && defined(_GNU_SOURCE)
-
-The issue was jsoncpp has features.h which was conflicting with the system
-header file features.h.
-
-So renamed the header file  features.h in jsoncpp to json-features.h so
-as to localize the effect of this change within jsoncpp.
-
- Signed-off-by: Ridish Aravindan <ridish.ra@lnttechservices.com>
-
-Index: jsoncpp-src-0.6.0-rc2/include/json/json-features.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ jsoncpp-src-0.6.0-rc2/include/json/json-features.h	2014-08-27 06:41:40.000000000 +0000
-@@ -0,0 +1,49 @@
-+// Copyright 2007-2010 Baptiste Lepilleur
-+// Distributed under MIT license, or public domain if desired and
-+// recognized in your jurisdiction.
-+// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
-+
-+#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
-+# define CPPTL_JSON_FEATURES_H_INCLUDED
-+
-+#if !defined(JSON_IS_AMALGAMATION)
-+# include "forwards.h"
-+#endif // if !defined(JSON_IS_AMALGAMATION)
-+
-+namespace Json {
-+
-+   /** \brief Configuration passed to reader and writer.
-+    * This configuration object can be used to force the Reader or Writer
-+    * to behave in a standard conforming way.
-+    */
-+   class JSON_API Features
-+   {
-+   public:
-+      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
-+       * - C & C++ comments are allowed
-+       * - Root object can be any JSON value
-+       * - Assumes Value strings are encoded in UTF-8
-+       */
-+      static Features all();
-+
-+      /** \brief A configuration that is strictly compatible with the JSON specification.
-+       * - Comments are forbidden.
-+       * - Root object must be either an array or an object value.
-+       * - Assumes Value strings are encoded in UTF-8
-+       */
-+      static Features strictMode();
-+
-+      /** \brief Initialize the configuration like JsonConfig::allFeatures;
-+       */
-+      Features();
-+
-+      /// \c true if comments are allowed. Default: \c true.
-+      bool allowComments_;
-+
-+      /// \c true if root must be either an array or an object value. Default: \c false.
-+      bool strictRoot_;
-+   };
-+
-+} // namespace Json
-+
-+#endif // CPPTL_JSON_FEATURES_H_INCLUDED
-Index: jsoncpp-src-0.6.0-rc2/include/json/json.h
-===================================================================
---- jsoncpp-src-0.6.0-rc2.orig/include/json/json.h	2011-05-02 21:47:24.000000000 +0000
-+++ jsoncpp-src-0.6.0-rc2/include/json/json.h	2014-08-27 06:39:13.000000000 +0000
-@@ -10,6 +10,6 @@
- # include "value.h"
- # include "reader.h"
- # include "writer.h"
--# include "features.h"
-+# include "json-features.h"
- 
- #endif // JSON_JSON_H_INCLUDED
-Index: jsoncpp-src-0.6.0-rc2/include/json/reader.h
-===================================================================
---- jsoncpp-src-0.6.0-rc2.orig/include/json/reader.h	2011-05-02 21:47:24.000000000 +0000
-+++ jsoncpp-src-0.6.0-rc2/include/json/reader.h	2014-08-27 06:39:32.000000000 +0000
-@@ -7,7 +7,7 @@
- # define CPPTL_JSON_READER_H_INCLUDED
- 
- #if !defined(JSON_IS_AMALGAMATION)
--# include "features.h"
-+# include "json-features.h"
- # include "value.h"
- #endif // if !defined(JSON_IS_AMALGAMATION)
- # include <deque>
-Index: jsoncpp-src-0.6.0-rc2/include/json/features.h
-===================================================================
---- jsoncpp-src-0.6.0-rc2.orig/include/json/features.h	2011-05-02 21:46:58.000000000 +0000
-+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
-@@ -1,49 +0,0 @@
--// Copyright 2007-2010 Baptiste Lepilleur
--// Distributed under MIT license, or public domain if desired and
--// recognized in your jurisdiction.
--// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
--
--#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
--# define CPPTL_JSON_FEATURES_H_INCLUDED
--
--#if !defined(JSON_IS_AMALGAMATION)
--# include "forwards.h"
--#endif // if !defined(JSON_IS_AMALGAMATION)
--
--namespace Json {
--
--   /** \brief Configuration passed to reader and writer.
--    * This configuration object can be used to force the Reader or Writer
--    * to behave in a standard conforming way.
--    */
--   class JSON_API Features
--   {
--   public:
--      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
--       * - C & C++ comments are allowed
--       * - Root object can be any JSON value
--       * - Assumes Value strings are encoded in UTF-8
--       */
--      static Features all();
--
--      /** \brief A configuration that is strictly compatible with the JSON specification.
--       * - Comments are forbidden.
--       * - Root object must be either an array or an object value.
--       * - Assumes Value strings are encoded in UTF-8
--       */
--      static Features strictMode();
--
--      /** \brief Initialize the configuration like JsonConfig::allFeatures;
--       */
--      Features();
--
--      /// \c true if comments are allowed. Default: \c true.
--      bool allowComments_;
--
--      /// \c true if root must be either an array or an object value. Default: \c false.
--      bool strictRoot_;
--   };
--
--} // namespace Json
--
--#endif // CPPTL_JSON_FEATURES_H_INCLUDED
-- 
2.10.2


