Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6B57B7D41A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykV0ydfz63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230194;
	bh=/2jgOcv+pw2dNAhLBlmzssgjMELYzBdyNrGn7TIAr94=;
	h=From:To:Subject:Date:From;
	b=O2wOcR77PbC8eUAGiX9/A2yOvHP+JsgbDiLrBVNY125b1MY8q9w51p7MDwVkbS2EK
	ZFMXAAaDQt31CY54zmhSJ9tao2LfxAd9rBfJ9b+2hqWUk9O+g8oUiPNzoJ72VByL4y
	yz6bUH2fiWMVCDAEszIPtEQ/+cgCs562JaFYS7ubaf46OZG3nW7KvdspuTe+PKdMu/
	JiJFF9AfjxZ9a5AfEaXuWB8E/P00tjWLxTVZTSJFozEuJXvOyLrYabpi/XJ8s65ju5
	X8R3IWX2BizW4azCP/kjMmghalDR0uU2pSI+Fei9/2UeUeQhN12jJR/6CO8dao/Hzz
	4dEhiYUYL7357P3JGGfIbZE24CmLYl8FJTqE2CO1fY6QsKTquTj6Bp745fObNrQwEh
	cppEIW2NJtNdJOZBACCiz4hD8pNphK+76H0LssEc09gRMPLAXSVxmsk6mcQQI7wnCD
	74wiRAAV2cf1uTbv87keTl/TEZlTbEEqe2vyP0gs6QCEnLUq9/gWr79iJN75wwVMAA
	tjbdxTOEwjjBCo6ATiQs94eavwJtlm7EhQpAYe6UH/XRwSSX3DLIY240PkSKcNLtXX
	+PXzvWLeJ4Hye7k2UUmJvT6rPSvSZ/czRy0/zYUaI1H2Vi/ybe/bmecL7aUoVJEXzo
	E90NLKUAbKLvuGR2UOMHofTc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:26 +0300
Message-Id: <20190507115630.30368-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] sysstat: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 07 May 2019 11:56:33 -0000

Currently a development version is being used.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/sysstat/sysstat.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14d36..e7ddc02b71 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 DEPENDS += "base-passwd"
 
 # autotools-brokensep as this package doesn't use automake
-inherit autotools-brokensep gettext systemd
+inherit autotools-brokensep gettext systemd upstream-version-is-even
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
-- 
2.17.1


