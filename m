Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36198.1795584012984460143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WxMae9t2;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3006; q=dns/txt;
  s=iport01; t=1795584013; x=1796793613;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pVihpLdEx/5b9uGfSZe42hkVmXKArWJUhEw4443MMYY=;
  b=WxMae9t2xJq4DgLQ3XRKuIc5KL+rDiSeuMSiukwle4B8q2XlaFwSnVD/
   ClujzrEVImYt6GOmqpgU/h8nA5a29yUIUmirNZM3LltYHmwKTSJ3PlWyF
   rH7oV5wfemtXndEx7uT9CgLVkixzy3rS2yVMYJpjBVLtdQMk2LRFjjOKG
   7BVn/Cq+2wDWPBHEZrLl7Cd5vFtHtuqe9miDCEfCpcVCiL2BMP74iyP1o
   5v8VzzK+buNzhTfWZKPG5wPN/mf3juF1ADSqKgJgrVl09dGRf6j7hapqO
   DhXAAX5/n+xHPNu6za90L2XnrPJp+E4xlvk3GdBfWp62fTG8PwrQ1pyUj
   A==;
X-CSE-ConnectionGUID: COFZpeyCQFWwrBHodFTknA==
X-CSE-MsgGUID: SGMxC1P1QzCYge69xSZrcQ==
X-IPAS-Result: =?us-ascii?q?A0A5AAAGbgZr/8pK/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?0thQkkDjG+HOIIhniyBfg8BAQEPRA0EAQGEP45qAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZBLARgBG0JcRIMCAYJ0AgERugGCL?=
 =?us-ascii?q?IEBgykBgVTbPxWBOAGFQYgldoR+JxsbgXKBFYNqgQWBXAKBJypchXkEgiJ6E?=
 =?us-ascii?q?o5ngUuIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeUE4IpRS0BPFIKIQSBF1I/GKVdoREKKIN5jCSVOhozqnKZCI4Kl?=
 =?us-ascii?q?lGEaoFoPIFZcBWDIglKGQ+OOYNrzlsjNQIMLwEBBwIHDgMLgWiQAAImgVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:IG/ZAK2iJtCdzAaB0/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bpz1Wx
 zBJCjjSOvffZDDyL94iPd7l8xxTsMfSn9BiSgdv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ2YYD5UV681OL15R7
 9Y4LzwjUhOFrrfjqF67YrEEasULJcTxeYdasXZ6wHSBVLAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NE6ojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjuCzaYqJJoTiqcN9pWm9t
 kmfxz3AEDorO9HBmCq+wGinv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:f+hGCKzSvXlCilWVbYrYKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:e6eN/mwNJG1na4gzQ2fgBgU/Pe4XanDM507+HFCiI0ZuRJOpSlm5rfY=
X-Talos-MUID: 9a23:TcVSjwkl4it8o4MSRR9MdnpZG+J4yP2WUXkfuqQJtpfVJRdCITyk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60618440"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:11 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id B78B579506
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6B889CC1634; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 00/10] python3-aiohttp: fix CVEs (2026-11-25)
Date: Tue, 24 Nov 2026 21:19:56 -0800
Message-Id: <20261125052006.3116497-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132976
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport the upstream security fixes for python3-aiohttp on Wrynose
without upgrading the package or its dependencies.

The series carries the CVE-2026-123817 fragment-retention fix and
the fixes for CVE-2026-128124 through CVE-2026-128129 and
CVE-2026-128132. They address domain matching, cookie and form limits,
multipart base64 reads, and WebSocket size limits and flow control.

The existing CVE-2026-54273_p2.patch already backports the fix that
upstream identifies for CVE-2026-128130 [1]. Patch 10 adds the second
CVE ID to that patch's metadata so cve-check credits the existing fix;
no second source patch is needed.

CVE-2026-128131 concerns concatenated-member decompression code absent
from the current sources and recipe patches. Patch 8 records this with
not-applicable-config, which maps to vulnerableCodeNotPresent.

[1] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-28qf-cpwq-vmc2

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

Ashishkumar Parmar (10):
  python3-aiohttp: fix CVE-2026-123817
  python3-aiohttp: fix CVE-2026-128124
  python3-aiohttp: fix CVE-2026-128125
  python3-aiohttp: fix CVE-2026-128126
  python3-aiohttp: fix CVE-2026-128127
  python3-aiohttp: fix CVE-2026-128128
  python3-aiohttp: fix CVE-2026-128129
  python3-aiohttp: ignore CVE-2026-128131
  python3-aiohttp: fix CVE-2026-128132
  python3-aiohttp: mark CVE-2026-128130 patched

 .../python3-aiohttp/CVE-2026-123817_p1.patch  |  120 +
 .../python3-aiohttp/CVE-2026-123817_p2.patch  |  317 ++
 .../python3-aiohttp/CVE-2026-128124.patch     |  118 +
 .../python3-aiohttp/CVE-2026-128125.patch     | 3115 +++++++++++++++++
 .../python3-aiohttp/CVE-2026-128126.patch     |  599 ++++
 .../python3-aiohttp/CVE-2026-128127.patch     |  291 ++
 .../python3-aiohttp/CVE-2026-128128.patch     |  206 ++
 .../python3-aiohttp/CVE-2026-128129.patch     |  677 ++++
 .../python3-aiohttp/CVE-2026-128132.patch     | 1242 +++++++
 .../python3-aiohttp/CVE-2026-54273_p2.patch   |    2 +-
 .../python/python3-aiohttp_3.13.5.bb          |   17 +
 11 files changed, 6703 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-123817_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128124.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128125.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128126.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128127.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128128.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128129.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128132.patch

-- 
2.35.6

