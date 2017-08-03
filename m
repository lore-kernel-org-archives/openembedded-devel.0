Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96E967199A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Aug 2017 16:43:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y129so1963479pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Aug 2017 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kCuZY3Pa4Xn9/67t4vRd/Md2gB4PkalpAcmnZrElCss=;
	b=JgFFjCpKSXnIht8jWoF6Xw2iVfcEnfD7j28hZVOcAjLgp6R/+l1c5TpXI6fkdz/E9I
	tXbO0vrYWfZwZXc2B0uhsWPaRpHZvrRKCULQwiIrNmPutGQFsBZZWVpWYAq7I32sW/qf
	b4GbjefRB5R2+SWv8o73hg5ZbzTuWIwYhsMgmxEhq59CjIwZf7GglRTbjeeFAAbiWwWb
	VIz5OpJZy7Jd9GZ+mHjOv7xwf9Hv4WAPdaRDYxiEGieQ5e4cO0avMb+eMlKxDc/Dx4mf
	nVEQ5BLWqDtJ1HZiBOerH7aqWRze12wgIUkqT7nM1bGkzg9bjN0gp57wIkX+hcuBiEJQ
	u99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kCuZY3Pa4Xn9/67t4vRd/Md2gB4PkalpAcmnZrElCss=;
	b=gSJbPKZXw61drXN3MtqtVS59kJ6CRR0DnQkXqudiBpyXbCSfqvN4q+qfCUSCB0jxC/
	yDs2kfoMDNAcm5qcHWi8ZF7x0xjCVi4njhTdeqsTFYNELCwIBFe4zN61Ci8aSFCMG7Hs
	SDxQXQQWedimkMxsV4XMnMKzbQcDMtT6kgPbeipAe/+MLP314JrBS6lGMa3UQKU9kk4J
	Kwhg2irdfW0R5Bal0Gn2bNkIhVeOxITjHf4gjE1wtXdQsgSaI4MZM9cNfVyGY9tdohGb
	xqSOf5+UDvvnMhENQRfUD2xMl4TgxoP2zO5anPk3f6s4haLuufO4jTK1ZwCVR/t5WkNW
	+rww==
X-Gm-Message-State: AIVw110ZftsbAZ6BN2UBn+rzsCq1eUdd3V6Z9PYjSxD60d/vtPC/OT4g
	SmXMroPff8F83pBi
X-Received: by 10.84.128.75 with SMTP id 69mr2558285pla.58.1501778619637;
	Thu, 03 Aug 2017 09:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	l2sm58417558pgc.27.2017.08.03.09.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 09:43:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Aug 2017 09:43:26 -0700
Message-Id: <20170803164326.11187-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.4
Subject: [meta-browser][PATCH] chromium: Disable use_sysroot
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
X-List-Received-Date: Thu, 03 Aug 2017 16:43:38 -0000

This variable is required to be unset so that we
can tell the system that we are using a different
newer C++ runtime library than the sysroot which
helps in compiling with clang also

Fixes link errors like
undefined reference to '__atomic_is_lock_free'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-browser/chromium/files/aarch64/oe-defaults.gypi | 1 +
 recipes-browser/chromium/files/armv6/oe-defaults.gypi   | 1 +
 recipes-browser/chromium/files/armv7a/oe-defaults.gypi  | 1 +
 recipes-browser/chromium/files/armv7ve/oe-defaults.gypi | 1 +
 recipes-browser/chromium/files/x86-64/oe-defaults.gypi  | 1 +
 recipes-browser/chromium/files/x86/oe-defaults.gypi     | 1 +
 6 files changed, 6 insertions(+)

diff --git a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
index 27e1cfe..3862e58 100644
--- a/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/aarch64/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv6/oe-defaults.gypi b/recipes-browser/chromium/files/armv6/oe-defaults.gypi
index 27e1cfe..3862e58 100644
--- a/recipes-browser/chromium/files/armv6/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv6/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv7a/oe-defaults.gypi b/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
index 27e1cfe..3862e58 100644
--- a/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0
+    'use_sysroot': 0,
   }, 
 }
diff --git a/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
index 27e1cfe..3862e58 100644
--- a/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
+++ b/recipes-browser/chromium/files/armv7ve/oe-defaults.gypi
@@ -11,5 +11,6 @@
     'use_cups': 0,
     'use_gnome_keyring': 0,
     'linux_link_gnome_keyring': 0
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


