Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE8FC5479A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8721.1724833543487925868
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nsVNTXgs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833544; x=1756369544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DUUVP4BLOBd+Yoo5J3u6DA0AmHEf3Oh7XJ3qw+ieKXc=;
  b=nsVNTXgse+FYTpwO0rF9fX2OVfwdyc/+63DRRZNbMtMunH4gEkzflUHu
   Oebzwu5Gc7MyOnzRq+4S6aLFpdMDvabwBey5fSJiJBfxbowd5IvAc9VXd
   M0ffv+5jMicoHHuTaSHcnb0dxwLMt3fCqSMYQt574KDUFyFr2UZsgmpfp
   JfxDMcqOT8/fBrXqslpjPTsC8XDaEaQJK+LKUnOJWDK0R4l5Aj+GXvLIN
   UMRslPIB+saxqwcIsEpp7zqIo2I7dEe3kdcNcXx/7TXGJRLyA1lQ66YDO
   cIx/t+gVjpsTZsW7CWv4caPvXZOsaY/bh0VQnSr/zCUpYY/Qc3pQKpfzK
   g==;
X-CSE-ConnectionGUID: V916GCgAQEm1X+qPIJrK3A==
X-CSE-MsgGUID: 1wJm++VLRYa/B8ExeNtqwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171952023"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171952023"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 240A1D7AD6
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6618AD4C34
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3F4320079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8997A1A0002;
	Wed, 28 Aug 2024 16:25:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 13/46] mutter: upgrade 46.2 -> 46.4
Date: Wed, 28 Aug 2024 16:24:51 +0800
Message-Id: <1724833525-2162-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.082100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytBHfH0Hk/jxGlF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74D8KWLAt/9Aod9zZd3pUn7KofY
	lG2S9Af/SSNk65bYMyoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzbKj1qK9/Wca21r
	veXQx60thZ2v+jp3iGF1GMC37ysJWbGEFQwGVkLyFOFM4MSOroHe7H5bIh+4U0NM4Z5xSSs9pY/
	eXJ0G6+iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111990

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix nested popovers on wayland
* Misc. bug fixes and cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/mutter/{mutter_46.2.bb => mutter_46.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.2.bb => mutter_46.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.2.bb b/meta-gnome/recipes-gnome/mutter/mutter_46.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_46.2.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_46.4.bb
index 6a121b09c..c91744cf6 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.2.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.4.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "009baa77f8362612caa2e18c338a1b3c8aad3b5fe2964c2fef7824d321228983"
+SRC_URI[archive.sha256sum] = "611bd9cf982adb56597ce2b34224272fda619bb3bb912a684d75c6f2c37502e4"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
-- 
2.34.1


