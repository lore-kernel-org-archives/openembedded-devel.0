Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8082DC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:06:28 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3022.1787216779602505196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T9pZ4bYv;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1035; q=dns/txt;
  s=iport01; t=1787216779; x=1788426379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gdkLQ6kU06+iO1f3iLfeY6a3eviEcCOz9CASO6CGZBo=;
  b=T9pZ4bYv632gvjJSX8aQd8ASw9MT1fNkuMGehddtwcjPHsPYz2K6h4Hg
   ZBOAZo9UREh51srb2ljlXkLQGC0td6HKEkXWKU5h+hoWjhpRWeWWA/d7s
   GRQylwhZOt/RKQ/T81wVGgn8XYtG+KCCQvgAEACnTGIOWatVMAS0Xep5c
   R8uoPnRj3NxjR7vBnDOqI2Ah0HCPEWDgGjNDEC1aL3CgbOHCmvoqu0yz6
   QAO33JC+ec1y++wnxd72WdIhFN+kQj2ClaWr5b0zUUBjoex/l3ZCH3P+Z
   ydcXdR2/0L063GdLd3Aq9hWsf6NdnUm70B/YLSxTy3MRszqtchAwNjylC
   w==;
X-CSE-ConnectionGUID: XkehlaQwRjeJyDZxLZ5qUA==
X-CSE-MsgGUID: ncde1vnRQuCWoF8nrBri3A==
X-IPAS-Result: =?us-ascii?q?A0BCAgCfwoZq/5QQJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdNgEYAS0wUQtEgwIBgjoDNwMRwi6CLIEBgygBPwJDUNhLDYJYA?=
 =?us-ascii?q?QsUAQWBM4U/gn+FI4VyJxsbgXKEfoIfQgGBKIEGhXgEgiKBDIF4kVJIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqY?=
 =?us-ascii?q?QESF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPm4HjlEVC4JLgQ4BK4I9k?=
 =?us-ascii?q?2uReqAecQoog3aMIY8+hXwaM6psLphajgqECZJHhGmBaDyBWXAVgyIJShkPl?=
 =?us-ascii?q?zbHJicyAjsCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:c/B91KDvxJ4MzRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD4m1jUFm
 jMWWW+FbPaIMzTxc4txOY63pEIFupDWy4cyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8/ZjDEU/BJIi+OtVEE185
 dgqdSkwR0XW7w626OrTpuhEj8AnKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWoHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUqgeG9bYeMEjCMbcNekkvBu
 GT8xnnSPRY0ZNqF4yCEqVv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:yA4B0qPgeMlxLcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:Y8Yk92GDIUVuzhRfqmJX90MUHskcbUffwVXBD32oLVQ0UYC8HAo=
X-Talos-MUID: 9a23:zjhVFwRtusllvOlsRXTqjz1vbdlu2Z2zI38Kv8UAoeOeNHdZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813918551"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:06:18 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 93553180000B5;
	Thu, 20 Aug 2026 09:06:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 31D3BCC12A6; Thu, 20 Aug 2026 02:06:18 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH] smarty: extend CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:06:18 -0700
Message-Id: <20260820090618.58639-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129382

From: Gyorgy Sarvari <skandigraun@gmail.com>

Some CVEs assign smarty-php as the vendor to the corresponding CPE.
E.g CVE-2024-35226[1] is tracked with smarty-php:smarty by mitre
(NVD tracks it without CPE).

[1]: https://cveawg.mitre.org/api/cve/CVE-2024-35226

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1aee6a403c1901bc7ae793a2f4581b3cdbd95c1d)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-support/smarty/smarty_4.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
index 395fd77722..cd59a71103 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.4.1.bb
@@ -25,4 +25,4 @@ do_install() {
 }
 FILES:${PN} = "${datadir}/php/smarty3/"
 
-CVE_PRODUCT = "smarty:smarty"
+CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
-- 
2.35.6

