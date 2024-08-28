Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095AFC54748
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8718.1724833538730307556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=koEjU91v;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833540; x=1756369540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nfmf3rpyAdB2DfnOUHARQPMmttuVnusI6uQAAKx6Kn8=;
  b=koEjU91vxab4r3jv+0/OEzIhEIn7FjxzZCiPLqKFnPjXuonn1zEQqCus
   YX53b5aYXIcJuGsPltcj0mv7WhNn2xw6ouT/2TgpyEWbHaXz5OfhjKSpN
   WTBdL4ZdzY3dt2F9fb/UHJZ/0uzc4wEv525Xa9Vck/pOXXqilB1UyBD//
   gncrsAHSFi8aMGGjHWsAxgO2ah/b5qjqaBKFHt4kqXPP4UPIiTCg2dh/3
   A5fBwPOlaX6V0WS93QvnDNEvK23dP9WPW9bRHIwC/mEHzAP9QqP7XdLzM
   3tMq1VHZNWzAI09VlN8ZWAyQVP3j8IwHddR8J3fgUaVXzTzqLATVmxU2v
   g==;
X-CSE-ConnectionGUID: QuwPh9MvTU2bj5nPi+e3Pw==
X-CSE-MsgGUID: EUZihONcRCa6MC0B3SB/iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913172"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913172"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6F54D6EEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EE33D9698
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3BF620079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C5BA1A0002;
	Wed, 28 Aug 2024 16:25:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/46] libtdb: upgrade 1.4.11 -> 1.4.12
Date: Wed, 28 Aug 2024 16:24:48 +0800
Message-Id: <1724833525-2162-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.225100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGPvwmMFLImuhngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUXXppeiLxnWeXQfnKOR6Y5ULFuLTHqfD+mijN/pFg7QpuTFPOvV06PwDZZafPeQ3EpoE
	XQaMoOk4huQ88qPypfBlD9B3mwfoKqBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111986

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.11.bb => libtdb_1.4.12.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.11.bb => libtdb_1.4.12.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb
index 091d7977c..a96527a3e 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4e8ba6d93f383565bbd061be4deee15318232d1bbcca7212f18e17f56bb975a8"
+SRC_URI[sha256sum] = "6ce4b27498812d09237ece65a0d6dfac0941610e709848ecb822aa241084cd7a"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.34.1


