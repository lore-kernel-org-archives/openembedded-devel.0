Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T4pZY-0003fI-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 10:48:56 +0200
Received: by bkcik5 with SMTP id ik5so497328bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=biJPERQYpUDgyfpvXD1bsd1OzFbgZ2m5T5DoZWUXVnc=;
	b=YBE8ZsX920EgTLWTM52CbThAZxTApMMmgkwPFCXqnSuvpbwLKhoGP3vGG1sEJdqz/b
	ql857ilGq2XGg6OP1nWw8O/EkuiDU167Hp2iDOMlE1A7+O5vPZhF/2qTBH/yeTmTb5HU
	xhp7xHLmhLM+eqwDfbAxmy6X+GKKf1kuEaNOCs0ilaMDeu1e0ZaPItd5J2/pdwClZp8L
	l3IgFyxvthGkVzYOiyxNfnHMR/iyOZ8a1liHo3dyXpL42kqK61N+YPpBat5cDU8EQMW2
	tX+s4Rxp0pWKwxIENgpJ9Cll0S6dMd7ggBwVfoEVLsX2wCUn5YOufMCvFF/LlvBTG6pR
	1vSg==
Received: by 10.204.156.10 with SMTP id u10mr1570789bkw.11.1345797409084;
	Fri, 24 Aug 2012 01:36:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id m9sm5877962bkm.10.2012.08.24.01.36.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 01:36:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2012 10:36:06 +0200
Message-Id: <1345797366-17322-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] pixman: fix qemu workaround
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
X-List-Received-Date: Fri, 24 Aug 2012 08:48:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...lated-workarounds-in-cpu-features-detecti.patch |   63 ++++++++++----------
 .../xorg-lib/pixman_0.27.2.bbappend                |    2 +
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
1.7.6.5



