Return-Path: <nicolas.ferre@atmel.com>
Received: from email.microchip.com (smtpout.microchip.com [198.175.253.82])
	by mail.openembedded.org (Postfix) with ESMTP id CD0B3773F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 14:31:45 +0000 (UTC)
Received: from tenerife.corp.atmel.com (10.10.76.4) by
	chn-sv-exch06.mchp-main.com (10.10.76.107) with Microsoft SMTP Server
	id 14.3.181.6; Fri, 27 Jan 2017 07:26:27 -0700
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Jan 2017 15:26:28 +0100
Message-ID: <20170127142628.24092-1-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAC+NgFvrNIsWRWlGSWpSXmKPExsXCxeXDojs5ojvCoOXzxre8Ft8uN7NbXDy8lNmByWPBr60sHuc2rmAMYIpizcxLyq9IYM14Ne8pU8F9rop1m+YyNTCu5uxi5OQQEljPKPFqaz2IzSagK3F2whM2EFsEyP74YS4jiM0soC3xdcEyFhBbWMBW4v+21ewgNouAqsScb3fA4rwCNhITe6aygtgSAnISDefvM0PEBSVOznzCAjFHQuLgixfMEHtVJPre97ND1AdK9F/8wQhhO0n8XzkTKm4ncXj6RSjbQeL+/RlsMDUHtz6HsrUltr/aB7VXR2LbwX4WCNtWYs+MiUwQtrvEg0fLoWxfiVkPG6BqoiRO9X9mncAoNgvJqbOQnLqAkWkVo7Szh59ucJiua4Szh4GZXm5yRoFubmJmnl5yfu4mRkhMZO9gPDI/4hCjJAeTkigvt0V3hBBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3o3hQDnBotT01Iq0zBxgdMKkmTg4DzFKcPAoifA6gtTwFhck5hZnpkPkTzFKSonzbgJJCIAkMkrz4HovMYpKCfPK+wHleApSi3IzSyDitxiFOR4yCbHk5eelSgHdyQAEGoyvGMU5GJWEeReCzOLJzCuB2/EKaD0T0HrxH10g60sSEVJSDYzHZV6K2rr0av2VztxbeGnmHwl/56NJYQVPSttP/t684GW1C8O6yE8vapdopmVsfPF3htDOpdKHOuJfPJE6Hv/g2OeqmNBg358LpDYYruh/WSz6/WdOgOd+x+eHsriu/HiU/dxus0aKl1rAc0O+4PDjV2Ust1++aX702AZxBhUjtt8vGbZ15koqsRRnJBpqMRcVJwIAcDJcTQ4DAAA=
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
X-List-Received-Date: Fri, 27 Jan 2017 14:31:46 -0000
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


