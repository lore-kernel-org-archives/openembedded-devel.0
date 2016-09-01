Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id DACF1731E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 18:26:25 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id a1so2231831uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 11:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=bpG751k1Y1wc3g+6O5eMguOZDK3T3G7YoFv8j/6844w=;
	b=B2NNRx4klNE8Tv4PVgemDvRW8qVYq/nl7qP1CxP6W3fIxtr4n6FSP1ujEobaYmfcdP
	1gH9nq3ubPpxnaIwFplJicrbgZiu9fwsJQRaA+pdKdALvESgnsULxBkMkqksFGrJeLoP
	JDSLaOrt812NX4E+Lyro9GvEAh5R8hUZWiI5mxK606nXsqk9O8+SZv1cH/Hc7JWAWQQh
	B0YVKs2GLu2mRqNKWgPux/a+ak3Mcq+BaT0dSM8KxoMdttrZaQtdZDSD+Ui9cRmMoTsd
	71hAdBq6z7bbPuTlU/0yp5heKkYsG2APTGdMJdw65R38zaY/jaMGmsta4uZBoUwbb9lM
	ur9w==
X-Gm-Message-State: AE9vXwOOwxzxNqP1jWk31S5Q6d8eS9nKfuVPfiI76YSdHL0kSDvlQ0ObGVbhxB+RFH8caQ==
X-Received: by 10.176.1.131 with SMTP id 3mr10074999ual.30.1472754385823;
	Thu, 01 Sep 2016 11:26:25 -0700 (PDT)
Received: from localhost ([179.105.254.222]) by smtp.gmail.com with ESMTPSA id
	c194sm1037187vkf.24.2016.09.01.11.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Sep 2016 11:26:25 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 01 Sep 2016 15:26:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  1 Sep 2016 15:26:17 -0300
Message-Id: <20160901182617.25340-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] glmark2: Fix build error due a missing space before a macro
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
X-List-Received-Date: Thu, 01 Sep 2016 18:26:27 -0000

This fixes following error:

../src/native-state-x11.cpp:63:33: error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
     static const char *win_name("glmark2 "GLMARK_VERSION);

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...uild-error-due-missing-space-before-macro.patch | 27 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch
new file mode 100644
index 0000000..00eb2ed
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing-space-before-macro.patch
@@ -0,0 +1,27 @@
+From 3fb9b6aeed2e2758239e59ba9ba1ca98535fe510 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Fri, 19 Aug 2016 15:08:44 +0000
+Subject: [PATCH] Fix build error due missing space before macro
+Organization: O.S. Systems Software LTDA.
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ src/native-state-x11.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/native-state-x11.cpp b/src/native-state-x11.cpp
+index 3b66b77..3c1703b 100644
+--- a/src/native-state-x11.cpp
++++ b/src/native-state-x11.cpp
+@@ -60,7 +60,7 @@ NativeStateX11::display()
+ bool
+ NativeStateX11::create_window(WindowProperties const& properties)
+ {
+-    static const char *win_name("glmark2 "GLMARK_VERSION);
++    static const char *win_name("glmark2 " GLMARK_VERSION);
+ 
+     if (!xdpy_) {
+         Log::error("Error: X11 Display has not been initialized!\n");
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 3a1c2e2..396ae70 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,6 +15,7 @@ PV = "2014.03+${SRCPV}"
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
            file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
            file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
+           file://Fix-build-error-due-missing-space-before-macro.patch \
            file://Fix-configure-for-sqrt-check.patch \
            file://Fix-deprecated-declarations.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
-- 
2.9.3


