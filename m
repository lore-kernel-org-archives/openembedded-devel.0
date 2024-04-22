Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5298C10F15
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.14071.1713777370176135847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mP00RQCE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777370; x=1745313370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KXCv9uLiycUTRgYKCxKdVhlfN6QaSl0bdnif8r7rpfA=;
  b=mP00RQCEihtuLH6VJWAQvv3p/myF/Uf3BCuPqhWryGUoATZhN790zSBK
   AY0EADkNVeWU9JgVrxfrNvlH+dQSdKoJ1Y1g6FZYTkzJtx1RRYIHeNism
   DZPx3wdnc9v8EYzrS0FmRIufUrokhwfD4CkKdJmDkNJKRWbX/NZnbg1Qy
   vpbXbbexIftSuUCH1F3Tm4w3IfPiEOs1OYSHhtb4vI88eZdnf9rJWD+5I
   /MY/SiBUdi4BEFE9KIrpkAEFMqOszhglgxubWQkRZrOedDFVJIG3UqmXs
   uwcbk1Ak/5R5Ar3DbCz90icj4dWeKQQbXo6CR0h5slA/1pkrY67TZnqBo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144774006"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144774006"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F15ED9DBC
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6AC9D9461
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37C6B6BC6F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D68571A000B;
	Mon, 22 Apr 2024 17:16:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 04/15] openfortivpn: upgrade 1.21.0 -> 1.22.0
Date: Mon, 22 Apr 2024 17:15:34 +0800
Message-Id: <1713777345-29264-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--5.945600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr3hng3KTHeTbRnp8Qx+pp6wjJ
	lierVE/nQxTNQIR96f6+daZEFcM/u+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8cdA8XPYQyAUAYUFsN5WfiFrsq/7BhdGyDwbwIBMSBLpq4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7CEuuCn94OsEIkXOhIDIfkeCCqgohI/aV5KQC
	tEEiPbM1cY+ISPwfC4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110087

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* make sure Homebrew packages for macOS are built with --enable-legacy-pppd
* do not print TLS socket options in log (revert change from 1.16.0)
* add option to specify SNI
* change most occurrences of "SSL" to "TLS" in user-visible text

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.21.0.bb => openfortivpn_1.22.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.21.0.bb => openfortivpn_1.22.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
index e6c9a69ee..568593b2d 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.21.0.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "26a1fe68cc7a61c58f4f2a98862f6fcf30f9f2dc"
+SRCREV = "82e4401162fc65efad8267f4cb3287c6ab6fc088"
 
 DEPENDS = "openssl"
 
-- 
2.34.1


