Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D99078486
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 23:27:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id v22so630139pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XsWDi1nz7rII/ZI79TIv+sRRD4BcYlx0+xeFPAkWU68=;
	b=cJ0ykqAa7T4YK54rXjXmtAJkCcbXE423duC6EKbXOEaBCikFH+brYiWqG5AL8CDrrk
	5sszbUV8hn6eWdwxyGrgw7kyWTO510XPEAUgwunKOVMrucqHe98w1d0XdROg6wjsgAtC
	927jb/dsyk0RVTIcPdoO3aqu8Ek3KZiW+GQA09s14fSY2LMmis0xUZRDsJYpH4q8ivdE
	jiH4s4f3PzrqkgFkuZWH5UHf+w8KIVmh0OQVTQwDVOoivOXUlFuhqmHm6Zkvo5hTV4YM
	sfEaNftzGzYD2nYb9wdbEWkATMCKVo28FUel/utyBQrePruopAZHkADxkWRWEnTKaZni
	470w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XsWDi1nz7rII/ZI79TIv+sRRD4BcYlx0+xeFPAkWU68=;
	b=p0856luTZ4ETUm+l7JPAOLpISA6QnFBjIHjxNphd7nNYu1v7mnVkFCphnid+rLn1y8
	Gc8uhFpAyj5nVJfQsZIz0irY7Zw3dqTaGNH2VARlTE++h16+zqNvUClksZj41t2xJefj
	Tr6DQFA4mvJVe8ihDQ9aTSPUdhLKsyUygUxDDnmTsmM41vb9K9HQwUOtVFO+k9+xdmt6
	yWhKG2s4MaJ8BNoZF1EAy2wDCZ4N1InXbcsRMdmSXDKKzkN2HLdDG9jO2uQszPdULRZB
	1frRbZRpZJrWkrXxpZPFPra4wYcfDdg6Auo1F6182Jv8GB+/lHK5kcE8auDotKbzVAkI
	CNKA==
X-Gm-Message-State: AHPjjUj6ovhjldLD2GJqio53fYdSvLIm8USdJa2h4APO8Zjlgygvw7zb
	dCU6R33m2xyJwbOD
X-Google-Smtp-Source: ADKCNb7NIqcXpWkivV2iSnSqOdeYUaXzT+mRz0T0Yo/Tr2XNAlE4wY9+bJOSvBykqt6pOX/8r0MNNA==
X-Received: by 10.84.193.131 with SMTP id f3mr143852pld.88.1504222025492;
	Thu, 31 Aug 2017 16:27:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id 16sm888569pge.33.2017.08.31.16.27.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 16:27:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 16:26:45 -0700
Message-Id: <20170831232645.6125-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831232645.6125-1-raj.khem@gmail.com>
References: <20170831232645.6125-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 4/4] netkit-tftp: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 23:27:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-tftp-Include-missing-fcntl.h.patch        | 27 ++++++++++++++++++++++
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb |  7 +++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch

diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
new file mode 100644
index 000000000..78936907f
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
@@ -0,0 +1,27 @@
+From fa57e161fc953264a75d50a787cb83983e60acc7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 18:30:02 -0700
+Subject: [PATCH] tftp: Include missing fcntl.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tftp/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tftp/main.c b/tftp/main.c
+index 8c54843..5c9b698 100644
+--- a/tftp/main.c
++++ b/tftp/main.c
+@@ -63,6 +63,7 @@ char main_rcsid[] =
+ #include <ctype.h>
+ #include <netdb.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ 
+ #include "tftpsubs.h"  /* for mysignal() */
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
index 67a541d25..92c13e850 100644
--- a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
@@ -6,9 +6,10 @@ DEPENDS = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
-    ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
-    file://tftp.conf \
-"
+           ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
+           file://tftp.conf \
+           file://0001-tftp-Include-missing-fcntl.h.patch \
+           "
 
 SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
 SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
-- 
2.14.1


