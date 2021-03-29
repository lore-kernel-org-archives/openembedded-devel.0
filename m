Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web12.2776.1617048647084095962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 13:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=KZ7P75XK;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1139; q=dns/txt; s=iport;
  t=1617048647; x=1618258247;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zHNsZFRlNVR+BO0r43Jlf2f7ybti1Hw2goTuZoJmtdA=;
  b=KZ7P75XKbp2h8y3SSlPQ+M2Sw0/RQwfb3u4oEJZRpcRC7FtXBsnjccGT
   u3V0WPAnN7okmHra4Y6PmEuHbx3Wjw6L4RkdcetGh1dBzI+d+9gvSOl06
   PlKLOYGSgoU0QzyupIYZsArPKroh3wHMm33TZ6TtCxx8WzB/V597JGa7g
   s=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AnGQMO6F85zIhUTWRpLqEcMeALOonbusQ8z?=
 =?us-ascii?q?AX/mp2TgFYddHdqtunm+4V2QSxpDEaXnwhnt7oAtjjfVrw/YN4iLN+AZ6MRw?=
 =?us-ascii?q?/j0VHEEKhHza/PhwLtADf/8Ok179YCT4FbBMfrBVZ3yeb2iTPYL/8azNOK8L?=
 =?us-ascii?q?+liI7lph8HJz1CUb1q7AtyF2+gfXFeeQ8uP/YEPavZwsJGoja6EE52Uu2LQl?=
 =?us-ascii?q?8YQuPEu9rH0LXhbBJuPW9C1CC+yRW19bX9Dx+Umi07bgoK67Ij/W/Z+jaJg5?=
 =?us-ascii?q?mejw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C+AwBGM2Jg/51dJa1aglmCK3ZWATk?=
 =?us-ascii?q?xsGqBfAsBAQENAQEgFAQBAYZUAiU0CQ4CAwEBDAEBBQEBAQIBBgRxhWENhn0?=
 =?us-ascii?q?BgVNEgnABgweqbIIphViDJoFEgTmIZIRmJhyBSUKBEoNahAeBBoUpBIJHgQ6?=
 =?us-ascii?q?BTLt7gxCJWZJ6DyKFBZ9LtBGDfwIEBgUCFoFUOoFZMxoIGxWDJAlHGQ2QaYt?=
 =?us-ascii?q?+QQMvOAIGCgEBAwmGXIJFAQE?=
X-IronPort-AV: E=Sophos;i="5.81,288,1610409600"; 
   d="scan'208";a="609118680"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 Mar 2021 20:10:45 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 12TKAjmu024992
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Mar 2021 20:10:45 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id CD10BCC1251; Mon, 29 Mar 2021 13:10:44 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: improve reproducibility
Date: Mon, 29 Mar 2021 20:10:44 +0000
Message-Id: <20210329201044.63642-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.23.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Content-Transfer-Encoding: 8bit

Pass -f(debug|macro)-prefix-map through CC because libbpf
build system overrides CFLAGS. Also remap STAGING_KERNEL_DIR
because it is also stored in resulting executable

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 15143a90b..f0696db59 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -9,7 +9,16 @@ inherit bash-completion kernelsrc kernel-arch
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-EXTRA_OEMAKE = "V=1 -C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+EXTRA_OEMAKE = "\
+    V=1 \
+    -C ${S}/tools/bpf/bpftool \
+    O=${B} \
+    CROSS=${TARGET_PREFIX} \
+    CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}" \
+    LD="${LD}" \
+    AR=${AR} \
+    ARCH=${ARCH} \
+"
 
 SECURITY_CFLAGS = ""
 
-- 
2.23.1

