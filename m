Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3E77C64B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:37:52 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdp-0006YO-DY; Wed, 20 Feb 2019 05:37:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zEgydbFq6KCLUIcDbu32dTn/NHJrHKJlF4wD0Z9gY2Y=;
	b=G6ybb4cRtk9U0CrUkxHtukj62Q
	XC2sP5iTWyrm5jL2A2uS7wjet9H0wcf3coSWfNfy9ZSC1gSDSYBsK7CrZmpgGN0Alqrp+1VZW4nEp
	sLxCuSvPlJJSS0XWWg6T12cSAz82TPxQUiOvJmLv2/eBopNd91aGwQKTJ3mc69UoqdI+eBKyDuat0
	BJvmqjZafw0r1tMWWu/DYAmwpsGglY7Pu/v+/7HqPqGmxhAoN7uwGLzkCMYKuhfNptdW9HODVKhMa
	VwnVDnFamsBlC5Tbbrc9totSAg3ySQcgE6umvYsJRZF7XHhcTknBK9GfDE2rPXeq0C4ESOMdDWDIs
	lanfc2aQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdl-0003gE-9M; Wed, 20 Feb 2019 05:37:50 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:37:40 +0100
Message-Id: <20190220043740.27952-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220043740.27952-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 590f427944e86919b339bef1bc8dcd47
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220043750Z
Subject: [meta-initramfs][PATCH 3/3] dracut: Use architecture override to RRECOMMEND intel-microcode
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
X-List-Received-Date: Wed, 20 Feb 2019 04:37:52 -0000
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


