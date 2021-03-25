Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web08.1864.1616689110059687383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=ALHPJmBx;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2095; q=dns/txt; s=iport;
  t=1616689108; x=1617898708;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wHpn4mL6wDdB80DBRk1PZ1a8d63w9OPfLfxeRt17p1M=;
  b=ALHPJmBxhUUFYXdm3CMSI4npRqsMCClVDwaUEEtaPQUPqKdf5CuiJD3c
   dw55rS6yEwUHfArWIrXRfGQXMJDsMGTZ2MZlS2qOP6uiwsIG4mHGcgcWd
   vsgEVRK0XPXoRUS2POBthCuJxo1HijAk02y5amrpAavRBGRJJuz07zcWa
   0=;
X-IPAS-Result: =?us-ascii?q?A0AgAQDXtlxgmIsNJK1aglmDIVYBOTGwb4F8CwEBAQ0BA?=
 =?us-ascii?q?SQQBAEBhk4CJTQJDgIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhjYNh?=
 =?us-ascii?q?n0BdF9EgnABgweqXoIphViDP4FEgTmIXYRmJhyBSUKEbIUNhSkEgkeBD02BW?=
 =?us-ascii?q?p8AnB+DEIlZknoPIoUFn0u0EYN/AgQGBQIWgVQ4gVszGggbFYMkCUcZDY44g?=
 =?us-ascii?q?jGBDIsSIQMvAjYCBgoBAQMJh20BAQ?=
IronPort-HdrOrdr: A9a23:tDgLx64xaAcvWKYITgPXwFDXdLJzesId70hD6mlaTxtJfsuE0/
 20lPMA2hPuzBoXUncsmdePUZPwI0/02JZp7eAqU4uKcxLhvAKTQb1KyavH73neFzbl9uhbvJ
 0QEJRWLNHrF1B1gYLb7WCDcuoI+9WM/KC2ieq29R4EJmtXQpt95AR0ABvzKCJLbTRBbKBUKL
 Osou5Opz+tYh0sDviTNz0iQ/XJocHNmdbAZxMLbiRXjDWmvHeP9KPwFQSe01Mldw53hZ0m8W
 TDjmXCl8Cej80=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="684003530"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 16:18:27 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PGISuK013788
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 16:18:29 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 6E85ECC1251; Thu, 25 Mar 2021 09:18:28 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
Date: Thu, 25 Mar 2021 09:18:28 -0700
Message-Id: <20210325161828.41393-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
Content-Transfer-Encoding: 8bit

Have not seen build issues for 5.4 and 5.10
x86-64 kernels so allow to build it

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

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
index 1758430bc..e58bdd493 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -32,4 +32,3 @@ python do_package_prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
-PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
-- 
2.26.2.Cisco

