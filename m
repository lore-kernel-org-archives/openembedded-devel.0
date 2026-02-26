Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9442AFCE071
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:51:10 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69307.1772110268299695699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JMSpcS+m;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=678; q=dns/txt;
  s=iport01; t=1772110268; x=1773319868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JN/Glf5nU7WCE+CghO78W537So7HKSzI+wYvG/ahjaw=;
  b=JMSpcS+m1q2zybFBE9IM6YnLnWTmHRvDQ4mW2CuqILKzpXaFXYH1dhVp
   lSrFLNjJIQXTm6xecjoTsf+xMAtpoO9/dzwVf7xw42V0uvyYUPkHRQvNy
   pdXDCHnpihqErTMnZ3DFP80Kg3YewRbCxQ/347weL/TYNvk6OMIJg3o6g
   75GIIX2e5qFi6GX1r2dTNRsbWOYu9ynTEPoOxbVtuyFPFSq6d7lI7Rrxl
   ENLabj3oXrrQinY6sY6S0WiT12139+kWQCJmn8cwzERHVHw/3Ityd02m7
   jz+aTNSeq5tR7eY2lmcnYxqRWF8MVa2LwFZYg/ZhUldKTk9xJhOMRUf5n
   A==;
X-CSE-ConnectionGUID: PnDRpt6RRc+Mm0izunVlAw==
X-CSE-MsgGUID: U+epXrmZRmq0ryKDImiNqQ==
X-IPAS-Result: =?us-ascii?q?A0C/BwC9QKBp/43/Ja1aglmCSA9xX0JJlk6gGQ8BAQEPM?=
 =?us-ascii?q?SAEAQGFBwKNHwImNwYOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZbAgEDMgEYAS0QIDErKxmDAgGCcwIBpm2CLIEBgygBgVPbJgELF?=
 =?us-ascii?q?AGBOIU8iBl0hHonGxuBcoR9hRCFdwSCIoEOh3wGiwxIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQobBwWGCA+IdHhugRqCBAMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?Wk/gjR0GoJpo0KCIaEOCiiDdIwelToaM6prLphYpFmEaIF+JoFZcBWDIglJG?=
 =?us-ascii?q?Q/ZJSI1AjoCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:vxrGK6OpFbOkB2DvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUomgmQPy
 jBLXWyEaf6JajagLt8iPovgoEkCucTUm98yQXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf/gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj681oIHsuIdMiwO00JGQW9
 O4FLg4JRw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJIzgP+hmlH0ciZTrxSeoq9fD237klMqjOK9b4CLEjCMbfgWk16ov
 Gf0xWHgWgsLF/C+zDuj60v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:YSiRB6zMAMErdSP5EBPBKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3At4ZrcGgm9gcUWcff9Un6jqzjoDJuSnvx9m/MfXW?=
 =?us-ascii?q?CAiVMTeWUW0KWxqdNjJ87?=
X-Talos-MUID: 9a23:qE5mXgXKWilMdFzq/AKviSlSLsJa2aG3UFocsrknvsiiLBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="673428726"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:51:07 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 6232F180005C3;
	Thu, 26 Feb 2026 12:51:07 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 020A8CC1284; Thu, 26 Feb 2026 04:51:07 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-oe] [PATCH v1] onig: Add CVE_PRODUCT to support product name
Date: Thu, 26 Feb 2026 04:51:04 -0800
Message-Id: <20260226125105.47526-3-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260226125105.47526-1-hetpat@cisco.com>
References: <20260226125105.47526-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124674

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta-oe/recipes-support/onig/onig_6.9.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.10.bb b/meta-oe/recipes-support/onig/onig_6.9.10.bb
index f285c2ed73..d7419b4ace 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.10.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.10.bb
@@ -35,3 +35,6 @@ do_install_ptest() {
 }
 
 PROVIDES += "oniguruma"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "oniguruma_project:oniguruma"

