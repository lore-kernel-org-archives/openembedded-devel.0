Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6632E785EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:31:16 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s13so8109235plq.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WRB3GKdIoWmyelIqahNClPe9gI4hGbRB2Yq1NwfV4ew=;
	b=QW6g5Q3f7zZ2YeQGC1SR2CMf1FlBKbmITFjZDP5bCcGNeYPUIRR714q6mYGBDZEihG
	ZouSyYFvFHdR/0I3lkkQqO4rKZyP7WG2PtglIFTEuOC4J7KS0WqRAN41Ac43AhqnsTGU
	8aHUjqTe83Cv1WnpRph2Gfovv//5VsgwG6Ezi2JkPcDdnJdseiBzIqNsZx1bZ0cbhzJ8
	mA2bt5Wb1jwWExekHzA9YFM3+NdeywoQqqUkJWMBcr+wkCUjSLEuRoAURufLqPu1yYwm
	fOk9oB5vTYXW97BD3P4r04F7wq1+kHYfl+bnuVzXnM8mVOjJQvNP/7MxjN7yYlojqLh6
	XskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WRB3GKdIoWmyelIqahNClPe9gI4hGbRB2Yq1NwfV4ew=;
	b=WtiZnhtDqVt0I2GSziJACwP/vomrn1v6GCgD44P5bE5XpyZkr8v16pEh9CQVjilEwB
	jUKquQ0o0wrXpgBEI7jptXHb5kv8e9svmhBReDgxw7p8wGKjtWp/n8gud+Taz0vU+VW4
	xOOzCKZxDiBfksu9H4Dyoch8sJtZjEWgw3uFe+oBwRlqtSSNJ3BSjsYzZTjA1aWLlmvq
	jO3c8HB/A1o5YQ887lyWVAktUiosFE/bqNZ01yn50QAgg/aJW3lkahgr1QyTgj3GepEs
	v41+/pvks/lFPN5Selhr78g0VZj/WUdZkGIEtnQVj6NQbmyfYK8kLCrB6qig/7gJG0XZ
	BpdQ==
X-Gm-Message-State: APf1xPAfT0t7zQ1NZ0c2UgkOm/TRRcs2VQhmk/mXjcrQSQAtaSEsd6Qb
	e6euTKAf17nkee653cHx9agMgA==
X-Google-Smtp-Source: AH8x226zBkBAdRgD3v4B/a0K08irVvrA8tPBWQsnAg+Tb88bTOYtEFlDWkw3PT+f8pO2CqNpSL804Q==
X-Received: by 2002:a17:902:6b43:: with SMTP id
	g3-v6mr8314879plt.177.1519594278428; 
	Sun, 25 Feb 2018 13:31:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id f3sm12467918pgn.9.2018.02.25.13.31.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:31:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:31:12 -0800
Message-Id: <1519594272-24403-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594272-24403-1-git-send-email-akuster808@gmail.com>
References: <1519594272-24403-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 2/2] openl2tp: fix compile issue with 4.15 kernel
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
X-List-Received-Date: Sun, 25 Feb 2018 21:31:17 -0000

see: http://errors.yoctoproject.org/Errors/Details/168101/ for errors.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openl2tp/openl2tp/fix_linux_4.15_compile.patch | 44 ++++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/fix_linux_4.15_compile.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/fix_linux_4.15_compile.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/fix_linux_4.15_compile.patch
new file mode 100644
index 0000000..4597df8
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/fix_linux_4.15_compile.patch
@@ -0,0 +1,44 @@
+This fixes a compile issue introduced with linux kernel 4.15
+
+include/linux/in.h:222:8: error: redefinition of 'struct in_pktinfo'
+|  struct in_pktinfo {
+
+
+Upstream-Status: Pending
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: openl2tp-1.8/plugins/ppp_unix.c
+===================================================================
+--- openl2tp-1.8.orig/plugins/ppp_unix.c
++++ openl2tp-1.8/plugins/ppp_unix.c
+@@ -25,9 +25,14 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <signal.h>
++#include <linux/version.h>
++
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 0)
+ #include <net/ethernet.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
++#endif
++
+ #include <arpa/inet.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+@@ -41,12 +46,12 @@
+ #define __user
+ #endif
+ #include <sys/ioctl.h>
+-#include <linux/if_ether.h>
+-#include <linux/if_pppox.h>
+ #include <linux/ppp_defs.h>
+ #include <linux/if_ppp.h>
++#include <linux/if_pppox.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 0)
+ #include <linux/if_pppol2tp.h>
+-
++#endif
+ #include "usl.h"
+ #include "l2tp_private.h"
+ 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index bf6850b..1f6b4de 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -33,6 +33,7 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://openl2tpd.service \
            file://openl2tpd-enable-tests.patch \
            file://run-ptest \
+           file://fix_linux_4.15_compile.patch \
            "
 
 SRC_URI_append_libc-musl = "\
-- 
2.7.4


