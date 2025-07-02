Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF9CC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:55:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.18266.1751442903649042604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kli8KjXQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751442904; x=1782978904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DfLVs+5+2bWqN/qcxrI13Kwvy54RUuDAmzNEgYVjiww=;
  b=kli8KjXQEyhVfhqxi9SvzGx7xBJYGdl1PUU2Ab0JwbCyGAEWwqgCFay7
   OUteMi0Y2epGOAGLYtU9cmEzBoWO04SRY/iB0Eicc4ccAuhP9DcqLJY6h
   bXC/H/loeT7x4uGfsVlGwJhz7q5Wa6SPPNzS1PxTbmck5f38B+YxfpaN3
   lgm7/o4J2sc73ioiSJ6kE+Qq6YD5h+GHM9F4nievKbtRuIQ65/f422v0I
   9Eoxy4rWp3GKvxYBCqD1KvOcCK81eSq5uFFUYo7yfcvw2Wr6OiM7Pz+PO
   TrdNxgKd45uChi7QAahtGR4y1MF+LEx0acuhkCqJs/jK9rpKdM/+3i9jj
   g==;
X-CSE-ConnectionGUID: yGwKZHiCScS5E+OgizwEEg==
X-CSE-MsgGUID: vm+MsdpuQgSYD0DEdaXqcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="208133239"
X-IronPort-AV: E=Sophos;i="6.16,281,1744038000"; 
   d="scan'208";a="208133239"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 16:55:02 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1703B1C1C701
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Jul 2025 07:55:02 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 52980C06BFA
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Jul 2025 07:55:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B687DC18A3
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Jul 2025 16:54:59 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.160.53])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DDAAB1A000B;
	Wed,  2 Jul 2025 15:54:58 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: maxj.fnst@fujitsu.com,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] hwloc: upgrade 2.9.3 -> 2.12.1
Date: Wed,  2 Jul 2025 15:54:50 +0800
Message-ID: <20250702075451.892-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 07:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118199

Version 2.12.1
--------------
* Add hwloc-calc's --default-nodes option to hwloc-bind and hwloc-info.
* Improve the --best-memattr "default" fallback, try to use "default"
  memory nodes, and add verbose messages and warnings if some
  performance info are incomplete or missing.
  Thanks to Antoine Morvan for the report.
* Fix CPU and memory binding on different locations,
  thanks to Antoine Morvan for the report.
* Add HWLOC_LOCAL_NUMANODE_FLAG_INTERSECT_LOCALITY and enable it by
  default in hwloc-calc --local-memory for finding local NUMA nodes
  that do not exactly match input locations.
  Thanks to Antoine Morvan for the report.
* Fix a possible crash in the x86 backend when Qemu is configured to
  expose multicore/thread CPUs that are actually single-core/thread.
  Thanks to Georg Pfuetzenreuter.

Version 2.12.0
--------------
* Add hwloc_topology_get_default_nodeset() for the set of default
  NUMA nodes.
  - hwloc-calc now has --default-nodes option.
* Rework oneAPI LevelZero support to use zesInit() and avoid the need
  to set ZES_ENABLE_SYSMAN=1 in the environment.
  - zesDriverGetDeviceByUuidExp() is now required in the L0 runtime.
  - ZES/Sysman variants were added in hwloc/levelzero.h to specifically
    handle ZES/Sysman device handles.
* Fix the locality of AMD GPU partitions, thanks to Edgar Leon for
  reporting and debugging the issue.
* Better detect Cray Slingshot NICs, thanks to Edgar Leon.
* Add support for Die objects and Module groups on Windows.
* Only filter-out Dies that are identical to their Packages
  when it applies to all Dies.
* Improve hwloc-calc to handle CPU-less NUMA nodes or platforms with
  heterogeneous memory without requiring --nodeset-output.
* hwloc-calc now accepts counting/listing cpukinds and memory tiers
  with -N and -I cpukind/memorytier.
* The systemd-dbus-api output of hwloc-calc has changed, and
  --nodeset-output-format was added, to support NUMA node outputs.
  Thanks to Pierre Neyron.
* Update NVLink bandwidth and CUDA capabilities up to NVIDIA Blackwell.
* Fix some NUMA syscalls on Linux for platforms with old libc headers.
* Some minor fixes in distances.

Version 2.11.2
--------------
* Add missing CPU info attrs on aarch64 on Linux.
* Use ACPI CPPC on Linux to get better information about cpukinds,
  at least on AMD CPUs.
* Fix crash when manipulating cpukinds after topology
  duplication, thanks to Hadrien Grasland for the report.
* Fix missing input target checks in memattr functions,
  thanks to Hadrien Grasland for the report.
* Fix a memory leak when ignoring NUMA distances on FreeBSD.
* Fix build failure on old Linux distributions without accessat().
* Fix non-Windows importing of XML topologies and CPUID dumps exported
  on Windows.
* hwloc-calc --cpuset-output-format systemd-dbus-api now allows
  to generate AllowedCPUs information for systemd slices.
  See the hwloc-calc manpage for examples. Thanks to Pierre Neyron.
* Some fixes in manpage EXAMPLES and split them into subsections.

Version 2.11.1
--------------
* Fix bash completions, thanks Tavis Rudd.

