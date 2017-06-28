Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD1F78049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:48 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id j186so24139827pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FpsR74EfE1+vQY8gUq21obtcmOAZBki6Dtkey2HDPzc=;
	b=EDjFRtE3Di6Pm1J8df03RrVNp5B/Fp5co02PfMyT5HLJR4sYc/ZHpIxECkVUB7HFJz
	ppuhpDpDS2zc0/Ght/ILrhAVEM0iMzg2qoCWGMPnPq+LVHESaTdjKRCSSg7hjWpKnluj
	B9/IvFABm3QvLxRd+UT5Edc+xTlYfv6B+d1SJejUiH3g7SgiUYDo2HI75OMfcnimRwIW
	GAl1My1DHArFkFWJWcpCf+YI08XbbqXcP9C9eM2k3w/kbqGQ51uXaQLyhlnLZqaRnI6r
	c/oA4skQPsHZxcuJxjFTmyQpZOPzXn1S8+dXKmMKOj9G8LfFLA+AZfd6W9F01ibfGq7w
	eXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FpsR74EfE1+vQY8gUq21obtcmOAZBki6Dtkey2HDPzc=;
	b=YgfS++WGDxPjQihbj1Olu6+ZidZrkGgourF0n3cGUy7Nl17AiamYxYyeAF4qN3R8Lu
	cvaV7CC6aQ+W1FxrQo9uYcvx+DWElsEA/5wcEJz2k8Bjtyz/B4BPlDcoU4PjU9xJEazf
	h5t/Vy0QpV8MTM1hFRnwBEsNFw0ITXDsckQV9T9P5VXl4DUDnoi2nqGf7DcmdeE4nPpK
	CWgPWwzQNtZM7M7W8jHyO1/OgdXBsI6Rf4JQsV3Lw8BZKNB3yxzTVUkbGVW+7jeb4NHU
	Jf2Ka1paXTYLkbWwHfJbAz7FRBmywK1P3ParPsaXM8ZbNINsIlWjU9dm7T+UcEmScE1K
	1loQ==
X-Gm-Message-State: AKS2vOwZaTOBhfojnGs+fKAB3nSDWRuqBczbtoUsfdVgXhnuKpeQgugH
	ZvzqiM7qo3aCH+l1
X-Received: by 10.99.96.204 with SMTP id u195mr8017424pgb.125.1498615729313;
	Tue, 27 Jun 2017 19:08:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:13 -0700
Message-Id: <20170628020819.17047-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/13] netkit-rpc: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-rpcgen-Fix-printf-formats.patch           | 51 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb   |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch

diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
new file mode 100644
index 000000000..8bd77d2e4
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
@@ -0,0 +1,51 @@
+From 439e3e35f7fcbff1abb782de4b19b31e43ae3449 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 09:59:19 -0700
+Subject: [PATCH] rpcgen: Fix printf formats
+
+Fixes build with hardening flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rpcgen/rpc_hout.c   | 2 +-
+ rpcgen/rpc_tblout.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/rpcgen/rpc_hout.c b/rpcgen/rpc_hout.c
+index 0ef52df..09a7b57 100644
+--- a/rpcgen/rpc_hout.c
++++ b/rpcgen/rpc_hout.c
+@@ -474,7 +474,7 @@ pdeclaration(const char *name, declaration *dec, int tab,
+ 			break;
+ 		}
+ 	}
+-	f_print(fout, separator );
++	f_print(fout, "%s", separator );
+ }
+ 
+ static int
+diff --git a/rpcgen/rpc_tblout.c b/rpcgen/rpc_tblout.c
+index d64bfde..fd62a52 100644
+--- a/rpcgen/rpc_tblout.c
++++ b/rpcgen/rpc_tblout.c
+@@ -99,7 +99,7 @@ write_table(const definition *def)
+ 		} 
+ 		else {
+ 			expected = 1;
+-			f_print(fout, null_entry);
++			f_print(fout, "%s", null_entry);
+ 		}
+ 		for (proc = vp->procs; proc != NULL; proc = proc->next) {
+ 			current = atoi(proc->proc_num);
+@@ -139,7 +139,7 @@ write_table(const definition *def)
+ 		}
+ 
+ 		/* print the table trailer */
+-		f_print(fout, tbl_end);
++		f_print(fout, "%s", tbl_end);
+ 		f_print(fout, tbl_nproc, progvers, progvers, progvers);
+ 	}
+ }
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
index abc9d88cb..75ec07cfe 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
@@ -5,7 +5,9 @@ LICENSE = "SPL-1.0"
 LIC_FILES_CHKSUM = "file://rpcinfo/rpcinfo.c;beginline=2;endline=3;md5=3e6339e3ce266e1122c5ba293e04bc89"
 
 SRC_URI = "http://sources.openembedded.org/${BPN}-${PV}.tar.gz \
-           file://gcc4.patch"
+           file://gcc4.patch \
+           file://0001-rpcgen-Fix-printf-formats.patch \
+           "
 SRC_URI[md5sum] = "67212720482ea1aea9182a98653a9642"
 SRC_URI[sha256sum] = "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b5e933ddad8a14d3b"
 
-- 
2.13.2


