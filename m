Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3285.1794374984723547537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QVBN91Ht;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1465; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYZ0UsHq9RpWo8M2PZfs2Hdc+FTUR3kxD7Ympo6//SQ=;
  b=QVBN91HtE9XzZ3rA8hMHQ+9aO5fE6I/ub4lak+p+BaflAiezU0/64FQD
   /I5FTGhILNw223q+e0yhqjUyvT4MWNMVOjE+yAc6kYN5bZy0TJ+ruyKCP
   htBQue+K0KO/kLomhdMbg3PYn47ct9BnFRW015xO9zvZjZbOO/4rJ7el7
   N4OV17p4JS4igw9mm6MzyARJS56RzCwWh97r09SKWh99Cjfqo/iL8DTfu
   2zyquLe3UxyqW5hD1kf0NA7rC+CWX3N3ssFLyjzL03BAb0KeTK+vLXa/n
   Lbhw4J5Cmnb0rpkP0Tnuf6GjKn0HEy977iwt/4hFGmmuAkN5nnswuWvGw
   A==;
X-CSE-ConnectionGUID: LtnjLtckQRyHN7+RzjkikA==
X-CSE-MsgGUID: qULbkYrwSJiqweq7pNuirA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDP+/Nq/4r/Ja1aglmCV3VgQ0kDlVxvgROdD4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEwIBAzIBGAEtECAxKx0BDRmDAgGCdAMRuVaCLIEBgykBP?=
 =?us-ascii?q?wJDUNszAQsUAYE4hUKIJHUBhH0nGxuBcoEVgnN2gQWBXAEBgi2FVyIEgiKBD?=
 =?us-ascii?q?IJjjBGIdkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEcgR6BE?=
 =?us-ascii?q?oEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSboMVg?=
 =?us-ascii?q?Q4sBFCBWJNJki2hEQoog3iMJJU6GjOqcguYfY4KllGEaoFoPIFHCwdwFYMiC?=
 =?us-ascii?q?UoZD44vCguDYIF/zFwmMgIMLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:DJaMaauvbqTiWJByXqEQB7JDMefnVAZfMUV32f8akzHdYApBsoF/q
 tZmKT/UMqyDYGKkLttybY+y/B5UuMLQxoc2QQA6/CE3Rn8VgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3vpxA0VS/
 v8hEiEtSE/AvfC0w7O4Y7w57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWGp0MwRzH+
 Aoq+UzgPzUQN+2F1gGn82uzi/aQhQXmWZg7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:FHUnHqNjwCUU3sBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:HmMYdGFv+nZgBMZDqmJD6EgWPtwucUTn3Vf2fAyCG2RqSb68HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AccxqCQ4EMzhrWsSSOFHfmYjnxoxx3oCkC3EXjq4?=
 =?us-ascii?q?kutCbODUvIxGAjS6eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="547017276"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 632FD180001DC;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C26F1CBEF8A; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 7/9] python3-filelock: ignore CVE-2026-112907
Date: Tue, 10 Nov 2026 21:29:36 -0800
Message-Id: <20261111052938.3691463-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132119
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The upstream advisory describes a Windows-only denial of service
  caused by an unanswered oplock on a soft-lock marker. [1][2]
- Marker reads and stale-marker removal can exceed the acquisition
  timeout, including in asynchronous and fallback locks on Windows. [1]
- The Wrynose Linux target does not use the affected Windows oplock
  operations. [1][2]
- Mark the CVE as not applicable to the Linux target platform.

Reference:
[1] https://github.com/tox-dev/filelock/security/advisories/GHSA-567q-5qvw-pf92
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-112907

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 6f52b19272..814fd59eb3 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 CVE_PRODUCT = "tox-dev:filelock"
 
+CVE_STATUS[CVE-2026-112907] = "not-applicable-platform: Windows oplock handling is not used on Linux"
+
 SRC_URI += " file://run-ptest \
     file://CVE-2026-112939.patch \
     file://CVE-2026-112935_p1.patch \
-- 
2.35.6
