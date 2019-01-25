Return-Path: <krzk@kernel.org>
X-Greylist: delayed 483 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Jan 2019 13:13:49 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id F363C7C375
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 13:13:49 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0F3B3218E2;
	Fri, 25 Jan 2019 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548421548;
	bh=of0WIIRoBLaO1EUDMvRF2Grx14M3coQqrxe9f+sOgmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y3F7M3uek9n08B1W5HSk9q4dIYfTTjbg3ytZUWCpju6A7ciyKL89itcieEgJgYIQ/
	EO2gKr7I3LgFPAgCcLnVMReY1kkL8hdt2aK9PoeNy0PZTUDL7/nOzrGL3Ihy9UidBi
	FdFJ/Zv4lHEJQtMbnBW3Ye8dSDQwrm9O0Rsf0I4o=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2019 14:05:17 +0100
Message-Id: <1548421517-28338-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548421517-28338-1-git-send-email-krzk@kernel.org>
References: <1548421517-28338-1-git-send-email-krzk@kernel.org>
Subject: [meta-oe][PATCH 2/2] libkcapi: Bump to v1.1.4
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
X-List-Received-Date: Fri, 25 Jan 2019 13:13:50 -0000

License file was updated with new dates ("2016" -> "2016 - 2019").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index f70f774bf2d6..46c66a1b2c92 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -1,14 +1,13 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
 LICENSE = "BSD | GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
+LIC_FILES_CHKSUM = "file://COPYING;md5=14d5a68b28755c04ebdba226e888b157"
 
 DEPENDS = "libtool"
 
 S = "${WORKDIR}/git"
-# Use v1.1.3 with changes on top for building in OE
-SRCREV = "1c736c43eb71fbb5640d00efaf34a1edf1972c49"
-PV = "1.1.3+git${SRCPV}"
+SRCREV = "3c56934f44a8f5a1257c342942e6e034fc6f20be"
+PV = "1.1.4+git${SRCPV}"
 SRC_URI = " \
     git://github.com/smuellerDD/libkcapi.git \
 "
-- 
2.7.4


