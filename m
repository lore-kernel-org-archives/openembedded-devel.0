Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 956 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Jul 2017 07:19:26 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 5712C71A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=AsE4KRD+3GyZhJsvMoueD3XBT+iRmziw6Vd6sr2vvaM=; 
	b=FcQUekdv/uTkkLUAzhLWKRRUTUEHUdvUh+2NtlWXDGmteRsLMr7nYn9sfoFgsXvkexUUzSJbJuMC90WzhDP+gAQOEEgsI+aXWYmTi5+umepyUo2xOl7v/yprO+n/b/a075qC1vFSuwfy5wlHXExtwvzkU6DXyj/XoyKunmPsJneSS4yPbRXZ1K+k132vT6K6prJkzzidDcN/+CHa2rAXZxt0B1b+NMoJfyr96ZP1ApKJVAQtxiiZdkMAq1cVv5NM2mak/kaVZywZswN24lkr/sn+WN1gwe3Qm7UWsq6n7V5e30N7yAJkn+4uBv5cJkt0YsbxU2Fs00H14PDjo6ymmQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYRyE-00068L-NE; Fri, 21 Jul 2017 10:03:30 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYRyE-0007n9-Lu; Fri, 21 Jul 2017 10:03:30 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 10:03:15 +0300
Message-Id: <1500620597-28886-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH 1/3] fribidi_0.19.7.bb: set CVE_PRODUCT to gnu_fribidi
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
X-List-Received-Date: Fri, 21 Jul 2017 07:19:27 -0000

gnu_fribidi is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2010-3444

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
index e79de66..423a914 100644
--- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
+++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
@@ -16,3 +16,5 @@ SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "6c7e7cfdd39c908f7ac619351c1c5c23"
 SRC_URI[sha256sum] = "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e"
+
+CVE_PRODUCT = "gnu_fribidi"
-- 
1.9.1


