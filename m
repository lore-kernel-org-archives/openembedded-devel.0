Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 74F856E6F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 16:05:49 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so3139539eak.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 08:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=p/KYTSCiJd6Zq+kgwPH+2PeLqs7G4ZnNZ5HhM/X9uLk=;
	b=Z35H3zHENAf8sg8Sm5o8wlJHlrhvkEEaOQQ30drNdMNknUteMbYnLFUrxiYWl+FR+y
	/gTpYf3usjaZl454ke5V9mdTyEKnEQ/+9w2xWJFqPq9WCL/hkEbaG/Ur1jI9gztEwl2r
	d1V/UPbi0cjcUt2JmPU1/ZTuCJMOA4dJ/simhif96HWuXBgo8BK7mWB93TdYcBQmRXjb
	wdFwAnOYn2wX14pD29M454slk/cKPArxxAVxPfbfTLE2KIA47ScjutIbxtMh1O7lp6vW
	8oyQhYLRQ/V47pjgFGPUhZ+ZbFMosTknzAwjeJmh1cg5qG3g0E8EVUcqs+8W77+AVR0t
	93iA==
X-Received: by 10.14.110.68 with SMTP id t44mr3738870eeg.74.1392048349971;
	Mon, 10 Feb 2014 08:05:49 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-124.unitymediagroup.de.
	[109.91.251.124]) by mx.google.com with ESMTPSA id
	o43sm56086885eef.12.2014.02.10.08.05.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 08:05:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2014 17:05:40 +0100
Message-Id: <1392048341-24963-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.1] 1/2] libraries based on cmake and depending on qt5qml failed to configure with:
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
X-List-Received-Date: Mon, 10 Feb 2014 16:05:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

|   The imported target "Qt5::DBus" references the file
|
|      "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qt5/qdbusxml2xml"

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
index d213252..23e22a8 100644
--- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
+++ b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
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


