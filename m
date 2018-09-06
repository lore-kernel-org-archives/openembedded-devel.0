Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 264A57971B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:16:19 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d4-v6so5906247pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DRvqnDiav2P8KtTRlW1HEqWha/eJp3ld/MFAC8S3Nik=;
	b=vX8nGDGbVElmWo+uknnYa19FfF5ntfQZxC2Stapx4wg1/331GyziB1HAMLClDwat1O
	EemXXu/oTm2/8jYqZhB1vq6j6MWjwuYitj40yWZywDDcyVdgRExfVCJ8B1jcD6BE+dqg
	cUpFm7VGW4EWDCi/aLu8FelUWQzS3buw3du733vi8VQBtwcMLPsz5QV+pCD22RJzJcVu
	PmW5L+nEnXv6GCdZRkkAOqnVFZzCc3u/OjNInAIDfmaHCQLHhTC94fphMLlgMb+tEdrC
	Ahlng6vFuq0BAC2Ztxl+IwMx9SNBPmrCXPbopmcezOGw+gUKPtSW8lVf4TG2AE/6N03j
	C4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DRvqnDiav2P8KtTRlW1HEqWha/eJp3ld/MFAC8S3Nik=;
	b=TXyQZFf8vo4QumSGkuuCRZe6OBRcrUecZHEtkzFjw56lAeaWqE3vuFzznv0OK7PfOV
	/2C4o61zVT5jzGcATjo9H5VuCWflDgrUL9MUSl6pbD4mIkUjM7duScbd7dTaX56r4kuf
	DJlnxYh+R7MBF8Nt4+TWaY9XUO1/hoIka53Az+DIXtckYGrm2Y/Tmk4hiGoMJ6t3Vkwc
	2aAEf/XsHyAH5+sHnAr1p48WX6kmHj+IV0LNfJcS9QaavOD2niSTHGn+953SdVKB5B2X
	0/+AhRpVvwy02mYaGAQKt3y3M4886fgNRY0FrMpvZ6kl4r+7uGBNLN5cBrLtPEaGyqom
	Mxgg==
X-Gm-Message-State: APzg51BJj5nMsSdKrVeUoMHFBIsT9QSbMjDE38LsfhYyVUPRZt+Z7A6F
	bzN7gRMYmTZyck78sBnoCuuJnyFB
X-Google-Smtp-Source: ANB0Vdb34RmweVylxtBAxtppYGHFLCg6BTyOjOBdFqj60xG4CJdp749FZDyfYAXzGjql0n2786+SCw==
X-Received: by 2002:a62:f208:: with SMTP id
	m8-v6mr5020167pfh.222.1536268579957; 
	Thu, 06 Sep 2018 14:16:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	r18-v6sm7375776pgj.51.2018.09.06.14.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 14:16:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 14:16:06 -0700
