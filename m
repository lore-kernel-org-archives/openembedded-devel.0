Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D600C54735
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2885.1722934019647386510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KyEPN+ba;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dPnWUyrBbG9rKsp9CgRgLW+pqZyVOyiE4KFa3b4UwmA=;
  b=KyEPN+baT6AqVsjB6rmoEH3z2SkuV6yylmiPggOCYv4Pnv9+Idmaz9Tj
   JvLkipbmmy4zwzLez1rgO3IQpP0UmU60Lryj3ygNOvAWOKBojeFC6m93v
   WeiFJE4VzTEAEYYnK2je2kL3rrif23NcCSi6Fd9mk3DPpQ/JI2ZfurJ0A
   WNMn18C+e5FE/VzaHeYAoID7M6d7DkUi2NHLu1ZGzraUQzK0Tm139wqBT
   HsukLUKQt+fewRo9dFe5O1YSH1WsUFh9raVFoRibPfINBIGKamg1D3onZ
   /pzggXzba+8PibKIWgBrnTysALSWJKgSP8iAZ40kkyprcttHmUIMdaqKT
   g==;
X-CSE-ConnectionGUID: lIK3hK4DSC6Wp0AkVkTx8w==
X-CSE-MsgGUID: VaQmSvYNS22s7A7QINTGUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213945"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213945"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 914F6D64A6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFEFEBF491
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 814FF2007955E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A4B11A000C;
	Tue,  6 Aug 2024 16:46:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/60] nss: upgrade 3.102 -> 3.103
Date: Tue,  6 Aug 2024 16:46:01 +0800
Message-Id: <1722933994-32549-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--1.209700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWh5YNyGJc3vf6nHbeBu5LnkL//VMxXlyE3hh5KUdlgWiOiw
	t/WQfkJ+YL7Af4qgNymINl7u96s5fAxYKB0LOn5qdVNZaI2n6/53ZbPRfc5otmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFPTfA88NYBCdBynUTKbTaMrVVyifBJWsZoBWG
	l0xECzIo7Jr01YtjmQ0iPEphjn2WnczKAgvXvgkv6M/T60WX++zOGO7+sIdrux9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111543

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.102.bb => nss_3.103.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.102.bb => nss_3.103.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.102.bb b/meta-oe/recipes-support/nss/nss_3.103.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.102.bb
rename to meta-oe/recipes-support/nss/nss_3.103.bb
index 4924a0b6d..64141e938 100644
--- a/meta-oe/recipes-support/nss/nss_3.102.bb
+++ b/meta-oe/recipes-support/nss/nss_3.103.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "c29b03f24856db18a34fbcde737fcca6407c27b5f3f60baba5111460e6cb307b"
+SRC_URI[sha256sum] = "7b4ab657f772dc7520c46e8d481940b292dcfc6a4c90150a7c26672384cee962"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.34.1


