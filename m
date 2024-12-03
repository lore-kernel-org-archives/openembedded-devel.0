Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA1AE69EB8
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8070.1733185014399800145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kQeFI1Ff;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185014; x=1764721014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zjRr8i40aNrHPhE4ooS7xYUnNcOEBrFrFFkQp7UBz/E=;
  b=kQeFI1Fft+e6Ert/lJd+0b+33b5jGQ6sciqJijgvR5drUwzO3d7VLVwh
   hkz0Ei+N1yEUT/uEGP9GhIpfpeq6+wDbJi+0/OlvV3hPUkyo/eZoDoaIh
   7JA2Q5vkrUTHxgfF5Hjm3a6SCGpfG0WghkFRcAtAgnjb6Q5XAZC+WeOLo
   kOUfTCIii5uzKKV35NwKKppVC+FRXzJ17sg0pJwNm84FWK2R7YjhHmpZA
   s6zO9K7WLSpFdOpzlBMm3R+V0tveM+ANrB2kmCcSf36Iul0Um57dwk/Sq
   oWMWSl7OikdytTnZRDvXj0R0J6fgHylOLywukj+apyiwAe4Ktlfvt+CH7
   Q==;
X-CSE-ConnectionGUID: B2lMldBxQK6JClAi4FN0EQ==
X-CSE-MsgGUID: 6t5G8bm7RCSJg70UbjfWkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406403"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406403"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E41F0D6EA9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8CB3D96F0
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B57020071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F04781A0003;
	Tue,  3 Dec 2024 08:16:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/34] gnome-online-accounts: upgrade 3.52.1 -> 3.52.2
Date: Tue,  3 Dec 2024 08:16:12 +0800
Message-Id: <1733184999-27041-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--4.037600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yXtNecKMjy32F4r8H5YrEqy8B7vl7G5M0biR
	FJnWDxklz5hqUuJXY3yay7rv659o0O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WaatyIGyqiA2Ax8oa86bLOCUlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbYQvo7F3FbVsMVa/mjH4+v8aUdJ7nvKvWDN+6Iwa7zfB4wUFdFLCGjSVARzBseTZLhKou
	z3shjA5QjJypXKmgxMkXgKQ0xrqr/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114148

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed:
- goadavclient.c: add WebDAV default candidate to test
- goafedoraprovider: fix use-after-free

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...nline-accounts_3.52.1.bb => gnome-online-accounts_3.52.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.52.1.bb => gnome-online-accounts_3.52.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.1.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.2.bb
index 9c01095f23..214476f900 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.52.2.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "37c7522ff9454f8371b5a8725bba76ed7430c95b1f9efc7feba6268f052d1eb7"
+SRC_URI[archive.sha256sum] = "fb413f48deefbb9fc3002a91579dee947ceeed41f49c2f51317af7489b676f67"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
 
-- 
2.34.1


