Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFAEA78275
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id f127so15346677pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vMB78sgkurCDJw5JFfNcJpLAR0k8RBVzehL8SG5ADE8=;
	b=bb3PeNpue+vqaEvwyLaCiiEnzLMmY6CGD65Jcblw0HfqU8dROBiSIltLeDaOebT8j1
	PXJwkkVYd0zD68ccvqvZ92ewG1q+wyoNEZt6X+vqEnWLJ5KtvkO7eLXrMu8zV12biMHF
	0PCjjPjh8Rb/IMB9zxfAn+49cTpRkDVjDSvBj0sgYqhfnx892k5X4muGdi5yGS8vdjXV
	qAzYTVz1plWZ0MnChDtBbI3kUEwGujmhQdUaON985nKl0DXRjSMANlvOLVkFYXGfQlvD
	rQmWlNy69Ya1glmiczl8S43JczazH0+PIDEyXxOvvUdukAVIgRyZhyagt4aCw64vvkdn
	0TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vMB78sgkurCDJw5JFfNcJpLAR0k8RBVzehL8SG5ADE8=;
	b=GmyItnEqnSZwwkRYi/NtcFL/ANZVpkFDtRY1lxpm3aBg83+XH6pUEGFuny5AL6K6Rt
	kgHJRoJlknUgJGYiES01RGQGi7zaSJVln8sWPtbYDM4gT0+5g2yUDRiMcmB9/fPVQcKj
	HOcuQRRgBE4V7gMhpW2ZFe4ghzbecio4RSo/lkHAFDjQVISirKQe2Z57Ssyhaj2Xwwf0
	TM1tig+PuO9Jz+jMhtKbSn8YDFFizthDP8C1mnKSDGrz7K2qocTB1oGL/87t4KK0g9F1
	ysF6ynruVKbuSVSt+zxQbkH8UHCcp1LvR2JaNcd1aOYO90Vrg9SjoGlEFqM2SKuvCN8c
	NGdg==
X-Gm-Message-State: AKS2vOy8EiJRc72qhFrf8WcqUCQE20jtK220BstQxBpvwlYkGN6Q7xwc
	f1UahiCLBkr4YCOC
X-Received: by 10.99.120.132 with SMTP id t126mr21176047pgc.276.1498827634516; 
	Fri, 30 Jun 2017 06:00:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:55 -0700
Message-Id: <20170630125957.3342-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/17] rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FEATURES
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index af1c4d656..c731cf707 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -14,6 +14,10 @@ PV = "0.9.6+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
 inherit autotools pkgconfig
 
 do_configure_prepend() {
-- 
2.13.2


