Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6F6EDE99A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18336.1725959012835706305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LeTkGovX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959018; x=1757495018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o/cWT7btGVmfeirhwCPCFunGIaJG7sEEzxmzDSh83ik=;
  b=LeTkGovXLnYJ4yiNB7xkT8ACuH0Ofnalm00VhoLOWieVPVesblhQ94Tc
   Auc4SARyk0aMgE7DpdDBj55X/UAD3xtktruQW7+CKsKtOFjoO9lm/qLuB
   cGuIUSjbOHYERaxbWRUrxLzvJG3yqni/6mC/8Tcww5/rQ1ipM/QVXSatD
   Mhvf8Cg7BnJR8rtkVauqHm8OW20xehk27Xy5avzfROu92zqNJlxo4RIYe
   ULjrpBpkB70ZgyIGdnh2AaCA0tdtN6QmJ+ad4+w9HAbhoT10/YeG6FIop
   fBM9VJFNr7nCBTp+LeDA2MX4uqrQ/zgytOJN7hf7Ojsdw9FZFhuUSGT6t
   g==;
X-CSE-ConnectionGUID: tC43ZLMQRp26ioiOyJAAYA==
X-CSE-MsgGUID: s+ctbLxdRiOfIms9t/KNhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173393793"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173393793"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57F9ECC145
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A4068D73A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02113411B3
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A71561A000B;
	Tue, 10 Sep 2024 17:03:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/42] xterm: upgrade 393 -> 394
Date: Tue, 10 Sep 2024 17:03:10 +0800
Message-Id: <1725958990-5719-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-1.182300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJopGZilTi8ctSOwpfLMeBwRtr9+Kgn2XgeNzONa1Rspx3G0q
	oOc1rQcqUTVij24f8Ray8ojY+JYM95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrRqtOaAxamz6dXdGURUFv7r7jyp//q+3XLsc+eaRgqO7yRtEesbxLcPUfhzdf8qWLF45Z
	bENRrSy9o9+iULAs/MlNAo7UENLVR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112227

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_393.bb => xterm_394.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_393.bb => xterm_394.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_393.bb b/meta-oe/recipes-graphics/xorg-app/xterm_394.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_393.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_394.bb
index 05e45345f..94953b288 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_393.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_394.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=1a3032aa728f8fda9d
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "dc3abf533d66ae3db49e6783b0e1e29f0e4d045b4b3dac797a5e93be2735ec7b"
+SRC_URI[sha256sum] = "a2a0cb206eb0423dedc34794f5c2d38c83390d2dd1106b66aba0960c3a976c7a"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


