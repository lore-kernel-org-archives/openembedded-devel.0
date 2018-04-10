Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1146774933
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:38 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v5-v6so6212211plo.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=8VHIEZnne842pRmC0TLH12O35qT+dopV6TaDSIZi/24=;
	b=ipzdKQm9jYZtu70BtrbDuAPGcAR014mzA/bxEhWgE6UCfub6nsC28EFS7ncUAZHGVO
	v/eAka5/xudmKoC5oBIS0VoP1haBjFaXagGGMhd/kbPFIzp5TjEHXSKd1/a4ToowyYqe
	7ZM69WA//WKBILlTTtFyW4mcp5RfhZZ6+8EfRI+iN/aWgIDX3dbM3xMwptxfoFc5Hwzl
	d/UFXyBJSZTw8bMk4nvI6qO9xd1i4LrEETLcpKqt9jXk+306QgpndP6L0kWq6NyorAU/
	QN2Q/dvmKEUlkselFEKoMiGumXydxyMzNxK4F+ySNDKkC2Wzky7TPwQHQZ5qoD4QVqPd
	8eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8VHIEZnne842pRmC0TLH12O35qT+dopV6TaDSIZi/24=;
	b=uLqp170k1xO98osOLZwajkFA7++qAZiJ0EukpgH7WMYYpjGAemX2lMDYkjjgDC3Box
	DHtKUo6eBoyywJV7ADwWj+4zcduZLTUctCCVos41Zh1oFra6dFvfd+7e7lEdE4TbohUt
	khMKHNHH7jTyOUc9yZYlNUZSEyHOfKfNFoRO/Av/aIuVieUPjg+vAYZO7g+2ia7pl+w/
	2evEFQJ1NV5xdvGjcLy7cI9SACLwamt9Rx6F6BYuMeZeHLQ9gwdIeceu64a8Eq7WpGc0
	W9N6D0djoDG3NrNi7mhMYdWUk0CE4lmh/GGzevjOFKUGN985+KNlwUD3OsXmFLmlnSlt
	egrQ==
X-Gm-Message-State: AElRT7H8tsSqaoXo60jMFK4ONW/LzQk3Zsgop4R6cQlsk7mEV3tLNv0S
	0kDQ8/T8rw7gDewxGpeWiL7qKw==
X-Google-Smtp-Source: AIpwx48lYXsXy4Gq7P27eO0dZS5IgRiZuXSNvEtW7wXYbmSCcQld12TnaRYz9ddoCsG/a+Mbo9DRpA==
X-Received: by 2002:a17:902:a60d:: with SMTP id
	u13-v6mr40945766plq.305.1523319759643; 
	Mon, 09 Apr 2018 17:22:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:27 -0700
Message-Id: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 01/10] dbus-broker: include only if systemd is DISTO_FEATURE
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:39 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_git.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
index 51dfe8c..b62bccf 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
-DEPENDS = "dbus glib-2.0 expat systemd"
+DEPENDS = "dbus glib-2.0 expat"
 
 PV = "9+git${SRCPV}"
 SRCREV = "ccd06b284892182af569e69046262331150e3536"
@@ -17,13 +17,16 @@ SRC_URI += "file://0002-Correct-including-directory-for-conf.patch"
 
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig systemd
+inherit meson pkgconfig systemd distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
 
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
 
-RDEPENDS_${PN} = "dbus systemd"
+RDEPENDS_${PN} = "dbus"
 
 BBCLASSEXTEND = "native"
+
-- 
2.7.4


