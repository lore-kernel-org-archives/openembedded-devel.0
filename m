Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018A1CCA48F
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:04 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13829.1792120857841685084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PT36KFQ+;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3609; q=dns/txt;
  s=iport01; t=1792120857; x=1793330457;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YbbhwqfUQXpX1DXEBZH8DTowC0/urXEAgo584f89EDc=;
  b=PT36KFQ+lx1Gtv64AEiWPecG1v0qChq/7pAej3irQCzuybcS/54u5BNb
   1vUVOWENyZBchWJ0tB21CjlNQEwdN0mKzv3sVHSss43r7U6fe4EPPxIBS
   wbTpgCb/m72rQkZBoVYNP+laLq2YWIgItpGYlU3NhkYICidU8HUTvPz9j
   OiZxDZigOKZzDpyV/PCephqjGphWcDaVrs53AXm3pOY1kaAi1irBNV4yx
   kKOCaOBEQWjIA+0RyKsnGE/SduXbKOT+YVM8mQw+bUP7gMHimhLIQbOrM
   EY5b45lb2SI0eL/88kqv9I90HjrC3M+MWnrTszAYg9HtbdUEvCvR0I3QQ
   w==;
X-CSE-ConnectionGUID: UaZHCSE5SXiRWfUAi1Ih0g==
X-CSE-MsgGUID: ZV2ckqt8QFGVS4kXRmGcfQ==
X-IPAS-Result: =?us-ascii?q?A0BmBABtltFq/5X/Ja1aHgEBCxIMggULg0xgQ0mTWQGCc?=
 =?us-ascii?q?J4fgX4PAQEBDzEgBAEBhQWOFwImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXJAVNgEYAS0wXESDAgGCdAO9CoIsgQGDKQGBVNs+FQWBM?=
 =?us-ascii?q?4VAiCN2hHwnGxuBcoR+iwgEgiJ6EpchSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3F?=
 =?us-ascii?q?RkEPm4HkhMegmUWRDUqBQGCJwWlcKEPCiiDdowilToaM6pvmQikWYRpgW8GL?=
 =?us-ascii?q?4FZcBWDIglKGQ/gficyAjsCBwIHDgMLkWotgU8BAQ?=
IronPort-Data: A9a23:HUV5ZqMxIJvBRHXvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp20TYOx
 zBOCm/UPPnbZTHyeN90bti+9kMF68OAmNZhTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68hnPmEdBqBFwdZ2O15Ay
 NUZcRENNh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEriemzb4eKJbRmQ+1noByTp
 Xvar13XLS8haN+v8z+q+XyV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:OVrr5az30aFkdct0FRcIKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:ZJ+iPG8AQGEwoJldxDGVv3MdKOAOSVCA90fRGXC2NE9oEZyVEVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A58o+cA9aSbP4Z6zS6dQ5jGuQf/VWua+tEVxdqLs?=
 =?us-ascii?q?phfLYNhxKPhiWgg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521967577"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:56 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id CABE518000301;
	Fri, 16 Oct 2026 03:20:56 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 73DF3CC1611; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 00/11] nginx: Security fixes
Date: Thu, 15 Oct 2026 20:20:45 -0700
Message-Id: <20261016032056.409095-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131026

From: Hetvi Thakar <hthakar@cisco.com>

This series backports the upstream nginx security fixes for the
following CVEs to nginx 1.28.3 and 1.29.7 in Wrynose:

- CVE-2026-40701
- CVE-2026-42934
- CVE-2026-42946
- CVE-2026-42945
- CVE-2026-9256
- CVE-2026-42055
- CVE-2026-48142
- CVE-2026-42533
- CVE-2026-56434

Each fix was selected from the upstream commits referenced by
the corresponding nginx security advisory.

The series also adds conditional CVE_STATUS entries for
CVE-2026-40460 and CVE-2026-60005. These are not applicable
when the HTTP/3 and slice modules, respectively, are disabled.
They remain reported as unpatched when those modules are enabled.

Validation performed:

 - The complete series applies cleanly to the Wrynose branch.
 - bitbake nginx -c patch -f completed successfully.
 - bitbake core-image-minimal completed successfully.

Hetvi Thakar (11):
  nginx: Fix CVE-2026-40701
  nginx: fix CVE-2026-42934
  nginx: fix CVE-2026-42946
  nginx: fix CVE-2026-42945
  nginx: fix CVE-2026-9256
  nginx: fix CVE-2026-42055
  nginx: fix CVE-2026-48142
  nginx: fix CVE-2026-42533
  nginx: fix CVE-2026-56434
  nginx: Ignore CVE-2026-40460
  nginx: Ignore CVE-2026-60005

 .../nginx/files/CVE-2026-40701.patch          |  74 ++
 .../nginx/files/CVE-2026-42533_p1.patch       | 127 +++
 .../nginx/files/CVE-2026-42533_p2.patch       | 381 +++++++++
 .../nginx/files/CVE-2026-42533_p3.patch       | 704 +++++++++++++++++
 .../nginx/files/CVE-2026-42533_p5.patch       | 254 ++++++
 .../nginx/files/CVE-2026-42934.patch          |  80 ++
 .../nginx/files/CVE-2026-42945.patch          |  47 ++
 .../nginx/files/CVE-2026-42946_p1.patch       |  47 ++
 .../nginx/files/CVE-2026-42946_p2.patch       |  92 +++
 .../nginx/files/CVE-2026-48142.patch          |  42 +
 .../nginx/files/CVE-2026-56434.patch          |  71 ++
 .../nginx/files/CVE-2026-9256.patch           |  77 ++
 .../nginx/nginx-1.28.3/CVE-2026-42055.patch   | 108 +++
 .../nginx-1.28.3/CVE-2026-42533_p4.patch      | 587 ++++++++++++++
 .../nginx/nginx-1.29.7/CVE-2026-42055.patch   | 188 +++++
 .../nginx-1.29.7/CVE-2026-42533_p4.patch      | 723 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  19 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  19 +
 18 files changed, 3640 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch

-- 
2.35.6


