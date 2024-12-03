Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB84E69EB9
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8067.1733185010411138136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f2dl5Mtl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185010; x=1764721010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s2AiY7IGuo45/Km8hAu1KLx+9vF2CchLQdwUuvV7gsc=;
  b=f2dl5Mtlxr2RkT5SUGy2keIGCbC9Zs3iO4Ht4aqjbx0veG/00t9wnDxI
   TGZhexzH1i3qyQyN/hmHtrXGXit9AT1cFPQHBGflz4ICcIRaPxmyvnCyt
   r7RpeMW48VPS3sLem/fN7fdShUdOfIoLncWnQFVvduaCaX+89jsPYOvrx
   JtrYxAXKWMqb1gO0BcpR+FJY/5i8M0QnpIKqFgKbYCuMd7wv+1DPWeGGJ
   llZYa1t6HwhhtfbzrlGnQakIuG2vuNmAbaiJHzVkeM4AkdR3JyIJ6KWMb
   KfwUC9/mXhLUHWS2WR9GkfevtJ8pkWzG8SoxHgCdtUurfFk41AY3e68sP
   g==;
X-CSE-ConnectionGUID: vFA/QBi6Rz+JLe8Ct44ocA==
X-CSE-MsgGUID: DxwOMp9/SeyXkJy/9oDvWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406395"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406395"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CF3CEE60A4
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A15E2BDC91
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31DF56CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C62321A0003;
	Tue,  3 Dec 2024 08:16:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/34] bats: upgrade 1.11.0 -> 1.11.1
Date: Tue,  3 Dec 2024 08:16:07 +0800
Message-Id: <1733184999-27041-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--2.063400-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiHJC/JOD1QlSFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKata+/EguYor8cFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq0EDbUn0Nwp3FGVKmNs0TMCa5ghneTGIjsRQTqIWz0VZlYZbzF/krNVAOyFKJqgIoCJNT
	vKPIgDcVhdgePaJSMPPnV3eg06NIEdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114144

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.11.0.bb => bats_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.11.0.bb => bats_1.11.1.bb} (94%)

diff --git a/meta-oe/recipes-test/bats/bats_1.11.0.bb b/meta-oe/recipes-test/bats/bats_1.11.1.bb
similarity index 94%
rename from meta-oe/recipes-test/bats/bats_1.11.0.bb
rename to meta-oe/recipes-test/bats/bats_1.11.1.bb
index f0615f7b79..82f57e51b1 100644
--- a/meta-oe/recipes-test/bats/bats_1.11.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.11.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
   "
 
 # v1.10.0
-SRCREV = "7531b575bb81487553553aecb654c41b237ae96c"
+SRCREV = "b640ec3cf2c7c9cfc9e6351479261186f76eeec8"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


