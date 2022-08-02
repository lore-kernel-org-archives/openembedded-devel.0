Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79831C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:43:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.6317.1659447811721345110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aNU4HMzF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447809; i=@fujitsu.com;
	bh=SqzfUVhyTXN4jJxOisCzTOGN3RlGkSGWjhdp70matF4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aNU4HMzFXniWvOICZRLW7J9/x8fp6vzbGzfFBA8w7Ldi+88Wx+8ZrsiNrMxJUyRDy
	 WkfN7pfP3csRqHMRct9K6S6VolTcre7sY+JFElCuENFs8XNVuhDlhJFtNz2RD1jaix
	 tBzPIF6Ez0BS/5ynVSI1uvnTuy7+rRwimWBXYB9WjonI51l0PVp9brkTI7CVPFrZX1
	 rA44wg0EEIybL/LYF6w6O9oHsdaBVThjSbGGPPgiZthaSI+9EpZ32OraPTvQVFV4Sl
	 K6QFgjr/l63msAqXSvL0Ou+PXz3cm7a2dSzHIVx5+bz94aHDqriawuiJ5ufeIg2Yg+
	 soxPmhxKfr+DQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpMuo9TL
  JYM4NRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePYglaWgoVcFWsPljUwLuTsYuTiEBJ4yCgx
  9ehjNgjnMpPEhs1bWCGc3YwS9+6vZ+5i5ORgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgJ3EioPPweIsQPH3x48zgdi8Ak4Sk7buYQOxJQQUJKY8fA9Uw8HBKeAs8anfHiQsBFTS8b
  CZEaJcUOLkzCcsEOMlJA6+eMEM0aooMftyMwuEXSExY8Y2qJFqElfPbWKewCg4C0n7LCTtCxi
  ZVjHaJBVlpmeU5CZm5ugaGhjoGhqa6lqa6RqaWOglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEhnFKccKUHYyH9/3SO8QoycGkJMorp/gySYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IE7y1VoJxgUWp6akVaZg4wpmDSEhw8SiK8ZzWA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEuddDlIkAFKUUZoHNwIW35cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMeAJnCk5l
  XArfpFdARTEBH6HC9ADmiJBEhJdXANEE2Jf3dUubzOldt+Korw/brC33QZl1rPucFi/vp1r23
  H+j4+laVbbOrmT5b6loPn8jn//lvGf+KWbRWSX5pP+l5jP+u4OPmeYKHInL+mPUFr+dQt75yw
  uBB843VP5KisrIC6qeJLbvf1HzXYd7kz/eWeN20nbNuAccVxpXXcnS7Wbe4xnjvtbz1WXD53R
  0+BpOXPzQ3EU/c7FOu+FJ1oqSZ0XOpRZI7J5tM06lq5Q+tiXo6ryUrspJjwWzxCpbMvXw3rUV
  ftJXuWhyf/dQ56sYeqxPW4bmC4nO8T9mppW5gaJPN89PvKMkqsJnLbqSr2aydbdDzrpblh9uh
  Epav9WYHz7HKHCv3OBQTM1mJpTgj0VCLuag4EQBNv6xUagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1659447809!40346!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14010 invoked from network); 2 Aug 2022 13:43:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:43:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id EBE091B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E0CDC7C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:43:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.0.5 -> 6.2.1
Date: Tue, 2 Aug 2022 21:43:10 +0800
Message-ID: <1659447791-24448-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
References: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98096

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.0.5.bb => zabbix_6.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.0.5.bb => zabbix_6.2.1.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb
index 2deaea268f..9949bd81f1 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.5.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.1.bb
@@ -23,12 +23,12 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
 
-SRC_URI[sha256sum] = "3eeb7063efc5dad56f84dfdcf9aeb781044be712e11e83f66d043da55f33bdc2"
+SRC_URI[sha256sum] = "f3d6b7cf4e67d820ce7d28cd54ac67724f7453f261f668877e6410cd21ab9ea1"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


