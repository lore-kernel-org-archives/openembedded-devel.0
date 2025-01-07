Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9CAE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16417.1736240520801990958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WW2hhZvV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240521; x=1767776521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VHxBGI8z0Y70CCDedwpnXoNoXaTkQqkllISGH+DlmiU=;
  b=WW2hhZvVoQJrz0uUjkQu4/b/rQf0AfpeeGOLLDG3CCLaAl9SUcySRVnW
   2tYWCffGAGI34FAazCwFef+g0Kyl8EzYq6j5lKjXYRWUGwQyx5+vi66wi
   SRLr6Fwb0UnSxe9I/vvqA4/PECB+xa3dspdwkmnwZmFA8diLu6lM6Lpb/
   rJjRPMVjhii+ZzpB9wxfBTadzvSwkB+3PQovhgPtLrXNw47lMJhFTCZoU
   D9K3l3cZtHn6nFaXt03Fe8luExBzj/3Fc9cgD1DWSRsiegXfBoEeHIB5N
   razx+zPaxSsv5EOUIMksVdWKayY/EJ/Yip3P/+MNkejTCo5lr9Ckk3L9O
   w==;
X-CSE-ConnectionGUID: Kn4VIJ+tRteX3Pq2jPe9Jw==
X-CSE-MsgGUID: yVtQMgbzTv6Ig9UwetgQTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="186036865"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="186036865"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:58 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC36E8521
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB7B6170C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 79159200930C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 345791A0003;
	Tue,  7 Jan 2025 17:01:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/18] python3-virtualenv: upgrade 20.28.0 -> 20.28.1
Date: Tue,  7 Jan 2025 17:01:44 +0800
Message-Id: <1736240504-5315-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-3.058700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvN0z1Vq9LTccL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPCDEOxwZN11GZOmDyLoprUrgs
	3ekP0kQ2dOQGAeR7mh+O/mIidh2lxQxPRrc4aYOqtza+1Gca7yvr2BVWZMFgMkYohVkyubl+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Skip tcsh tests on broken tcsh versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.28.0.bb => python3-virtualenv_20.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.28.0.bb => python3-virtualenv_20.28.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb
index 4601ddaa29..c163e0b45c 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.28.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "2c9c3262bb8e7b87ea801d715fae4495e6032450c71d2309be9550e7364049aa"
+SRC_URI[sha256sum] = "5d34ab240fdb5d21549b76f9e8ff3af28252f5499fb6d6f031adac4e5a8c5329"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


