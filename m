Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.43421.1591034193600954174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 10:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=k3HEwFFu;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 7458760144;
	Mon,  1 Jun 2020 19:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591034191;
	bh=Y6B03JXkVb9RqL8neGjjqSw5R0J6XJwEdcpMnCvZkDA=;
	h=From:To:Cc:Subject:Date:From;
	b=k3HEwFFu+GNU/CMQ7lcgmm3jBefBFWf8aXOFaHcXnWy/jLyx05+KOEq4t+ENclGCV
	 75SOOTl2BtpknaEFKYPTmFrPbepGNoiu+bwmaDgQWShhkJvXNj9qp+oawWl/5CH2uL
	 2lwBERizrmIjJiLTdtZPV8Du2pv3RZRB/MyxWFELrpf8YTWkrC5nzbrzlKauCnY4tR
	 pdSHMUeynhOtrX4GNjVjknOq7sUJ1EGBoe1167R0RmaAshM1QCltgH/gvXx4u2DQ96
	 VgK8hY+Rt87UsTlLKbK6iPGsNp6qQd5a+738/mW92Y4uNtNNQvc6ucWkp+/8qR2m59
	 kQbq5JMvUvkLQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] dbus-brocker: upgrade 22 -> 23
Date: Mon,  1 Jun 2020 19:56:29 +0200
Message-Id: <1591034189-11980-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/bus1/dbus-broker/releases/tag/v23

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-core/dbus/{dbus-broker_22.bb => dbus-broker_23.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_22.bb => dbus-broker_23.bb} (87%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_22.bb b/meta-oe/recipes-core/dbus/dbus-broker_23.bb
similarity index 87%
rename from meta-oe/recipes-core/dbus/dbus-broker_22.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_23.bb
index c0b6f7f..c622e48 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_22.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_23.bb
@@ -7,8 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[md5sum] = "03c4730f2110b5492e1212c81af325dc"
-SRC_URI[sha256sum] = "32f30700cefc997c479d75fcc42f3177940f1ebbee9c5a60c1e3ee39b90a9783"
+SRC_URI[sha256sum] = "95adfde56bce898c3b69eee0524732365e802348dd8189a35d5d00c30990dc81"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.7.4

