Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8917579010
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 15:02:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s12-v6so3292185wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Bj4RfYe7Deq1j5Uy8wHuOGJqmwtbidNCdm7qP6mjdTw=;
	b=sl7yL/N7O4yz+r/Oqut0Ewadg4WB1uX3Gz9D6mkTxD+uiNhgkiuQOmz2rCMmm6taaT
	1LGvczKXGgbvkPYX7WDuiRP0BQ6OXmAjaUwWlIMINJFHok6+ion1a536ySiUrCN2yKm/
	910160xHSpsBDZ4BPwFKrkRD3jynxvV/NaTNVENJwvfdEQtfbrCDU7c/+ThTR/tWAh3R
	1O5/E8rxDWEI7QKWOpEF0hpUsh6VvBKLUUM0Xmv+Mxhikivr8xY1E5ouIjnmD/P3u3o/
	S9feWq81NQDbQwP4tFIi4GzzyHTw2Qz5N5lBwjvHNh7MnpIUB+HzomQW3FvnTk7mDXIl
	njKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bj4RfYe7Deq1j5Uy8wHuOGJqmwtbidNCdm7qP6mjdTw=;
	b=CGgAkMA96sb4Y1jETF0xeciz/ecpnxiLbfUv4zApW/fO6xeXxOP4v6nsPikIfqGZhp
	pOBwlYzKh6iCZSnQaTKYb/JTAzrhWwPOw1Ay0z0C+76YeZu/hroCZn5pNpZ/HCGGzm/+
	d59bTGcaUBWCEQKwfnmmCi4g0Ey1L3f7Uyy/7aZssW8jrgrRpVHLhwxlkLrf/dbS0Ofp
	0OZYKrK3G4sKFPVR2ukL19pc8AK8wjHuyEKUavna1n6SzgV6Mknmr6az3/PoUvnGWZ5g
	0Nv9z7JeNHwUCJxeY0IREoB3Bn4fMGqMIh7nF5xbs8Y+57zm7dD24uecc6NN0o+Kzz68
	QauA==
X-Gm-Message-State: AOUpUlHL22HYCYmbmkqWHxz6S8oDnlPQbMEhKoq+LAKQylZJypqHniTi
	4nzzU0Df42yn2ZFDXOUsq++btfTJ
X-Google-Smtp-Source: AA+uWPxTmfoGYQlnUtB4gSxw5M3NFVo8D8IiDUD2Foo/2ahi9i5LdiWiX7BF+SSG7NVWfJRBr+WuMQ==
X-Received: by 2002:a1c:9e4d:: with SMTP id
	h74-v6mr30161648wme.70.1534863762932; 
	Tue, 21 Aug 2018 08:02:42 -0700 (PDT)
Received: from localhost.localdomain
	(host160-253-dynamic.41-79-r.retail.telecomitalia.it.
	[79.41.253.160]) by smtp.gmail.com with ESMTPSA id
	p89-v6sm26869719wrc.97.2018.08.21.08.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 08:02:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 17:02:37 +0200
Message-Id: <1534863757-25115-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: rework Makefile patch for purgatory
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
X-List-Received-Date: Tue, 21 Aug 2018 15:02:42 -0000

Replace previous hack, wrap linker LDFLAGS for compatibility with
klcc.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0011-purgatory-Makefile-adapt-to-klcc.patch    | 33 +++++++++-------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
index 0ae2be7..a459d45 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -1,17 +1,16 @@
-From fa3844ce6ce95f2db142b6c77f077b3e704d4f6f Mon Sep 17 00:00:00 2001
+From 9b6866b106eb3ad11115bd591a23e65a68dd847d Mon Sep 17 00:00:00 2001
 From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 17 Apr 2018 19:12:14 +0200
-Subject: [PATCH] purgatory Makefile: adapt to klcc
+Date: Tue, 21 Aug 2018 16:31:44 +0200
+Subject: [PATCH 11/11] purgatory Makefile: adapt to klcc
 
 Upstream-Status: Inappropriate [klibc specific]
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
 ---
- purgatory/Makefile | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
+ purgatory/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 49ce80a..da36075 100644
+index 49ce80a..72eefaa 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
 @@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
@@ -23,21 +22,17 @@ index 49ce80a..da36075 100644
  		      -fno-zero-initialized-in-bss \
  		      -fno-PIC -fno-PIE -fno-stack-protector
  
-@@ -59,13 +59,14 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -59,8 +59,8 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
 -			-Wl,--no-undefined -nostartfiles -nostdlib \
-+			--no-undefined -nostartfiles -nostdlib \
- 			-nodefaultlibs -e purgatory_start -r \
--			-Wl,-Map=$(PURGATORY_MAP)
-+			-Map=$(PURGATORY_MAP)
+-			-nodefaultlibs -e purgatory_start -r \
++			-Wl,--no-undefined -Wl,-nostartfiles -Wl,-nostdlib \
++			-Wl,-nodefaultlibs -Wl,--entry=purgatory_start -Wl,-r \
+ 			-Wl,-Map=$(PURGATORY_MAP)
  
  $(PURGATORY): $(PURGATORY_OBJS)
- 	$(MKDIR) -p $(@D)
--	$(CC) $(CFLAGS) $(LDFLAGS) -o $@.sym $^
-+#	$(CC) $(CFLAGS) -o $@.sym $^
-+	$(LD) $(LDFLAGS) -o $@.sym $^
- #	$(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) --no-undefined -e purgatory_start -r -o $@ $(PURGATORY_OBJS) $(UTIL_LIB)
- 	$(STRIP) --strip-debug -o $@ $@.sym
- 
+-- 
+2.7.4
+
-- 
2.7.4


