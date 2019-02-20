Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 12AA67C9D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:52:10 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJre-0007vd-W0; Wed, 20 Feb 2019 05:52:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NZ0HVlCUVijJUK6OrYZvBzx6D2vq6KcEEf10j7uvgD4=;
	b=Qg79l2lM2XQuOAGP8h4pK7lB2f
	Fd7kv8EPKny+1bV2bYoqVRh+GouE9+Df5ZPwkMCgHPpCXnve1N3m/GRiDi4waDq4PNwvkJeiKPfc2
	XL+w2dxN8n3ehqNDghPuVKdhe2YsTWrChY6D2MCFOq6aIWJbiYBpnskPqDgkH/RQPeewBXFNsVJvl
	OiUy77TU6N+vIgvyXOeYGUhw/zkG+kQ4A+cFAnHpaS5YdgMGEhobZkDbH00GZzmgEzjRHlee2sccR
	prY8Iweb0FeJIhY9rerIY+HIOXpFOpdzfNdEXEH5pJVhihhteezA17Fe11qXMsR1UyQhafb93FvdL
	o0gaOPmA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJrb-0001Ai-6d; Wed, 20 Feb 2019 05:52:08 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:51:56 +0100
Message-Id: <20190220045156.28372-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220045156.28372-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190220045156.28372-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 61dc834c4512bbdac06a43d8f23e4555
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220045208Z
Subject: [meta-initramfs][PATCH 4/4] dracut.bbclass: Use systemd DISTRO_FEATURE to depend on systemd
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
X-List-Received-Date: Wed, 20 Feb 2019 04:52:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/classes/dracut.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/dracut.bbclass b/meta-initramfs/classes/dracut.bbclass
index 3c1421df8..58c4493a3 100644
--- a/meta-initramfs/classes/dracut.bbclass
+++ b/meta-initramfs/classes/dracut.bbclass
@@ -76,7 +76,7 @@ DRACUT_DEPENDS = " \
 			ldconfig-native coreutils-native findutils-native \
 			cpio-native util-linux-native kmod-native xz-native \
 			dracut-native pkgconfig-native cross-compiler-ldd \
-			systemd \
+			${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
 		"
 DEPENDS_append_class-target = " ${DRACUT_DEPENDS}"
 PACKAGE_WRITE_DEPS_append = " ${DRACUT_DEPENDS}"
-- 
2.20.1