Version 2.11.0
--------------
* API
  + Add HWLOC_MEMBIND_WEIGHTED_INTERLEAVE memory binding policy on
    Linux 6.9+. Thanks to Honggyu Kim for the patch.
    - weighted_interleave_membind is added to membind support bits.
    - The "weighted" policy is added to the hwloc-bind tool.
  + Add hwloc_obj_set_subtype(). Thanks to Hadrien Grasland for the report.
* GPU support
  + Don't hide the GPU NUMA node on NVIDIA Grace Hopper.
  + Get Intel GPU OpenCL device locality.
  + Add bandwidths between subdevices in the LevelZero XeLinkBandwidth
    matrix.
  + Fix PCI Gen4+ link speed of NVIDIA GPU obtained from NVML,
    thanks to Akram Sbaih for the report.
* Windows support
  + Fix Windows support when UNICODE is enabled, several hwloc features
    were missing, thanks to Martin for the report.
  + Fix the enabling of CUDA in Windows CMake build,
    Thanks to Moritz Kreutzer for the patch.
  + Fix CUDA/OpenCL test source path in Windows CMake.
* Tools
  + Option --best-memattr may now return multiple nodes. Additional
    configuration flags may be given to tweak its behavior.
  + hwloc-info has a new --get-attr option to get a single attribute.
  + hwloc-info now supports "levels", "support" and "topology"
    special keywords for backward compatibility for hwloc 3.0.
  + The --taskset command-line option is superseded by the new
    --cpuset-output-format which also allows to export as list.
  + hwloc-calc may now import bitmasks described as a list of bits
    with the new "--cpuset-input-format list".
* Misc
  + The MemoryTiersNr info attribute in the root object now says how many
    memory tiers were built. Thanks to Antoine Morvan for the report.
  + Fix the management of infinite cpusets in the bitmap printf/sscanf
    API as well as in command-line tools.
  + Add section "Compiling software on top of hwloc's C API" in the
    documentation with examples for GNU Make and CMake,
    thanks to Florent Pruvost for the help.

Version 2.10.0
--------------
* Heterogeneous Memory core improvements
  + Better heuristics to identify the subtype of memory such as HBM,
    DRAM, NVM, CXL-DRAM, etc.
  + Build memory tiers, i.e. sets of NUMA nodes with the same subtype
    and similar performance.
    - NUMA node tier ranks are exposed in the new MemoryTier info
      attribute (starts from 0 for highest bandwidth tier)..
  + See the new Heterogeneous Memory section in the documentation.
* API
  + Add hwloc_topology_free_group_object() to discard a Group created
    by hwloc_topology_alloc_group_object().
* Linux backend
  + Fix cpukinds on NVIDIA Grace to report identical cores even if they
    actually have very small frequency differences.
    Thanks to John C. Linford for the report.
  + Add CXLDevice attributes to CXL DAX objects and NUMA nodes to show
    which PCI device implements which window.
  + Ignore buggy memory-side caches and memory attributes when fake NUMA
    emulation is enabled on the Linux kernel command-line.
  + Add more info attributes in MemoryModule Misc objects,
    thanks to Zubiao Xiong for the patch.
  + Get CPUModel and CPUFamily info attributes on LoongArch platforms.
* x86 backend
  + Add support for new AMD CPUID leaf 0x80000026 for better detection
    of Core Complex and Die on Zen4 processors.
  + Improve Zhaoxin CPU topology detection.
* Tools
  + Input locations and many command-line options (e.g. hwloc-calc -I -N -H,
    lstopo --only) now accept filters such as "NUMA[HBM]" so that only
    objects are that type and subtype are considered.
    - NUMA[tier=1] is also accepted for selecting NUMA nodes depending
      on their MemoryTier info attribute.
  + Add --object-output to hwloc-calc to report the type as a prefix to
    object indexes, e.g. Core:2 instead of 2 in the output of -I.
  + hwloc-info --ancestor and --descendants now accepts kinds of objects
    instead of single types.
    - The new --first option only shows the first matching object.
  + Add --children-of-pid to hwloc-ps to show a hierarchy of processes.
    Thanks to Antoine Morvan for the suggestion.
  + Add --misc-from to lstopo to add Misc objects described in a file.
    - To be combined with the new hwloc-ps --lstopo-misc for a customizable
      lstopo --top replacement.
* Misc
  + lstopo may now configure the layout of memory object placed above,
    for instance with --children-order memory:above:vert.
  + Fix XML import from memory or stdin when using libxml2 2.12.
  + Fix installation failures when configuring with --target,
    thanks to Clement Foyer for the patch.
  + Fix support for 128bit pointer architectures.
  + Remove Netloc.

Changelog: https://github.com/open-mpi/hwloc/blob/v2.12/NEWS

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../hwloc/{hwloc_2.9.3.bb => hwloc_2.12.1.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_2.9.3.bb => hwloc_2.12.1.bb} (86%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb
similarity index 86%
rename from meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb
index d72c5f2be5..f56142dffd 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_2.9.3.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.12.1.bb
@@ -7,9 +7,9 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec"
-UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.12/downloads/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "38a90328bb86259f9bb2fe1dc57fd841e111d1e6358012bef23dfd95d21dc66b"
+UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.12/"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


