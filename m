Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417F10ED664
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:13:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70455.1774613619131252184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cvOgV8Ra;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774613617; x=1806149617;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=peOUm/7Ig3ioks2SpOuHjCKuaZJTuoDtzIdWq0UUfQI=;
  b=cvOgV8RaYMDkWUtTUV/aCEhizjAKG9QKNy7hU17dPZ+142kwjFAyW++4
   6LVwJN87rE0ruUdFGCENHEt8RlFgRQPRa1OQWmICfiRf3QqKci5Im5393
   9o8tGmGD7jlJU4Y8F5nkuui9voGOKaRHqj4uG3WivLG+hPt/OsPAIll3M
   HpWFK72DrG0k9GSczdHJEgmA/5zJUyjj5B4gBfShkAcNCpveruoV6+ePy
   s+fBOhoYztC9J63b8BjHz0oO9KnEgVqeFakVWFxMqzVJU4PDZY5XXD1y3
   SfJdJfvG4AzVOu4kgDs81wYaS4AkBOfwt+uEMUXOIS/OK3o+ZUM6KEgUz
   A==;
X-CSE-ConnectionGUID: DhP+hs7KS/Kye1LGZXLJgw==
X-CSE-MsgGUID: a73ZGDrrTKep+/kp+cRa/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="223514521"
X-IronPort-AV: E=Sophos;i="6.23,144,1770562800"; 
   d="scan'208";a="223514521"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:13:35 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 71DA81C166D7
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 12:13:37 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2BA87181AEB9
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 12:13:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CA79110024BA;
	Fri, 27 Mar 2026 12:13:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] graphviz: upgrade 14.1.3 -> 14.1.4
Date: Fri, 27 Mar 2026 20:13:31 +0800
Message-ID: <20260327121331.1295-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125788

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Enable ascii plugin to be built using autotools.
- Processing 'concentrate=true' graphs no longer crashes Graphviz. Processing of
  'concentrate=true' graphs still often errors out.

License_Update: Change Eclipse Public License from version 1.0 to 2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb} (95%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
similarity index 95%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
index d885dc43ac..bfc59c3ca1 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Graph Visualization Tools"
 HOMEPAGE = "http://www.graphviz.org"
-LICENSE = "EPL-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9109f5fc16cf963fb3cdd32781b3ce04"
+LICENSE = "EPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d9fc0efef5228704e7f5b37f27192723"
 
 DEPENDS = " \
     bison-native \
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "fe76529477c22c0cf833ec5a35b430cf710f4705afc465d86292bf13560be584"
+SRC_URI[sha256sum] = "043877c0857d8d46067cd2f18809d54fc876c399f0ecd438f60ea7f4d8037451"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


