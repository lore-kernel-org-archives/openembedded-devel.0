Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4471F76FEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:49 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so6854235wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=vVet+IwhsDOgoohY/dJ4PSK7DljCg8ATVraHCKxNdSo=;
	b=ftu1HWiFv5WMxZB+XT8Je8oJ0AXjhwsS5Kpmdz1MnSEHdVt7GadniXp/QKzPROaW2o
	1hZS/ITfdBIcnRZ6wCj8XvfGsGt50t0F3BEJH7YkERpcxNdPPL5PiEDcMhlHttP4nkYC
	LV1cMAjzQIADUe43VS4HlUQKwQvHqJ+IrLaPIwcdMTdGgoi8lnTtQscGqOma/7NE6v8f
	IIz3VxX0N7lvKSTVKAiwWC9obGrT3lIw3ED03BGQ8Su+XGAKhvUFOsp91dC2F/PVsjjo
	8DUazC1wBdJJ5gXNovpYITY7vyMwk8m3WdE9hWaerivoLiYjpIruJk8kOiwCTZQKBnke
	0Kbg==
X-Received: by 10.180.85.104 with SMTP id g8mr23511151wiz.57.1442450509708;
	Wed, 16 Sep 2015 17:41:49 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:20 +0200
Message-Id: <1442450491-14912-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] udisks: replace udev by libgudev in DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Sep 2015 00:41:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| configure: error: Package requirements (gudev-1.0 >= 147) were not met:
|
| No package 'gudev-1.0' found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 4bd65d3..9923d60 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 intltool-native lvm2"
+DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-native lvm2"
 # optional dependencies: device-mapper parted
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-- 
2.1.0


