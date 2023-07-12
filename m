Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835B0C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.974.1689139871672603887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=B/V/MioC;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFF2A1BF205
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139870;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=oEtEaQGntgHzuG5+GR8SrBp7WdZEVZFIpd9vluH2aCQ=;
	b=B/V/MioCf/1tqcvGz0p2AZVqB8zAO/7bLmgqepo2LADJXZl9DzwDjhNeO2yiuD7MSKhEhp
	V8g8QqyoxrAMeJVek/KWxLXvwJpDCMlfnUZcG++H0p4jokT4Z5QH+Ht4aWzvv0yrj9CF6R
	SX29RQClUWJKrYnTl7C8S8O3oYeImx1XZTD7XqRylPDrsIvJVzta7eLgY+GlgWMhn9T82K
	czF5d410tx7K+waJbv8lCh7XnmDC1uACkSavpS/lTRymSPInExn8liBH3/F5A4ZJmbCqxO
	hNBb6+VrY9n5Ras+nYuKrDUBEgexlJY97ssVTDJhpHzHNUaNjzoIgAt/iW43hw==
Content-Type: multipart/mixed; boundary="===============6227238262101682088=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pocketsphinx: upgrading to 5.0.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103787
Message-Id: <20230712053120.835B0C001DF@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:20 +0000 (UTC)

--===============6227238262101682088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pocketsphinx* to *5.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pocketsphinx-upgrade-0.1.15-5.0.1.patch
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
From f521c45dd47fba61a54e5ec852dd514b809d69fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:09:32 -0500
Subject: [PATCH] python3-pocketsphinx: upgrade 0.1.15 -> 5.0.1

---
 .../python/python3-pocketsphinx_0.1.15.bb     |  14 --
 .../python/python3-pocketsphinx_5.0.1.bb      | 151 ++++++++++++++++++
 2 files changed, 151 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb

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
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
new file mode 100644
index 000000000..3bb475514
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
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
+SRC_URI[sha256sum] = "cadfe42cf1596399ff1a6818ad75970c658e567c7250d67e758b29444facede9"
+
+inherit pypi setuptools3 features_check
+
+DEPENDS += "swig-native pulseaudio"
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.25.1


--===============6227238262101682088==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pocketsphinx-upgrade-0.1.15-5.0.1.patch"

From f521c45dd47fba61a54e5ec852dd514b809d69fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 21:09:32 -0500
Subject: [PATCH] python3-pocketsphinx: upgrade 0.1.15 -> 5.0.1

---
 .../python/python3-pocketsphinx_0.1.15.bb     |  14 --
 .../python/python3-pocketsphinx_5.0.1.bb      | 151 ++++++++++++++++++
 2 files changed, 151 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb

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
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
new file mode 100644
index 000000000..3bb475514
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb
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
+SRC_URI[sha256sum] = "cadfe42cf1596399ff1a6818ad75970c658e567c7250d67e758b29444facede9"
+
+inherit pypi setuptools3 features_check
+
+DEPENDS += "swig-native pulseaudio"
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.25.1


--===============6227238262101682088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12762 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:22e5067f92bec36b1b0e78937de2ac92467c6e66"
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
meta-perl            = "tmp-auh-upgrades:22e5067f92bec36b1b0e78937de2ac92467c6e66"
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
meta-perl            = "tmp-auh-upgrades:22e5067f92bec36b1b0e78937de2ac92467c6e66"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 411 Local 12 Mirrors 391 Missed 8 Current 260 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 671 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 269 of 671 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1805 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_fetch)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2119 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_unpack)
NOTE: Running task 2120 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2121 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_patch)
NOTE: Running task 2122 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_configure)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_configure: Started
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2126 of 2135 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_compile)
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.1-r0/pocketsphinx-5.0.1/setup.py", line 1, in <module>
|     from skbuild import setup
| ModuleNotFoundError: No module named 'skbuild'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-pocketsphinx-5.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2126 tasks of which 2119 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pocketsphinx-5.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pocketsphinx-5.0.1-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.1-r0/temp/run.do_compile.1375368', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-pocketsphinx/5.0.1-r0/temp/log.do_compile.1375368
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.1.bb:do_compile) failed with exit code '1'

--===============6227238262101682088==--

