Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id CFA4D7C1E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:26:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 740A15C2196;
	Thu, 17 Jan 2019 17:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547742395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Hm31QnblbTzYV0EZ6TiV4bEvWz0DEhygzH6aGEaiT6w=;
	b=mQBwUCcdFk+Jxv36aVxMLMfvtEgaAbMLRpzbVrlheCTek3by/gkBUJpa3ulb0FrrR4wNET
	SYj5wxMCp9ACszu4VyGc2/pq79lNPQ8tdpqYQMSka7CaL551xuDx0OxZUnYNL87dAZ2SEJ
	HmTXz+2YX68m3XTTHt+PqVjcxV1jttg=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:27 +0100
Message-Id: <20190117162629.47677-3-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190117162629.47677-1-stefan@agner.ch>
References: <20190117162629.47677-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
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
X-List-Received-Date: Thu, 17 Jan 2019 16:26:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

systemd and polkit are not directly related. It is just fine to build
with systemd but without polkit. Rename the systemd package config
to polkit and enable it depending on whether polkit is enabled in
DISTRO_FEATURES.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
index ed117b0a6..1cdcb4160 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
@@ -20,8 +20,8 @@ EXTRA_OECONF = " \
     --enable-panel-plugins \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
+PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 
 PACKAGES += "xfce4-powermanager-plugin"
 
-- 
2.13.6


