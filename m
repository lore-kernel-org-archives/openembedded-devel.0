Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7374D6B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id c25so7246941pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XTTu/MvuN2o+a/vSJRRj4E0dKQhaS7QxEhNhJzbyIoM=;
	b=qSnYwY3MBWHLT3x0VFqDWCOyscZfUVwXTwhXPEZ6Qn39ugO2SdCxxaAQ9go7wvZcAx
	iSR61ZfKdcMoEBYvKa5vNWTFDj1F9zx9ynWeFW+5ca0x6h1VXCHPI13wd1Z1yslkMkEU
	L2iEx2WDNPqmQdR63SB55IJA94IEN+uFXfNJ5uPWYfPUT/TsaGi+tCSY0ncSVsMHHk8z
	s0FO8Gt91+g8ByPLkA/UbrdAlqKfppxLjJa2z9KRhNJ4iKilS0Wlqzh3M+zGxYwoh3x2
	HqYF1H+FUrkber70wn1Sc7qmTBC8lHSCoVwb5GB9+YF1xm21tC5p5oMM6cAITZsQO6Ee
	bsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XTTu/MvuN2o+a/vSJRRj4E0dKQhaS7QxEhNhJzbyIoM=;
	b=CZRn54LZ5lKYGQBLBl7DYPJEspVkJRmpD8gtJSZO28Qx4N7O6iK9hT7m+Qd8t/dDwv
	NXKpvm5iP2YnpK9NZyyI31+PAd3BMpX//rj9EY+/0K3Amn8OmVHaR6pKqkWeefa2CsBp
	EqnQNo88HwFJCXPchGSZ0sIBMIxrQLwMbEod95GhziQ0IVFlq1nfRFRyRxP10ZVWFeMP
	TtMSFwjj4b313viUu+8h822ZeT4SBNc58XoQYUz1vg+sk6pEKAeeJSUT4yA7zNofuPIC
	Gw/GWTQwfaDF36+Ctzkg2H4Ry+rxwh71BNU8XxocJKguHPIAu7vw26+y+6dDA2oHvvtr
	X05g==
X-Gm-Message-State: AA+aEWZT2b/tRmg+ih11VfyBdz0n89Tx/NKJIGUVZ8KtxBomM5gKGg2W
	DB74z0ySFdRPQY/50VOMlXYL6++W/s8=
X-Google-Smtp-Source: AFSGD/U6AK28WaSj2uVPNuOvdYbVTnr8v8xsBVi584+6Ob5rKr92YrXPk7RA50TpuvSp0PJOjPz5Bw==
X-Received: by 2002:a63:24c2:: with SMTP id
	k185mr17240861pgk.406.1545187890093; 
	Tue, 18 Dec 2018 18:51:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:08 -0800
Message-Id: <20181219025109.19159-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219025109.19159-1-raj.khem@gmail.com>
References: <20181219025109.19159-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] opensc: Upgrade to 0.19.0
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
X-List-Received-Date: Wed, 19 Dec 2018 02:51:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch fetcher to use github
Add patch to build with gcc9
Remove upstreamed patch
Inherit bash-completion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Fixed-gcc-8-compilation-errors-1353.patch | 73 -------------------
 .../0001-Remove-redundant-logging.patch       | 34 +++++++++
 .../{opensc_0.18.0.bb => opensc_0.19.0.bb}    | 19 ++---
 3 files changed, 42 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
 rename meta-oe/recipes-support/opensc/{opensc_0.18.0.bb => opensc_0.19.0.bb} (74%)

diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch b/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
deleted file mode 100644
index 48d8327546..0000000000
--- a/meta-oe/recipes-support/opensc/opensc/0001-Fixed-gcc-8-compilation-errors-1353.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 87857d5cae7db94fdd776904886392b1e86053bd Mon Sep 17 00:00:00 2001
-From: Florian Bezdeka <1119693+fbezdeka@users.noreply.github.com>
-Date: Fri, 18 May 2018 18:54:56 +0200
-Subject: [PATCH] Fixed gcc 8 compilation errors (#1353)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The following errors occured during a compilation using gcc 8:
-
-In function »gids_create_file.constprop«,
-    inserted by »gids_save_certificate.isra.8« beicard-gids.c:1548:7:
-card-gids.c:465:2: Error: »strncpy« output may be truncated copying 8 bytes from a string of length 8 [-Werror=stringop-truncation]
-  strncpy(record->filename, filename, 8);
-  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-pkcs15-oberthur.c: In function »sc_pkcs15emu_oberthur_add_prvkey«:
-pkcs15-oberthur.c:741:5: Error: »strncpy« output may be truncated copying 254 bytes from a string of length 254 [-Werror=stringop-truncation]
-     strncpy(kobj.label, objs[ii]->label, sizeof(kobj.label) - 1);
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/1353]
-Signed-off-by Khem Raj <raj.khem@gmail.com>
----
- src/libopensc/card-gids.c       | 3 ++-
- src/libopensc/pkcs15-oberthur.c | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/libopensc/card-gids.c b/src/libopensc/card-gids.c
-index fc5d2a7..ac3e579 100644
---- a/src/libopensc/card-gids.c
-+++ b/src/libopensc/card-gids.c
-@@ -33,6 +33,7 @@ Some features are undocumented like the format used to store certificates. They
- 
- #include <stdlib.h>
- #include <string.h>
-+#include "../common/compat_strlcpy.h"
- 
- #ifdef ENABLE_OPENSSL
- /* openssl only needed for card administration */
-@@ -462,7 +463,7 @@ static int gids_create_file(sc_card_t *card, char* directory, char* filename) {
- 	memset(masterfilebuffer + offset, 0, sizeof(gids_mf_record_t));
- 	record = (gids_mf_record_t*) (masterfilebuffer + offset);
- 	strncpy(record->directory, directory, 8);
--	strncpy(record->filename, filename, 8);
-+	strlcpy(record->filename, filename, sizeof(record->filename));
- 	record->fileIdentifier = fileIdentifier;
- 	record->dataObjectIdentifier = dataObjectIdentifier;
- 
-diff --git a/src/libopensc/pkcs15-oberthur.c b/src/libopensc/pkcs15-oberthur.c
-index 4f841ed..3415be7 100644
---- a/src/libopensc/pkcs15-oberthur.c
-+++ b/src/libopensc/pkcs15-oberthur.c
-@@ -29,6 +29,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
-+#include "../common/compat_strlcpy.h"
- 
- #include "pkcs15.h"
- #include "log.h"
-@@ -738,7 +739,7 @@ sc_pkcs15emu_oberthur_add_prvkey(struct sc_pkcs15_card *p15card,
- 			unsigned int id = path.value[path.len - 2] * 0x100 + path.value[path.len - 1];
- 
- 			if (id == ccont.id_cert)   {
--				strncpy(kobj.label, objs[ii]->label, sizeof(kobj.label) - 1);
-+				strlcpy(kobj.label, objs[ii]->label, sizeof(kobj.label));
- 				break;
- 			}
- 		}
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch b/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
new file mode 100644
index 0000000000..291f1a239a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/0001-Remove-redundant-logging.patch
@@ -0,0 +1,34 @@
+From c012f46965b3fe24e31367796e52c2d0b14ca5d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Dec 2018 18:44:23 -0800
+Subject: [PATCH] Remove redundant logging
+
+Same information is printed a few line below in same function, the only
+difference is that there it takes care of case when label is NULL pointer
+unlike this line
+
+secondly, every function call to cosm_write_tokeninfo() in this file
+passes label=NULL, and then it tries to print a null pointer
+
+Fixes errors like
+src/libopensc/log.h:48:47: error: '%s' directive argument is null
+[-Werror=format-overflow=]
+
+Upstream-Status: Submitted [https://github.com/OpenSC/OpenSC/pull/1557]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pkcs15init/pkcs15-oberthur.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Index: git/src/pkcs15init/pkcs15-oberthur.c
+===================================================================
+--- git.orig/src/pkcs15init/pkcs15-oberthur.c
++++ git/src/pkcs15init/pkcs15-oberthur.c
+@@ -70,7 +70,6 @@ cosm_write_tokeninfo (struct sc_pkcs15_c
+ 	ctx = p15card->card->ctx;
+ 
+ 	SC_FUNC_CALLED(ctx, SC_LOG_DEBUG_VERBOSE);
+-	sc_debug(ctx, SC_LOG_DEBUG_NORMAL, "cosm_write_tokeninfo() label '%s'; flags 0x%X", label, flags);
+ 	if (sc_profile_get_file(profile, COSM_TITLE"-token-info", &file)) {
+ 		rv = SC_ERROR_INCONSISTENT_PROFILE;
+ 		SC_TEST_GOTO_ERR(ctx, SC_LOG_DEBUG_NORMAL, rv, "Cannot find "COSM_TITLE"-token-info");
diff --git a/meta-oe/recipes-support/opensc/opensc_0.18.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
similarity index 74%
rename from meta-oe/recipes-support/opensc/opensc_0.18.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index 45c931e7bd..bc1722e394 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -8,22 +8,19 @@ eID cards have also been confirmed to work."
 
 HOMEPAGE = "http://www.opensc-project.org/opensc/"
 SECTION = "System Environment/Libraries"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "https://snapshot.debian.org/archive/debian/20180521T101428Z/pool/main/o/opensc/opensc_0.18.0.orig.tar.gz \
-           file://0001-Fixed-gcc-8-compilation-errors-1353.patch \
+#v0.19.0
+SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
+SRC_URI = "git://github.com/OpenSC/OpenSC \
+           file://0001-Remove-redundant-logging.patch \
           "
-
-SRC_URI[md5sum] = "bce516f752e0db5327aa06cc0136fe27"
-SRC_URI[sha256sum] = "6ef62b00e8fdbe3e386c3ee25c2cadb56c1931ea42f1a11dce8c947f51b45033"
-
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-inherit autotools pkgconfig
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig bash-completion
 
-S = "${WORKDIR}/OpenSC-${PV}"
 EXTRA_OECONF = " \
     --disable-static \
     --enable-openct \
-- 
2.20.1


