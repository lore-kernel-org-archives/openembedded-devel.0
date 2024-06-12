Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E588C3064D
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2490.1718161123300457061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rZLoKj+W;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161130; x=1749697130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BE68jSpvyxK1sfwA1OoLk8J5+EiruhRyAR+viLJZ+Tw=;
  b=rZLoKj+WlEaYb6Ez5lq4Qei0vvb+ikkRdKyVBc4CGpzXNmO+6ZqEprKQ
   SQGVoQhtLfyGKvlr35J1as4xCSpCziNc6IUMsiqEjniLsDmxLCc7b9c+2
   g3XtWQN98bVsNLHckE1fYmYuQBKw5jSGEHhSt32DqRtyvtwrxu74IoqmL
   X9hL/KDsNYKDpZ0+KReP/GiM5xa6mmRx2hWcDamrR8YIseRmdszC3c4BN
   EE+j5Bb4oLrSkgfoQyH9zJrDCSBSwQbvegFY4SHrecbjqYk2lRO33iN/4
   /vAyS33UsJm44u83H/AL9/MFMXwR+hZAKRLmT/4HrxiJ6ZQsYjvUJAyF7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162860647"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162860647"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDE14D8001
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AD69D73CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AB4D20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 23F8C1A0002;
	Wed, 12 Jun 2024 10:58:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/43] python3-sdbus: upgrade 0.11.1 -> 0.12.0
Date: Wed, 12 Jun 2024 10:58:02 +0800
Message-Id: <1718161096-29710-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.712400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr5sPqcQkI8pt3Y7kpVKWrn5Ky
	Pf1j7t43/6CWCDtMiNh7SUj1yeQkFxLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsFdF5UWZ5EPniCsqewnUZGBv+ggm5QAi4fOd2ImQcUyErsOYTuNrXJujxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0FLt6OkwmJvgTku6PLp7NoD5PY2TBPL7yPo8TEuYGKwEhrI
	0A4OHoWbJQI3jf5kQRDZCpthYidhnKm5qbGGDm3wB5fdZvYbgkdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed async D-Bus properties not having a proper generic typing.
- Fixed build not working when systemd has a minor version suffix.
- Fixed being unable to name arguments in D-Bus introspection when
- method has no return arguments.
- Fixed serving D-Bus methods that return a single struct.
- Fixed sending extremely large D-Bus messages getting stuck.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sdbus_0.11.1.bb => python3-sdbus_0.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.11.1.bb => python3-sdbus_0.12.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb
index 26bc71762..054e94115 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "adb97718ce996bb308520682c50b1a13e606d65a6edb1c1967a15d2e570cb3b7"
+SRC_URI[sha256sum] = "c3692d75704438a78adc1439350bc32f30d6b38ad344cfc94773db89c6ce4a89"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
-- 
2.34.1


