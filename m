Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id C911375265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:06:38 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id m5-v6so8586936pgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 22:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=skNZ/rstchLUAlFP3YvwxFh5+7qmYHX6nFQy7IqZX30=;
	b=HDvzVy0i99zDKPGVxWmF7wUld9swWoo7fflUxUi3SNYMFltMJSJZU++25sjmbXQ8Gs
	AM252wh5O3RHmO06G2EXJCtOInwhyUxybGvwy8B8Kzzrk7SuQOLbu7/2fv3FDKNkVezW
	lexR33mBDtoO4m1IxMvaFOHRvMl8NSInzSjqqqjAMActpSFrYRStWQaH08n1LK0maETm
	uzpB1776n3h/NJjKbqmaA1EBpjbRI/i7YKiKJU4yFE/AhB1TXEW5G2kKt5nijY+ak+GN
	R4g+7vyxnSC3ckaVTQIFBcwfIU9ouFyZNmolapB03vW0LS0M3LrH1EK9tzJuheqIrFih
	TMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=skNZ/rstchLUAlFP3YvwxFh5+7qmYHX6nFQy7IqZX30=;
	b=OUSUzilAeqqBXfo02xfOAb2bZ3mOosH5nYOB3mmUVEPDtwq+IMY2N7SzheK+7EwId2
	2pvaNYhBC0FCZXSErLCWtffWkSGZV1T4dKMzTKsHK9pvz3Lj0NtDQ6VRTo2eSTXisodZ
	jKqRR4no8UgHGlEFo0HFFrtwsuLLrNyrmD2LhZXpBcVqrBa1AsZeZeZWelCR+TkGhlDC
	GTkmX8L7D3wYJIqAw8CNlZ1kQx3wfYFn0XpWHN/GSRZl5f0wSE8zmB1wbBMRctxFZpKI
	MSmCUr1I9xoJU2mC7fWg1msHsOW3VsHKoiFjeBuIBEMS0QXklYYkoppHIMZXoEfizVeq
	TzlQ==
X-Gm-Message-State: APt69E1gc1u+vxlHnr4DWvkSk94JrsNAA/DiI/qyY9kLp68L/SU6B3qW
	2PySuIQCrPLnVks1tMCYQeVbnw==
X-Google-Smtp-Source: ADUXVKJE1ZUjG2APGaL98rLvF5Enc4/YM+/Q/1PzjeJEPRCSJNHPVBIqnQV5S1fUy6B8s6BRcneLsg==
X-Received: by 2002:aa7:8004:: with SMTP id
	j4-v6mr16361726pfi.174.1529384799536; 
	Mon, 18 Jun 2018 22:06:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	e189-v6sm28405430pfc.134.2018.06.18.22.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 22:06:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jun 2018 22:06:39 -0700
Message-Id: <20180619050639.4830-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619050639.4830-1-raj.khem@gmail.com>
References: <20180619050639.4830-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] iscsi-initiator-utils: Update to latest
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
X-List-Received-Date: Tue, 19 Jun 2018 05:06:38 -0000

Remove patches for gcc8 issues which are now fixed upstream
but differently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-limit.h-for-PATH_MAX.patch   | 22 ----------
 ...iface-Set-strncpy-bounds-to-not-over.patch | 41 -------------------
 .../iscsi-initiator-utils_2.0.876.bb          |  4 +-
 3 files changed, 1 insertion(+), 66 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Include-limit.h-for-PATH_MAX.patch
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-iface-Set-strncpy-bounds-to-not-over.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Include-limit.h-for-PATH_MAX.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Include-limit.h-for-PATH_MAX.patch
deleted file mode 100644
index 074ea7565c..0000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Include-limit.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 782730a74dd453a3c9bd2b47b79b1797586871fa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Jun 2018 18:11:34 -0700
-Subject: [PATCH] Include limit.h for PATH_MAX
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libopeniscsiusr/node.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libopeniscsiusr/node.c b/libopeniscsiusr/node.c
-index e82bb0d..3438a8f 100644
---- a/libopeniscsiusr/node.c
-+++ b/libopeniscsiusr/node.c
-@@ -29,6 +29,7 @@
- #include <unistd.h>
- #include <errno.h>
- #include <string.h>
-+#include <limits.h>
- 
- #include "libopeniscsiusr/libopeniscsiusr.h"
- #include "misc.h"
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-iface-Set-strncpy-bounds-to-not-over.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-iface-Set-strncpy-bounds-to-not-over.patch
deleted file mode 100644
index b7c87f4163..0000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-libopeniscsiusr-iface-Set-strncpy-bounds-to-not-over.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 56a56567d4f334b119e60c4ef0ad87edf7b77609 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Jun 2018 18:46:19 -0700
-Subject: [PATCH] libopeniscsiusr/iface: Set strncpy bounds to not overflow
-
-Fixes warnings found by gcc8
-
-iface.c:492:47: error: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4073 [-Werror=format-truncation=]
-
-iface.c:140:3: note: in expansion of macro '_strncpy'
-   _strncpy((*iface)->transport_name, proc_name + strlen("iscsi_"),
-   ^~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libopeniscsiusr/iface.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libopeniscsiusr/iface.c b/libopeniscsiusr/iface.c
-index 955395d..d33363e 100644
---- a/libopeniscsiusr/iface.c
-+++ b/libopeniscsiusr/iface.c
-@@ -138,7 +138,7 @@ int _iscsi_iface_get_from_sysfs(struct iscsi_context *ctx, uint32_t host_id,
- 
- 	if (strncmp(proc_name, "iscsi_", strlen("iscsi_")) == 0)
- 		_strncpy((*iface)->transport_name, proc_name + strlen("iscsi_"),
--			 sizeof((*iface)->transport_name) / sizeof(char));
-+			 sizeof((*iface)->transport_name) / sizeof(char) - 1);
- 	else
- 		_strncpy((*iface)->transport_name, proc_name,
- 			sizeof((*iface)->transport_name) / sizeof(char));
-@@ -489,7 +489,8 @@ static int _fill_hw_iface_from_sys(struct iscsi_context *ctx,
- 
- 	sysfs_iface_dir_path = malloc(PATH_MAX);
- 	_alloc_null_check(ctx, sysfs_iface_dir_path, rc, out);
--	snprintf(sysfs_iface_dir_path, PATH_MAX, "%s/%s",
-+	sysfs_iface_dir_path[PATH_MAX+strlen(_ISCSI_SYS_IFACE_DIR)] = '\0';
-+	snprintf(sysfs_iface_dir_path, PATH_MAX+strlen(_ISCSI_SYS_IFACE_DIR)+1, "%s/%s",
- 		 _ISCSI_SYS_IFACE_DIR, iface_kern_id);
- 
- 	_good(_sysfs_prop_get_str(ctx, sysfs_iface_dir_path,
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
index f61900d823..e6a87a38aa 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
@@ -11,7 +11,7 @@ DEPENDS = "openssl flex-native bison-native open-isns util-linux"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRCREV ?= "0cfebb10d29382ac1058c950a60a946c28b01e53"
+SRCREV ?= "bd79e4ed1004a6035d2538a308c5930890421a22"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://initd.debian \
@@ -20,8 +20,6 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
-           file://0001-Include-limit.h-for-PATH_MAX.patch \
-           file://0002-libopeniscsiusr-iface-Set-strncpy-bounds-to-not-over.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.17.1


