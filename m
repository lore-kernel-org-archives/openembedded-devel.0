Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 89DF07CA08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:52:08 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrd-0007vW-CA; Wed, 20 Feb 2019 05:52:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zEgydbFq6KCLUIcDbu32dTn/NHJrHKJlF4wD0Z9gY2Y=;
	b=SBTT1etdKGDGsGTyMkPYihGa4/
	c0sLM+nOJT2SHxfVPSWzF/jYri+r42dTmyQsAosVb1VNGYR5y19qv2WvGEUgb88bS4hq2awjgtnaI
	HUwkpKeOHyFdo7N2jFVH2p23Cr+9bwwJcfxm5c3hvFU2Fk1KsxjX52QU/fUZSTs1qnRX7NWlL2J9N
	2MWgCnSuIips7knvYKgosWsrUkW15sH3Fn/egIYHOGhu5nuOseBeoXlv2FoktlGz/WZSRiFX7I/79
	LMbnZ8J20gLeDzzQV9lsrv7zdzr5C1z8jSojjQhppYJogBtfdV6NqRp3Vlns+AVkziBnulAmDToyX
	jaHvuE5w==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrZ-0001Ai-Cw; Wed, 20 Feb 2019 05:52:07 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:51:55 +0100
Message-Id: <20190220045156.28372-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220045156.28372-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190220045156.28372-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 590f427944e86919b339bef1bc8dcd47
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220045207Z
Subject: [meta-initramfs][PATCH 3/4] dracut: Use architecture override to RRECOMMEND intel-microcode
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
X-List-Received-Date: Wed, 20 Feb 2019 04:52:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 4efdf39f6..e168e05a6 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -80,7 +80,9 @@ RRECOMMENDS_${PN}_class-target = " \
                      kernel-modules \
                      busybox \
                      coreutils \
-                     intel-microcode \
                     "
 
+RRECOMMENDS_${PN}_append_x86 = " intel-microcode "
+RRECOMMENDS_${PN}_append_x86-64 = " intel-microcode "
+
 BBCLASSEXTEND = "native"
-- 
2.20.1


