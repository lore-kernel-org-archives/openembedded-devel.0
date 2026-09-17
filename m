Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EA6C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:45:19 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34322.1789631117244532122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=i8Nm6ejE;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso447571f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 00:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789631115; x=1790235915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHNp4/WyZDnwAR5fyQFVsJQsGqeuth8IlDHFOgix/9k=;
        b=i8Nm6ejEtmdKvcVkaYdVI5Ojhc0iiHuaS5WgKls6axe9dKkvjpGQeDwohdxtztXlgM
         BSt0kF85/k1mC6bk+eXBYH1N9xUHqvumS/Ur3wHnVKKyl9wJrrDQORN/Lqc662wm+SSE
         O5KBj22IvuM7pHZg3oqmw1NSUIDBlMPtrVdY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631115; x=1790235915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHNp4/WyZDnwAR5fyQFVsJQsGqeuth8IlDHFOgix/9k=;
        b=j+NrZRBuWFWMafSPwqHLYHnbEWIQvmdPAjrFFMfQ491ttqObbUhRZ12W0hcGxWUe+/
         aDc0fyMvI0LPB/udE6EQzI1Djf3abhEh7E0H8xuQ0YjSHT9v7wpPaw15ITOdLCtuvCKu
         rLhklhxJtv7faS4pSxMJaFVVFnlBmTKoKnHcbBYKMW0KFzx6NIuPmxFU3NGZOXzSSAos
         IwvfRYKpGlIX3rRbz3t1ExTht+PwyZSbGE943omGzxJ7FO7cgKbxqACDw4eBUrxkSBPH
         7cEiSZfpUdqO/E2DOxvtJwN0kdGDFbxaGDbnQ3u2RQCStOybKrc1+6pAOycmKqe1pucC
         j+1w==
X-Gm-Message-State: AFuF++m20guDF1pVZIKpRXYT+HGo/g4kCNL081v0UzQ4H5/h3SjWWQjT
	ylqlNf5hMiTzZcA+Deu/p500V7lkgv3bMEPsW76RMowkipU8j8cTOlfwvbhrhNXJXsrw4JAvPES
	156P3
X-Gm-Gg: AYBFou2/CqcwuRWKEeXsh1lxY4zu/RGF6ji+nR9CgqF+DM/h/tLfldoUm1eTz5/UaQG
	kI1IgW2nSYJmDiEdbsTNYY6umXOai/slvvXufOlfMmiCEqO9f2DT5e0k3pMqNxtZoZz7X/aGyMC
	bRNDmRiwnE0kQW2Y4geY5mXnx3rzeFqtP8qCG2qMyKtCHwkbMxG8U3m/5Jjal8xnzhbt1TDObnR
	7sBZ5qbKhkesv3CeLXG++iKQsvrblabGtFXDG7a8fN4qZDL6mGJmAP7qGEF6GVq/qlekl3j1QZF
	YVGT7TIm1w3LUJBx1/Ek02LLsnDKBoIFfwIdMEPfm66AAcON7C5i6ZlZpK7TobI8mjsVgwmzzU/
	dJu6aWx8kKVgRdrKilLIPqF8t9UdqDiSBXfrIfrCr33j/sAx3eSBS5mvAkNHs+uWqNCZFRM1xeZ
	flarmXN+o3sHE4OsL5qwr9860gqCAclMDaVwLPutJAlQbXWj+3zNdW47ogivZ2NIO/wb+NinOad
	Q5K0cGeDNaSielUQnxxF6u4NmyHQtYLgatxtqKDkTQdGOUGDe69Pe/CiU9XK/GukDL3MG1ezib7
	Rrnx05LS5XRGDkC6OUYWG7ec
X-Received: by 2002:a05:6000:27d2:b0:487:f18:9a3e with SMTP id ffacd0b85a97d-4870f189b76mr4523800f8f.43.1789631115129;
        Thu, 17 Sep 2026 00:45:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33d93sm12515682f8f.22.2026.09.17.00.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:45:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] zabbix: Upgrade 7.0.29 -> 7.4.14
Date: Thu, 17 Sep 2026 10:45:12 +0300
Message-ID: <20260917074512.3698427-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 07:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130093

