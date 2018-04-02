Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4F251747CE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:05:58 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m22-v6so5118987pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eqxlla0SJBghQm1V9Fws4SdgpaM0mSgs9uypBWlSyyU=;
	b=fzh1663l41uBpUZe85VFRZtL6V9VlFs2xMyNFeTAR6R1ULSuI/a1BT01pk5Yth3Qzt
	761R2EcajhOL/DuOUDZh770MXoYpuU3dtYsYQKm0VklLcFfb8bUZ4cx4WSeZVHNWAnkZ
	T0vMVdh1ELJjilX6LXtp+Bcpfin+5jh2cI+lggM0N5tmVMHXeo3E+2ro3H8WxWuIcvy3
	6lUHlk8re/SNKpBRSV4vEasHSqIBhAXzHyeml84ebuQ5XP13EWK9hL4xKqATa1Jmek4c
	dcxxt03rBtAos2DenmSA6eavRZRpW++8roF31OpqOcVouBenBFc8+F5p6BM06Hif6wXa
	1xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eqxlla0SJBghQm1V9Fws4SdgpaM0mSgs9uypBWlSyyU=;
	b=swZSBMpSTxaF8xGd+0QHUX2Ixkp91NngrD5ACheKQSMfCRqUySLYUZSHYz3uld4DS2
	JeU6SRQ1abxJovNJwYW9OZKx/UtF3CnHWLWM2/VmTqlf2A55UBA8xrtHIvc+bOOTcRtL
	E9J5F0oF11fCrxcUKkjhR6Xjwrt4fafO0zblnGZxc0L8K4d/YXDmLpRzEAUlnK4yEmHg
	BtVM3Tm/N9rDYpDtJqDvySut0TfpalR5SRnYOMpiNLTfmABKrqBqg50zMqgDcNxSZyKj
	8sJdOKERBKyY8CKN9g9x5Vn2vKxmQ/xt30XjbJ2a8fxhELVeFt+z35Rnb4+sfEcpP13h
	N3RA==
X-Gm-Message-State: AElRT7HUtDRxgXNmy8S8k7iHCQJWC5Uco8sw9zwIx9L98TLZCkgnK3iR
	do5CXHhH0+uO4KwAL+8k2wth5g==
X-Google-Smtp-Source: AIpwx4/Qo1XdeFjOD3nJQO1FkNED9ybNvnd5TpuhkToCPylUVTyruJv/26p1Jm3xnlgJWmFDqXvpnw==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
	n59-v6mr11009641plb.198.1522692359111; 
	Mon, 02 Apr 2018 11:05:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:05:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:44 -0700
Message-Id: <20180402180546.38078-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180402180546.38078-1-raj.khem@gmail.com>
References: <20180402180546.38078-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] yp-tools: Upgrade to 4.2.3
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
X-List-Received-Date: Mon, 02 Apr 2018 18:05:58 -0000

Switch to github for SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ding_dup.c-Include-string.h-for-strdup-de.patch | 28 --------------------
 ...mp_bindings.c-Include-string.h-for-memset.patch | 30 ----------------------
 .../nis/{yp-tools_4.2.2.bb => yp-tools_4.2.3.bb}   | 11 ++++----
 3 files changed, 6 insertions(+), 63 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
 rename meta-networking/recipes-support/nis/{yp-tools_4.2.2.bb => yp-tools_4.2.3.bb} (75%)

diff --git a/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch b/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
deleted file mode 100644
index 3d4d4f278..000000000
--- a/meta-networking/recipes-support/nis/yp-tools/0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 420cb6927553bbca5b49b7681cf208e6df6e4d7c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Sep 2017 08:42:45 -0700
-Subject: [PATCH 1/2] ypbind3_binding_dup.c: Include string.h for strdup
- declaration
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- lib/ypbind3_binding_dup.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/ypbind3_binding_dup.c b/lib/ypbind3_binding_dup.c
-index ce4aadf..8199c0b 100644
---- a/lib/ypbind3_binding_dup.c
-+++ b/lib/ypbind3_binding_dup.c
-@@ -19,6 +19,7 @@
- 
- #if defined(HAVE_YPBIND3)
- 
-+#include <string.h>
- #include <rpcsvc/yp_prot.h>
- #include "internal.h"
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch b/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
deleted file mode 100644
index 0562e58af..000000000
--- a/meta-networking/recipes-support/nis/yp-tools/0002-yp_dump_bindings.c-Include-string.h-for-memset.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 03ccabb6264c008430c4b1739351df5a63829f8e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Sep 2017 08:52:32 -0700
-Subject: [PATCH 2/2] yp_dump_bindings.c: Include string.h for memset
-
-Fixes
-error: implicitly declaring library function 'memset'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/yp_dump_binding.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/yp_dump_binding.c b/src/yp_dump_binding.c
-index a5ab920..d75e2c2 100644
---- a/src/yp_dump_binding.c
-+++ b/src/yp_dump_binding.c
-@@ -26,6 +26,7 @@
- #include <libintl.h>
- #include <locale.h>
- #include <getopt.h>
-+#include <string.h>
- #include <sys/stat.h>
- #include <arpa/inet.h>
- #include <rpcsvc/ypclnt.h>
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
similarity index 75%
rename from meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
rename to meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
index 9ac973812..4e27e32d4 100644
--- a/meta-networking/recipes-support/nis/yp-tools_4.2.2.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_4.2.3.bb
@@ -11,13 +11,14 @@ ypwhich, yppasswd, domainname, nisdomainname \
 and ypdomainname. \
 "
 
-SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
+# v4.2.3
+SRCREV = "1bfda29c342a81b97cb1995ffd9e8da5de63e7ab"
+
+SRC_URI = "git://github.com/thkukuk/yp-tools \
            file://domainname.service \
-           file://0001-ypbind3_binding_dup.c-Include-string.h-for-strdup-de.patch \
-           file://0002-yp_dump_bindings.c-Include-string.h-for-memset.patch \
            "
-SRC_URI[md5sum] = "fb4a8bffb44ae5d3390351d67f320ef3"
-SRC_URI[sha256sum] = "137f19a986382b275bf4a2b1a69eb26689d6f4ac056ddaa21784d6b80eb98faa"
+
+S = "${WORKDIR}/git"
 
 DEPENDS = "libtirpc libnsl2"
 
-- 
2.16.3