Message-Id: <20180906211606.4910-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906211606.4910-1-raj.khem@gmail.com>
References: <20180906211606.4910-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 3/3] opensc: Upgrade to 0.18.0
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
X-List-Received-Date: Thu, 06 Sep 2018 21:16:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Fixes build with OpenSSL 1.1.x
* Fix build with gcc8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with gcc8

 ...-Fixed-gcc-8-compilation-errors-1353.patch | 73 +++++++++++++++++++
 .../{opensc_0.16.0.bb => opensc_0.18.0.bb}    |  9 ++-
 2 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
 rename meta-oe/recipes-support/opensc/{opensc_0.16.0.bb => opensc_0.18.0.bb} (82%)

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch b/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
new file mode 100644
index 0000000000..48d8327546
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
@@ -0,0 +1,73 @@
+From 87857d5cae7db94fdd776904886392b1e86053bd Mon Sep 17 00:00:00 2001
+From: Florian Bezdeka <1119693+fbezdeka@users.noreply.github.com>
+Date: Fri, 18 May 2018 18:54:56 +0200
+Subject: [PATCH] Fixed gcc 8 compilation errors (#1353)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The following errors occured during a compilation using gcc 8:
+
+In function »gids_create_file.constprop«,
+    inserted by »gids_save_certificate.isra.8« beicard-gids.c:1548:7:
+card-gids.c:465:2: Error: »strncpy« output may be truncated copying 8 bytes from a string of length 8 [-Werror=stringop-truncation]
+  strncpy(record->filename, filename, 8);
+  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+pkcs15-oberthur.c: In function »sc_pkcs15emu_oberthur_add_prvkey«:
+pkcs15-oberthur.c:741:5: Error: »strncpy« output may be truncated copying 254 bytes from a string of length 254 [-Werror=stringop-truncation]
+     strncpy(kobj.label, objs[ii]->label, sizeof(kobj.label) - 1);
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/1353]
+Signed-off-by Khem Raj <raj.khem@gmail.com>
+---
+ src/libopensc/card-gids.c       | 3 ++-
+ src/libopensc/pkcs15-oberthur.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/libopensc/card-gids.c b/src/libopensc/card-gids.c
+index fc5d2a7..ac3e579 100644
+--- a/src/libopensc/card-gids.c
++++ b/src/libopensc/card-gids.c
+@@ -33,6 +33,7 @@ Some features are undocumented like the format used to store certificates. They
+ 
+ #include <stdlib.h>
+ #include <string.h>
++#include "../common/compat_strlcpy.h"
+ 
+ #ifdef ENABLE_OPENSSL
+ /* openssl only needed for card administration */
+@@ -462,7 +463,7 @@ static int gids_create_file(sc_card_t *card, char* directory, char* filename) {
+ 	memset(masterfilebuffer + offset, 0, sizeof(gids_mf_record_t));
+ 	record = (gids_mf_record_t*) (masterfilebuffer + offset);
+ 	strncpy(record->directory, directory, 8);
+-	strncpy(record->filename, filename, 8);
++	strlcpy(record->filename, filename, sizeof(record->filename));
+ 	record->fileIdentifier = fileIdentifier;
+ 	record->dataObjectIdentifier = dataObjectIdentifier;
+ 
+diff --git a/src/libopensc/pkcs15-oberthur.c b/src/libopensc/pkcs15-oberthur.c
+index 4f841ed..3415be7 100644
+--- a/src/libopensc/pkcs15-oberthur.c
++++ b/src/libopensc/pkcs15-oberthur.c
+@@ -29,6 +29,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
++#include "../common/compat_strlcpy.h"
+ 
+ #include "pkcs15.h"
+ #include "log.h"
+@@ -738,7 +739,7 @@ sc_pkcs15emu_oberthur_add_prvkey(struct sc_pkcs15_card *p15card,
+ 			unsigned int id = path.value[path.len - 2] * 0x100 + path.value[path.len - 1];
+ 
+ 			if (id == ccont.id_cert)   {
+-				strncpy(kobj.label, objs[ii]->label, sizeof(kobj.label) - 1);
++				strlcpy(kobj.label, objs[ii]->label, sizeof(kobj.label));
+ 				break;
+ 			}
+ 		}
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
similarity index 82%
rename from meta-oe/recipes-support/opensc/opensc_0.16.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.18.0.bb
index fd67181dc2..c389e0bb58 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
@@ -9,10 +9,12 @@ eID cards have also been confirmed to work."
 HOMEPAGE = "http://www.opensc-project.org/opensc/"
 SECTION = "System Environment/Libraries"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+           file://0001-Fixed-gcc-8-compilation-errors-1353.patch \
+          "
 
-SRC_URI[md5sum] = "724d128f23cd7a74b28d04300ce7bcbd"
-SRC_URI[sha256sum] = "3ac8c29542bb48179e7086d35a1b8907a4e86aca3de3323c2f48bd74eaaf5729"
+SRC_URI[md5sum] = "bce516f752e0db5327aa06cc0136fe27"
+SRC_URI[sha256sum] = "6ef62b00e8fdbe3e386c3ee25c2cadb56c1931ea42f1a11dce8c947f51b45033"
 
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
@@ -21,6 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 inherit autotools pkgconfig
 
+S = "${WORKDIR}/OpenSC-${PV}"
 EXTRA_OECONF = " \
     --disable-static \
     --enable-openct \
-- 
2.18.0


