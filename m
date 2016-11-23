Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 669F9719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:47 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id d2so2626630pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IH7BLiEkqABdWbeIP4miOLAhlDVW0ZUH5opEp5h2+80=;
	b=jta5fP6Bf9gzjZzWAoLAp5OgUVnockjJ0MO7EygJpUQfDjCpT3tWapLnK9SZINofqH
	Ct/rh/IxfxqNHzPpDaUp6OKIGiszhhEvui316ASGT8d6u3Gwt/QIhwj7e3Ngoowcwdl6
	ZUj8gnUEubNsYGF6rePuv0r3Djfam2PWb6yIRXYFkOustu9SRa8Amt7D0XizAe+z/9N1
	0JdAlohyWfNq9gJ1OTj2cZjZf2D/nvQuLLXTC4OWh1cIjvHtmjqDCS0dkjgXLhIRmsHD
	gWhSYVg3KxdG0JpYgP2IzAIxGb6Ivqhp/fRBLEqkWIA3HheA0aj8211mIU7DglsTbZ1f
	33eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IH7BLiEkqABdWbeIP4miOLAhlDVW0ZUH5opEp5h2+80=;
	b=T4rfFg+quPpKzFzNlWiTvdoWHVURd+8kpkSxZ8ISYHmPS8I7VaPt9MEPRMlxxy7z4s
	gPPJG8e9Lanu1DTguEgLAfi0Wjrmp24E6Uvgn6/CA0lxhIkiieUsT1SXIRxOjSv+4CoA
	x2nWtS55Y1TTmC1uHoVgOKUVcHcf9xngNkStl9JKt9jDZOoVudTbckou/QJMcK85ZYal
	GAtfA1TAvFESlFc/xsRO63NSCpaE5OZX90w1wbq0GAT94+jB+XFF7V5AgSCgnSoRg9pN
	eN3t2QFI9datYDPKypOrsZl+hc/NQMheisZRE/3fWnFdANQkPNibLJ+pMbkGf1SCOap4
	kprw==
X-Gm-Message-State: AKaTC03MT5gizcKX0dj6QmkApmSAqj8f5dX4HneaA6S/Y/ews0Ok+WzG3rcBZsZ46ZaBsw==
X-Received: by 10.99.219.21 with SMTP id e21mr3505219pgg.136.1479892968145;
	Wed, 23 Nov 2016 01:22:48 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:00 -0800
Message-Id: <20161123092209.23699-40-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 40/49] jsoncpp: Add new recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-jsoncpp-rename-features-header-file.patch | 152 +++++++++++++++++++++
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb  |  21 +++
 2 files changed, 173 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
