Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8B4C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 15:16:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.52511.1743088596141793466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 08:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pIa2WWxA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18949442DB;
	Thu, 27 Mar 2025 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743088594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MVm6aJ/f0OpNZ2tGWT4wXGHwjbfRxEDJ/SJc524oMEs=;
	b=pIa2WWxAih1W14v1+1VdK9GdSsvxF7PRYPafWxs2oThVVYazWtDpa+nC6GyvXi/BhDSqIl
	+7W7WJxCzmHAWOnonLR0njZR63hPFT0jbHmjqGCHHbKUhxTNgGhLKt7AQTDmpqw7gwKfvI
	jp9M/veNVKPoiKYx6FTVspa2c/NQtTACZQVOE7sHflNzg9Frn4/XGqGyWJV5XuqRf8SphK
	VZyNVvGp6ooB8uzOVVkV21Wo5hJzuBjk3B8cch+Lftpdh0JWR2re8OgMLQ4DaFKf8P4BTt
	LAIl6l5fbF/wemCeU+E0BlHFyUYnVWjKI3nCxiQBnZUnBSP1/4zlsZoZnJRSsA==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH] jack: apply some improvements
Date: Thu, 27 Mar 2025 16:16:19 +0100
Message-ID: <20250327151619.1943977-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepiefgheegiedtveeutdekuefgtdekkedthfffuddttdegleffhfefiedvkefgveeunecuffhomhgrihhnpedvvddrsggsnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeigphhsudefqdduudeihehgjedrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 15:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116322

From: Thomas Perrot <thomas.perrot@bootlin.com>

- Remove the do_install append because jack_control no longer
  builds when the dbus pkgconfig is disabled.
- Add python3-core to the runtime dependencies when D-Bus is
  enabled, because jack_control requires /usr/bin/python3.
- Use PACKAGE_BEFORE_PN to enable additional packages.
- Remove the HTML documentation because it no longer builds.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-multimedia/jack/jack_1.9.22.bb | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index d46391d08f04..d4e6447aad07 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -31,28 +31,20 @@ inherit waf pkgconfig
 PACKAGECONFIG ??= "alsa"
 PACKAGECONFIG[alsa] = "--alsa=yes,--alsa=no,alsa-lib"
 # --dbus only stops building jackd -> add --classic
-PACKAGECONFIG[dbus] = "--dbus --classic,,dbus"
+PACKAGECONFIG[dbus] = "--dbus --classic,,dbus,python3-core"
 PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
 
-do_install:append() {
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'dbus', True, False, d)}; then
-		rm -f ${D}${bindir}/jack_control
-	fi
-}
-
-PACKAGES =+ "libjack jack-server"
+PACKAGE_BEFORE_PN = "libjack jack-server"
 
 RDEPENDS:jack-dev:remove = "${PN} (= ${EXTENDPKGV})"
 
 FILES:libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
+
 FILES:jack-server = " \
     ${datadir}/dbus-1/services \
     ${bindir}/jackdbus \
     ${bindir}/jackd \
 "
-
-FILES:${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/*"
-
-- 
2.49.0


