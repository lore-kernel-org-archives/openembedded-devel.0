Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE34C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 09:28:34 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.web11.4641.1684920507744594284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 02:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Fy7lOLi6;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=821; q=dns/txt; s=iport;
  t=1684920507; x=1686130107;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=98Hf33AVKw1HylT4yiJSGjX9oXrmGmAy+FYBpyW90No=;
  b=Fy7lOLi6Z47erAWd/jwhW3HswScgj7m0TwMsk0hq+pDvHA3mGyjO091+
   xQaiG6K8thN4I/PVwzoMOX6TwXypXsLAsJSAIlsH//lszjJ3BWPZrqLs3
   JgMCETymYAxikRXZm0pAjE48orsawBG/4YDNWGxLCWA2UnDFWme/d9IAQ
   4=;
X-IPAS-Result: =?us-ascii?q?A0AjAQDn121kmJtdJa1agliDJFVAR7NyFIERA1YPAQEBD?=
 =?us-ascii?q?QEBMRMEAQGKYgIlNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBA?=
 =?us-ascii?q?QEBAQEBHhkFDhAnhWgNhj0BgVNEgn4BglwDrG6CLIEBhHWaa4FogUKMFIVKJ?=
 =?us-ascii?q?xuBSUSEfoQqZ4V1BI8pjR+BMHKBIz9pgQICCQIRZ4EOCGaBc0ACDWQLC2yBO?=
 =?us-ascii?q?4MGAgIRQgwVXQJqGhABEwMHBAKBDhAxBwQ3LAYJHTUtBl0HGRYkCRMVUweEK?=
 =?us-ascii?q?wMKCmoDCQMHBUlAAwsYDVARLDUUHwYmIIEJGGMEggRPnT6DAIEOgi86pBegI?=
 =?us-ascii?q?4QRi3mVBBozhVWjey6XXqNahC8CBAYFAhaBYzqBWzMaCBsVgyIJSRkPjjmCN?=
 =?us-ascii?q?pE+JDE7AgcLAQEDCYtGAQE?=
IronPort-Data: A9a23:Qs0EKqhqZu3UhnLGTzY59bE8X161ExAKZh0ujC45NGQN5FlHY01je
 htvUT/XbPnbazDwc9x3bY2woxtV756Gn98xSVBkqSoxQixjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKkYAL/En43HVcMpBsJ00o5wLZk2NIw2LBVPivU0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq
 0kv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOjzAazhHe3JrXO9IGNgBXshK4kux02
 cVTkcKZYisjMqTDzbF1vxlwS0mSPIVc87PBZHO4q8HWkwvNcmDnxLNlC0Re0Y8wo7ksRzoRs
 61DbmlQM3hvhMruqF6/YuV+j8skNtTqFIgeoXpnizreCJ7KRLidGfmSuo4Ah1/cgOhJBvWEf
 O4/QgBeMjPGWj1JalZMIpExybLAan7XKm0E9w39SbAMy2/LwQp81bLgPNbYdpmGSNtYmm6cp
 3na5CL+GhwcOdmVxDaJ/37qgfXA9R4XQ6oIH7G+s/VtmlDWmioYCQYdUh2wpvzRZlOCt8x3M
 RNT+hMJnKUO8V27UP2jdjaUqnKNsUtJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrHFTGM
 XfUx7vU6SxTXK69Ei3Cq+/Fxd+mEW1Ecj9YPH5soR4tuoG7+OkOYgTzosGP+ZNZY/XvEj32h
 juNtiV72/MYjNUA0OOw+lWvb9OQSnrhEFZdCub/BzLNAuZFiGiNPNHABb/ztqwoEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AA/Q8l/qWrxoif7LOi8BQ2Swm80ba7onhe0P
 ifuVf95v/e/wVPzN/YsOtLtYyjU5fm7RbwJqcw4nvIXMsQuK2drDQllZFWb2Cj2gVMwnKQkU
 ap3gu7yZUv2/Z9PlWLsL89EiOdD7nlnmQv7G8uhpzz5iuX2WZJgYepfWLd4RrpnvPrsTcS82
 4s3CvZmPD0ADbShO3CLoNF7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:0PE6YK1ZhKNk5ikaPzGShgqjBKckLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vfK/mKIVybygabvp
 0QFpRDNA==
X-Talos-CUID: =?us-ascii?q?9a23=3ARAwybmu3r/v3VP5yWKQDkYoc6Is/LTrd9VDhLnO?=
 =?us-ascii?q?9GHZ3bOO8YnOa9Kprxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AVMrraA6uD7Brjblt+LeTpy1Jxoxv+Kf0E2Qruq8?=
 =?us-ascii?q?35e6CDAx2azbGpje4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,188,1681171200"; 
   d="scan'208";a="62407903"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 24 May 2023 09:28:26 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 34O9SPdu006861
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 09:28:26 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 8CD98CC1293; Wed, 24 May 2023 02:28:25 -0700 (PDT)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: return do_configure dependency
Date: Wed, 24 May 2023 02:28:24 -0700
Message-Id: <20230524092824.848838-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 09:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102775

return do_configure dependency that was removed
by (3de33c7ecc99 "bpftool: Fix externalsrc support")

do_configure and do_populate_lic runs independently
and do_configure require prepared kernel sources dir

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index d4286295c..bbfab47aa 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -22,6 +22,8 @@ EXTRA_OEMAKE = "\
 
 SECURITY_CFLAGS = ""
 
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
 COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.35.6


