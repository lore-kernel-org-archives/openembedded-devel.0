Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1402C3ABAD
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7614.1745900151729756690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AwqMrHr+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900152; x=1777436152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M3qpUkYIpy3oUH2X9kpK2oqc2DRciaM2Y2zayDihNgQ=;
  b=AwqMrHr+ifCyaJAjPAz8goItFYAJusC1Tv6FuvFMbQqvuzdKQMzwzzP1
   GgUCEIY6syVCjBRjYR12F+oSwJswJiD4li+qWIdA62gLYAvpJ3u2yLbC4
   lamFsSCflvUdObgIbklNwULXkLbQZBa4baxejes4GMlyGmXHKyIPp2Eyq
   uRnhsCWrosWd1BijY0ya59gpDpcPVEtP8g7HmLOAodBrvWX5PxuzlD5Da
   Ctb0S1VzkyULvVq3NRmXulSv/MS+/WEqDmkDZ88UsatdYKmLtwQP4n+6f
   lM+kZg6XIFzZHo+UctrRkljtwagnx8Y5/OnDpWKXCEuncJcEOydzMyunH
   A==;
X-CSE-ConnectionGUID: Eko1GOc5Q66oyW/0QzAj1g==
X-CSE-MsgGUID: gu+PqU8nQbO4X2nVd1Ri+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="185959272"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="185959272"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB966D6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60CF3D5046
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E62341A0071;
	Tue, 29 Apr 2025 12:15:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/23] libauthen-sasl-perl: upgrade 2.1700 -> 2.1800
Date: Tue, 29 Apr 2025 12:15:20 +0800
Message-Id: <1745900138-26424-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117213

From: Wang Mingyu <wangmy@fujitsu.com>

  [Changed]
    - Minimum required Perl version 5.14+ (from 5.6.0);
      Digest::HMAC_MD5 was 5.8.1, making 5.8.1 the effective minimum
    - Move example code to the eg/ directory

  [Added]
    - Mechanisms XOAUTH2 and OAUTHBEARER added
    - Include mechanisms available on server when
      negotiation fails on the client
    - Add `_acceptable()` function to allow mechanism
      implementation classes to decline selection based
      on the callback values

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...authen-sasl-perl_2.1700.bb => libauthen-sasl-perl_2.1800.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libauthen/{libauthen-sasl-perl_2.1700.bb => libauthen-sasl-perl_2.1800.bb} (90%)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
similarity index 90%
rename from meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb
rename to meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
index f0913c5b58..e8ee641d9c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1700.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} = "libdigest-hmac-perl"
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "b86d5a576b8d387aee24f39f47a54afd14bb66b09003db5065001f1de03a8ece"
+SRC_URI[sha256sum] = "0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922"
 
 S = "${WORKDIR}/Authen-SASL-${PV}"
 
-- 
2.43.0


