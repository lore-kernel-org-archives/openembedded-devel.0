Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web10.10847.1616755550278787306
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 03:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=jxp6R/GH;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2300; q=dns/txt; s=iport;
  t=1616755550; x=1617965150;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sFip7Ngk2XIECpU5LM6mld3t2zhlWhHK4+04eZ/RLt4=;
  b=jxp6R/GHiOCAiTIcl4PiTdTZNNVSLx94KxhE0gyPYkJn+z77vgGmlBdd
   1l106Hy1W/6LUh++WIkspgyjFp39hByeiIlZLO4qwN3tzu0XUlzPl2FIe
   m20c64R6B0DK6txnKUEMHM6ouNa8HRsIc+QNoxigGPy+23gAYAceW4FmP
   w=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ay9Olp6uvPSHCre6X0KXHcTXl7skD7tV00z?=
 =?us-ascii?q?AX/kB9WHVpW+afkN2jm+le6AT9jywfVGpltdeLPqSBRn20z+8W3aA9NaqvNT?=
 =?us-ascii?q?OJhEKGN4dnhLGO/xTFOwnTstFQzr1hda8WMqySMXFfgdzh6Ae1V/YsqePnzI?=
 =?us-ascii?q?mSie3Tz2hgQGhRAskKhTtRMBqREUF9WWB9aqYRKZz03KZ6jgvlXXwWa8ihb0?=
 =?us-ascii?q?NkY8Hz4/vWiZnhfRkKQzkg5QXmt0LN1JfKVz6FwxwZTzRDhY0HzFGAuQn46q?=
 =?us-ascii?q?K/2svLryPh6w=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ClAwAFul1g/5RdJa1aglmCK3ZWATk?=
 =?us-ascii?q?xsG+BfAsBAQENAQEkEAQBAYZSAiU0CQ4CAwEBDAEBBQEBAQIBBgRxhWENhn0?=
 =?us-ascii?q?BdF9EgnABgweqSoIphViDQ4FEgTmIXYRmJhyBSUKEbIUNhSkEgkeBD02BWp8?=
 =?us-ascii?q?AnB+DEIlZknoPIoUFn0u0EYN/AgQGBQIWgVQ6gVkzGggbFYMkCUcZDZBpgQy?=
 =?us-ascii?q?LEiEDLwI2AgYKAQEDCYduAQE?=
X-IronPort-AV: E=Sophos;i="5.81,280,1610409600"; 
   d="scan'208";a="876869861"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Mar 2021 10:45:48 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 12QAjmjO031772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 10:45:48 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id EFC24CC1251; Fri, 26 Mar 2021 03:45:47 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] bpftool: remove recipe from blacklist
Date: Fri, 26 Mar 2021 03:45:47 -0700
Message-Id: <20210326104547.90765-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Content-Transfer-Encoding: 8bit

Have not seen build issues for 5.4 and 5.10
x86-64 kernels so allow to build it

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c717d45e5..6f7e6fc74 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
     trace-cmd \
 "
 RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select ipmiutil pm-graph turbostat"
-RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
 RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
 
 # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
 RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
-RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash intel-speed-select kernel-selftest minicoredumper turbostat"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash intel-speed-select kernel-selftest minicoredumper turbostat"
 
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 1758430bc..15143a90b 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -15,6 +15,7 @@ SECURITY_CFLAGS = ""
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
+COMPATIBLE_HOST = "(x86_64).*-linux"
 COMPATIBLE_HOST_libc-musl = 'null'
 
 do_compile() {
@@ -32,4 +33,3 @@ python do_package_prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
-PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
-- 
2.26.2.Cisco

