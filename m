Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.1414.1616687650795306321
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=N2xQmovg;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1907; q=dns/txt; s=iport;
  t=1616687651; x=1617897251;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZfRYkIHT//0tJxHsTOCt9K3KwCpQZjYxZ2/4pZDm51w=;
  b=N2xQmovgMFoVw/XITN8axfcf90OA8KjbLskhaBvjJZyOvbs89SFkkxIC
   cRwXR2tSm/r6Qyp6dUwz2BX8JZrYUwVV4eNmdI6VuDhEOuRhuh1Syb1d0
   e3/edkdP4pnIKJu3BYcc6W/QtAcIvnasFGHCKLjHc2iwqdZkUKvBspaZP
   c=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AAypkc6BN5JygWf7lHek055DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UZ3VBBTb4ikjMiohvsWzlvZjzwWVXEml7m7Scu9aF7V6JId2+csFJi4Wg?=
 =?us-ascii?q?2OggaVBaVDyaen/DH6AS358YdmpMRdWoxzEsf5A1Q/rcuS2miFOu0tytWG76?=
 =?us-ascii?q?yk7N22pxwGcShRd6pi4w1lYzz1LmRKQmB9aaYRJd657spDqyHIQxQqR/X+IG?=
 =?us-ascii?q?UZVO7eoNCOs5TqbXc9dnoawTjLqy+047jnFBXd5DMiandkxLcv9nWtqX2d2p?=
 =?us-ascii?q?me?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BmAwCusVxg/5xdJa1aglmCK3ZWATk?=
 =?us-ascii?q?xsHCBfAsBAQENAQEkEAQBAYZOAiU0CQ4CAwEBCwEBBQEBAQIBBgRxhWENhn0?=
 =?us-ascii?q?BdF9EgnABgweqSIIphViDP4FEgTmIXYRmJhyBSUKEbIUNhSkEgkeBD02BWp8?=
 =?us-ascii?q?AnB+DEIlZknoPIoUFn0u0EYN/AgQGBQIWgVQ6gVkzGggbFYMkCUcZDZBpgQy?=
 =?us-ascii?q?LEiEDLwI2AgYKAQEDCYdtAQE?=
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="607539465"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 15:54:08 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PFs50P010380
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 15:54:06 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id B8BDBCC1251; Thu, 25 Mar 2021 08:54:01 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: remove recipe from blacklist
Date: Thu, 25 Mar 2021 08:54:01 -0700
Message-Id: <20210325155401.37285-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Transfer-Encoding: 8bit

Have not seen build issues for 5.4 and 5.10
kernels so allow to build it

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c717d45e5..eb3d51c62 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -597,6 +597,7 @@ RDEPENDS_packagegroup-meta-oe-graphics_remove_libc-musl = "renderdoc"
 
 RDEPENDS_packagegroup-meta-oe-kernel ="\
     agent-proxy \
+    bpftool \
     crash \
     cpupower \
     ipmitool \
@@ -613,7 +614,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
 
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

