Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC920C2BD08
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2434.1718161121378957902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ccsO+JFo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161121; x=1749697121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=olcj4oKUGgj2SOo9Pw5FcWb4sTHKlzXuEEXTcjmAY3o=;
  b=ccsO+JFo5RoLYK3/g87cgoI5KGEApgaG1Gblu3ikEuuSXa0bcVOurcst
   O1GxJyFi/Is/Et7G6IeKG/oX1SsuQle0cPQIF1h6vFCrjWxnxukban/L2
   pi5FLT7f38H3QwsuuPQStBRYVmtbG/EbpPW4arFd+27T9xRMgKEox3+We
   SJwCE9mfO8P0lNhKB5rkQOPd4Aa1FyugvRolcb/IBbuOd0TTbJi7vbvB2
   kR5H0YS5fziN5R24GYpsMuPTcV+qmGcKmqnvwgxm0ivy+P2Ngm4nFuplP
   VXLE4rkDk+2c+I0POAH5cfsY4foedv9RZaxCeTdQQ/fqWssZDWHjmch5/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="164690166"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="164690166"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 107FDCA1E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C724D73B9
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D651F20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 848B91A0002;
	Wed, 12 Jun 2024 10:58:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/43] python3-evdev: upgrade 1.6.1 -> 1.7.1
Date: Wed, 12 Jun 2024 10:57:41 +0800
Message-Id: <1718161096-29710-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.238700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrPsGG+kQsvKi+U1asDs8Y/L+I
	hmgj6NxW3xN6jyfnVfq2SbdI/J3d/8ZoS/tyjzzKZEKL9WloxNdMVCcj56k8hpFdPcTV9Nv+OcY
	/jkDGKiKl0J1x5auvOKEh/Pk+rxu47VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs1QTw
	7HjOHkVMBmEpW5ZP5OT6LERNacAtNSeuHenemimB3Ltv4CWvDvyrMj9dSzGOYsEXnDvib+ugqex
	M1zfntHOe9ZLBgJD+YgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110846

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Provide fallback value for FF_MAX_EFFECTS, which fixes the build on EL 7
- Add #ifdef guards around UI_GET_SYSNAME to improve kernel compatibility
- Wait up to two seconds for uinput devices to appear.
- Respect the CPATH/C_INCLUDE_PATH environment variables during install.
- Add the uniq address to the string representation of InputDevice.
- Improved method for finding the device node corresponding to a uinput device
- Repository TLC (reformatted with ruff, fixed linting warnings, moved
  packaging metadata to pyproject.toml etc.).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-evdev_1.6.1.bb => python3-evdev_1.7.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.6.1.bb => python3-evdev_1.7.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
index be6f9611e..dcf50f339 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ff275b442f45fc06287544cf713016f"
 
-SRC_URI[sha256sum] = "299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3"
+SRC_URI[sha256sum] = "0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde"
 
 inherit pypi setuptools3
 
-- 
2.34.1


