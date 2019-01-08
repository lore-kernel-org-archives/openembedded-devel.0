Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7927BFAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2019 22:05:19 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id e11so2528273plt.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2019 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=auXXyfXcXRSsnAYMPAFxzh0Zk06acta5P0kGM36gbuw=;
	b=ALUG3BAgFoMhW1ckkWPM56yYqm55RXXJzV1mKKiwt9KBZalBibeVvdEAGxosoIEDz9
	Tu8QcgR0dty2+eRbCGYltnScpEzl8G75RBiYHPdMY7X7q/zuDJ6fjSHVwsfukWHAbnlH
	vuGjiblij2kT1Mn2hr33J+VM+tEDSb9G0gvxFUNXVGpwo91Z5eifGOy0TJJEibytW9/m
	fmlDjocyyd2uTkwnk/MeLlnnM7Zn4GM7W6rJ7vEDwtOT88KPWGIGehJ+2YQqUd/OU456
	kTER8hZdvQbX8AIWzf4XpTCtxQMSzL4XNEq/QyLk8VAIAm35en7unqyBtNhAnEKHiq/R
	FlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=auXXyfXcXRSsnAYMPAFxzh0Zk06acta5P0kGM36gbuw=;
	b=FCYxd1NOflWBpTxzgkkaf71Z5Ve7iVB2ISCminl9sppvY8uprAw62mmQL64VOQ89xD
	BYFYvBi3mU7ZaFhhcndW/k6kXHAqfHvneTEnti+JG43st+k5X+CjPs/1gx4vk2mZXOyy
	BF0GD688lI9zQl20vWVSlQrDhULlUBRLWtTqqi365JCTa0KrSZzInVsLiazzehDCYOBw
	6/qc1x3WaUyGok2UeWWUWkQXia3ZWiwq73XJZNZSyR6OFNZBxnKRM1G6PNjuQg61ML7i
	DOS0AyLSWqFq+gSQ1GRsAMkZbg9cEoXsyMBEW3RTRVPg8B6YALDGCpj8CwHsfBs3UU9r
	Spdw==
X-Gm-Message-State: AJcUukcLoJ6FzI6M7g+UiMkXWDe+qsuN6J0C9xg2SHvpx4ZZLA15shRC
	2sXaVDkzs0yA7Nn6SoNbfL89dxGvdys=
X-Google-Smtp-Source: ALg8bN7NCvKDLPMqDXLSrGrpz0jt03xn56rZlDdrmrg36fiqmSmbHN/mTKDBY3bW67verNNK0Y+RuA==
X-Received: by 2002:a17:902:541:: with SMTP id 59mr3584882plf.88.1546985120179;
	Tue, 08 Jan 2019 14:05:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	b27sm104995752pfh.113.2019.01.08.14.05.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 14:05:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2019 14:05:12 -0800
Message-Id: <20190108220512.44077-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190108220512.44077-1-raj.khem@gmail.com>
References: <20190108220512.44077-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] linuxptp: Upgrade to 2.0 release
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
X-List-Received-Date: Tue, 08 Jan 2019 22:05:19 -0000
Content-Transfer-Encoding: 8bit

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...03-include-missing-time.h-for-time_t.patch | 26 --------------
 ...eader-sequence-to-avoid-duplicate-de.patch | 36 -------------------
 .../{linuxptp_1.8.bb => linuxptp_2.0.bb}      |  6 ++--
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_1.8.bb => linuxptp_2.0.bb} (72%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
deleted file mode 100644
index 96163f6542..0000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0003-include-missing-time.h-for-time_t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b36cafdbcbe2193f5b669e703c608e19e23f80a3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 11:16:42 -0700
-Subject: [PATCH 3/4] include missing time.h for time_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.h b/util.h
-index e912f19..3c634c1 100644
---- a/util.h
-+++ b/util.h
-@@ -22,7 +22,7 @@
- 
- #include "ddt.h"
- #include "ether.h"
--
-+#include <time.h>
- /**
-  * Table of human readable strings, one for each port state.
-  */
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
deleted file mode 100644
index e699275148..0000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3cd28aa771934d9165ff0d7e19932cde65de3e52 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 11:16:57 -0700
-Subject: [PATCH 4/4] Adjust include header sequence to avoid duplicate
- definitions on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- raw.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/raw.c b/raw.c
-index f51c829..494ea7f 100644
---- a/raw.c
-+++ b/raw.c
-@@ -18,8 +18,6 @@
-  */
- #include <errno.h>
- #include <fcntl.h>
--#include <linux/filter.h>
--#include <linux/if_ether.h>
- #include <net/ethernet.h>
- #include <net/if.h>
- #include <netinet/in.h>
-@@ -32,6 +30,8 @@
- #include <sys/types.h>
- #include <unistd.h>
- 
-+#include <linux/filter.h>
-+#include <linux/if_ether.h>
- #include <linux/errqueue.h>
- #include <linux/net_tstamp.h>
- #include <linux/sockios.h>
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
similarity index 72%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
index c7b8b2933c..eb262d36b2 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.8.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://no-incdefs-using-host-headers.patch \
-           file://0003-include-missing-time.h-for-time_t.patch \
-           file://0004-Adjust-include-header-sequence-to-avoid-duplicate-de.patch \
            "
 
-SRC_URI[md5sum] = "5688cdfe57932273e1dbf35b3b97b9a0"
-SRC_URI[sha256sum] = "fa8e00f6ec73cefa7bb313dce7f60dfe5eb9e2bde3353594e9ac18edc93e5165"
+SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
+SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
     EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
-- 
2.20.1


