Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30043.1793869213943589263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NBfHYeIU;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1473; q=dns/txt;
  s=iport01; t=1793869214; x=1795078814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=N6jH9e83XM2LeP3T5D1Qwnx0wKqPsJBDTIGGQa+byZU=;
  b=NBfHYeIU0rPHF2YL4Agbe/2jcKbnY3sFt9GE9OAnpGW2QH5eczHsIMov
   TeHB4UbTRGh6mkp31fjyLWPF1lLtp6QDJI0JXG7/+U9nZhaa/vafruaGW
   Zb/lE18/m34kyq7e7Klv94O+MDYEBIWZnZRXRHojax8fonRHhCcDOvRuV
   AnY2kgUYeWoaDjKz2VfUxoIWZPId4YrBkKkJL1s7kNILBZgOCLNKgfQVA
   1PvUiSgIY8uLvDouZ85eVsRDEqQq4jKr62ir006LzHuEzerfF6je83bTN
   +COrZ4oC5qp7KqlkUJESOFM5uyCLtSFioIxYny/hLwrHYm+gk3sJqUXvm
   w==;
X-CSE-ConnectionGUID: 6ITYC+HsS2aZ6MtUW59pvg==
X-CSE-MsgGUID: j4ehkCqrT4GCOVhthC6nAw==
X-IPAS-Result: =?us-ascii?q?A0D+AgBHRexq/4r/Ja1aglmCV3VgQ0kDlCeCIQOeIYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEwIBAzIBGAE9IDErHQENGYMCAYJ0AxG8MYIsgQGDKQGBV?=
 =?us-ascii?q?NszAQsUAYE4hUCII3UBhH0nGxuBcoEVg2mBBYFcAoE4dYV5BIIigQyBeIx6i?=
 =?us-ascii?q?EVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BK?=
 =?us-ascii?q?yheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?AsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRgQ4sBIIoB?=
 =?us-ascii?q?ZMHkmqhEQoog3iKFIIQlToaM6pxC5h9jgqWUYRpgW8NKIFZcBWDIglKGQ+OO?=
 =?us-ascii?q?YNrzlsmMgIJAy8BAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:J9Mp4KO9LGRXEJTvrR31lsFynXyQoLVcMsEvi/4bfWQNrUog1WZWz
 DAZUDqFa/iNYzaheY0kPYux809T78WDzt4ySXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66tPMHAdfq0Dwbx+Mz9r6
 cEndWEVcB/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEtjOa0bICLJrRmQ+1XwkuYp
 Unf5VilLTo9CtyDyRHb9Fuz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMEBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Or+nQK18AVXeW297ITcweQqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:qulvuWOLhBGysO5DBghbxWVXOtseKHTvklLMHnDlWH53R+jA
X-Talos-MUID: 9a23:o642LgiFu8t6Ep76lHPC1sMpNptl46eFEVoxzbotnPeEKSxbZTG0k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544614264"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:00:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 91466180001D0
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id A7379CBEF72; Thu,  5 Nov 2026 01:00:07 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 16/18] python3-virtualenv: Ignore CVE-2026-102937
Date: Thu,  5 Nov 2026 01:00:05 -0800
Message-Id: <20261105090007.351866-17-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105090007.351866-1-hthakar@cisco.com>
References: <20261105090007.351866-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131898
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- The advisory [1] describes command injection when Windows cmd.exe
  executes a generated activate.bat file.
- BatchActivator.supports() rejects Linux interpreters, so the Linux
  CLI does not select this activator.
- Limit the status to Linux TARGET_OS values. Leave other platforms,
  including MinGW SDK builds, unexcluded.
- The upstream fix is [2]; no backport is needed for Linux activation.

Reference:
[1] https://github.com/pypa/virtualenv/security/advisories/GHSA-x78j-v8h9-3j2q
[2] https://github.com/pypa/virtualenv/commit/d721ff140ce4afdc2a9b76751e4584e25d9fbea6

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../recipes-devtools/python/python3-virtualenv_21.2.1.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
index adeff3939a..1a8091adcc 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
@@ -52,3 +52,6 @@ RDEPENDS:${PN} += " \
 "
 
 CVE_PRODUCT = "virtualenv"
+
+# The batch activator only supports Windows interpreters.
+CVE_STATUS[CVE-2026-102937] = "${@'not-applicable-platform: Windows cmd.exe batch activation is not selected for Linux interpreters' if (d.getVar('TARGET_OS') or '').startswith('linux') else ''}"
-- 
2.35.6

