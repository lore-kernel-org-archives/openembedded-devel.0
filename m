Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB233C07352
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1699061895893924145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LAgCjvhz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Id90P71u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b97fb149e-4b6f81aa-9d6b-468e-8485-ae21641454a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ijcRu4I7e28KhAO64A0jiLg/xFZnekIaiLESI51RXw=;
	b=LAgCjvhzJ1WlN+RIUAwIxStaQL2OWu4t/QD3P8xFBUAUh4Y4Cmq7qa//31qqW7OD
	TK9hiGIaipND7WwkcaYCYAyoJyLhBly00hB3upJ12iP0q8sfHBltrUTE4zqh6UxF0QI
	K59bgtSUbEh87F/OH5Oh6aYj5BKQMtekGWTfez14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ijcRu4I7e28KhAO64A0jiLg/xFZnekIaiLESI51RXw=;
	b=Id90P71u1ZAS3Wk1vThLvLJZvqPluIhx+hbn9s+14OzPeUtpDYirvQj+rqF/2rWO
	deb5BDDJT2yY80CyGMmGtzEa26vTBiQMczxC4XnAFbbvfaKM0kiCZ3MGDQdTVxvZvcO
	n/Ai32/M8H8OlGxhkZ6ftybMetjpkVzZrzssNNCA=
Content-Type: multipart/mixed; boundary="===============8191827040945955278=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pocketsphinx: upgrading to 5.0.2 FAILED
Message-ID: <0101018b97fb149e-4b6f81aa-9d6b-468e-8485-ae21641454a0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106139

--===============8191827040945955278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pocketsphinx* to *5.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pocketsphinx-upgrade-0.1.15-5.0.2.patch
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
From 218687b6184096caeaf7bf48c44ee13f259d612f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 23:18:53 +0000
Subject: [PATCH] python3-pocketsphinx: upgrade 0.1.15 -> 5.0.2

---
 .../python/python3-pocketsphinx_0.1.15.bb     |  14 --
 .../python/python3-pocketsphinx_5.0.2.bb      | 151 ++++++++++++++++++
 2 files changed, 151 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
deleted file mode 100644
index f7ffd9d26..000000000
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
-DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
-HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
-
-SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
-SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
-
-inherit pypi setuptools3 features_check
-
-DEPENDS += "swig-native pulseaudio"
-REQUIRED_DISTRO_FEATURES += "pulseaudio"
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb
new file mode 100644
index 000000000..dd6fa020c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb
@@ -0,0 +1,151 @@
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
+# -Copyright (c) 1999-2016 Carnegie Mellon University. All rights
+# +Copyright (c) 1999-2016 Carnegie Mellon University.  All rights
+#  reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# @@ -20,11 +20,117 @@
+#  THIS SOFTWARE IS PROVIDED BY CARNEGIE MELLON UNIVERSITY ``AS IS'' AND 
+#  ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
+#  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# -PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
+# +PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY
+#  NOR ITS EMPLOYEES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
+#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
+#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
+#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
+#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
+# -OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +WebRTC VAD code (in src/vad):
+# +
+# +Copyright (c) 2011, The WebRTC project authors. All rights reserved.
+# +
+# +Redistribution and use in source and binary forms, with or without
+# +modification, are permitted provided that the following conditions are
+# +met:
+# +
+# +  * Redistributions of source code must retain the above copyright
+# +    notice, this list of conditions and the following disclaimer.
+# +
+# +  * Redistributions in binary form must reproduce the above copyright
+# +    notice, this list of conditions and the following disclaimer in
+# +    the documentation and/or other materials provided with the
+# +    distribution.
+# +
+# +  * Neither the name of Google nor the names of its contributors may
+# +    be used to endorse or promote products derived from this software
+# +    without specific prior written permission.
+# +
+# +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+# +"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+# +LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+# +A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+# +HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+# +SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+# +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# +DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# +THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# +(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# +OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +Python WebRTC VAD code and test files (in cython and test/data/vad):
+# +
+# +The MIT License (MIT)
+# +
+# +Copyright (c) 2016 John Wiseman
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +SOFTWARE.
+# +
+# +JSON parser (in src/jsmn.h):
+# +
+# +Copyright (c) 2010 Serge A. Zaitsev
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is
+# +furnished to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in
+# +all copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+# +THE SOFTWARE.
+# +
+# +Escaping code in JSON serialization (src/ps_config.c):
+# +
+# +Copyright (C) 2014 James McLaughlin.  All rights reserved.
+# +https://github.com/udp/json-builder
+# +
+# +Redistribution and use in source and binary forms, with or without
+# +modification, are permitted provided that the following conditions
+# +are met:
+# +
+# +1. Redistributions of source code must retain the above copyright
+# +  notice, this list of conditions and the following disclaimer.
+# +
+# +2. Redistributions in binary form must reproduce the above copyright
+# +  notice, this list of conditions and the following disclaimer in the
+# +  documentation and/or other materials provided with the distribution.
+# +
+# +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+# +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+# +ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+# +FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+# +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+# +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+# +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+# +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+# +SUCH DAMAGE.
+# 
+#
+
+SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
+DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
+HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
+
+SRC_URI[sha256sum] = "e976dd55ffb26f5d4e14f2b4c7b69c200ed337107f45b79b66b415c388c3fc00"
+
+inherit pypi setuptools3 features_check
+
+DEPENDS += "swig-native pulseaudio"
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.39.2


