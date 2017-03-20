Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC9171D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n11so4239085pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/u3ayY4sEsspCTAASdvTI3VGA2TVNv6WdYESY4egxoA=;
	b=R+ncCYeMghEoXpjrTkiQsLdBCFXZuh/3AccXi+MFyJQwcrFdDM7ONYiHxMzV2CoDJ0
	7vxfy1Sspezy+1tKjJqUf/ZTIiC3vDc9BQxqu14rc9iPV6YB5AJf9AyECfVJoqB3HLE/
	zoKoYQT+yBVPQCqLxLQYc+pIjwCGWnGWh+T2OdrVJ9cMnNtbV7rm8FzfilB0j+4s5/ND
	M3WNtwfjfx0A5r7fGhGR3any9bbAl0MaF9Mgi+vCRHnroT9UqfInRfrFbdTI3DboXmRR
	SLrOGBw7iIB7JEBeO98j6Lu2kBPD2mv2CPAp2RyKVy3OY8K8lfdOD4Sx7T3KjHsXwxC7
	bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/u3ayY4sEsspCTAASdvTI3VGA2TVNv6WdYESY4egxoA=;
	b=fIbwCmht+xg/mAvWyS4OfCZimej3sr2InbgYmLAwmpDgCL6DDpbNhb6PIwUvePn4eo
	Ltr55hnuWk8MJKMvDnxOvoanA8VEI0G5ejFCGAlFnJUSGvYZ9b7upDVPjZvdTBhlipc+
	gttDmXzIxpqyj59GmFzznFZsaNPnlJ8z9qJpVn5pn0+C7OFq2Ctr8FR4khhqV6D+CORZ
	xGY+Ybr5FllCnMr8ENt+pmVwV5hL9s5I5doAJYdLHuf2Sr/REZjhoyDs25HqybcKwAaT
	RUfPna40JZJopPV0TBpccBL7PnhsrKQR+Ma34kBLn+ku/9jXNr6V+6ek7WSRRYWi/Fku
	hAxg==
X-Gm-Message-State: AFeK/H0lONILYBhRNPwyikXBt8p+JG5bKRP34PIHD2FEkgvgm/F1ZlNnj8cYo60jFb9+Ww==
X-Received: by 10.99.172.2 with SMTP id v2mr29245600pge.100.1489987937887;
	Sun, 19 Mar 2017 22:32:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:45 -0700
Message-Id: <20170320053152.29352-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/16] gradm: Fix GNU_HASH QA errors
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...file-Append-instead-of-overriding-LDFLAGS.patch | 26 ++++++++++++++++++++++
 meta-oe/recipes-support/gradm/gradm_3.1.bb         |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch

diff --git a/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
new file mode 100644
index 000000000..09a60127a
--- /dev/null
+++ b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
@@ -0,0 +1,26 @@
+From d67e93ada37d7237983fd10894c18b92f4243d50 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 08:51:45 -0700
+Subject: [PATCH] Makefile: Append instead of overriding LDFLAGS
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 28557ff..deed94c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,7 @@ OPT_FLAGS := -O2
+ # for older versions of grsecurity, comment the above line and uncomment the below:
+ #OPT_FLAGS := $(shell if [ "`uname -m`" != "sparc64" ] && [ "`uname -m`" != "x86_64" ]; then echo "-O2" ; else echo "-O2 -m64" ; fi)
+ CFLAGS := $(OPT_FLAGS) -fPIE -Wcast-qual -DGRSEC_DIR=\"$(GRSEC_DIR)\" -D_LARGEFILE64_SOURCE
+-LDFLAGS= -pie
++LDFLAGS+= -pie
+ INSTALL = /usr/bin/install -c
+ 
+ # FHS
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-support/gradm/gradm_3.1.bb b/meta-oe/recipes-support/gradm/gradm_3.1.bb
index 252b19de2..1a4261a9e 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
 DEPENDS = "flex-native bison-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://grsecurity.net/stable/${BP}-201507191652.tar.gz \
-           file://0001-Makefile-remove-strip.patch"
+           file://0001-Makefile-remove-strip.patch \
+           file://0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch \
+           "
 SRC_URI[md5sum] = "ecec72d3a9b6d84c00eda97957b707b6"
 SRC_URI[sha256sum] = "2f14c357bf0459e502a4e108b76c3f6240aa484762d07bb1687796b9b9297a50"
 
-- 
2.12.0


