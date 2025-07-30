Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF6FC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.31493.1753869308081090093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KVWa6BB0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869308; x=1785405308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SrsEfLueVkHBvIsD/M7OaLZOndi00u7c8gTiyFomDH0=;
  b=KVWa6BB0IvHC/esrTwfnfAHUWTpgwZ9GREFij/Wih8oZJlVhOHgWf5nW
   Q3WuCGJGVVBjcNV5zbYSKjPanrled77o+xXOBJL0J6OX1ws0lkdQ879bB
   cNMgF5YjaO1F6EZeX2M56xi2YSROWn7Nssb7s/nsn4IwFMQJ6l9mxPyz3
   L58ABxg/G6d9tnuhxWhazcwfAq986Nl7Au4l3LGDnFjQXrJ3lsyMfa91B
   B9T/Mh9JbRsa9mp5fnAxyNxTUI3uRukPzZpqqUlflGTfPUnSHOvlEDyzP
   /Mgk3ESp81bzMA1EnuSt2TTaR/q1QrbXLm6CwMwmChbb7nK3jIaVns81N
   g==;
X-CSE-ConnectionGUID: zlw6OvfDTpWhCvCbB4LX+A==
X-CSE-MsgGUID: /0kNAI1ESf22UEuHIHCt+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207849417"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207849417"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:06 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 50E688203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B33ACC01835
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0B3A1A0096;
	Wed, 30 Jul 2025 17:55:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/40] gensio: upgrade 2.8.7 -> 2.8.15
Date: Wed, 30 Jul 2025 17:54:24 +0800
Message-ID: <20250730095456.695-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118776

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
index 9325b1e5dc..e064f5acd5 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.8.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.15.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "e4dbb9687bd5e887fa98a4cdcec012ea85da1ef2"
+SRCREV = "5ffe39f4a247ff001661a4c283305a3abe823fe3"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.8.x;tag=v${PV}"
 
 
 inherit autotools
-- 
2.43.0


