Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D884EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.2155.1691221128361250622
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=bcf4L122;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85BF4240002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221126;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=SJMgQsz18IsupjglGjNVJM5DI59pdFgBO3vbaGNU/Ks=;
	b=bcf4L122cS8EpZGbnrHUHMMI6aYthOa5iZE4K4vXhNzHhSlzlA1cyirtNEGS7sAqzMMnz8
	MGq9RdOFMsVI5mKCLDkXHFopcz1NSnjsVAhGIvbOL6ogM94yitro95rhE+DP8iKoDpoNm0
	uA9xIqnaltLKaV0c4Z0ZeNT0I0PA0VxWMdgBAZ8Oi9PpvTIj0Qboa7/P1fI3bMe3tFX859
	t3NRL72xcW3sQasCGP39qzYC9RV0CSgQT2S+YclZgQrZylyZEtMI7koz8Nw5TBwjDz4A4+
	/GEfC/gY/UjZXCGISZaZx+KZXIrabQdU6+f7ApUwBN57FnZtlGcKEJI67N+Ddw==
Content-Type: multipart/mixed; boundary="===============2005540019983380071=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-flask-user: upgrading to 1.0.2.2 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104245
Message-Id: <20230805073849.9D884EB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:49 +0000 (UTC)

--===============2005540019983380071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flask-user* to *1.0.2.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-flask-user-upgrade-0.6.19-1.0.2.2.patch
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
From cd057b9d2e1cd017555547c042868f84a6c7a012 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:02:36 -0500
Subject: [PATCH] python3-flask-user: upgrade 0.6.19 -> 1.0.2.2

