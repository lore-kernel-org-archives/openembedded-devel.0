Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF47C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1025.1689139888376808382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=COr2xApt;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4A38C0003
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139887;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=XVthVjdg0BPkBVYMoqw/erF6SJQaBQdmrEqbd0c2h2Y=;
	b=COr2xAptno8dHK8B7QrjHnCoFQv4lSKmmmY4l+/9gN2nAzY40ZnyPflfQguuY7XfcnaoDe
	5cbD5EncUbbqNozpAo4qw8G41bDetnFGz4MU0WS9+O7k4LMe1uzF6H4poMmFmRXcQ7OyU+
	64qYxaDieOynn1CbRK/ktdPWzUZqD6D19cnEM5gyFtsZJ+LlfS0XB+DGOUNzQnZoFUAUbg
	xnbdzz2WPgj0bVQafybAU3XN6J0d22cGdgiGxvRXvrLKnbT0TXOQTLW8sqNto8VwdQKPiN
	xDiyr/AT+lc/IiWfUMKYCx/x6UJqyer/YO36njeTX5eAY90XFveW9K7ueANOUA==
Content-Type: multipart/mixed; boundary="===============7639171881849014826=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pytest-asyncio: upgrading to 0.21.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103797
Message-Id: <20230712053130.6AF47C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:30 +0000 (UTC)

--===============7639171881849014826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-asyncio* to *0.21.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pytest-asyncio-upgrade-0.16.0-0.21.0.patch
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
From fdabe06ed8538ed7df7df8e83e3c9ce3037a4588 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:05:46 -0500
Subject: [PATCH] python3-pytest-asyncio: upgrade 0.16.0 -> 0.21.0

---
 ....0.bb => python3-pytest-asyncio_0.21.0.bb} | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.16.0.bb => python3-pytest-asyncio_0.21.0.bb} (25%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
similarity index 25%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
index 1dfeab633..86ad30ec8 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
@@ -1,9 +1,27 @@
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
+# @@ -199,4 +199,3 @@
+#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+#     See the License for the specific language governing permissions and
+#     limitations under the License.
+# -
+# 
+#
+
 DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
+SRC_URI[sha256sum] = "2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7639171881849014826==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pytest-asyncio-upgrade-0.16.0-0.21.0.patch"

From fdabe06ed8538ed7df7df8e83e3c9ce3037a4588 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 22:05:46 -0500
Subject: [PATCH] python3-pytest-asyncio: upgrade 0.16.0 -> 0.21.0

---
 ....0.bb => python3-pytest-asyncio_0.21.0.bb} | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.16.0.bb => python3-pytest-asyncio_0.21.0.bb} (25%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
similarity index 25%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
index 1dfeab633..86ad30ec8 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb
@@ -1,9 +1,27 @@
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
+# @@ -199,4 +199,3 @@
+#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+#     See the License for the specific language governing permissions and
+#     limitations under the License.
+# -
+# 
+#
+
 DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
+SRC_URI[sha256sum] = "2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============7639171881849014826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12792 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:77e4860c180896a6d9fa3f381eede71bb8c49f07"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:77e4860c180896a6d9fa3f381eede71bb8c49f07"
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
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:77e4860c180896a6d9fa3f381eede71bb8c49f07"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 280 Local 9 Mirrors 263 Missed 8 Current 189 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 469 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 198 of 469 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1132 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_fetch)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1641 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_unpack)
NOTE: Running task 1642 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_patch)
NOTE: Running task 1644 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_configure)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1648 of 1657 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_compile)
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pytest-asyncio/0.21.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pytest-asyncio/0.21.0-r0/pytest-asyncio-0.21.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-pytest-asyncio-0.21.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1648 tasks of which 1641 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-asyncio-0.21.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pytest-asyncio-0.21.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pytest-asyncio/0.21.0-r0/temp/run.do_compile.1475748', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pytest-asyncio/0.21.0-r0/temp/log.do_compile.1475748
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.21.0.bb:do_compile) failed with exit code '1'

--===============7639171881849014826==--

