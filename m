Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2020ACD1292
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.39471.1711983092271528304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EYCgsw0P;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983092; x=1743519092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=USkRTuph8CF7O66Pcc3FvdV89USWLG9iQc/xwSRbxM8=;
  b=EYCgsw0PCaXGcdDPGqcPpdHIjuo7kfFZ7eGSB6i8iFpEfqTZMjnSGcoj
   JFPygYlSB5apBnQbvhd1ZkeUyu/OhlnWUI4mpbNJwX/nJaw5qu9YlzUlj
   bXXwOBRjCrG68A97ieVG/Ja6MqLM7l7bwsqFlLgEPInvV/IoiZiHyHNMU
   L9ilezmO0NcnWVsSRMdxPL1b9hx62wWYOJnO3Xlm5J/gCARDg5kWKy+NZ
   cvZvJ/Q6aoQ4Lrl3d8ZJRREzZeZc5aH+dRnTJPugD7XyZpxm0YSN9kEF4
   XkDwtj1Mwv6t9fxXLxGk40PT37wQEzgkQcglFMb4QfznWTPEw0lQQrpqU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053923"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053923"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B73FEB425
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FEDFBF3C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CAAB40FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B72291A000A;
	Mon,  1 Apr 2024 22:51:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/47 v2] libmbim: upgrade 1.30.0 -> 1.31.2
Date: Mon,  1 Apr 2024 22:50:38 +0800
Message-Id: <1711983079-16849-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--2.676800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45ipe4ofkluPsp7vF0/kUIbmC7C2rJeUToeh+xVJZnrh8npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFF8OaeACV7VpSXNrwrLxRJwHPe
	tOGSCa2htcCE07kl9sno3ixYMJyM1YXn7ldd39+YeIJZW10GtairOCfMEWfEZ0meQ1/vZEQOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109723

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.30.0.bb => libmbim_1.31.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.30.0.bb => libmbim_1.31.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
index a22712449..a386e4486 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "8415687e4f30ae5e36f407f179c8147f1529725c"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-30"
+SRCREV = "9c0309fcd3142411c921c14f7dd675cac086bab6"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


