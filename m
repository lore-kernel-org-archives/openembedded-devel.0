Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE17C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 04:37:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.5084.1643863075778834985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Feb 2022 20:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 24F6B40002;
	Thu,  3 Feb 2022 04:37:52 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] linuxptp: Update to 2.0.1
Date: Wed,  2 Feb 2022 20:37:26 -0800
Message-Id: <20220203043726.773834-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Feb 2022 04:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95214

Fixes CVE-2021-3570 and CVE-2021-3571

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../linuxptp/{linuxptp_2.0.bb => linuxptp_2.0.1.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_2.0.bb => linuxptp_2.0.1.bb} (75%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
similarity index 75%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
index c98976779..79e59a8fe 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.1.bb
@@ -2,14 +2,13 @@ DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
+SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v2.0/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            file://time_t_maybe_long_long.patch \
            "
 
-SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
-SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
+SRC_URI[sha256sum] = "6f4669db1733747427217a9e74c8b5ca25c4245947463e9cdb860ec8f5ec797a"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
 
-- 
2.34.1