--===============8191827040945955278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5018 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:e82d95a5fcd450748d1bc367a489ccf8db0b8251"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 542 Local 533 Mirrors 0 Missed 9 Current 469 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 478 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 480 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 529 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 1011 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1011 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 686 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe swig-native-4.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running task 654 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_fetch)
NOTE: recipe swig-native-4.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1011 (virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/swig/swig_4.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 658 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_unpack)
NOTE: recipe swig-native-4.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe swig-native-4.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 969 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1597 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_patch)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_patch: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1011 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2593 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2729 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2733 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_configure)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_configure: Started
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 2745 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_compile)
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/pocketsphinx-5.0.2/setup.py", line 1, in <module>
|     from skbuild import setup
| ModuleNotFoundError: No module named 'skbuild'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155, line 184
NOTE: recipe python3-pocketsphinx-5.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2734 tasks of which 2727 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103231819.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103231819.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pocketsphinx-5.0.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pocketsphinx-5.0.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/run.do_compile.682155', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.2/temp/log.do_compile.682155
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.2.bb:do_compile) failed with exit code '1'

--===============8191827040945955278==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pocketsphinx-upgrade-0.1.15-5.0.2.patch"

RnJvbSAyMTg2ODdiNjE4NDA5NmNhZWFmN2JmNDhjNDRlZTEzZjI1OWQ2MTJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzoxODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ja2V0c3BoaW54OiB1cGdyYWRlIDAuMS4xNSAtPiA1LjAuMgoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtcG9ja2V0c3BoaW54XzAuMS4xNS5iYiAgICAgfCAgMTQgLS0KIC4uLi9weXRo
b24vcHl0aG9uMy1wb2NrZXRzcGhpbnhfNS4wLjIuYmIgICAgICB8IDE1MSArKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcG9ja2V0c3BoaW54XzAuMS4xNS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ja2V0c3BoaW54XzUuMC4y
LmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1wb2NrZXRzcGhpbnhfMC4xLjE1LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1wb2NrZXRzcGhpbnhfMC4xLjE1LmJiCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCBmN2ZmZDlkMjYuLjAwMDAwMDAwMAotLS0gYS9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvY2tldHNwaGlueF8wLjEuMTUuYmIKKysrIC9k
ZXYvbnVsbApAQCAtMSwxNCArMCwwIEBACi1TVU1NQVJZID0gIlRoaXMgcGFja2FnZSBwcm92aWRl
cyBhIHB5dGhvbiBpbnRlcmZhY2UgdG8gQ01VIFNwaGlueGJhc2UgYW5kIFBvY2tldHNwaGlueCBs
aWJyYXJpZXMgY3JlYXRlZCB3aXRoIFNXSUcgYW5kIFNldHVwdG9vbHMuIgotREVTQ1JJUFRJT04g
PSAiUHl0aG9uIGludGVyZmFjZSB0byBDTVUgU3BoaW54YmFzZSBhbmQgUG9ja2V0c3BoaW54IGxp
YnJhcmllcyIKLUhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9iYW1ib2NoZXIvcG9ja2V0
c3BoaW54LXB5dGhvbiIKLVNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgotTElDRU5TRSA9ICJCU0Qt
Mi1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04MjZlYmRh
Nzg3ZWI0OGU3OGFlYzI2MjRmOWZhYmE3MiIKLQotU1JDX1VSSVttZDVzdW1dID0gIjk0ZDAwOGVl
YmVhMTZhY2I2MGE5ZmZlNjE0NTc1ZGVlIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM0ZDI5MDc0
NWM3ZGJlNmZhMmNhYzk4MTViNWMxOWQxMGYzOTNlNTI4ZWNkNzBlNzc5YzIxZWJjNDQ4ZjliNjMi
Ci0KLWluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBmZWF0dXJlc19jaGVjawotCi1ERVBFTkRTICs9
ICJzd2lnLW5hdGl2ZSBwdWxzZWF1ZGlvIgotUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTICs9ICJw
dWxzZWF1ZGlvIgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wb2NrZXRzcGhpbnhfNS4wLjIuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvY2tldHNwaGlueF81LjAuMi5iYgpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmRkNmZhMDIwYwotLS0gL2Rldi9udWxsCisrKyBiL21l
dGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ja2V0c3BoaW54XzUu
MC4yLmJiCkBAIC0wLDAgKzEsMTUxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQor
IyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMTk5OS0y
MDE2IENhcm5lZ2llIE1lbGxvbiBVbml2ZXJzaXR5LiBBbGwgcmlnaHRzCisjICtDb3B5cmlnaHQg
KGMpIDE5OTktMjAxNiBDYXJuZWdpZSBNZWxsb24gVW5pdmVyc2l0eS4gIEFsbCByaWdodHMKKyMg
IHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQg
YmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgQEAgLTIwLDExICsyMCwxMTcgQEAKKyMg
IFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgQ0FSTkVHSUUgTUVMTE9OIFVOSVZFUlNJVFkg
YGBBUyBJUycnIEFORCAKKyMgIEFOWSBFWFBSRVNTRUQgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJ
TkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgCisjICBUSEUgSU1QTElFRCBXQVJSQU5USUVT
IE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSCisjIC1QVVJQ
T1NFIEFSRSBESVNDTEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBDQVJORUdJRSBNRUxMT04gVU5J
VkVSU0lUWQorIyArUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4gIElOIE5PIEVWRU5UIFNIQUxMIENB
Uk5FR0lFIE1FTExPTiBVTklWRVJTSVRZCisjICBOT1IgSVRTIEVNUExPWUVFUyBCRSBMSUFCTEUg
Rk9SIEFOWSBESVJFQ1QsIElORElSRUNULCBJTkNJREVOVEFMLAorIyAgU1BFQ0lBTCwgRVhFTVBM
QVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElORywgQlVUIE5PVCAKKyMgIExJ
TUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNUSVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExP
U1MgT0YgVVNFLCAKKyMgIERBVEEsIE9SIFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElP
TikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWSAKKyMgIFRIRU9SWSBPRiBMSUFCSUxJVFksIFdI
RVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQgCisjICAoSU5DTFVE
SU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBBUklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRI
RSBVU0UgCisjIC1PRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJ
QklMSVRZIE9GIFNVQ0ggREFNQUdFLitPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElGIEFEVklTRUQg
T0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyArCisjICtXZWJSVEMgVkFEIGNv
ZGUgKGluIHNyYy92YWQpOgorIyArCisjICtDb3B5cmlnaHQgKGMpIDIwMTEsIFRoZSBXZWJSVEMg
cHJvamVjdCBhdXRob3JzLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyArCisjICtSZWRpc3RyaWJ1
dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQK
KyMgK21vZGlmaWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dp
bmcgY29uZGl0aW9ucyBhcmUKKyMgK21ldDoKKyMgKworIyArICAqIFJlZGlzdHJpYnV0aW9ucyBv
ZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0CisjICsgICAgbm90
aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVy
LgorIyArCisjICsgICogUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVwcm9k
dWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQKKyMgKyAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25k
aXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4KKyMgKyAgICB0aGUgZG9jdW1l
bnRhdGlvbiBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlCisjICsgICAg
ZGlzdHJpYnV0aW9uLgorIyArCisjICsgICogTmVpdGhlciB0aGUgbmFtZSBvZiBHb29nbGUgbm9y
IHRoZSBuYW1lcyBvZiBpdHMgY29udHJpYnV0b3JzIG1heQorIyArICAgIGJlIHVzZWQgdG8gZW5k
b3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlCisjICsg
ICAgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Npb24uCisjICsKKyMgK1RI
SVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05U
UklCVVRPUlMKKyMgKyJBUyBJUyIgQU5EIEFOWSBFWFBSRVNTIE9SIElNUExJRUQgV0FSUkFOVElF
UywgSU5DTFVESU5HLCBCVVQgTk9UCisjICtMSU1JVEVEIFRPLCBUSEUgSU1QTElFRCBXQVJSQU5U
SUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBGT1IKKyMgK0EgUEFSVElDVUxBUiBQ
VVJQT1NFIEFSRSBESVNDTEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUCisj
ICtIT0xERVIgT1IgQ09OVFJJQlVUT1JTIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJF
Q1QsIElOQ0lERU5UQUwsCisjICtTUEVDSUFMLCBFWEVNUExBUlksIE9SIENPTlNFUVVFTlRJQUwg
REFNQUdFUyAoSU5DTFVESU5HLCBCVVQgTk9UCisjICtMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBP
RiBTVUJTVElUVVRFIEdPT0RTIE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwKKyMgK0RBVEEsIE9S
IFBST0ZJVFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9O
IEFOWQorIyArVEhFT1JZIE9GIExJQUJJTElUWSwgV0hFVEhFUiBJTiBDT05UUkFDVCwgU1RSSUNU
IExJQUJJTElUWSwgT1IgVE9SVAorIyArKElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lT
RSkgQVJJU0lORyBJTiBBTlkgV0FZIE9VVCBPRiBUSEUgVVNFCisjICtPRiBUSElTIFNPRlRXQVJF
LCBFVkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAr
CisjICtQeXRob24gV2ViUlRDIFZBRCBjb2RlIGFuZCB0ZXN0IGZpbGVzIChpbiBjeXRob24gYW5k
IHRlc3QvZGF0YS92YWQpOgorIyArCisjICtUaGUgTUlUIExpY2Vuc2UgKE1JVCkKKyMgKworIyAr
Q29weXJpZ2h0IChjKSAyMDE2IEpvaG4gV2lzZW1hbgorIyArCisjICtQZXJtaXNzaW9uIGlzIGhl
cmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBj
b3B5CisjICtvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmls
ZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAorIyAraW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQg
cmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAr
dG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNl
bnNlLCBhbmQvb3Igc2VsbAorIyArY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1p
dCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjICtmdXJuaXNoZWQgdG8gZG8gc28s
IHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyArCisjICtUaGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNs
dWRlZCBpbiBhbGwKKyMgK2NvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisjICsKKyMgK1RIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VU
IFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjICtJTVBMSUVELCBJTkNMVURJTkcg
QlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMg
K0ZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRQorIyArQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBM
SUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyArTElBQklMSVRZLCBXSEVU
SEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcg
RlJPTSwKKyMgK09VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRI
RSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFCisjICtTT0ZUV0FSRS4KKyMgKworIyArSlNP
TiBwYXJzZXIgKGluIHNyYy9qc21uLmgpOgorIyArCisjICtDb3B5cmlnaHQgKGMpIDIwMTAgU2Vy
Z2UgQS4gWmFpdHNldgorIyArCisjICtQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICtvZiB0aGlzIHNv
ZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUi
KSwgdG8gZGVhbAorIyAraW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1
ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyArdG8gdXNlLCBjb3B5LCBtb2Rp
ZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAor
IyArY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20g
dGhlIFNvZnR3YXJlIGlzCisjICtmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZv
bGxvd2luZyBjb25kaXRpb25zOgorIyArCisjICtUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBh
bmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyArYWxsIGNv
cGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICsKKyMgK1RI
RSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBL
SU5ELCBFWFBSRVNTIE9SCisjICtJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRP
IFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgK0ZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRI
RQorIyArQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJ
TSwgREFNQUdFUyBPUiBPVEhFUgorIyArTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBP
RiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgK09VVCBPRiBP
UiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVB
TElOR1MgSU4KKyMgK1RIRSBTT0ZUV0FSRS4KKyMgKworIyArRXNjYXBpbmcgY29kZSBpbiBKU09O
IHNlcmlhbGl6YXRpb24gKHNyYy9wc19jb25maWcuYyk6CisjICsKKyMgK0NvcHlyaWdodCAoQykg
MjAxNCBKYW1lcyBNY0xhdWdobGluLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgK2h0dHBzOi8v
Z2l0aHViLmNvbS91ZHAvanNvbi1idWlsZGVyCisjICsKKyMgK1JlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyArbW9kaWZp
Y2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRp
b25zCisjICthcmUgbWV0OgorIyArCisjICsxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNv
ZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAorIyArICBub3RpY2UsIHRoaXMgbGlz
dCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIuCisjICsKKyMgKzIu
IFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUg
Y29weXJpZ2h0CisjICsgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBm
b2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0aGUKKyMgKyAgZG9jdW1lbnRhdGlvbiBhbmQvb3Igb3Ro
ZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGggdGhlIGRpc3RyaWJ1dGlvbi4KKyMgKworIyArVEhJ
UyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUgQVVUSE9SIEFORCBDT05UUklCVVRPUlMgYGBB
UyBJUycnIEFORAorIyArQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJ
TkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCisjICtJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVS
Q0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRQorIyArQVJF
IERJU0NMQUlNRUQuICBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQVVUSE9SIE9SIENPTlRSSUJVVE9S
UyBCRSBMSUFCTEUKKyMgK0ZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BF
Q0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMCisjICtEQU1BR0VTIChJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUworIyAr
T1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJ
TlRFUlJVUFRJT04pCisjICtIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVAorIyArTElBQklMSVRZLCBPUiBUT1JU
IChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWQor
IyArT1VUIE9GIFRIRSBVU0UgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9GIFRI
RSBQT1NTSUJJTElUWSBPRgorIyArU1VDSCBEQU1BR0UuCisjIAorIworCitTVU1NQVJZID0gIlRo
aXMgcGFja2FnZSBwcm92aWRlcyBhIHB5dGhvbiBpbnRlcmZhY2UgdG8gQ01VIFNwaGlueGJhc2Ug
YW5kIFBvY2tldHNwaGlueCBsaWJyYXJpZXMgY3JlYXRlZCB3aXRoIFNXSUcgYW5kIFNldHVwdG9v
bHMuIgorREVTQ1JJUFRJT04gPSAiUHl0aG9uIGludGVyZmFjZSB0byBDTVUgU3BoaW54YmFzZSBh
bmQgUG9ja2V0c3BoaW54IGxpYnJhcmllcyIKK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9iYW1ib2NoZXIvcG9ja2V0c3BoaW54LXB5dGhvbiIKK1NFQ1RJT04gPSAiZGV2ZWwvcHl0aG9u
IgorTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT1jNGQ3MjBjZGM5YzY5NTMwOTFmNjVlOGIwMTUyNGJiNCIKKworU1JDX1VSSVtz
aGEyNTZzdW1dID0gImU5NzZkZDU1ZmZiMjZmNWQ0ZTE0ZjJiNGM3YjY5YzIwMGVkMzM3MTA3ZjQ1
Yjc5YjY2YjQxNWMzODhjM2ZjMDAiCisKK2luaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBmZWF0dXJl
c19jaGVjaworCitERVBFTkRTICs9ICJzd2lnLW5hdGl2ZSBwdWxzZWF1ZGlvIgorUkVRVUlSRURf
RElTVFJPX0ZFQVRVUkVTICs9ICJwdWxzZWF1ZGlvIgotLSAKMi4zOS4yCgo=

--===============8191827040945955278==--

