Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C20C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:05:41 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33664.1785906332231574894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YSqctHCs;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1025; q=dns/txt;
  s=iport01; t=1785906332; x=1787115932;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J7CWS6MQwxPOcPNfBuW+ZY82lOFtvkuSP5QfAZcR9fI=;
  b=YSqctHCsSXRr0sLeTEe3CqiLp9h3gEMouvAVvPuSFUE2lJC6+uCb/Eo0
   eGlmlC9Ar1m4jXu+jlpVKMAVldVI1ecfqB6DkRFTpcu1ps4OapHR/1EpJ
   9lhMa/3Yowe2R/H4dff8v0WX0dWnbRWlkctcC3aItH35VtvLzWzH9TAoo
   fadQbQKMwtv7oh84EDhNbpO7ngQHtkfGGyGKzebJeVd+r1n5axEoHXn16
   GT8nlSjj+aK09wDkbCfrM5S+Z1F9Q+HZi2Z1wcAx3CORP6w59vvJ/9Nrn
   GLSZJZ2EQjMYuc880IlVtHElLPup3yoe7jJj0eVgggbidFLaSmqfPT7Rb
   Q==;
X-CSE-ConnectionGUID: Nm2KbgowSo+lyeGtLGGHjw==
X-CSE-MsgGUID: UO/Rf/wIRrShloBs+fCgKg==
X-IPAS-Result: =?us-ascii?q?A0BCAgBrw3Jq/5QQJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBRC0SDAgGCOgM3A7xsgiyBAYMoAYFU2EkNglgBCxQBB?=
 =?us-ascii?q?YEzhT+CfoUjhXInGxuBcoR+gh+CcYV4BIMuklFIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB41oIIJAgQ6CaaNEgiGgHnEKKIN1jCGPPoV8GjOqbC6YW?=
 =?us-ascii?q?pITkkeEaYFoPIFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:MvyuZKh1OU0QFxR+piGLvgHdX161MREKZh0ujC45NGQN5FlHY01je
 htvX2GEafqOMDD3fdogPNmy8EkFsZfdy99iTgJsqXpnRihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/rf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU+/7xUC25J6
 scfazQcYz+fo82Z4LCkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaj/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKKK4PSGpQNzh3wS
 mTuwkO+OB9dK/2l0wGF9nWGnazBtizYV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:+y6xBqyNZVYutWL8niYKKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3APlMHoGhadnJrrYeYCK/tX8RAgzJuVHiH733fJFC?=
 =?us-ascii?q?DDiVtWbC6VXu/14NmjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ACqaIOg+9a+61UB4TwDNlFq2Qf/pPpJ6gT18sq48?=
 =?us-ascii?q?9u82DHzczNRySrzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="797079083"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:05:31 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 5286518000393;
	Wed,  5 Aug 2026 05:05:31 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id EB010CC12A6; Tue,  4 Aug 2026 22:05:30 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-networking][scarthgap][PATCH] tcpdump: add CVE_PRODUCT
Date: Tue,  4 Aug 2026 22:05:30 -0700
Message-Id: <20260805050530.1745278-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128793

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 112120131d334dd4aea51183fbe63857f9f5ef20)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index b05b832dd8..1614325833 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -31,6 +31,8 @@ SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
+CVE_PRODUCT = "tcpdump:tcpdump"
+
 inherit autotools-brokensep pkgconfig ptest
 
 PACKAGECONFIG ?= "openssl"
-- 
2.35.6


