Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F274EE69EAF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8206.1733185019611837934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i4kn2Zk1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185019; x=1764721019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pXApm1LigX4YRX+fpAOBwTlYiEXQxuCBqv5+rsgJRNw=;
  b=i4kn2Zk1cpEtoC3nFcEP0Rei32nWW9RTpE6fHfTLYPb0aiD3sa2MeXJ0
   ymWCGGoBbs1vlrDgoec3qf7LmB7OqaHb6tfTX+yotB2XiBQbHQA32Ncnx
   pTeQesOU++0VUVReY3hKrhb9I4ce8O2HsbMWUZ7AW626U6Emjtgd38LPZ
   78GJVETNUXey3PktUpkFlXWtVLXP/If32w2TD/Gg+SeyvBfRvHsj0wEux
   m/hLYur1yw5TNVuUJCjQWjH8W6pEa3nqPeV7QWXE6die1xlXIgz5xziWx
   em9ijsiNKFW1c5ys94to+qAtcIeDbcs/jz0UKhOkGL1Z7nYwk5RLnTIgp
   A==;
X-CSE-ConnectionGUID: YUzGXjhvQRikVIgRbYxDww==
X-CSE-MsgGUID: p5BHJQpyT0qAN427zboIjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161250544"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161250544"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BACFBD4808
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F6F9D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CCB820071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0A6E1A0003;
	Tue,  3 Dec 2024 08:16:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/34] python3-blivetgui: upgrade 2.5.0 -> 2.6.0
Date: Tue,  3 Dec 2024 08:16:20 +0800
Message-Id: <1733184999-27041-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-4.447400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRvkwFzTzcgzhPnGwx36cSE1rBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFKDbXdqGNKzpKgQPy5XpTa3AOo
	xeTiFxuR+zGieY2CKaLmLh4ywRshSLxmf2yHVCVpIB9HdWcuF1CjF1aLInVX9tyoBmuPZ03ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114157

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-blivetgui_2.5.0.bb => python3-blivetgui_2.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.5.0.bb => python3-blivetgui_2.6.0.bb} (92%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
similarity index 92%
rename from meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
index 124f36c6e0..b615ff2c92 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.5.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.6.0.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https"
-SRCREV = "626b44610a30ad26734dd20642538caab5a9178a"
+SRCREV = "7cec4bd48af4c8f7beb1a74bac751c3d520dedf1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


