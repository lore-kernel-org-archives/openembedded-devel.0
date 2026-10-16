Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B992CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:57:12 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13789.1792119422947480683
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P91Gy0CK;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1402; q=dns/txt;
  s=iport01; t=1792119422; x=1793329022;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QeatrndssroU5kKuq+WrM7A/OEA+ZwqYg8IfthgzD+E=;
  b=P91Gy0CKUkccuyDcredyccHfjG+Gv2FKrtLx8WHlRpZSay5Z9rsmNUCh
   XRVjeDivXiPUqVa/H3uhGwlGEtAR82m/MdDn801asmdg0xITm3uXaSWPO
   nbCQWdHNYznbwaw8/wBel2zOka3ONYr4NJJTXzE2c+5gIJ4eaFHPm8lA2
   8Mta585e2vHobdbdNYEZfIJSmRU6LXTj3y0mybV78EqXC2RDXos/mYZWH
   bnMY9c6WHZTZCrMHNwBi2WNhES7j9BFeYIK7sgmfTvlRNY1ATA1vBLYBl
   uG4gMxf6Cm95ZwLlmtB/q/nh1f345rT2YC5Qi5C1e6XB3LT+F7XjSukRO
   A==;
X-CSE-ConnectionGUID: 4nuglb+pRMSXAgZX9zk3YA==
X-CSE-MsgGUID: vGwKp6P0S7+YnseA6hGvKg==
X-IPAS-Result: =?us-ascii?q?A0BJBQA+kdFq/43/Ja1ahiVgQ0mTWQGCcKAdDwEBAQ89F?=
 =?us-ascii?q?AQBAYUFjhcCJjgTAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2QFSsLARgBLTBcHQEmgwIBgnQDEQa8VYF5M4EBgykBQ0FQ2z4VBYEzhUCII?=
 =?us-ascii?q?3UBhHwnGxuBcoR+gmEDgSYqXIV4BIIiehKXIUiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5ITHoJlYS0qAoI9BpNjkXuhDwoog3aMIpU6GjOEBKZrmQiCW?=
 =?us-ascii?q?aIAhGmBfyWBWXAVgyIJShkPlzfJRycyAgEBOQEBBwIHDgMLgWiQAAImgVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:JNkIDqP7yYsXxj7vrR30lsFynXyQoLVcMsEvi/4bfWQNrUom0zUHz
 2EeD2uFa6yNNDPxctF1bIm/oUhX75/Rz9JjSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66loEU4yN84AwMNMMUhBx
 8xJOjNWXznW0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEqjuG9bYCJI7RmQ+1LsVm7v
 jz+p1+mQSAcL9G2lzqq7FGj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:FbgXI6H956GI+W60pLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:LYSxeW0nEiWXkvt3sT7PxrxfRsY4fXnXj2/qBnSIIGlbeOyHSgSh0fYx
X-Talos-MUID: 9a23:GY6TKgskYMsKNbCmgs2nmh59F9822/yVVwM8l44LkpeEGjJTNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536185241"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:57:02 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 0F1B5180005FD;
	Fri, 16 Oct 2026 02:57:02 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id AAD4ACC1611; Thu, 15 Oct 2026 19:57:01 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][wrynose][PATCH 0/1] wireshark: upgrade 4.6.4 -> 4.6.8
Date: Thu, 15 Oct 2026 19:57:00 -0700
Message-Id: <20261016025701.372513-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131023

From: Hetvi Thakar <hthakar@cisco.com>

This patch upgrades Wireshark directly from 4.6.4 to 4.6.8. It
updates the recipe filename and source checksum in one patch, rather
than carrying the four intermediate upgrade commits from master.

The upgrade addresses 84 CVEs in the reported set: 43 were first
fixed in 4.6.5, one in 4.6.6, 12 in 4.6.7, and 28 in 4.6.8.
CVE-2026-19696 concerns a Windows-only crash and does not affect
Wrynose Linux builds.

The features listed for 4.6.5 through 4.6.7 primarily update Windows
installers and their bundled components; those installer changes do not
apply to the Yocto source build. Version 4.6.6 also adds a welcome-page
preference in the GUI. The Wrynose recipe does not enable Qt by default.
Updates to existing protocol dissectors and capture-file handling are
included in the upgrade.

Release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.5.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.6.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.6.8.html

Hetvi Thakar (1):
  wireshark: upgrade 4.6.4 -> 4.6.8

 .../wireshark/{wireshark_4.6.4.bb => wireshark_4.6.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.4.bb => wireshark_4.6.8.bb} (97%)

-- 
2.35.6


