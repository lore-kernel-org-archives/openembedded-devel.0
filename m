Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B65FC04E69
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.2160.1691221139188923146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=onGvUr5+;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A82E40004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221137;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=XIs6FifJo3BsSab4451DeMS6VIZffxNY6z8phcOZ3t0=;
	b=onGvUr5+UOxFKOfXY9WrDDMO2cUCra4bxzB6bEUrbgGHf5/YqKOr81j6XwG4qHyzrPJP5G
	SginvukJNcJnDhzBu4AtLkjx8GB3JFZ3KR+szIeg6ns+hddSmjnB1eF/8MTk4ytKfm4CA6
	2vOnOKI95Eb86SDPYtAJCMEEN0rbqHeV8EJSc08e+yOzMQ5zkBkheuWmHwyyx06tEh9dQo
	FBqi59w9udO4nFo5j6h4fz0D47fXBinDtDrJbq5MQuzHKgbofId8VEJ7Gl90NPzJUOz8iv
	aXFcsaNgIUD1cqFizcuISmj9HGehMECSLBYjGvkqAf8ECbLg/jnRradWqaopvQ==
Content-Type: multipart/mixed; boundary="===============6005427799178968804=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-kivy: upgrading to 2.2.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104250
Message-Id: <20230805073909.9B65FC04E69@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:09 +0000 (UTC)

--===============6005427799178968804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-kivy* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-kivy-upgrade-2.1.0.-2.2.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From a881ee5dd2847b5b7ee9bff363241139fe0535da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:02:43 -0500
Subject: [PATCH] python3-kivy: upgrade 2.1.0. -> 2.2.1

---
 .../0001-add-support-for-glesv2.patch         | 19 ++++++++---
 ...3-kivy_2.1.0..bb => python3-kivy_2.2.1.bb} | 32 ++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0..bb => python3-kivy_2.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
index 0abc6c5c7..ccd89050c 100644
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -1,8 +1,19 @@
+From cef98bdb9e304903623b3ee24ea5dad4449bc33b Mon Sep 17 00:00:00 2001
+From: William Huang <whuang8933@gmail.com>
+Date: Thu, 2 Sep 2021 07:25:07 -0400
+Subject: [PATCH] recipes-devtools: python: add support for Kivy
+
 Upstream-Status: Pending
 
+---
+ setup.py | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 35e34afdd..0ba3aca72 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -695,7 +695,18 @@ def determine_gl_flags():
+@@ -730,7 +730,18 @@ def determine_gl_flags():
          c_options['use_x11'] = True
          c_options['use_egl'] = True
      else:
@@ -22,7 +33,7 @@ Upstream-Status: Pending
      return flags, base_flags
  
  
-@@ -723,14 +734,13 @@ def determine_sdl2():
+@@ -774,14 +785,13 @@ def determine_sdl2():
              sdl_inc = join(include, 'SDL2')
              if isdir(sdl_inc):
                  sdl2_paths.append(sdl_inc)
@@ -36,5 +47,5 @@ Upstream-Status: Pending
 -        ['/usr/local/lib/'])
 +        [''])
  
-     if sdl2_flags:
-         flags = merge(flags, sdl2_flags)
+     if kivy_sdl2_path:
+         # If we have a custom path, we need to add the rpath to the linker
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
index ca1fc5f96..de546cef3 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
@@ -1,24 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2010-2022 Kivy Team and other contributors
+# +Copyright (c) 2010-2023 Kivy Team and other contributors
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22e7b4dd8140eec57fd7edfd9fa23dfc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5cd0f2cfda42852c332e3b88c85fea"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
 
-SRC_URI = "\
-    git://github.com/kivy/kivy.git;protocol=https;branch=master \
-"
+SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
+           file://0001-add-support-for-glesv2.patch \
+           "
 
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
 # and mali-based OS's. We need to patch the setup file to tell Kivy setup
 # that our machine has GLES libaries installed as well
 # Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
-SRC_URI += " \
-    file://0001-add-support-for-glesv2.patch \
-"
-SRCREV = "960b95dc666753f59eff1b449124490fbec10184"
+SRCREV = "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============6005427799178968804==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-kivy-upgrade-2.1.0.-2.2.1.patch"

From a881ee5dd2847b5b7ee9bff363241139fe0535da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 23:02:43 -0500
Subject: [PATCH] python3-kivy: upgrade 2.1.0. -> 2.2.1

---
 .../0001-add-support-for-glesv2.patch         | 19 ++++++++---
 ...3-kivy_2.1.0..bb => python3-kivy_2.2.1.bb} | 32 ++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0..bb => python3-kivy_2.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
index 0abc6c5c7..ccd89050c 100644
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -1,8 +1,19 @@
+From cef98bdb9e304903623b3ee24ea5dad4449bc33b Mon Sep 17 00:00:00 2001
+From: William Huang <whuang8933@gmail.com>
+Date: Thu, 2 Sep 2021 07:25:07 -0400
+Subject: [PATCH] recipes-devtools: python: add support for Kivy
+
 Upstream-Status: Pending
 
+---
+ setup.py | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 35e34afdd..0ba3aca72 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -695,7 +695,18 @@ def determine_gl_flags():
+@@ -730,7 +730,18 @@ def determine_gl_flags():
          c_options['use_x11'] = True
          c_options['use_egl'] = True
      else:
@@ -22,7 +33,7 @@ Upstream-Status: Pending
      return flags, base_flags
  
  
-@@ -723,14 +734,13 @@ def determine_sdl2():
+@@ -774,14 +785,13 @@ def determine_sdl2():
              sdl_inc = join(include, 'SDL2')
              if isdir(sdl_inc):
                  sdl2_paths.append(sdl_inc)
@@ -36,5 +47,5 @@ Upstream-Status: Pending
 -        ['/usr/local/lib/'])
 +        [''])
  
-     if sdl2_flags:
-         flags = merge(flags, sdl2_flags)
+     if kivy_sdl2_path:
+         # If we have a custom path, we need to add the rpath to the linker
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
index ca1fc5f96..de546cef3 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
@@ -1,24 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2010-2022 Kivy Team and other contributors
+# +Copyright (c) 2010-2023 Kivy Team and other contributors
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22e7b4dd8140eec57fd7edfd9fa23dfc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed5cd0f2cfda42852c332e3b88c85fea"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
 
-SRC_URI = "\
-    git://github.com/kivy/kivy.git;protocol=https;branch=master \
-"
+SRC_URI = "git://github.com/kivy/kivy.git;protocol=https;branch=stable \
+           file://0001-add-support-for-glesv2.patch \
+           "
 
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
 # and mali-based OS's. We need to patch the setup file to tell Kivy setup
 # that our machine has GLES libaries installed as well
 # Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
-SRC_URI += " \
-    file://0001-add-support-for-glesv2.patch \
-"
-SRCREV = "960b95dc666753f59eff1b449124490fbec10184"
+SRCREV = "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


--===============6005427799178968804==--

