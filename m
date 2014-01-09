Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id AA6456C745
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2014 16:48:37 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so1428179eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qHwEVBQ5/wcr1OWSA91lNxoEhfwtq54mO3FHzmr4Wts=;
	b=JHYS+usMfhw2zulBvj44TSsjkBHoMgAro+ISZFPED1fwVnESgclxAAeoFidfqUYxeN
	9hkCMJkysA2cH0MVyz0Aeul+QuvUHn+WcFjkLfC4LoA0tsTasu2STGgjnQshXpqkHzgO
	8zm9kc0kHt+OA9xfSON/KTd9LEGvrP1GC4Iyz6mrPuN3pZ4N7iKmGBqCNN/o9oShs1Vx
	XzK44nndyDMUACyEOQMbMqNpxihRsJIbDs8QFpX58WY3JmSa/AvpRNDedmix7k6S9GNX
	M7id+tEioNz1atjDmlmduKmn8qltyDbY3Y3yaHh10Fz1L+m1xx4oiU8NFsaCy1EvHDuD
	X9mA==
X-Received: by 10.14.110.134 with SMTP id u6mr4229998eeg.87.1389286118053;
	Thu, 09 Jan 2014 08:48:38 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id o13sm7061332eex.19.2014.01.09.08.48.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 08:48:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2014 17:48:26 +0100
Message-Id: <1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
References: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
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
X-List-Received-Date: Thu, 09 Jan 2014 16:48:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libraries based on cmake and depending on qt5qml failed to configure with:

|   The imported target "Qt5::DBus" references the file
|
|      "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qt5/qdbusxml2xml"

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
index e3f1b72..ea3364e 100644
--- a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
+++ b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch
@@ -54,7 +54,7 @@ index 1d94715..617efa8 100644
      set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
  !!ELSE
 -    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2xml$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
  !!ENDIF
      _qt5_DBus_check_file_exists(${imported_location})
  
-- 
1.8.3.1


