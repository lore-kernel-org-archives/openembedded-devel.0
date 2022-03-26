Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A60C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Mar 2022 18:14:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.6250.1648318455388571298
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 11:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 2067EC0007;
	Sat, 26 Mar 2022 18:14:11 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-networking][PATCH] stunnel: Update to 5.63
Date: Sat, 26 Mar 2022 11:13:05 -0700
Message-Id: <20220326181305.3013155-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Mar 2022 18:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96215

License checksum changed due to copyright year update. The license is
GPLv2+ with an OpenSSL exception.

Switch fetch from ftp to https. This works better with proxies that
frequently block traffic like ftp.

stunnel added bash completion support in version 5.62, use the class to
package the files properly.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../stunnel/{stunnel_5.59.bb => stunnel_5.63.bb}    | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.59.bb => stunnel_5.63.bb} (67%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.59.bb b/meta-networking/recipes-support/stunnel/stunnel_5.63.bb
similarity index 67%
rename from meta-networking/recipes-support/stunnel/stunnel_5.59.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.63.bb
index 9e0169a7e..325737e8c 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.63.bb
@@ -2,21 +2,18 @@ SUMMARY = "Program for providing universal TLS/SSL tunneling service"
 DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
 HOMEPAGE = "https://www.stunnel.org/"
 SECTION = "net"
-# Note: Linking stunnel statically or dynamically with other modules is making
-# a combined work based on stunnel. Thus, the terms and conditions of the GNU
-# General Public License cover the whole combination.
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=223b26c62f5e7c5c8656d6c133edd5ec"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=d8a2866ad5ebf3a2d2ce27279472875a"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
-SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
+SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f"
+SRC_URI[sha256sum] = "c74c4e15144a3ae34b8b890bb31c909207301490bd1e51bfaaa5ffeb0a994617"
 
-inherit autotools
+inherit autotools bash-completion pkgconfig
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} libwrap"
 
-- 
2.34.1


