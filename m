Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4BFC774D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:13:16 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id g138so3018658itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PZMiR9/EwBqpRaLLMcQP7d5TI8h3uq2tPswH7FLH5Cc=;
	b=ACx+PzVe5T926cHJJielTpw68+0k3/VrjOUBiuKxuAt7ITZR0bjBd6aRVimj3gI+OC
	3YHH1JkF5HrHniE6QbPy4XCpQJ/8pgVsD2lS0Hx1Li3H7MhT0aBms+XDA4EHjiU4/QAL
	h3vGKUf+H8AzqyO/0uAuMVwEr6HFb2BbtHwuUhAn3aZAljgU6DENu8XoDYg8BVV+TfnI
	pfsDmx7Uc1itu0aK/LUXxrazfz4RDJAhtlGIyopvFjUZr9cJxeEhFh4//LVcEUlMDkXq
	0ez8sYyqJ1e4ucXc04y5OjQjSW9bOWP60MLQv1a4dgnWbmUcBk2d6DO7yyTT9it8/kGE
	Ht2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PZMiR9/EwBqpRaLLMcQP7d5TI8h3uq2tPswH7FLH5Cc=;
	b=PPP+UyAeBTa+QWhKzJkFAK/3OhBBG8HYVsh/ZWU2/1BuAVOKJC8/Aiy37lzFESMziS
	YumAnqwb0yIYF4fmXgaNZB7iPB6OIiFZiMo5nWE2PsZFkS9LSsIqGpGYqubTeauo/KeR
	+/srCSam20BGMR90PaKHDwiUGt3X4QcOQhxf3//F1LPsY85kA02pQzuSef2yR4bxvKIh
	RT492CUO2ZS/onv6CRG0PKApyuge8K4nFP+mHcxhMaarL5N+RIYySSInQmLgxjYhdZGJ
	Q0vhPr/KT5smJ3Kclzz8S//vxtXScscb4tkzVIrU4TNsLj9OD7q2MZsaMmE/feGW9XW6
	KH0A==
X-Gm-Message-State: AFeK/H2NeWE3gmlt926xD9AsQ/yttKNFMaCfxnZU+Zij30xXlV4w9OAPM0fdarCwPvD4Xg==
X-Received: by 10.36.20.1 with SMTP id 1mr5113069itg.121.1489583597753;
	Wed, 15 Mar 2017 06:13:17 -0700 (PDT)
Received: from linux-uys3.suse (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id 10sm144319itm.12.2017.03.15.06.13.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 06:13:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 09:13:00 -0400
Message-Id: <20170315131300.10131-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
In-Reply-To: <20170315131300.10131-1-twoerner@gmail.com>
References: <20170315131300.10131-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH 2/2] chromium: add support for 32-bit raspberrypi
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
X-List-Received-Date: Wed, 15 Mar 2017 13:13:18 -0000

Apart from gcc complaining about conflicting -march and -mcpu flags, chromium
builds and runs fine as-is on 32-bit Raspberry Pi for X11.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium.inc                   |  1 +
 recipes-browser/chromium/files/armv7ve/include.gypi     |  9 +++++++++
 recipes-browser/chromium/files/armv7ve/oe-defaults.gypi | 15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 recipes-browser/chromium/files/armv7ve/include.gypi
 create mode 100644 recipes-browser/chromium/files/armv7ve/oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index e603af0..60edccb 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -6,6 +6,7 @@ COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
 
 # The build type defaults to Release. If you want a Debug build, you can set
 # the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.conf file.
diff --git a/recipes-browser/chromium/files/armv7ve/include.gypi b/recipes-browser/chromium/files/armv7ve/include.gypi
new file mode 100644
index 0000000..316cf48
--- /dev/null
+++ b/recipes-browser/chromium/files/armv7ve/include.gypi
@@ -0,0 +1,9 @@
+{
+  'variables': {
+    # Configure for armv7 compilation
+    'target_arch': 'arm',
+    'armv7': 1,
+    'arm_thumb': 1,
+    'arm_neon': 1,
+  }, 
+}
diff --git a/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
new file mode 100644
index 0000000..27e1cfe
--- /dev/null
+++ b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
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
2.12.0.rc1.48.g076c053


