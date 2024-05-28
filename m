Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A987C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.12849.1716860960454296928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nnDVmoHD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860961; x=1748396961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gYuHikKN8Iqe6Jmtroz6uZKSzI5SdqNyBmNr+bXGH8g=;
  b=nnDVmoHDpnrfA0sp+Kq4rG13/uX5uXqLpa+CASNt9SkZVuTBY0aiZRPa
   iO0Aiv4O/ymhhoCMBYuv+5ymhnjdjSXbAVAsIYjhc2R7Yi2qUkowl59Jm
   eHss5CYdR9yT16VWVhx42b4fl3RVqpXAXDiGc2F4BP2GCORYeXT6Ta9G+
   a67uBM1Q3l7/HF6FN9yNmFl39oWgbIwXSh/I2RVU4FSv3JS2DRKnI25Wu
   dW7KvwMG/MpSFnMEDB0ZnS9SYWTkFOGVxZOarEzOVZIXir7k8hGGZhlL3
   JGJZaH+mkYNNYdSZQl+4hZDptFORg5RyFEhjSZT/uunFz9R7+jz7LoK34
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="159728439"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="159728439"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F49CA1E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33D48D73CB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B045E2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D9EC1A000A;
	Tue, 28 May 2024 09:49:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/40] gsl: upgrade 2.7.1 -> 2.8
Date: Tue, 28 May 2024 09:47:48 +0800
Message-Id: <1716860901-863-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--3.990500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkwaoe6trQC0YY+
	d4I4WCpE2fhTe/jcT34TPWTBWYr2fCo+z0C9aqaDCtzGvPCy/m43l2plwgrtWCD1HdXyqDnEli+
	BaqMwTNo1gIHPPGxSe/+EMOr9fJmZL/tBTZzO5Q0D2WXLXdz+AVK6+0HOVoSoewyWG/HesOCem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUnmL+DsjKYrQ+0nUZnNKj+ARWl
	K72i6StVkAW6eCRyfAVlLAlmMEzcXvIP1TTF4GuJbrzzULEWLyKTd/U7XAIfTWp5FH2kEu27H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110544

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* updated multilarge TSQR method to store ||z_2|| and
  provide it to the user
* add routines for Hermite B-spline interpolation
* add Lebedev quadrature (gsl_integration_lebedev)
* major overhaul to the B-spline module to add
  new functionality

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/gsl/gsl_2.7.1.bb | 4 ----
 meta-oe/recipes-support/gsl/gsl_2.8.bb   | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_2.7.1.bb
 create mode 100644 meta-oe/recipes-support/gsl/gsl_2.8.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_2.7.1.bb b/meta-oe/recipes-support/gsl/gsl_2.7.1.bb
deleted file mode 100644
index a4dc1437e..000000000
--- a/meta-oe/recipes-support/gsl/gsl_2.7.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-SRC_URI[sha256sum] = "dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b"
diff --git a/meta-oe/recipes-support/gsl/gsl_2.8.bb b/meta-oe/recipes-support/gsl/gsl_2.8.bb
new file mode 100644
index 000000000..45c776112
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_2.8.bb
@@ -0,0 +1,4 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+SRC_URI[sha256sum] = "6a99eeed15632c6354895b1dd542ed5a855c0f15d9ad1326c6fe2b2c9e423190"
-- 
2.34.1


