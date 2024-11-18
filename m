Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D65D44018
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.37265.1731922212291396906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CTWtQt01;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922219; x=1763458219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MGyr/SROz72TCJpoDbeI/05kvcRM/EzXyW5jcYSOcgc=;
  b=CTWtQt01x/mkWKAkQROGUPZtHjgIN/I1i85auXTM7nVRYVyfyO1+bmZI
   xs99nVxFQkGM6Vd6i3+CRI8LYeiM0sdBNIfRhceK1/JMH/v+S0ckxYYGA
   LIrBiJMXeZBrfjYpX4qUOQk65v/8g3WwhXC374KjsUaSxB1vWYAV8mKsG
   sHD3vxjxk7VHZusR6YPnd8cu+Dk8GJam6aosXD32uuonkaeyXyXfaHwvZ
   8dNv/3eVrK/hko+sf7klK/jvoyOCe/5BQ/cK1P+/RlvQbHLBT0cAYpI6f
   vs7nRfF40I5NDVkvCemJjN6/72nYsij/F6L9R9W7FNk8m4jalZ4iJW+hX
   w==;
X-CSE-ConnectionGUID: 0RzidaBHQoyVdvWSWNK6Iw==
X-CSE-MsgGUID: bgx55azLSBGzlUkMTZvlVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180785058"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180785058"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 90C6FD4C2B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 182F7D52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A456C21FD58
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 547881A000B;
	Mon, 18 Nov 2024 17:30:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/32] python3-regex: upgrade 2024.9.11 -> 2024.11.6
Date: Mon, 18 Nov 2024 17:29:47 +0800
Message-Id: <1731922195-5266-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.727600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mryqyllX6UJIvIgofMgahPrRRc
	qLOELivDM2rbh7l8eYR5sRK06wHV4evsZywOYvoWA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcy2BSF0xksCUUy31EYpuRIY2u3iUmezi1hbSOHvFQSucm5ID+vt/TBKCkkVKPStlCC6H
	cSkZyu3R8S/Axr4P45fyh1xB7mCVmOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113890

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Git issue 546: Partial match not working in some instances with non-greedy capture
- Reverted to actions/download-artifact@v3 and actions/upload-artifact@v3 in
  main.yml because GitHub Actions failed when using them.
- Updated to actions/upload-artifact@v4 in main.yml.
- Updated to actions/download-artifact@v4 in main.yml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2024.9.11.bb => python3-regex_2024.11.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.9.11.bb => python3-regex_2024.11.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb b/meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb
index 8fbae0cdc..4a84414f1 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.11.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6c188c307e8433bcb63dc1915022deb553b4203a70722fc542c363bf120a01fd"
+SRC_URI[sha256sum] = "7ab159b063c52a0333c884e4679f8d7a85112ee3078fe3d9004b2dd875585519"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.34.1


