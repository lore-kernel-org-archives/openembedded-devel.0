Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 73D117C478
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:50:22 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 098405C0E9F;
	Mon, 28 Jan 2019 12:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548676222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=MkbefiLCNabTMsnogziFASUMzQbWzYa4gcuA8xZYT7Q=;
	b=Bp5FdhzY0mfCGP9wbUHO/ZLF/esYlQyi8ZigQVBTbvWzTAUloUT1HsQaWD3vhLFmvga7KB
	51iYEUw03rnPe+CW2fU6hPuCItxFDY98rCkhuGtKGMsnBZ8l0It+OyzbQzDPBekQ25ZxWg
	zNI52xkXjmXbSdH5pojSLC6gOL95DmA=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2019 12:50:18 +0100
Message-Id: <20190128115018.8210-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190128115018.8210-1-stefan@agner.ch>
References: <20190128115018.8210-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/2] iwd: update to 0.14
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
X-List-Received-Date: Mon, 28 Jan 2019 11:50:22 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_0.12.bb => iwd_0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_0.12.bb => iwd_0.14.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
index 16c537b66..1dfbed9fd 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
@@ -7,7 +7,7 @@ inherit autotools pkgconfig systemd
 DEPENDS = "ell readline dbus"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "d7609915db4b57229f7dd4c04b4eabcce637872a"
+SRCREV = "f87159964cf8fd9f85b0699d50e4a051d4f7c948"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.13.6


