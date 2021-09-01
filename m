Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.6805.1630497451138232648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 04:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DED9B40005;
	Wed,  1 Sep 2021 11:57:28 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-multimedia][PATCH 2/2] meta-multimedia: stop using "virtual/" in RPROVIDES and RDEPENDS
Date: Wed,  1 Sep 2021 13:57:18 +0200
Message-Id: <20210901115718.118994-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901115718.118994-1-michael.opdenacker@bootlin.com>
References: <20210901115718.118994-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.

That's confusing because "virtual/" has no special meaning in
RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).

Instead, using "virtual-" instead of "virtual/"
as already done in the glibc recipe in OE-core

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
index 369a407de..1c18ba032 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
@@ -251,7 +251,7 @@ FILES:${PN}-media-session = " \
     ${datadir}/pipewire/media-session.d/* \
     ${systemd_system_unitdir}/pipewire-media-session.service \
 "
-RPROVIDES:${PN}-media-session = "virtual/pipewire-sessionmanager"
+RPROVIDES:${PN}-media-session = "virtual-pipewire-sessionmanager"
 
 # Dynamic packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-spa-plugins = ""
-- 
2.25.1

