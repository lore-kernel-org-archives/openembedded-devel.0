Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C9B6D7F894
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 490B45C35B5;
	Tue, 19 Nov 2019 14:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574169125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=mR1DNt69PANxSpaVil0Ejtqne+GaaAKYeQ9vV50qOgA=;
	b=ARxL1jrIRUFMgBBcDrAYKjwGaJffE5icim70a+jk05IMBJXlrcZL07upMn0s7M1e+AlV44
	vnRULGFbjhmmN1ToB1uaeeiewgg4axnbx+vNt9b4kC3E75VYu5bC4M9Yln0Bw+B0ywyKP3
	6e7XfXMZ6Iels2iRVTsCmWjZeqzpNvY=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 13:12:01 +0000
Message-Id: <20191119131201.17013-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>, bunk@stusta.de
Subject: [meta-oe][PATCH] networkmanager: do not deploy unnecessary udev rule file
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
X-List-Received-Date: Tue, 19 Nov 2019 13:12:07 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The 84-nm-drivers.rules is not required for systemd-udevd versions
v210 and later. The file has been split into a separate file so
distributions with a new enough systemd version can drop it. See
also:
https://github.com/NetworkManager/NetworkManager/commit/1e0375826252abf9aab2aef273a2a24cd08c9f42

I noticed this while investigating into a warning show during
bootup:
  /usr/lib/udev/rules.d/84-nm-drivers.rules:10 Invalid value "/bin/sh -c
  'ethtool -i $1 | sed -n s/^driver:\ //p' -- $env{INTERFACE}" for PROGRAM
  (char 24: invalid substitution type), ignoring, but please fix it.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../networkmanager/networkmanager_1.18.4.bb                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 085807c4c..d2209a632 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -141,8 +141,11 @@ do_install_append() {
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
-    # For read-only filesystem, do not create links during bootup
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        # For read-only filesystem, do not create links during bootup
         ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
+
+        # systemd v210 and newer do not need this rule file
+        rm -rf ${D}/${nonarch_base_libdir}/udev/84-nm-drivers.rules
     fi
 }
-- 
2.17.1


