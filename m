Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43B4CFC507
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50342.1728896172937051476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hs1v7B3W;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896173; x=1760432173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LxmBhl4jMsE3eHXwHSLgKeEYowvRvOzdU5fXA13Jln8=;
  b=hs1v7B3WNv43cU5OCShZX1qvOE9A4lD8PwvEllfa5Sqrt7OaKk285q46
   I0exEgyBao2sUmAyTueYLjoQ1jLqMvI6Iu/neZ95ATw7A17QqlLV78Y2s
   nhnifRB8YBj8Kli0Y8OhyhS2J+O5AGY5g0bWk0Hj7eXVfZSXzjZLY/V3r
   a0TfQPe8UdTXQSxrE2Bs0asA3F42xRGRY/fLqdJ4dxwcZfnmVW6ELHku3
   vDGv6XrXML+yfCaIADcDegtLyyAR4zDGIuyebqwN4cySVIR+v8hpgxUMM
   BzeOCj9SvzRZQoc9TDxEm+YJ4BZhGhFITfL9SFVDb2v6oqNYFsf8xXPN0
   Q==;
X-CSE-ConnectionGUID: bEomZdMgShSQBvCEV4AX8A==
X-CSE-MsgGUID: IUOF7CH1T4aTJiJ00wv7iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665608"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665608"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:11 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DCE9FD29E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 302B1D4BD2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B4495200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 626EA1A000A;
	Mon, 14 Oct 2024 16:56:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/54] python3-ipython: upgrade 8.27.0 -> 8.28.0
Date: Mon, 14 Oct 2024 16:54:49 +0800
Message-Id: <1728896115-2944-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrXRwjMnb3nCwJ0jCTFoOenpUhTxybHtv60GF8+ibsorOqSXjZHNXwAxI08
	C1LvVf6LSgyUAaAfVqWZUXOylnF5uSHff77JEeyB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112877

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.27.0.bb => python3-ipython_8.28.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.27.0.bb => python3-ipython_8.28.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb
index 94e731b88..f290971cb 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "0b99a2dc9f15fd68692e898e5568725c6d49c527d36a9fb5960ffbdeaa82ff7e"
+SRC_URI[sha256sum] = "0d0d15ca1e01faeb868ef56bc7ee5a0de5bd66885735682e8a322ae289a13d1a"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


