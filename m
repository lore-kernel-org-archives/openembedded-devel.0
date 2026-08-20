Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6454DC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:06:38 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3245.1787216795228209854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=diqojtBd;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1135; q=dns/txt;
  s=iport01; t=1787216795; x=1788426395;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h3hwN/eAoc/TQ08Jx9IqZ+Xh12mx4YMOfUuBrfgNxuk=;
  b=diqojtBdinf8xHHg6dl5hQji9wf4fa49X8hMw6UsR80wfhpV7UjrOMtu
   u0Qhh+gY1tYIjfP9jnf0k1feGzpdKVySqsh2Kj+gZoZjvxrccduVsojp2
   d3q1RFgLzlWjHu5rWtpT8dhiMUFHq5VfvVGVcD9jqDERs9KuCa1ZCEr4b
   4JbMheALlfqCjmli6U8IFntjVna1g3wQzksh4/im3MAofQQMlRAqoyFc+
   qTrih8EcZe4E4bo/5PyfktdckBld+18i21Zg4qEUUI/y6IprRhXf562bT
   YJMrlOhMnjN8NRhW5jP5cL7IQJmSSdjnKBlqhzzMGxfASzP/IqTN1lcZY
   Q==;
X-CSE-ConnectionGUID: F2hP6ONAR6e3xhvMj/qNew==
X-CSE-MsgGUID: puyKpd96TbWTv3owgRrefQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/40QJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhD9GjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBRjBRC0SDAgGCOgM3AxHCMoIsgQGEfdhLDYJYAQsUAQWBM?=
 =?us-ascii?q?4U/gn+FI4VyJxsbgXKEfoIfQgKCLYV4BIMugXKRWEiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCc?=
 =?us-ascii?q?IIGAgFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCS4EOLKYBgiGgHnEKKIN2jCGPP?=
 =?us-ascii?q?oV8GjOEBKZoLphaglmLMYQJkkeEaYFoPIFZcBWDIglKGQ+SI8w5JzICOwIHA?=
 =?us-ascii?q?gcOAwuTZgEB?=
IronPort-Data: A9a23:/H7WcKMRSSvSEArvrR30lsFynXyQoLVcMsEvi/4bfWQNrUomgmYEm
 jQdX2iObKrYMWL0fYoibo/kpxwBup7cnNRmSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69s0DHloGqsxwLh6WnFO6
 9kabykrYw/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY2BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5Fwoi+GzaYSNJbRmQ+1Ng1e7v
 m6XoVjzPS0Eb9uAxgCf/3yV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXIIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:h92Sv6z0I9JL0VZM8igEKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3Az0mjo2ntP+/ocpNmHaLT31jFHsrXOVOHzE+OBGm?=
 =?us-ascii?q?RMzhkE62VV3qSv7pCntU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AVgl19w+Dz71uATdpU3WeBaaQf9918oe2BBFTrZ8?=
 =?us-ascii?q?5h9ffMjN/AS2Qgg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813161607"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:06:17 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 88CD9180004A8;
	Thu, 20 Aug 2026 09:06:17 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 28885CC12A6; Thu, 20 Aug 2026 02:06:17 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH] rsyslog: add CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:06:17 -0700
Message-Id: <20260820090617.58479-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129383

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 42761ba945ea3eb4bb8f3525871edcfd990dadff)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
index c5bd9be5bb..8ba0e4879f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] = "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_PRODUCT = "rsyslog:rsyslog"
+
 CVE_STATUS[CVE-2015-3243] = "backported-patch: The shipped default rsyslog.conf contains the fix"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
-- 
2.35.6

