Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A30C27C5E
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9824.1717664814572761252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RiRCBgPd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664816; x=1749200816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r/RSQibJA1CbmrtAXeH1t6L9Hzjg4VM6G+IJvCmmnVM=;
  b=RiRCBgPdvW53290leL8kXAM/GBKir+xsgvZopX+7BWXz+TA/m/lKwZP7
   q99GYmES/3dxR1drNUJVwIwbnLADJKFS1ahyKs5zgfKnRYRBVGuM7mx9a
   iok2ob+Mb/7snyl3vyMjdJBagY4iHCTeF2GMLKg8NWkDyrigxLyBqSks+
   2Bp5ACMpRezgmz0GajuGJP+wsSKxkgot2IJ971DnUiBTyNbvYYE4r1FrA
   ignH7RvvZIYep21yaOdk5YkLfybM8y2ToBN3VMZBasvjcw2LhIP1ZIFrF
   GlL/qJh1TDSmJ53a7RTBJ46DhB1WZ5s4yuL/i0CqqKvMZTtXqz2We1XCc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141612170"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141612170"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 32CB6C68E4
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 774F0CFBC1
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10F47401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B13881A000A;
	Thu,  6 Jun 2024 17:06:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/36] glibmm-2.68: upgrade 2.78.0 -> 2.80.0
Date: Thu,  6 Jun 2024 17:06:09 +0800
Message-Id: <1717664795-13902-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--6.565700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyAI7Mvq/sL51fL
	lZGunaSjlJdwBaRvjXm7uGbfGuF0M7BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7AwRlxCkpvJZ2oLZ8u2T3EHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiRyNg
	zNAigCkG0zAvhLAc/2lgfTG/xdU4FlAEFMlAvIxH7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110716

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add wide_from_utf8() and wide_to_utf8()
* DateTime: Add create_from_local_usec(), create_from_utc_usec()
  and to_unix_usec().
* Application: Add get/set/property_version()
* ApplicationCommandLine: Add done()
* DBus::Message: Add get_arg0_path()
* Socket: Add receive_bytes() and receive_bytes_from()
* content_type_guess(): Remove most of an unnecessary overload
* Require glib-2.0 >= 2.79.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glibmm-2.68_2.78.0.bb => glibmm-2.68_2.80.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.78.0.bb => glibmm-2.68_2.80.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
index f40a8144d..a45d31edc 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "5d2e872564996f02a06d8bbac3677e7c394af8b00dd1526aebd47af842a3ef50"
+SRC_URI[archive.sha256sum] = "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.34.1


