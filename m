Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590EFC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 13:54:18 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7524.1787147648070998864
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 06:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d/4vP/dS;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=820; q=dns/txt;
  s=iport01; t=1787147648; x=1788357248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6DTei09uskvyskl2syEek/I87wz4c+z1w6xxk45tPOI=;
  b=d/4vP/dS9fJdvf1FjpBD4HcyxX6/zVL9XrQbIw9oDsBtNg3L4y1OYydo
   ddahzq/h5Wq3CV/Q9KbVDC3W0JB61bGtVU4cTrizNFTyFRCfarIbNIjr2
   h91fyWbZU9K4XwLMo0G/i21CcD8q5hXFzW/3FWeZDX1TbdTIXzANtIpQr
   VLBOTWCMkM1VHFONtygu43oV9xq/WoKLaMCgP7KmeV80D/wXrdklJ1Fwm
   LtU4gwozaXKv/h1qeWtJwQcWYNyDJ3d5jGSeGBa+kOVOfrNKCk3Ge+fkw
   HwaAYYib/3/PPLrPy+KUx3P5+3h8+hofRbBFo8/ZpvzfUcp4ND0UXv7Kd
   g==;
X-CSE-ConnectionGUID: O0aw9NNhS06GdpAjmdOc8g==
X-CSE-MsgGUID: mfPnLD8XSf21gfLHAjd31Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgDutIVq/4wQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDw3eCLIEBgygBgVTbMAELFAEFgTOFP4gid?=
 =?us-ascii?q?oR8JxsbgXKEfoQKDXmFeASCIoEMgXiRSUiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJR?=
 =?us-ascii?q?Q4JCwsYDUgRLDcUGQQ+bgeOSSCCS4EOllSReqEPCiiDdowhlToaM6psLphap?=
 =?us-ascii?q?FqEaYFoPIFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:n2Fha6nWZwX+7fUXkl/MICvo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWTvXbqnYYWvwKIwnbN+39EhSvsfcndVhT1Q4qCxgFVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FapA8/kmJ0dOz
 qRGBzwVRxKGi8W9kL3uH4GAhux7RCXqFIobvnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEXUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMIoTUGpQLxC50o
 ErD8Vz/Jj1KBOeRk2OK/FaMr+3DxnrCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Lxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:G6pjQa2T0THSo204spEtpQqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:vbffBmxe2GT3vaoCsqn8BgUzQsk6I1v7zEyIfWC0EU9rTbGyQg+frfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AOABcLg4ibv5HbQrLYUWJgTCExoxt7ZyoLGxdoa4?=
 =?us-ascii?q?I4ZCLOwhQEjWR122OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="810067962"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 13:53:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id B4234180001ED;
	Wed, 19 Aug 2026 13:53:58 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 488F6CC12A6; Wed, 19 Aug 2026 06:53:58 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-cbor2: use exact CVE_PRODUCT mapping
Date: Wed, 19 Aug 2026 06:53:58 -0700
Message-Id: <20260819135358.16960-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 13:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129361

From: Devansh Patel <devanshp@cisco.com>

The product-only cbor2 mapping uses a wildcard vendor. Use
agronholm:cbor2, the NVD identity for the packaged source.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
index d7f08c6cbc..fdd206cf97 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.4.bb
@@ -19,6 +19,6 @@ RDEPENDS:${PN} += " \
     python3-datetime \
 "
 
-CVE_PRODUCT = "cbor2"
+CVE_PRODUCT = "agronholm:cbor2"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

