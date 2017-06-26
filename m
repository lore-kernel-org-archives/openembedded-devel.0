Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 65B976067C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:34:58 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id c73so49939120pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pYwgG/pOej1eO1M2ibCNRiQaTL/HIevt63LRezD2liw=;
	b=rNFuoAGK5IDGosxJ64NKGTlpJAS6p22uGFnHgGmRNkLWweMSwOYcYp+uap9WNlPOfx
	253T7az/TmosfmUWfdGDOtfFm/tAee/TRTK0h7ama5A2PpnL1arVMeymODVRG+ffM614
	3SldWKMywc1ejgf0mp6Re/8Jr3gnuVXxB/qN2pHAXyOpTE7aAzJDjbzmkyjY8eG9VWTX
	cxESlFpoUHVhMttdd/HF1R86GWjMfNprwyCtHcqViLCMDvET1qBG/erB+BpwGnlSoSrX
	AspEPP0yYtdfoP+AHe7fmOi13RT2sljphQE4P7QYNoN1cZoQDxkPADSIkoYiYgriROq8
	aHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pYwgG/pOej1eO1M2ibCNRiQaTL/HIevt63LRezD2liw=;
	b=n+odun1EbRC09fTmF32pcWcfmTKuNZP/d4+00SWzbZEYkagwbWkPSFhWZNB+OSaWqK
	KihswOSBM2vgjIVLmvTpO/LaPRXDXDaRDcMYAZzq6tKPvVihmHxpIZjLXJc8EvGDJ7I0
	J/TcFg9izUfIIINxCp2TiOGrg4IYL0yU4iyXNAOtgjaOS41vpndppkZNtipEH8i6UoFr
	mJKngu9mr5D5Edxk1jHDU/uIgHqaX/4NqKrXL1Eg++qrDhGIU7NaESlbJ/lfNqNq04eN
	fkLf6Tk4SoEERGEoxVijVouMhzZEowQc4Sujzpevu4tpSScUs60bsZSYFbyhQhquU8H5
	iHwA==
X-Gm-Message-State: AKS2vOwf+yhuuUSeYDxIIYQza5GTvn4XLiJ/cIRU7NrDJMz+gi7EnK/q
	x5dDcrf2+jNFPkeK
X-Received: by 10.98.153.135 with SMTP id t7mr20265129pfk.160.1498455299104;
	Sun, 25 Jun 2017 22:34:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.34.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:34:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:40 -0700
Message-Id: <20170626053446.37959-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-oe][PATCH 1/7] live555: Define XLOCALE_NOT_USED for glibc too
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
X-List-Received-Date: Mon, 26 Jun 2017 05:34:58 -0000

glibc has removed xlocale.h from public APIs starting
2.26 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index daae8d786..14ea66442 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -16,12 +16,9 @@ MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.or
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-XLOCALE_libc-musl = " -DXLOCALE_NOT_USED"
-XLOCALE ?= ""
-
 do_configure() {
     cp ${WORKDIR}/config.linux-cross .
-    echo "COMPILE_OPTS+=" -fPIC ${XLOCALE}"" >> config.linux-cross
+    echo "COMPILE_OPTS+=" -fPIC -DXLOCALE_NOT_USED"" >> config.linux-cross
     ./genMakefiles linux-cross
 }
 
-- 
2.13.1


