Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 57E1D6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Aug 2017 17:18:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h75so901896pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Aug 2017 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jcsUyiwHsDXmony+s6uu/vChZkTdEwJUNbSESQmuilU=;
	b=hWorQMybw3T6audqeb9QCvNcq6ljLS+mRU7D8noGxR+FdMJj9/e3c9YiaBOiLQOZq6
	QhTWV5oxk8BEViACz/88ALncx21fOL2dgLga4F62ZUS64LtThnX0uFCsXf740L3yFE7d
	PYZBKQ6r49W/0uqV5cRrTYc8suShrlYV9dRa03yqLGYypPXGmB/WodkiuZnfyqzrjSkn
	pNGqbHyhkeJz8m/TGDBBvzXQtkndu6beyRqxFkyDaMX6UHI7/QJ2SK+PyrZjzqh1PTvK
	dsBrNXD7QkCE0t5J+r9+5qXwmXR+h3EbLJQu6ysTHovUGq836b94wpfmWHN2Tu5soXQN
	mcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jcsUyiwHsDXmony+s6uu/vChZkTdEwJUNbSESQmuilU=;
	b=CouvxCgLRoAoQZbeNsCJ7n07rdPfeUJL94zbmhmx4T6YDosKD81FfKFDJChz/GG568
	T8aTuVbOAf8/7jNncxsk0B41r4Lbk/sLP+uuobxrd76Mt1FA7l4kvMznssebsLGB3N4/
	hRGq0neQMLj0LwErOMFAfqvbPdsNyz9/5Gt886utXttUmx1BO3Eo+fCRQJdA/fXYphhg
	a0nHhQRIAlGBPAXS18xuNQVHXM/8bJyMnQtrM+s8g5GDEFE89QRmHMF1itYDSenxts6y
	Z0PPj/KUc/VCVVlafQOCeGOe1f4A9GO2qiXXDasHHRtuyK8DUf2HM3VRUKxD6CbkchuK
	UoFA==
X-Gm-Message-State: AIVw112jSreU/FmQ14rC0/Gv5t0tOhgbA71bItYkjEye/QxTA0r53HJ5
	C9laUarmd68lDEm6
X-Received: by 10.98.9.135 with SMTP id 7mr2382694pfj.15.1501780740212;
	Thu, 03 Aug 2017 10:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	z189sm55920723pgb.12.2017.08.03.10.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 10:18:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Aug 2017 10:18:50 -0700
Message-Id: <20170803171850.22412-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.4
Subject: [meta-browser][PATCH V2] chromium: Disable use_sysroot
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
X-List-Received-Date: Thu, 03 Aug 2017 17:18:59 -0000

This variable is required to be unset so that we
can tell the system that we are using a different
newer C++ runtime library than the sysroot which
helps in compiling with clang also

Fixes link errors like
undefined reference to '__atomic_is_lock_free'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/files/aarch64/oe-defaults.gypi | 3 ++-
 recipes-browser/chromium/files/armv6/oe-defaults.gypi   | 3 ++-
 recipes-browser/chromium/files/armv7a/oe-defaults.gypi  | 3 ++-
 recipes-browser/chromium/files/armv7ve/oe-defaults.gypi | 3 ++-
 recipes-browser/chromium/files/x86-64/oe-defaults.gypi  | 1 +
 recipes-browser/chromium/files/x86/oe-defaults.gypi     | 1 +
 6 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
index 27e1cfe..cfdeab6 100644
--- a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
@@ -10,6 +10,7 @@
     'use_kerberos': 0,
     'use_cups': 0,
     'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
+    'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv6/oe-defaults.gypi b/recipes-browser/chromium/files/armv6/oe-defaults.gypi
index 27e1cfe..cfdeab6 100644
--- a/recipes-browser/chromium/files/armv6/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv6/oe-defaults.gypi
@@ -10,6 +10,7 @@
     'use_kerberos': 0,
     'use_cups': 0,
     'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
+    'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv7a/oe-defaults.gypi b/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
index 27e1cfe..cfdeab6 100644
--- a/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
@@ -10,6 +10,7 @@
     'use_kerberos': 0,
     'use_cups': 0,
     'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
+    'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
index 27e1cfe..cfdeab6 100644
--- a/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
@@ -10,6 +10,7 @@
     'use_kerberos': 0,
     'use_cups': 0,
     'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
+    'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/x86-64/oe-defaults.gypi b/recipes-browser/chromium/files/x86-64/oe-defaults.gypi
index 0a6e8e8..9f858d4 100644
--- a/recipes-browser/chromium/files/x86-64/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/x86-64/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/x86/oe-defaults.gypi b/recipes-browser/chromium/files/x86/oe-defaults.gypi
index 0a6e8e8..9f858d4 100644
--- a/recipes-browser/chromium/files/x86/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/x86/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0,
+    'use_sysroot': 0,
   }, 
 }
-- 
2.13.4


