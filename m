Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97DE077B41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 18:57:23 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id s141so11053402lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=bX1TBR7TuzsLJvcdpI6/0StGXh6+PrWZa+lhQZm1O/s=;
	b=cYCEQ+rEPhxIX54HbccHtGaeTvJoPARncp4lIzsdzfSFlvKW2DRxXBGCE53sb7hPcY
	/bxOUVudmSSmbbu4dsxgd9g+QelJwK44w/mwd1ALk5vJzu9gPqz6sAW2hzQ9Ov8XtyI7
	WLtiaHz6nDD6PqjAPpwU05XZD0xhK+uarSLGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bX1TBR7TuzsLJvcdpI6/0StGXh6+PrWZa+lhQZm1O/s=;
	b=okNip3m2jzeM9tmWG+AGtAcEQzZIZVShO8POOyaqhBTxUUyk2Vpp/dtr+WAaOcBIs/
	/uNUIA2yUJxowxvNqyHe8YcnvfGlYJ9EjKprb3StmjF6OSljielxsxn5pdqUyVB6Fz5H
	t4kbt1ABs2/r9oiPiIXaWgbpkWx2PgFXtBpSKffXXV/ne297En20UKrzRYfzARH8SJSW
	KE8xzk2xjmaj1XDx8q01mLuQTzyV1doOyZm7/iJR3bueLpWre0+2+C/U6LoU3r/C5U87
	ObBWQw+c2aLrC8ov6FmJiX9USgS4gkz2m0EQF+ITp6Ydsj4uAzfPYT6fjA+x5bunOh/I
	so6A==
X-Gm-Message-State: AN3rC/7viHEm0qO/d6A8x7H/WITDq//v5iluKBmQUf9Y6S6XYwwp+cqNIO8crfshYRSTzjep
X-Received: by 10.25.99.155 with SMTP id v27mr128660lfi.170.1491591444142;
	Fri, 07 Apr 2017 11:57:24 -0700 (PDT)
Received: from ynk-TM8481.dev.rtsoft.ru (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	e124sm1100013lfg.8.2017.04.07.11.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 11:57:23 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 21:57:13 +0300
Message-Id: <1491591433-19590-1-git-send-email-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] chromium: enable aarch64 support
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
X-List-Received-Date: Fri, 07 Apr 2017 18:57:24 -0000

Tested by running:
- chromium-wayland on HiKey
- chromium on dragonboard-410c

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 recipes-browser/chromium/chromium.inc                   |  1 +
 recipes-browser/chromium/files/aarch64/include.gypi     |  6 ++++++
 recipes-browser/chromium/files/aarch64/oe-defaults.gypi | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 recipes-browser/chromium/files/aarch64/include.gypi
 create mode 100644 recipes-browser/chromium/files/aarch64/oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 60edccb..c0c3b94 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
 # The build type defaults to Release. If you want a Debug build, you can set
 # the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.conf file.
diff --git a/recipes-browser/chromium/files/aarch64/include.gypi b/recipes-browser/chromium/files/aarch64/include.gypi
new file mode 100644
index 0000000..ad0347a
--- /dev/null
+++ b/recipes-browser/chromium/files/aarch64/include.gypi
@@ -0,0 +1,6 @@
+{
+  'variables': {
+    # Configure for aarch64 compilation
+    'target_arch': 'arm64',
+  }, 
+}
diff --git a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
@@ -0,0 +1,15 @@
+{
+  'variables': {
+    'use_system_bzip2': 1,
+    'disable_nacl': 1,
+    'proprietary_codecs': 1,
+    'v8_use_snapshot': 1,
+    'use_system_ffmpeg': 0,
+    'linux_use_tcmalloc': 0,
+    'linux_link_kerberos': 0,
+    'use_kerberos': 0,
+    'use_cups': 0,
+    'use_gnome_keyring': 0,
+    'linux_link_gnome_keyring': 0
+  }, 
+}
-- 
2.1.4


