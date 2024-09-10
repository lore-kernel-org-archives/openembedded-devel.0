Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC50EEDE99D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.18333.1725959008513585507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VUY/EEBo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959008; x=1757495008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DXgkG4qbc1TOYMqTraod6kALGIuymkB0NHcOCRz8Y78=;
  b=VUY/EEBo+0pc1bBC84Vjyj7MSCwc0IsOu2PQfJ8Ke1P1kU0oom5fKgFg
   asVRdUDMxtm3zL9Oh05n3LO8SQ8wS6oca17mkzkOntClNHYgbd9Ry1h1M
   1rH8+riH6uWyD8nat3PlprEgYgeFW7SCymHDqQ6Fh8tgvXyDjYHZb5QOB
   AyJ8BOQ8lAnrl6/7Ys5yI3DrBkYVICFzTc3It1iq651wXAYmfvOorwZs/
   cJaDMLmPZ9N+4H4wAraN2juFjfcN47ZZQjKg+HbaYZt+EyOjvE/2Q1iZE
   bvtPduiRSinOwSAJUCGRyG8n5uSLAaUzpBLKTV6OsFbm/oCPs8qPM4759
   Q==;
X-CSE-ConnectionGUID: VB6jeKt+SzCRDRqBpIFUyQ==
X-CSE-MsgGUID: rbP558/TQIGVdMUMiA2Rcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173293556"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173293556"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49C4BC68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83E29D969A
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FA1B6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C84D91A000B;
	Tue, 10 Sep 2024 17:03:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 13/42] libio-compress-perl: upgrade 2.212 -> 2.213
Date: Tue, 10 Sep 2024 17:02:41 +0800
Message-Id: <1725958990-5719-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.427800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy+WtdtaO3wUEOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrcKNUDRZWrzKvplpsu0bmARF1oRY+cw1dUkKxnNR2VnhMiTbIh0/OwkXao
	Apib+3NPhpIXSm1cdAHuWuaPp+R7VsUROVvAqc+R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112199

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.212.bb => libio-compress-perl_2.213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.212.bb => libio-compress-perl_2.213.bb} (93%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
similarity index 93%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
index ca04ffc8e..4e0a0be4f 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=254a3b5756814db98ee
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "687490dbf9c4be42c22a945c4601812be5f4d38a9836018148915ba9e0ea65b1"
+SRC_URI[sha256sum] = "ae4d01ae574e4568c5f2fb0573e74631e2720b71ad3bc5a3ffe9480f1cb9a851"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
-- 
2.34.1


