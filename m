Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC9C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:08:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1086.1690780090290285459
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=MG2l+YgG;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 032B91C0004
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780088;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=3qSLWuT9qaASF9K2u6YM2O0cN3zX4kL8NrZ8TopabsQ=;
	b=MG2l+YgGyBXVR7dk4jAFUS5gbUiMcD4woA7AjmDrLL1bFEUfo6ysOgh0jzEl6ytuMjzCIp
	NpL4F+NfJK5Mz9ceQvTtx2n5x49mGRqmixueFqDRn/mxmgakYErRDJY5zBOcbKbJ+HBTtC
	s/mKMOph6/VAvW1RKHlc8vc0mDdNV7h42m5b+0cz5vfVkTMhIm5Hh6CZXAWbWG92Cjtggl
	2et8+GNK9FZ2fQRhLVk10yaQm1RKKX4iUxLx62dJuaLBsRTZovM8MTtRmu1iobPhHOSO+2
	0hD1ky4IVzJ6+wqBKi7mnKCUZwaF5tdWQqM/U8Oli+wEhdUSTjM7jdUe63+mWA==
Content-Type: multipart/mixed; boundary="===============3996185603599457568=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-aiohttp: upgrading to 3.8.5 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104079
Message-Id: <20230731050814.C1EC9C001DC@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:08:14 +0000 (UTC)

--===============3996185603599457568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-aiohttp* to *3.8.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-aiohttp -V 3.8.5
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (18:57:15.004047)
NOTE: Directory listing: ['tmp-qemux86-musl', 'tmp-qemuarm64', 'tmp', 'conf', 'tmp-qemux86-64', 'weeklyjob.sh', 'auto_upgrade_helper', 'tmp-qemux86', 'auto-upgrade-helper', 'upgrade-helper', 'cache', 'workspace', 'pokyjob.sh', 'buildhistory', 'perljob.sh', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (18:57:15.118997)
Loading cache...done.
Loaded 12619 entries from dependency cache.
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 12619 entries from dependency cache.
Parsing recipes...done.
Parsing of 7347 .bb files complete (7341 cached, 6 parsed). 12622 targets, 353 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:71788c99209918c19104de10497262557ed6e44e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  17% |######                              | ETA:  0:00:00
Adding changed files:  35% |############                        | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/a/aiohttp/aiohttp-3.8.5.tar.gz;downloadfilename=aiohttp-3.8.5.tar.gz...
INFO: Rebasing devtool onto 3fc71a73d2d69d1691c227bd2a4db7791747582b
Traceback (most recent call last):
  File "/home/auh/Projects/poky/scripts/devtool", line 349, in <module>
    ret = main()
  File "/home/auh/Projects/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/auh/Projects/poky/scripts/lib/devtool/upgrade.py", line 565, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/home/auh/Projects/poky/scripts/lib/devtool/upgrade.py", line 473, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
FileNotFoundError: [Errno 2] No such file or directory: '/scratch1/auh/build-auh/workspace/sources/python3-aiohttp/LICENSE.txt'


Next steps:
    - apply the patch: git am 0001-python3-aiohttp-upgrade-3.8.4-3.8.5.patch
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
From 18b3abe5e688190047517233b16853f088afeaec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sun, 30 Jul 2023 18:59:49 -0500
Subject: [PATCH] python3-aiohttp: upgrade 3.8.4 -> 3.8.5

---
 ...python3-google-api-python-client_2.95.0.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb
new file mode 100644
index 000000000..c8625838b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
+Moderator, and many other Google APIs."
+HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "d2731ede12f79e53fbe11fdb913dfe986440b44c0a28431c78a8ec275f4c1541"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-httplib2 \
+    ${PYTHON_PN}-uritemplate \
+    ${PYTHON_PN}-google-api-core \
+"
-- 
2.25.1


--===============3996185603599457568==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-aiohttp-upgrade-3.8.4-3.8.5.patch"

From 18b3abe5e688190047517233b16853f088afeaec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sun, 30 Jul 2023 18:59:49 -0500
Subject: [PATCH] python3-aiohttp: upgrade 3.8.4 -> 3.8.5

---
 ...python3-google-api-python-client_2.95.0.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb
new file mode 100644
index 000000000..c8625838b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.95.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
+Moderator, and many other Google APIs."
+HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "d2731ede12f79e53fbe11fdb913dfe986440b44c0a28431c78a8ec275f4c1541"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-httplib2 \
+    ${PYTHON_PN}-uritemplate \
+    ${PYTHON_PN}-google-api-core \
+"
-- 
2.25.1


--===============3996185603599457568==--

