Return-Path: <prvs=2645a3569=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6A07F8C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1578090272; x=1609626272;
	h=to:cc:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=HSYgMxp/agnZkaQZZt6A7xDqnsBghDYthECdFcLCHWo=;
	b=EkPTLN/Ja72uzVjsW3aIXgugTFdVQqT6lDbD2EJQqRgHnq/+7N4S0y+e
	cgFrBZ4Unoilm/3TaPeDtbKvCrQFXa9gWVLPgSbkKkSkSMUAOGlQ4qO+T
	2h76Nu3z5jj6dPfw7VpTN+RxFMUegAHcDdqQk24eWN6I4Rtv8MO7ldUrT
	zcLSwE9ViEaF9vBI8ZqHq0a7eBXEKMpgSPxrNtQqRudx1ZZoBIgeTuL5D
	jOcOy/UQ/8KnQvUGhz+yMp88qzgrXwcr0Eg1OroiIRRNcebXhEsMMJrNC
	ycbIiS5hDjOxjT9qrHwG2tPlJ+c6BDulBE1MBhEo23s/+t3gohZaeOA/9 w==;
IronPort-SDR: shucMEzFGmSxtrKY95GZfEyndzSjGSP4IISoY34Cq1YKPRsF3z6P2nC5drAG3Ofmtxptzu8/tY
	kuJU66XIwRyhT6YL5HMSmFF6BQProzQsnN8mV9oPSPQPSJJnITe1H0MGZmMdQosXY2a+D+zY5z
	Hh1w/Ark4qcC2/Q0w0whStPwmJXt3uZNbiAeUBhjK+A7UAzw3wiTitXGfZXdqem/llGjSYMEVV
	y0NqLlD7z344a8sP2Dn/h9hAZhtkqIFf0rPsH2vu4NKujnGyy45rry1tqSGy5JmbGyM4RlVjFf
	R+o=
X-IronPort-AV: E=Sophos;i="5.69,392,1571695200"; d="scan'208";a="21831362"
To: <openembedded-devel@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <e41daa42-7588-c966-9121-1478afd8b869@skidata.com>
Date: Fri, 3 Jan 2020 23:24:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Darcy Watkins <dwatkins@sierrawireless.com>
Subject: [meta-java][warrior][PATCH] Revert "openjdk-8: disable, stringop-overflow compiler errors"
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
X-List-Received-Date: Fri, 03 Jan 2020 22:24:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This reverts commit d5a8ec9e269d1f04a6cf78867ebf74a297f33258 as it broke
the build with older GCC versions.

See also https://lists.yoctoproject.org/g/yocto/message/47850

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Cc: Darcy Watkins <dwatkins@sierrawireless.com>
---
 recipes-core/openjdk/openjdk-8-release-172b11-common.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index f3bbf0a..ad20585 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -94,11 +94,6 @@ ARM_INSTRUCTION_SET_armv4t = "ARM"
 BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
 TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"

-# WORKAROUND: disable the "specified bound depends on the length of the
source argument"
-# compiler error until we update openjdk8 to a fixed version
-BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
-TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
-
 # Enable zero mode for arm based builds, as normal hotspot fails to build
 PACKAGECONFIG_append_armv4 = " zero"
 PACKAGECONFIG_append_armv5 = " zero"
-- 
2.20.1


