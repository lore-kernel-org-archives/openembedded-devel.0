Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B17E7718F
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.30371.1735032452880739708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RO2R3ZrF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032453; x=1766568453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RV1VxGA37XPEAVG1zS6hvkpF8WWQnHf3L5nVkv7TMPM=;
  b=RO2R3ZrFNISxoPH4xOBrkbR5nTJt51DF1e1U3Bwmgfp8iBizGVrBNloE
   gkWTda+PlUP+AuCrAgp8dVj1f0+Q7Ap2K/rwHFdjzksy/mX8gR3pmIXoU
   E1ieNFkCUCeL1yVTJVdCrzhySJErCnN7Jgt1/5mStonDl+UYffmzP3lgJ
   Cr5J4NHD9RLIWf3/sy5LKZLF+Z1RbSh2OB5CzEqO4NRE0RsrMpBAblar1
   zOU4RkTr7lyGLrj7gkJQplxe+aKTh8IY4Xtbaq7sZb/pPy+7I9+0tkAcT
   SpksEo043N40QGqdD52NdOpkRwA+NyaMGkFtzPeoJoLxjYmZZ6b0PoX95
   w==;
X-CSE-ConnectionGUID: aOPpTuQoQR2+fHPmmmO+jQ==
X-CSE-MsgGUID: 2DNHu+UBRaGo0RnOwQFTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003206"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003206"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC39BD4808
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BC987BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 591B120071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0125C1A0071;
	Tue, 24 Dec 2024 17:27:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 66/67] tk: upgrade 9.0.0 -> 9.0.1
Date: Tue, 24 Dec 2024 17:27:00 +0800
Message-Id: <1735032421-13513-66-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-2.180800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2vMJYD0aRF0RV0ieHN50/kHK0+leiJxLlcQhNjZQYyI3FxOQqP2lG9go8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJJtekWwNkd24w61RRk42PEQn4LOc/IwYt5mm
	WFAPjRXC5TEfccsfHvGhR6bDL/AEYuQJhdcqloPA5oOoKUR3K0M0kB7ksncLP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114540

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/tcltk/{tk_9.0.0.bb => tk_9.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk_9.0.0.bb => tk_9.0.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
rename to meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
index 7deba151f7..6cf1eecad1 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -20,7 +20,7 @@ DEPENDS = "tcl virtual/libx11 libxt zip-native"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
 "
-SRC_URI[sha256sum] = "f166e3c20773c82243f753cef4b091d05267cb7f87da64be88cb2ca5a2ba027e"
+SRC_URI[sha256sum] = "d6f01a4d598bfc6398be9584e1bab828c907b0758db4bbb351a1429106aec527"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
-- 
2.43.0


