Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713FCCCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 21:41:48 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.2206.1760046104352207721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 14:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BNmzNIsg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251009214140474a22f4cf0002075e-ahc_rv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251009214140474a22f4cf0002075e
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 09 Oct 2025 23:41:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UZwV9naistObCDqyJSPI1OBJkZ+ORuNGQnoTYErBIl4=;
 b=BNmzNIsg6pn4SoR1y/RKCg36QFYrEu0UvavnNvMw0ZUS2EF4SbBFcu+GIfkbLXTSvBWJ97
 TRRiUdb1DSfUBUYyyf2Ez8VbdUAn2KzHzE2PuAVS0eeu3RXBAMwAlpUISGSefaUQnkzhLZyf
 A1A9OfC0yTBun6b2MW5zxRqUGCenYZ8mgxxg5LVigZcXy0LGaJgYj/ln/xGR5I569s/AeQyf
 d2XuXoMePwOmHJikdLCXC78vN2U5i+qkD2LT46gZmT20opDpOGLYnsDw42CHgfCDvexVL1yq
 /r5gcW7mGaxRS2rbLJzlgXNNk+CMSqL5JH0OrLA7RUNkW+IRTPyyoH+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 1/3] squid: download from github
Date: Thu,  9 Oct 2025 23:41:30 +0200
Message-Id: <20251009214132.856182-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120451

From: Peter Marko <peter.marko@siemens.com>

Devtool could not find latest versions before.

Download page [1] shows message
"Squid sources are released through GitHub. Please refer to the Releases
Page to find all released versions."

Note that also squid security advisories were moved to Github.

[1] https://www.squid-cache.org/Versions/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_6.12.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.12.bb b/meta-networking/recipes-daemons/squid/squid_6.12.bb
index 87144fb049..41226f232e 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.12.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.12.bb
@@ -9,10 +9,9 @@ HOMEPAGE = "http://www.squid-cache.org"
 SECTION = "web"
 LICENSE = "GPL-2.0-or-later"
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
-MIN_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+PV_U = "${@d.getVar('PV').replace('.', '_')}"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}/${BPN}-${PV}.tar.xz \
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
@@ -28,6 +27,10 @@ SRC_URI[sha256sum] = "f3df3abb2603a513266f24a5d4699a9f0d76b9f554d1848b67f9c51cd3
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=6fbb6a2adc362e206da7b4f42846cdec \
                     "
+
+UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"
+UPSTREAM_CHECK_REGEX = "v?(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "libtool"
 
 inherit autotools pkgconfig useradd ptest perlnative systemd