---
 ....6.19.bb => python3-flask-user_1.0.2.2.bb} | 59 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (14%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
similarity index 14%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
index ac449361a..f7e87ce2b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
@@ -1,13 +1,66 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,22 +1,22 @@
+# -Copyright (c) 2013, Ling Thio and contributors.
+# +Copyright (c) 2013 Ling Thio
+#  
+# -Redistribution and use in source and binary forms, with or without
+# -modification, are permitted provided that the following conditions are met:
+# +Permission is hereby granted, free of charge, to any person
+# +obtaining a copy of this software and associated documentation
+# +files (the "Software"), to deal in the Software without
+# +restriction, including without limitation the rights to use,
+# +copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the
+# +Software is furnished to do so, subject to the following
+# +conditions:
+#  
+# -1. Redistributions of source code must retain the above copyright notice, this
+# -   list of conditions and the following disclaimer.
+# +The above copyright notice and this permission notice shall be
+# +included in all copies or substantial portions of the Software.
+#  
+# -2. Redistributions in binary form must reproduce the above copyright notice,
+# -   this list of conditions and the following disclaimer in the documentation
+# -   and/or other materials provided with the distribution.
+# -
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+# -ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+# -ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# -(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+# -LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+# -ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# -(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+# +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+# +OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+# +NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+# +HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+# +WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# +OTHER DEALINGS IN THE SOFTWARE.
+#
+
 SUMMARY = "Customizable user account management for Flask"
 DESCRIPTION = "Customizable User Account Management for Flask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
 
 PYPI_PACKAGE = "Flask-User"
 
-- 
2.25.1


--===============2005540019983380071==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-flask-user-upgrade-0.6.19-1.0.2.2.patch"

From cd057b9d2e1cd017555547c042868f84a6c7a012 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Fri, 4 Aug 2023 22:02:36 -0500
Subject: [PATCH] python3-flask-user: upgrade 0.6.19 -> 1.0.2.2

---
 ....6.19.bb => python3-flask-user_1.0.2.2.bb} | 59 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (14%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
similarity index 14%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
index ac449361a..f7e87ce2b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
@@ -1,13 +1,66 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,22 +1,22 @@
+# -Copyright (c) 2013, Ling Thio and contributors.
+# +Copyright (c) 2013 Ling Thio
+#  
+# -Redistribution and use in source and binary forms, with or without
+# -modification, are permitted provided that the following conditions are met:
+# +Permission is hereby granted, free of charge, to any person
+# +obtaining a copy of this software and associated documentation
+# +files (the "Software"), to deal in the Software without
+# +restriction, including without limitation the rights to use,
+# +copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the
+# +Software is furnished to do so, subject to the following
+# +conditions:
+#  
+# -1. Redistributions of source code must retain the above copyright notice, this
+# -   list of conditions and the following disclaimer.
+# +The above copyright notice and this permission notice shall be
+# +included in all copies or substantial portions of the Software.
+#  
+# -2. Redistributions in binary form must reproduce the above copyright notice,
+# -   this list of conditions and the following disclaimer in the documentation
+# -   and/or other materials provided with the distribution.
+# -
+# -THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
+# -ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# -DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
+# -ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# -(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+# -LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+# -ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# -(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+# -SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+# +EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+# +OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+# +NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+# +HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+# +WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# +FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# +OTHER DEALINGS IN THE SOFTWARE.
+#
+
 SUMMARY = "Customizable user account management for Flask"
 DESCRIPTION = "Customizable User Account Management for Flask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
 HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
 
 PYPI_PACKAGE = "Flask-User"
 
-- 
2.25.1


--===============2005540019983380071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12657 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12618 targets, 325 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c0f1c4f38bccd986ec90af65e2ea0dc26caa57ca"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c0f1c4f38bccd986ec90af65e2ea0dc26caa57ca"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:c0f1c4f38bccd986ec90af65e2ea0dc26caa57ca"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 380 Local 188 Mirrors 182 Missed 10 Current 305 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1343 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_recipe_qa)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1926 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_fetch)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_fetch: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1927 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_unpack)
NOTE: Running task 1928 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_unpack: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1929 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_patch)
NOTE: Running task 1930 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_patch: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1931 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1932 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_populate_lic)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1933 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_configure)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_configure: Started
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1934 of 1943 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile)
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py:84: _DeprecatedInstaller: setuptools.installer and fetch_build_eggs are deprecated.
| !!
| 
|         ********************************************************************************
|         Requirements should be satisfied by a PEP 517 installer.
|         If you are using pip, you can try `pip install --use-pep517`.
|         ********************************************************************************
| 
| !!
|   dist.fetch_build_eggs(dist.setup_requires)
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module named pip
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 96, in _fetch_build_egg_no_warn
|     subprocess.check_call(cmd)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", line 413, in check_call
|     raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command '['/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpb2r8va_y', '--quiet', 'Flask-Login']' returned non-zero exit status 1.
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/Flask-User-1.0.2.2/setup.py", line 26, in <module>
|     setup(
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 106, in setup
|     _install_setup_requires(attrs)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 79, in _install_setup_requires
|     _fetch_build_eggs(dist)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 84, in _fetch_build_eggs
|     dist.fetch_build_eggs(dist.setup_requires)
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 907, in fetch_build_eggs
|     return _fetch_build_eggs(self, requires)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 38, in _fetch_build_eggs
|     resolved_dists = pkg_resources.working_set.resolve(
|                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 829, in resolve
|     dist = self._resolve_dist(
|            ^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 865, in _resolve_dist
|     dist = best[req.key] = env.best_match(
|                            ^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1135, in best_match
|     return self.obtain(req, installer)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pkg_resources/__init__.py", line 1147, in obtain
|     return installer(requirement)
|            ^^^^^^^^^^^^^^^^^^^^^^
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/installer.py", line 98, in _fetch_build_egg_no_warn
|     raise DistutilsError(str(e)) from e
| distutils.errors.DistutilsError: Command '['/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpb2r8va_y', '--quiet', 'Flask-Login']' returned non-zero exit status 1.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-flask-user-1.0.2.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1934 tasks of which 1924 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-flask-user-1.0.2.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-flask-user-1.0.2.2-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/temp/run.do_compile.3020492', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-flask-user/1.0.2.2-r0/temp/log.do_compile.3020492
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb:do_compile) failed with exit code '1'

--===============2005540019983380071==--

