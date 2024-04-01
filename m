Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7460DCD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.39483.1711983102108014469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WYE6stes;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983103; x=1743519103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nTK4TOV+W4fM/2Ibj48+TqzgLaE5QN3IvNLJh2Nt7Ps=;
  b=WYE6stesq7z5xK3gbaRxmsC8LTbjPzwrRNYVUNTUmdA3EVDAsF3X1E73
   24y6wryQTjwqK0r8GW4OcHB/glGvrCtOL7KxrehsZGlnfGS5xfLA6tBy0
   /D5apkOAAxXhpZeb1orRzvpxU22RLf1Ug9e9Iei05kX8PCNOA1399hs0I
   hAdg/UTUtD20eO47B/bWgX7YbxUlYJjqnJurDLBgir3OFqzLcx1ZfyrhY
   k/SuuBAExxM1hH2rVS7vi6huTYHkuAvYpm0QLPGUxBC086rRNJJCuCBjD
   yQEG+T22qgn/aUeyW6FH/C+RcvypQyXEUxvuglmUObUbDL73pB5WxARff
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="141867302"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="141867302"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:41 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19D9FC680B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5844C1B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC51E21EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 922DF1A000A;
	Mon,  1 Apr 2024 22:51:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/47] python3-pymisp: upgrade 2.4.187 -> 2.4.188
Date: Mon,  1 Apr 2024 22:51:00 +0800
Message-Id: <1711983079-16849-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--5.630000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr1jd10P+8LE94s/vUphzuiiLm
	4/WzmuzLq9YyptElK5cWRRjCZKJSZA3/BHoVlrMzA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG4OpkJE16YK7Ahn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDw14kt+hArEP4ZH8NBXU0eZNTRK
	AL9aISUecLyUCry3MxoqF8S0ulM0w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109745

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Support X-MISP-AUTH Header.
- Bump changelog.
- Bump deps.
- Bump version, templates.
- Strip API key before setting it.
- Python 3.8 support & typing.
- Typing for Python < 3.10.
- Avoid issue when payload ist a list.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.187.bb => python3-pymisp_2.4.188.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.187.bb => python3-pymisp_2.4.188.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb
index 31b0d6446..59a00be15 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.188.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "6880aa07cc6ed08f6d99df74c310839bce229e2031e1aa24311c74d8b01937f3"
+SRC_URI[sha256sum] = "c2313d059a9f4d1221243fcda64fb8ae11603c1745e92d57c4071aad04336696"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