Upgrade to release 7.4.14:

New Features and Improvements:

- ZBXNEXT-10720 Updated maximum supported TimescaleDB version to
  2.29 API Server
- ZBXNEXT-10732 Updated help URL from the frontend to documentation

Bug Fixes:

- ZBX-28012 Fixed spacing between Host Wizard template tags in the
  expanded hintbox
- ZBX-27836 Fixed PHP runtime errors in user role edit form
- ZBX-28045 Fixed active checks in case of failed response on
  Zabbix agent 2 Agent
- ZBX-23057 Fixed memory fragmentation trigger and added RSS
  overhead triggers in Redis by Zabbix agent 2 template
- ZBX-27746 Removed unsupported discovery worker targets and
  preprocessing worker profiling targets from Zabbix server and
  proxy help messages and man pages Documentation
- ZBX-27791 Added multiplier to percent_used metric in Ceph by
  Zabbix agent 2 template
- ZBX-27646 Removed MS Teams webhook in default data
- ZBX-25042 Removed discard option for SNMP status items
- ZBX-25663 Added node name macro to RabbitMQ node templates
- ZBX-26229 Fixed CPU user and idle time OIDs in Check Point
  NGFW SNMP template
- ZBX-25608 Fixed missing precision for temperature sensors for
  Cisco template
- ZBX-22458 Fixed cache hit ratio base typo in MSSQL by ODBC
  template
- ZBX-25484 Fixed incorrect item configuration in default data
- ZBX-21236 Improved metrics filtering in API response for the
  Elasticsearch Cluster by HTTP template
- ZBX-24512 Fixed memory items in Cisco Nexus 9000 Series by SNMP
  template
- ZBX-24343 Fixed temperature threshold trigger duplication for
  Cisco IOS by SNMP
- ZBX-27892 Fixed dynamic row counter initialization when tags are
  read-only in host items
- ZBX-27893 Fixed infinite loop for graphs in hosts monitoring when
  working time period in GUI is 00:00-24:00
- ZBX-27646 Removed MS Teams webhook based on retired Office 365
  Connector
- ZBX-27908 Fixed icon mapping order for individual list item
- ZBX-26465 Improved aria-label text for all functional buttons and
  icons and aria-expanding of side menu elements for Screen Reader
  users
- ZBX-27920 Fixed event menu entry parameters being marked as
  required when they are disabled
- ZBX-25485 Fixed language change to work for different environments
- ZBX-27921 Fixed item and item prototype interval validation for
  trapper and dependent items
- ZBX-27942 Fixed time filter error for dashboard in Kiosk mode
- ZBX-25815 Removed mention of discovery from SNMP max_repetition
  help note
- ZBX-27140 Fixed overall hintbox positioning

Integration tests now use libpcre2 instead of libpcre, so DEPENDS
has been updated accordingly.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../zabbix/{zabbix_7.0.29.bb => zabbix_7.4.14.bb}      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.29.bb => zabbix_7.4.14.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb
index a7e617fa59..d40b04792b 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.4.14.bb
@@ -19,15 +19,15 @@ HOMEPAGE = "http://www.zabbix.com/"
 SECTION = "Applications/Internet"
 LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb1e647870add0502f8f010b19de32af"
-DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
+DEPENDS  = "libevent libpcre2 openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.4/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "184d03454d7ff2d49fa1d292082ad335bce907ba22e30d54035d05329708ce32"
+SRC_URI[sha256sum] = "efde5f6f19896f0200bb5245e3866035667271c7b1e84626d26095f24a6fbb42"
 
 inherit autotools-brokensep pkgconfig systemd useradd
 
@@ -55,8 +55,8 @@ EXTRA_OECONF = " \
     --with-zlib \
     --with-libpthread \
     --with-libevent \
-    --with-libpcre=${STAGING_EXECPREFIXDIR} \
-    --with-libpcre-lib=${STAGING_LIBDIR} \
+    --with-libpcre2=${STAGING_EXECPREFIXDIR} \
+    --with-libpcre2-lib=${STAGING_LIBDIR} \
     --with-iconv=${STAGING_EXECPREFIXDIR} \
 "
 CFLAGS:append = " -lldap -llber -pthread"
-- 
2.47.3


