Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC4AC3A59F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.7590.1649744998153946807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 23:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ddljrbzP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649744996; i=@fujitsu.com;
	bh=FFNx8wQrRLtoz4ZHnxEB8c1PILq30Z/OKnLilLKjoQg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ddljrbzPTxlLDZoJZ3X2dysfyPMkmvHrKoxQTTSCnxH949CXNw2QNRTVEGbjb90mb
	 RwSN4/JAETK+1CwayWL9bSgv+1h0aNiV88IqcXs1b705uze5f+qm6mJdjPjnHvujKz
	 pnBkJKIo79kGEi0G45cebXKbYdkcKxE9npGr/dJwFIXU04Za+gNsYusDehVmy6UAOK
	 dR3UrIyrvqXybSvltIt/ftiiobcUOkityz5a3TEchHi0MESTc7RbWXAHqkCsVp+jh+
	 5riqnlpo2fFzFjht4+mFTlH5gEmIa1Jf5GoLnca+r7Q2VFfLV21A5VkVbipBhqaQba
	 kfIOkf9XFKchA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxRTdZJjT
  JYOICNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN96VL2gmccFcdbrzM2MPZydDFycQgJzGaS
  6P/4mxnC2cMo8X/jZrYuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQXsJK4df
  ARmswDFd3fPBevlFXCUuL3wMlhcQkBBYsrD92C9nAJOEv+f7QSrEQKqmfHtI1S9oMTJmU9YIO
  ZLSBx88YIZoldRYvblZhYIu0Ji1qw2pgmM/LOQtMxC0rKAkWkVo3VSUWZ6RkluYmaOrqGBga6
  hoamusQWQMtRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMy5RitfwdjH9X
  /tQ7xCjJwaQkymvAE5okxJeUn1KZkVicEV9UmpNafIhRhoNDSYLXQRIoJ1iUmp5akZaZA4wRm
  LQEB4+SCK+KFFCat7ggMbc4Mx0idYpRUUqcV1caKCEAksgozYNrg8XlJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvNUgU3gy80rgpr8CWswEtDh0WyDI4pJEhJRUAxPj9LPpJdLMU/5Wf1V
  NMPcLupHJHjcnil9ggvfWkA+S2lc//zHduCGgZOEln4LJJWbdL2V4p897ej2j/76d4C3e4Imq
  61+kP/Z8cDXjp+Sz0Hks0/if3VNKuRnENHNa8c8ohh3/ZKez7pT6NlU+28Pl2u2dStGWhx32b
  jzSe75G/Zv/vKy28JvHZfUeaewzvnlw78JP/m8fN7DO10s59P8N90yu5UaTF2j8Ef4S+0NkQd
  EuY+ev8zeypstKeOf3t/+3FZ/ra3dqV/K26fO/hPz+2XC53kTg03/ePVHGJlZXZh7fJ9x8aHd
  GV4QY68kd/BtD/WpyPogkLUos3Pn1zy2tnPuZJ+9OXykoZHKo8XuGEktxRqKhFnNRcSIATdfI
  c0YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1649744995!33477!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24440 invoked from network); 12 Apr 2022 06:29:55 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 06:29:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23C6Tn6A005657
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:29:55 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 07:29:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.5.0 -> 0.7.0
Date: Sat, 9 Apr 2022 21:26:20 +0800
Message-ID: <1649510782-4563-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
References: <1649510782-4563-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96562

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v0.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/libbpf/{libbpf_0.5.0.bb => libbpf_0.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.5.0.bb => libbpf_0.7.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
index 067f58b79d..461e6b05ed 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "5579664205e42194e1921d69d0839f660c801a4d"
+SRCREV = "2cd2d03f63242c048a896179398c68d2dbefe3d6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.25.1


