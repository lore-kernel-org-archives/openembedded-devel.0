Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T710Q-00056H-Ck
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 11:25:42 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so696521bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=JAKtR5q3Gon1GhWMemVUbweZZgN57GgXunTxC6ltgII=;
	b=iHSXcPbWPu9vKGjo7xsqcfxEbY7krLMnVQaJUnKA9DGF41ktJAOGYMHwN0J4+sWXV8
	GBDr0lmt2/AOrcGuDYol2kSkfOko5+uC/YbaKksQGNnurGLoM4nH49Umnao0UYvlniAk
	2KoS4/jHtSXmYxUAakjAv97R7l+dY8B4UI9w0YalRVG+XAKTcsX06qyF2+VTbz0pjlpU
	aPutmx3c3qoR7nmPaWahtOP+eCpwPpHEm8/gtph6W2a3tk900Fkax/wYfble9sCusa4O
	+ukM2gLWQEL8xkzSsPMxjkPhRrnngGopEYUOH6h4P33bd8KAj+IMXd9uyW564vBEs6L3
	A08g==
Received: by 10.204.154.73 with SMTP id n9mr2323262bkw.113.1346318009535;
	Thu, 30 Aug 2012 02:13:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm631624bkv.0.2012.08.30.02.13.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 02:13:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 11:13:30 +0200
Message-Id: <624dcdc1fd83643323ecf0b426bd2ad5032f13ac.1346317656.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <]>
 <cover.1346317656.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346317656.git.Martin.Jansa@gmail.com>
References: <cover.1346317656.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] pixman: fix qemu workaround
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 09:25:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch | 63 +++++++++++-----------
 .../xorg-lib/pixman_0.27.2.bbappend                |  2 +
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
index 8a1c524..4569dca 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
@@ -1,25 +1,27 @@
-From d140e69c1d76ed61d1feb53b79820951707ee5a6 Mon Sep 17 00:00:00 2001
+From a0f53e1dbb3851bb0f0efcfdbd565b05e4be9cac Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 19 Aug 2012 15:15:45 +0200
+Date: Thu, 23 Aug 2012 18:10:57 +0200
 Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detection
  code
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-This was ported from meta-oe's patch [1]
+This was ported from meta-oe's patch [1]. The original pixman patch is found
+at [2].
 
 [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
+[2] http://lists.freedesktop.org/archives/pixman/2011-January/000906.html
 
 Upstream-Status: Inappropriate [other] qemu fix
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- pixman/pixman-arm.c |   74 +++++++++++++++++++++++++++++++++++++++++++++++---
- 1 files changed, 69 insertions(+), 5 deletions(-)
+ pixman/pixman-arm.c |   82 ++++++++++++++++++++++++++++++++++++++++----------
+ 1 files changed, 65 insertions(+), 17 deletions(-)
 
 diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
-index 23374e4..d0771fd 100644
+index 23374e4..d98bda6 100644
 --- a/pixman/pixman-arm.c
 +++ b/pixman/pixman-arm.c
 @@ -129,16 +129,35 @@ detect_cpu_features (void)
@@ -58,40 +60,34 @@ index 23374e4..d0771fd 100644
  
      fd = open ("/proc/self/auxv", O_RDONLY);
      if (fd >= 0)
-@@ -147,22 +166,23 @@ detect_cpu_features (void)
+@@ -147,32 +166,61 @@ detect_cpu_features (void)
  	{
  	    if (aux.a_type == AT_HWCAP)
  	    {
 -		uint32_t hwcap = aux.a_un.a_val;
-+		hwcap = aux.a_un.a_val;
- 
- 		/* hardcode these values to avoid depending on specific
- 		 * versions of the hwcap header, e.g. HWCAP_NEON
- 		 */
+-
+-		/* hardcode these values to avoid depending on specific
+-		 * versions of the hwcap header, e.g. HWCAP_NEON
+-		 */
 -		if ((hwcap & 64) != 0)
-+		if ((hwcap & ARM_HWCAP_VFP) != 0)
- 		    features |= ARM_VFP;
+-		    features |= ARM_VFP;
 -		if ((hwcap & 512) != 0)
-+		if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
- 		    features |= ARM_IWMMXT;
- 		/* this flag is only present on kernel 2.6.29 */
+-		    features |= ARM_IWMMXT;
+-		/* this flag is only present on kernel 2.6.29 */
 -		if ((hwcap & 4096) != 0)
-+		if ((hwcap & ARM_HWCAP_NEON) != 0)
- 		    features |= ARM_NEON;
+-		    features |= ARM_NEON;
++		hwcap = aux.a_un.a_val;
  	    }
  	    else if (aux.a_type == AT_PLATFORM)
  	    {
 -		const char *plat = (const char*) aux.a_un.a_val;
+-
+-		if (strncmp (plat, "v7l", 3) == 0)
 +		plat = (const char*) aux.a_un.a_val;
 +		plat_cnt++;
- 
- 		if (strncmp (plat, "v7l", 3) == 0)
- 		    features |= (ARM_V7 | ARM_V6);
-@@ -171,8 +191,52 @@ detect_cpu_features (void)
- 	    }
- 	}
- 	close (fd);
-+
++	    }
++	}
++	close (fd);
 +	if (plat == NULL || plat_cnt != 1 || *plat != 'v')
 +	{
 +	    /*
@@ -106,17 +102,19 @@ index 23374e4..d0771fd 100644
 +	    {
 +		if (strcmp (u.machine, "armv7l") == 0)
 +		{
-+		    features |= (ARM_V7 | ARM_V6);
+ 		    features |= (ARM_V7 | ARM_V6);
+-		else if (strncmp (plat, "v6l", 3) == 0)
 +		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
 +		    hwcap |= ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
 +		}
 +		else if (strcmp (u.machine, "armv6l") == 0)
 +		{
-+		    features |= ARM_V6;
+ 		    features |= ARM_V6;
 +		    hwcap |= ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
 +		}
-+	    }
-+	}
+ 	    }
+ 	}
+-	close (fd);
 +	else if (strncmp (plat, "v7l", 3) == 0)
 +	{
 +	    features |= (ARM_V7 | ARM_V6);
@@ -134,6 +132,7 @@ index 23374e4..d0771fd 100644
 +        features |= ARM_VFP;
 +    if ((hwcap & ARM_HWCAP_IWMMXT) != 0)
 +        features |= ARM_IWMMXT;
++    /* this flag is only present on kernel 2.6.29 */
 +    if ((hwcap & ARM_HWCAP_NEON) != 0)
 +        features |= ARM_NEON;
 +
@@ -141,5 +140,5 @@ index 23374e4..d0771fd 100644
  }
  
 -- 
-1.7.4.4
+1.7.6.5
 
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
index a04a549..c677167 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
+PRINC := "${@int(PRINC) + 1}"
+
 SRC_URI += " \
   file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
   file://0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-- 
1.7.12



