Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 31ECE71999
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 05:57:18 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u62so3016161pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 22:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=K8Ih7GO7Wyp3yCndYK40N4HRYo6ykg2GbaXEtedfuvQ=;
	b=R3pmNkHVXiJTrD/xQCTKGijhclMN4NuOqQq9KW8J+nE+kgN3uMkKIMlxq/RI77cTNN
	k5KtwxL17Na/fslWOys675znCD6FjIwl8xksEW2UDnCl1m2GW5bsblYw4sOlIPuDoKcg
	QcaJOM+wPGcFPSaT3cDlKo7AysYN2nR/mC+IB6Mi3oaeLkwcpU/SsZ++NPPORlU92ib2
	UCU9grdn2R/5hRxmwVROrCziYpMLaGonQVoghDoRBSFRx+HeMfo4RMOER1R1lAcA0zBg
	vltfIJZlKxpD3mLGyYHxzrOnNmREezR9i1nEPv4Fml3pRd4h6oXfz5yRbecr7v8ZOoPO
	/Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K8Ih7GO7Wyp3yCndYK40N4HRYo6ykg2GbaXEtedfuvQ=;
	b=pt6D4igwxmHZ+t+27lNuHKeJ01K4T5wt6yXMf4Q6uiZUTNHwYXJ3MJ/5wkpedv5yjo
	ELQhnEly9ADn8fTU82VPEkArVR6w0E743KOKSLnKOY9XQ5wR4/3ruU6s8RKCTS9/qbV9
	D4eV5EUlf2RFZ9A8x9OiWJuu72s6wWyrIEpw8tdZPd5vYwOoePm5Tu9gITYXaBDvrONo
	BUxiELsURvK8zWbfWW6B1OeR6ESGPMPdHlPnCLuwKCe5VDkD/aeB+7+be6IDSgwc6IXN
	Rb2D1rBembmEypr4RIg7ok30a/F0y4quf4biHFHZ1vnXYmx2o5aGe9JkASa5mRlQszIm
	LSjA==
X-Gm-Message-State: AKS2vOz07zyyCjpNQxXe/Zm8a+QLtoTonsv+7a4ujx3xOOUXimmGaTmk
	vhYoUVmnd3qCm1so
X-Received: by 10.98.131.134 with SMTP id h128mr3615421pfe.132.1498543039444; 
	Mon, 26 Jun 2017 22:57:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	h123sm2929327pgc.36.2017.06.26.22.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 22:57:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 22:57:08 -0700
Message-Id: <20170627055709.26136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-multimedia][PATCH 1/2] cdparanoia: Fix build with security flags
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
X-List-Received-Date: Tue, 27 Jun 2017 05:57:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdparanoia/cdparanoia_10.2.bb                  |  4 ++-
 ...-for-null-buffer-before-trying-a-byteswap.patch | 31 +++++++++++++++++++++
 .../files/0002-Fix-printf-format-errors.patch      | 32 ++++++++++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch

diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
index e846e3a97..30d71ff2c 100644
--- a/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/cdparanoia_10.2.bb
@@ -13,7 +13,9 @@ SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${PV}.sr
            file://0003-Fix-missing-shared-object-LDFLAGS.patch \
            file://dont-use-internal-configs.patch \
            file://out-of-tree-build.patch \
-"
+           file://0001-check-for-null-buffer-before-trying-a-byteswap.patch \
+           file://0002-Fix-printf-format-errors.patch \
+           "
 SRC_URI[md5sum] = "b304bbe8ab63373924a744eac9ebc652"
 SRC_URI[sha256sum] = "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"
 
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
new file mode 100644
index 000000000..682cf6e03
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
@@ -0,0 +1,31 @@
+From c760c5d31f2412a5be5ac6896e6069d1cea08527 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Jun 2017 22:31:45 -0700
+Subject: [PATCH 1/2] check for null buffer before trying a byteswap
+
+Author: Monty <paranoia@xiph.org>
+
+Patch from debian
+http://sources.debian.net/src/cdparanoia/3.10.2%2Bdebian-11/debian/patches/04-endian.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ interface/interface.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/interface/interface.c b/interface/interface.c
+index 526c2a9..763a0ea 100644
+--- a/interface/interface.c
++++ b/interface/interface.c
+@@ -118,7 +118,7 @@ long cdda_read_timed(cdrom_drive *d, void *buffer, long beginsector, long sector
+ 	if(d->bigendianp==-1) /* not determined yet */
+ 	  d->bigendianp=data_bigendianp(d);
+ 	
+-	if(d->bigendianp!=bigendianp()){
++	if(buffer && d->bigendianp!=bigendianp()){
+ 	  int i;
+ 	  u_int16_t *p=(u_int16_t *)buffer;
+ 	  long els=sectors*CD_FRAMESIZE_RAW/2;
+-- 
+2.13.2
+
diff --git a/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
new file mode 100644
index 000000000..024479ca7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
@@ -0,0 +1,32 @@
+From f4f81bdadb9515938b3b5d13707bd4b9322fd967 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Jun 2017 22:37:13 -0700
+Subject: [PATCH 2/2] Fix printf format errors
+
+error: format not a string literal and no format arguments
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/main.c b/main.c
+index 664acac..d568fb1 100644
+--- a/main.c
++++ b/main.c
+@@ -588,10 +588,10 @@ static void callback(long inpos, int function){
+ 	    buffer[aheadposition+19]='>';
+ 	}
+    
+-	fprintf(stderr,buffer);
++	fprintf(stderr, "%s", buffer);
+        
+ 	if (logfile != NULL && function==-1) {
+-	  fprintf(logfile,buffer+1);
++	  fprintf(logfile, "%s", buffer+1);
+ 	  fprintf(logfile,"\n\n");
+ 	  fflush(logfile);
+ 	}
+-- 
+2.13.2
+
-- 
2.13.2


