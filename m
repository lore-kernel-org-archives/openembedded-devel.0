Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id CEBB27C1E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:26:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2D8565C1ECD;
	Thu, 17 Jan 2019 17:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547742395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=lhgf0OWq8emWyR84tCDeEilLxgQGemoH78KVizmVUaM=;
	b=g0UFaxxXtxH6G+C0eJ7a01U5bE7CWLzmq/X7SbwjRjxCXAtFznkqHUn/YPWlTu98/oeWMb
	6OiQMEKhkEcFTShKIw+HduIlw3xMKbP/ne9KeE9g48taGcN0hGMZ23Cr5Hy/nVV9WlfZJC
	pEcEBn14kz9VeZRhkEt2RAWOvAoqC28=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:25 +0100
Message-Id: <20190117162629.47677-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/5] polkit: add polkit as a required distro feature
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

Make sure polkit is in DISTRO_FEATURERS if this package is being
installed. This will make sure that people who do use polkit in
their image also do enabled the recently introduced distro feature
polkit in their distro.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.115.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index ad0f66a5e..90c2fb152 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -9,6 +9,8 @@ DEPENDS = "expat glib-2.0 intltool-native mozjs"
 
 inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
 
+REQUIRED_DISTRO_FEATURES = "polkit"
+
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
                     bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
-- 
2.13.6