new file mode 100644
index 0000000..f1397ea
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-jsoncpp-rename-features-header-file.patch
@@ -0,0 +1,152 @@
+Issue: Build error in TDK DS_stub
+
+In file included from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/c++config.h:426:0,
+                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/string:38,
+                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/value.h:12,
+                 from /home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/json/json.h:10,
+                 from ./include/DeviceSettingsAgent.h:15,
+                 from src/DeviceSettingsAgent.cpp:13:
+/home/ubuntu/work/daisy-rdk/build-qemux86hyb/tmp/sysroots/qemux86hyb/usr/include/c++/i586-rdk-linux/bits/os_defines.h:44:19: error: missing binary operator before token "("
+ #if __GLIBC_PREREQ(2,15) && defined(_GNU_SOURCE)
+
+The issue was jsoncpp has features.h which was conflicting with the system
+header file features.h.
+
+So renamed the header file  features.h in jsoncpp to json-features.h so
+as to localize the effect of this change within jsoncpp.
+
+ Signed-off-by: Ridish Aravindan <ridish.ra@lnttechservices.com>
+
+Index: jsoncpp-src-0.6.0-rc2/include/json/json-features.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ jsoncpp-src-0.6.0-rc2/include/json/json-features.h	2014-08-27 06:41:40.000000000 +0000
+@@ -0,0 +1,49 @@
++// Copyright 2007-2010 Baptiste Lepilleur
++// Distributed under MIT license, or public domain if desired and
++// recognized in your jurisdiction.
++// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
++
++#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
++# define CPPTL_JSON_FEATURES_H_INCLUDED
++
++#if !defined(JSON_IS_AMALGAMATION)
++# include "forwards.h"
++#endif // if !defined(JSON_IS_AMALGAMATION)
++
++namespace Json {
++
++   /** \brief Configuration passed to reader and writer.
++    * This configuration object can be used to force the Reader or Writer
++    * to behave in a standard conforming way.
++    */
++   class JSON_API Features
++   {
++   public:
++      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
++       * - C & C++ comments are allowed
++       * - Root object can be any JSON value
++       * - Assumes Value strings are encoded in UTF-8
++       */
++      static Features all();
++
++      /** \brief A configuration that is strictly compatible with the JSON specification.
++       * - Comments are forbidden.
++       * - Root object must be either an array or an object value.
++       * - Assumes Value strings are encoded in UTF-8
++       */
++      static Features strictMode();
++
++      /** \brief Initialize the configuration like JsonConfig::allFeatures;
++       */
++      Features();
++
++      /// \c true if comments are allowed. Default: \c true.
++      bool allowComments_;
++
++      /// \c true if root must be either an array or an object value. Default: \c false.
++      bool strictRoot_;
++   };
++
++} // namespace Json
++
++#endif // CPPTL_JSON_FEATURES_H_INCLUDED
+Index: jsoncpp-src-0.6.0-rc2/include/json/json.h
+===================================================================
+--- jsoncpp-src-0.6.0-rc2.orig/include/json/json.h	2011-05-02 21:47:24.000000000 +0000
++++ jsoncpp-src-0.6.0-rc2/include/json/json.h	2014-08-27 06:39:13.000000000 +0000
+@@ -10,6 +10,6 @@
+ # include "value.h"
+ # include "reader.h"
+ # include "writer.h"
+-# include "features.h"
++# include "json-features.h"
+ 
+ #endif // JSON_JSON_H_INCLUDED
+Index: jsoncpp-src-0.6.0-rc2/include/json/reader.h
+===================================================================
+--- jsoncpp-src-0.6.0-rc2.orig/include/json/reader.h	2011-05-02 21:47:24.000000000 +0000
++++ jsoncpp-src-0.6.0-rc2/include/json/reader.h	2014-08-27 06:39:32.000000000 +0000
+@@ -7,7 +7,7 @@
+ # define CPPTL_JSON_READER_H_INCLUDED
+ 
+ #if !defined(JSON_IS_AMALGAMATION)
+-# include "features.h"
++# include "json-features.h"
+ # include "value.h"
+ #endif // if !defined(JSON_IS_AMALGAMATION)
+ # include <deque>
+Index: jsoncpp-src-0.6.0-rc2/include/json/features.h
+===================================================================
+--- jsoncpp-src-0.6.0-rc2.orig/include/json/features.h	2011-05-02 21:46:58.000000000 +0000
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,49 +0,0 @@
+-// Copyright 2007-2010 Baptiste Lepilleur
+-// Distributed under MIT license, or public domain if desired and
+-// recognized in your jurisdiction.
+-// See file LICENSE for detail or copy at http://jsoncpp.sourceforge.net/LICENSE
+-
+-#ifndef CPPTL_JSON_FEATURES_H_INCLUDED
+-# define CPPTL_JSON_FEATURES_H_INCLUDED
+-
+-#if !defined(JSON_IS_AMALGAMATION)
+-# include "forwards.h"
+-#endif // if !defined(JSON_IS_AMALGAMATION)
+-
+-namespace Json {
+-
+-   /** \brief Configuration passed to reader and writer.
+-    * This configuration object can be used to force the Reader or Writer
+-    * to behave in a standard conforming way.
+-    */
+-   class JSON_API Features
+-   {
+-   public:
+-      /** \brief A configuration that allows all features and assumes all strings are UTF-8.
+-       * - C & C++ comments are allowed
+-       * - Root object can be any JSON value
+-       * - Assumes Value strings are encoded in UTF-8
+-       */
+-      static Features all();
+-
+-      /** \brief A configuration that is strictly compatible with the JSON specification.
+-       * - Comments are forbidden.
+-       * - Root object must be either an array or an object value.
+-       * - Assumes Value strings are encoded in UTF-8
+-       */
+-      static Features strictMode();
+-
+-      /** \brief Initialize the configuration like JsonConfig::allFeatures;
+-       */
+-      Features();
+-
+-      /// \c true if comments are allowed. Default: \c true.
+-      bool allowComments_;
+-
+-      /// \c true if root must be either an array or an object value. Default: \c false.
+-      bool strictRoot_;
+-   };
+-
+-} // namespace Json
+-
+-#endif // CPPTL_JSON_FEATURES_H_INCLUDED
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
new file mode 100644
index 0000000..17947e3
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.7.7.bb
@@ -0,0 +1,21 @@
+SUMMARY = "JSON C++ lib used to read and write json file."
+DESCRIPTION = "Jsoncpp is an implementation of a JSON (http://json.org) reader \
+               and writer in C++. JSON (JavaScript Object Notation) is a \
+               lightweight data-interchange format. It is easy for humans to \
+               read and write. It is easy for machines to parse and generate."
+
+HOMEPAGE = "http://sourceforge.net/projects/jsoncpp/"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c56ee55c03a55f8105b969d8270632ce"
+
+SRCREV = "d8cd848ede1071a25846cd90b4fddf269d868ff1"
+SRC_URI = "git://github.com/open-source-parsers/jsoncpp \
+"
+
+S = "${WORKDIR}/git"
+inherit cmake
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
-- 
2.10.2


