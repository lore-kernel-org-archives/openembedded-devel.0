Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40315C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 05:50:51 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1735.1786513848595007094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 22:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bT9dXGQy;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1263; q=dns/txt;
  s=iport01; t=1786513848; x=1787723448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VlA/xJ00XwSHgpNkcBsX3kwbtxvZQ9CPv9uj61tgjxc=;
  b=bT9dXGQyvm2u/9yi+iTSApdaBJ55/9p9M412Kf3Z6pFDftCkS3LbFKj8
   JlzGExI4FEp0UO3327FodIvdPAOTepb7Bsdg66Hecjl5sUN5FjcvRYlAZ
   IKLokQ8/ldNjWhhv+jpRkzsy3SxKSZGbiH65gZuR/brlzRgp1WaciPQH4
   m9r5ETQLIxWHVU9zG20pqtpSDNx5u414s0NJaZdgjBUeW8NC9pVDkoeXW
   Eap/tKVm5SRgViX4n6zk6ied2pLB77fI+lSx0NBYZDZB0iXmskRJBeF5v
   2COgm7Gh37sD1T7WqX6PxXwIaq8xEKk6ctA6KgpQE7b9S5UGljWUFIgs5
   w==;
X-CSE-ConnectionGUID: hK423ADFSyWXEkXc9YpGKw==
X-CSE-MsgGUID: 7Ic7gyL6ShSr4rq02QfUNw==
X-IPAS-Result: =?us-ascii?q?A0BCAgDXCHxq/4oQJK1aHgEBCxIMggULgld0XkNJk1kBj?=
 =?us-ascii?q?leSN4F+DwEBAQ89FAQBAYUFjWkCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GXTYBGAEtMFELRIMCAYI6AzcDEcIYgiyBAYMoAURA2?=
 =?us-ascii?q?RoNglgBCxQBBYEzhT+CfoUjhXInGxuBcoR+gh+CcYV4BIMugXiBCZAmSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIRoIxk2fIEJYYErK?=
 =?us-ascii?q?mUBEheBCYI0AoJ2gS1iAgEeCxgNSBEsNxQZBD5uB44wIIJGgQ4BK5kOjHOCI?=
 =?us-ascii?q?aAecQoog3aMIY8+hXwaM4QEpmgumFqCWYsxhAmSR4RpgWg8gVlwFYJuAQEyC?=
 =?us-ascii?q?UoZD5Z7x2EnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:K/UnQqjEuQ0h8sBr5ZjiyHX8X161YxEKZh0ujC45NGQN5FlHY01je
 htvCGuPO6zcYmrzLd8ibI23/E0E7cDUydJnTQo9qyozHntjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/va8E0HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUY2botWkhi2
 8cJFwAgbSCI1tOu75GkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQUaj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFIofaGJoNwhvwS
 mTuoEXyXR4LEIKkyQGfrmi13rX2kx7dR9dHfFG/3rsw6LGJ/UQZBRsUXF66p7+zjVOgWt9FA
 0EX+ywptbN0/0uuJvHnVh/+o36JuzYTXtNRF6sx7wTl4q3M7gCUA2IJQjJMZJkqudE7QRQu1
 0SVhJXuHTFpvbifRH6R+7vSqim9URX5NkcLYSsCCA9A6N75rcRr11TET81oF+i+idid9SzM/
 g1mZRMW39075fPnHY3ilbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:aOCOa6w2aCn0f6ZWKSdBKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ADlmeKGpj9EtW9PJhKVbEiLHmUcAGLieG5Vv+GF6?=
 =?us-ascii?q?HOUtqeLbEeEe/27wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AtVF/lwwpbSfd1jFrD0NW3MIxsrSaqPuPAx8CgLF?=
 =?us-ascii?q?YgMm/L3BqIm/HtTqKZJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,218,1779148800"; 
   d="scan'208";a="803857045"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Aug 2026 05:50:47 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 8CFD7180003DC;
	Wed, 12 Aug 2026 05:50:47 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 2AD7CCC12A6; Tue, 11 Aug 2026 22:50:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Benjamin Bouvier <benjamin.bouvier@ekinops.com>,
	Khem Raj <raj.khem@gmail.com>,
	Devansh Patel <devanshp@cisco.com>
Subject: [meta-networking][scarthgap][PATCH] net-snmp: add CVE_PRODUCT
Date: Tue, 11 Aug 2026 22:50:43 -0700
Message-Id: <20260812055043.1488918-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 05:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128927

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5efb5b44e8a3eeafe9a8cac3a1344e5f397702af)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index d45cee86f5..406d609ce3 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f493074
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
 
+CVE_PRODUCT = "net-snmp:net-snmp"
+
 inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative ptest multilib_script multilib_header
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
-- 
2.35.6

