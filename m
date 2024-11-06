Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520EED29FAC
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.40137.1730874687516066881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HwOmuEoR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874688; x=1762410688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Vt6tZ+/7gw7XJKovp5iyPGdDYazQPBGdysT1maJ0jkA=;
  b=HwOmuEoRRyEeEREAhoRRSbdyj8dRn8ehxImpb85Lvickw5rzHNH00RVk
   jQNtYUUjbipMAQv1gMNYcPg9rIN9HdSuN0r5cgZ+dHh2anQKYDu8Bco49
   CjNCEwsgz6Cs3339iuYZ46OW5aweWzk2qIq0aoAVLxdCR0y1SocbLFpfS
   6xUsOT/ss0V1UWegKup6S/Vk1O/hzeX+bhmiY+jtXL+STk8uauYncEv0l
   cnNolsBX1C5NAUIkYStOw4CCRqBEcJsFlhXMnNUyHAPFIu+Gu6QCondDy
   +yi1wOpKoimRd847mmql58g5NkRHDnFCzQZ1U8REhBS2szGW+Jgmdb8Nq
   w==;
X-CSE-ConnectionGUID: yBxlnIAlQ5eyS1QvYt7NXA==
X-CSE-MsgGUID: EQezvsU8TECKXEAeyckQBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179341285"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179341285"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F87D8012
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB20AD748F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78A8D6BA6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 258B01A000A;
	Wed,  6 Nov 2024 14:31:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/46] python3-moteus: upgrade 0.3.72 -> 0.3.73
Date: Wed,  6 Nov 2024 14:30:43 +0800
Message-Id: <1730874660-2364-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZIWp6u4q8Ap99LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrT1ylGFzvL2wefSlwOmOv0+gfip7Yvq/OSU70nyXq3RBbXxjkeqSdwpJ/C
	VZMFwC4F3f80QmPlM9gii/FzO+CqOUoUpaMubUMB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113713

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.22.0.bb => python3-marshmallow_3.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.22.0.bb => python3-marshmallow_3.23.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
index 269522dce..715439588 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4972f529104a220bb8637d595aa4c9762afbe7f7a77d82dc58c1615d70c5823e"
+SRC_URI[sha256sum] = "3a8dfda6edd8dcdbf216c0ede1d1e78d230a6dc9c5a088f58c4083b974a0d468"
 
 inherit python_flit_core pypi ptest
 
-- 
2.34.1


