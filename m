Return-Path: <nicolas.ferre@atmel.com>
X-Greylist: delayed 314 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jan 2017 14:31:42 UTC
Received: from email.microchip.com (smtpout.microchip.com [198.175.253.82])
	by mail.openembedded.org (Postfix) with ESMTP id 06ACA773E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:31:42 +0000 (UTC)
Received: from tenerife.corp.atmel.com (10.10.76.4) by
	chn-sv-exch05.mchp-main.com (10.10.76.106) with Microsoft SMTP Server
	id 14.3.181.6; Fri, 27 Jan 2017 07:26:38 -0700
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jan 2017 15:26:39 +0100
Message-ID: <20170127142639.24159-1-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAC+NgFvrFIsWRWlGSWpSXmKPExsXCxeXDojsvojvC4Mahh+c4LL5dbma3uHh4KbMDk8eCX1tZPM5tXMEYwBTFmpmXlF+RwJrxat5TpoL7XBXrNs1lamBczdnFyMUhJLCeUaL71QH2LkZODjYBXYmzE56wgdgiQPbHD3MZQWxmAW2JrwuWsYDYwgK2Ev+3rQaq5+BgEVCVuP+TA8TkFbCROPVBHqRCQkBOouH8fWYQm1dAUOLkzCcsEFMkJA6+eAEWFxJQkeh7388OUR8oMWXhf0YI20li5/KpLBC2ncTh6Rehahwklv6eww5T0770DSuErS2x/dU+KFtHYtvBfqheW4k9MyYyQdjuEg8eLYeyfSVmPWyAqomSeDvvFMsERrFZSE6dheTUBYxMqxilnT38dIPDdF0jnD0MTPVykzMKdHMTM/P0kvNzNzFCIiJrB+PvzohDjJIcTEqivNwW3RFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg3hgPlBItS01Mr0jJzgLEJk2bi4DzEKMHBoyTCuwukhre4IDG3ODMdIn+KUVJKnHdCGFBCACSRUZoH13uJUVRKmFfeDyjHU5BalJtZAhG/xSjM8ZBJiCUvPy9VCuhOBiDQYHzFKM7BqCTMuxBkCU9mXgncjldA65mA1ov/6AJZX5KIkJJqYDSV+JC06KjZ1LAbzh7HO6sLPboddodm5jfd05rkGfUhhWuW/8YKp03fjXiiN7Zx6+dPfrRRLGD2jCtTjH00bjuwL3DmDeyaUCjJq3257MMP7d5exhIzh2y1k0tqFtulLcs6f2JLbGqj6IK8MNk5Fru/TSjj9RE+uvd99NNqs7jZAmHZfHtmK7EUZyQaajEXFScCAFg3f90NAwAA
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [meta-oe][morty][PATCH] nbench-byte: fix project URL
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
X-List-Received-Date: Fri, 27 Jan 2017 14:31:42 -0000
Content-Type: text/plain

www.tux.org/~mayer/linux/ location can't be found anymore. It seems that the
www.math.utah.edu website gives an alternative to reach nbench-byte tool: use
this one to fix the issue.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 56272d9852ce..4ec1c63751be 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
 designed to expose the capabilities of a system's CPU, FPU, \
 and memory system."
-HOMEPAGE = "http://www.tux.org/~mayer/linux/"
+HOMEPAGE = "http://www.math.utah.edu/~mayer/linux/"
 LICENSE = "nbench-byte"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"
 
-SRC_URI = "http://www.tux.org/~mayer/linux/${BP}.tar.gz \
+SRC_URI = "http://www.math.utah.edu/~mayer/linux/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
-- 
2.9.0


