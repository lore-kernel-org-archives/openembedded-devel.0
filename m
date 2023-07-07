Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1805CC04A6A
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4900.1688699648883492827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="102453326"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="102453326"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 95243C53D2
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE69BE140C
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6E508802D;
	Fri,  7 Jul 2023 12:14:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] renderdoc: upgrade 1.13 -> 1.27
Date: Fri,  7 Jul 2023 11:13:34 +0800
Message-Id: <1688699627-2519-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-4.505500-10.000000
X-TMASE-MatchedRID: SQmOk5wKiNajz0nOeth/yXg2y0j5vXZGlEDhvi2wR879wRnyxuPjhD7o
	3RYnDYPiynJamoOoK2YUH8PmWo2hhfXNEkgZOg/OCtzGvPCy/m5aoY8OZpUOyvnbrXgffMWITLT
	7TibJ7Y4Kx6jkYhVsxlOaJFtT3Rxm9RYy+aTqMwXWX4GMszyWyiqeRvi0KNXOXV3nmazSW4KitV
	zRHf8k+74fHF5XJNHgIHhML4CpCL5S0bd+i8J5eRHdIZ6edcbrUTBIPA569SG3L2aPW6sT0miXc
	D8fWgFvQkZ7AW6YoYIc5cYAt+FSho3Xp4wPKyd5RN+FMKVZBhFZoq85oEW2FCWxD2S0xfx/SMQa
	rOD+Oq6N9M3+OgU/CBbUWKBg6smt6nQxsRvaKcD3Hev8a6G/J+9Bi8r8zoNMteXjSBMYnmkRySi
	bCGB5xfkC9q4/CNNjYTBWmuuhXOVlwOzXLSTHokPgdOtHbbAjPl+VK9zsVxwfmRnL8RBuBCToWH
	TPugn4l2GUABdhPsxGPQ7oAgOiYJE4FU2ZdQO4qoeab9Xgz8/iUNNpI6ZR4JTx+2LIqNmt0yOPB
	v1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3X3j/lf1V8LPioIsi7Sa0gYA3qL69rXq6RY0Jy
	fRdA4hB/lt5QeuwcqSlmCUSTs2EQnn4qR0Bq7m9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+inTK
	0bC9eKrauXd3MZDXFwAeP0z4Zkl34jmZ1NyAGtmYLuOqHOZNSrX5lfvZgRIrBM3NZpmgp/tikUf
	i023OmzMCYKzMyUiRZUWCPD2AZXieZaroR1JgEOVjMf4VojFPJnXL2yNYdkuo847l05tDEzMyAm
	sz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103694

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
Python API changes
------------------
-D3D12Sampler.borderColor has been split into D3D12Sampler.borderColorType and
 D3D12Sampler.borderColorValue, and similarly for VKSampler.borderColor into
 VKSampler.borderColorType and VKSampler.borderColorValue, to allow for integer
 border colour types.
-D3D12RasterizerState.multisampleEnable and D3D12RasterizerState.lineRasterMode
 have been removed and replaced with D3D12RasterizerState.lineRasterMode of type
 LineRaster.

Features/Improvements
--------------------
 D3D12: Add support for new SDK 1.610.1:

 New state functionality
 New sampler creation parameters and PSO chunks
 New barrier API

 All: Show explicit dropdown arrow for tool buttons with menus.
 All: Report Windows 11 separately in analytics.
 Vulkan & D3D12: Optimisations to capture time overhead and GPU Syncs.
 D3D11: Disable query for undocumented internal D3D interface in composition API.

Bugfixes
----------
 All: Fix potential crash when reading large amounts of data from sockets.
 All: Fix potential crash when serialising strings if length is corrupted.
 All: Fix potential crashes/fatal errors rendering 0x0 thumbnails.
 All: Remove fatal errors in XML codec and have error handling for corrupted XML.
 All: Sanitise strings printed when received from target control/remote server.
 All: Save any capture changes (renames/bookmarks) to local file when remotely replaying.
 UI: Fix potential race when destroying windows while command is in flight
 Linux: Don't open symlinks when opening logfile.
 Linux: Try to handle processes on linux that fork without exec.
 Linux: Work around bash overriding getenv/setenv with custom implementation.
 Android: Make timeouts waiting for process to start just depressingly high.
 Android: Speculative fix for Android thread race condition.
 Windows: Ignore windows.storage.dll which spams a huge number of LoadLibrary calls.
 D3D: Fix shader debugging using wrong operand to look up resources in some gather4 opcodes.
 D3D11: Fix handling of RestoreDeferredContextState during capture if state isn't restored.
 D3D12: Add fatal error handling if a map fails during replay.
 D3D12: Add GPU syncs between potential moves of work across different queues.
 D3D12: Fix a bug with incorrect forward reference detection in DXIL.
 D3D12: Fix a discrepancy in DXIL disassembly from dxc.
 D3D12: Fix crash when D3D12 descriptor table is bound off the end of a heap.
 D3D12: Handle some unusually formatted DXIL shaders with missing implicit pointer types.
 OpenGL: Add workaround for Intel bug in pixel history.
 OpenGL: Don't show stencil for non-final fragments.
 OpenGL: Fix pixel history being affected by pixel pack/unpack state.
 OpenGL: Fix pixel history not using full precision depth.
 OpenGL: Fix pixel history on framebuffers that don't have stencil.
 OpenGL: Fix reporting of 10:10:10:2 resource formats.
 OpenGL: Fix some GL pixel history cases where not all events would be replayed correctly.
 OpenGL: Fix state tracking issues in GL pixel history.
 OpenGL: Handle drawbuffers when they aren't simple direct 1:1 with attachments
 OpenGL: Work around nvidia bug with failing GLX query.
 GLES: Fix requiring some proper GL GLSL extensions on GLES for blit shader.
 GLES: Fix use of proper GL function that's not available on GLES.
 GLES: Remove reset notification EGL context attribute preventing context sharing.
 Vulkan: Add fallback for shader feedback on Intel GPUs without int64 support.
 Vulkan: Disable buggy vulkan layers.
 Vulkan: Don't include discard in resource usage until end of renderpass.
 Vulkan: Fix a bug causing present fence extension to crash.
 Vulkan: Fix a missing flush for mapped non-coherent memory.
 Vulkan: Fix a potential GPU timeout on draws with huge number of instances with GS.
 Vulkan: Fix an incorrect use of GetInstanceProcAddr when initialising vkCreateDevice.
 Vulkan: Fix crashes for input structures with builtins.
 Vulkan: Fix depth results for fragments in pixel history.
 Vulkan: Fix detection of scalar packing from only matrix layout.
 Vulkan: Fix pixel history on framebuffers that don't have stencil.
 Vulkan: Fix separate stencil operations being applied properly with dynamic rendering.
 Vulkan: Fix uint/int bindings being broken in custom shader templates.
 Vulkan: Manually check and report depth bounds test in vulkan pixel history.
 Vulkan: Work around further broken Intel occlusion queries in pixel history.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../renderdoc/{renderdoc_1.13.bb => renderdoc_1.27.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.13.bb => renderdoc_1.27.bb} (89%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
similarity index 89%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
index ceff54f46a..c89b2d1c99 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
@@ -2,9 +2,9 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=36d34a46cb71546195d2b0c626a52e5d"
 
-SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
+SRCREV = "35b13a8e8fd2a331854dba6da81a20452e142d6f"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
     file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
-- 
2.34.1


