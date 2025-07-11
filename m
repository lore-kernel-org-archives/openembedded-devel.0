Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA66C83F28
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.10148.1752228090272721448
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=lsrX0xTu;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228090; x=1783764090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pinK9yWqAZEvMA/CyIZU+0CoFudcO8QDik1/ozmyaEU=;
  b=lsrX0xTuBxjBmjtO6d9mhyVr2qpl3aOPNzjSY4KIHDz3f+w+JT0oo7Ko
   XBJET80Q0riPvSoNCKl3MP9NxXOsavCf6vT/dKFC29Sb5VetA0huDUvDW
   KN3XtTJXcnq/1N221oUA4KuhoQbhsq840RbgU4Do5g0w8EN0ysSwJ3MFI
   8=;
X-CSE-ConnectionGUID: 60qjpYQOSTODvxEjuKEWsg==
X-CSE-MsgGUID: wgUL+j2PRWicPo6174yTWQ==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: 6nf71w08QnGnsEVV4ACelQ==
X-CSE-MsgGUID: judHHQ0hQcGzYkCxMDb14A==
X-CSE-ConnectionGUID: AOQBFYTjTyihKqIZpk3mSg==
X-CSE-MsgGUID: RDIi6aNHTYCXMJ3FRV4PCA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 06/10] wbxml2: upgrade 0.10.8 -> 0.11.10
Date: Fri, 11 Jul 2025 12:00:23 +0200
Message-ID: <20250711100052.255467-7-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118441

The project has moved away from SourceForge to GitHub at [0] and has resumed
publishing releases. The new version includes support to build against CMake 4+.

[0]: https://github.com/libwbxml/libwbxml

License-Update: Links to project homepage have been updated
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../opensync/{wbxml2_0.10.8.bb => wbxml2_0.11.10.bb}  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/opensync/{wbxml2_0.10.8.bb => wbxml2_0.11.10.bb} (50%)

diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.11.10.bb
similarity index 50%
rename from meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
rename to meta-oe/recipes-support/opensync/wbxml2_0.11.10.bb
index 02815ec7ba..50a00b526d 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.11.10.bb
@@ -1,16 +1,13 @@
 SUMMARY = "WBXML parsing and encoding library"
-HOMEPAGE = "http://libwbxml.opensync.org/"
+HOMEPAGE = "https://github.com/libwbxml/libwbxml"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c1128ee5341ccd5927d8bafe4b6266e1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b17146e5186e05865f75664e910ace79"
 
 DEPENDS = "expat"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libwbxml/libwbxml-${PV}.tar.gz"
-
-SRC_URI[sha256sum] = "a057daa098f12838eb4e635bb28413027f1b73819872c3fbf64e3207790a3f7d"
-
-S = "${UNPACKDIR}/libwbxml-${PV}"
+SRC_URI = "git://github.com/libwbxml/libwbxml;branch=master;protocol=https;tag=libwbxml-${PV}"
+SRCREV = "e58b1f19f11dbadff53e5b486b8c4b16639a656a"
 
 inherit cmake pkgconfig
 

