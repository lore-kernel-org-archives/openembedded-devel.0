Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 965247C2DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:06:04 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 97F0F5C1954;
	Wed, 30 Jan 2019 16:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548860763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=SyFsnWol90hr7wj4+wIF6MxabYMGIC26EUvrub5lyyE=;
	b=JGLjvydaDre/I/Uzju5L197d49UmXTW17aSkjTbj2JCnQCmALaqBOvpiaoP0DsOFAKBq/M
	DLx0HTmW4RV2VnKnmC9smXEwEwGT2ThhEeQimiETuk0jMubiohkLVAm2sZ9OYbO+iAsLIq
	LnQ1af/GsL89s7IYNw9jmNONL6S3fOc=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 16:05:51 +0100
Message-Id: <20190130150551.56036-2-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190130150551.56036-1-stefan@agner.ch>
References: <20190130150551.56036-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/2] wireguard: udpate to 20190123 version
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
X-List-Received-Date: Wed, 30 Jan 2019 15:06:04 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 ...eguard-module_0.0.20171221.bb => wireguard-module_0.0.20190123.bb} | 0
 ...ireguard-tools_0.0.20171221.bb => wireguard-tools_0.0.20190123.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20171221.bb => wireguard-module_0.0.20190123.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20171221.bb => wireguard-tools_0.0.20190123.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20171221.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20171221.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 6bd581a68..8314e79b9 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "39bb99fe11356423fb1ab45ae2d938bb"
-SRC_URI[sha256sum] = "2b97697e9b271ba8836a04120a287b824648124f21d5309170ec51c1f86ac5ed"
+SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
+SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.13.6


