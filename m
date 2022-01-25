Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114AC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:19:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.6823.1643116758189764542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NwCqHrJZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116754; i=@fujitsu.com;
	bh=33q1kxlIs8KM9cti++EFc3aOBne4qZ+SYRRmUy/LZgg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NwCqHrJZEJUQBbchwocAvSIV51pfS4R2+zf9clQ6oBhWegcY+QOfj0PLPrGl3HKJq
	 pQL/4aPlP0JG1UZ0K5ATUYo+q2OaVkcQ0uH8vz9AYoVh4hy0ClFRs/kre9yZ5tzp2o
	 32/aCOQRvlhYMvImkr8rrJmfW5pRHD5e8OWFOP8oBcz6k4MK0Ba7CfecYWnPewirOd
	 kqa903DI6Dk5YgRlbh5RTeNUqEzjcdRYV1V47O56c61R5ysT0vv2oBNPbEIBgY+0yZ
	 So0vqkm++ioHUVdtWjAhacOzkJLOnT1c6ncsxCFBxNUroG+RPRo+tg7PMokcE1L6F4
	 INa0LnN5pHPhA==
Received: from [100.115.38.159] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id D5/19-12680-2D8FFE16;
 Tue, 25 Jan 2022 13:19:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MRonvpx/t
  EgxWbpS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oybByazFfQLVMxrnc/cwNjF18XIxSEkMJNJ
  4tDii4xdjJxAzglGifmt9iA2m4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYwgJ2Eg8vH
  GQCsVkEVCVm/J0LFucVcJQ4uK8BzJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eMEMUaMoMftyMw
  uEXSExa1Yb0wRG3llIWmYhaVnAyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2FLXyNBYL7FKN1E
  vtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMMhSitWv7mDcvOqn3iFGSQ4mJVHexHXv
  E4X4kvJTKjMSizPii0pzUosPMcpwcChJ8L79BpQTLEpNT61Iy8wBBjxMWoKDR0mE9zpImre4I
  DG3ODMdInWKUVFKnPf2d6CEAEgiozQPrg0WZZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCf
  OqgUzhycwrgZv+CmgxE9Di3+ffgSwuSURISTUwtXa/5lec68ipe8/hddCx1Q87lMTfHbAyM3l
  12EZfz2NqTKWc7fYzHE6djT8O+KjpPL9uNXmSfN5j5l6794dEVrRvthS+NXHdL+dZN6QlhWtm
  9aZc/6E1+/S+eZ+L54faLm2K2qVZ73TihsRipw09QZam02Ifb1X9OiO8ylH8Jld7mDev+Uv1j
  bb8RoVNqx79eiNcLKRb5K3wc0dDm97bVuVHqm5965+suLjQeNf9vUe+L7x8aH4lzx9dJTHRR2
  FzVx8xfqLEXNBzKXVC+pJL3Zy/dnD8ObSzq3t6UF3qcjHVWqYXrhodS6Yv3tuY2tZ7fk9W5rq
  bUtOk1+uYnFFqWa174tWdKOlq5pUatzLKlFiKMxINtZiLihMB/y/53S0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1643116754!9644!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20976 invoked from network); 25 Jan 2022 13:19:14 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:19:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20PDJEIL019496
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:19:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ddrescue: upgrade 1.25 -> 1.26
Date: Tue, 25 Jan 2022 21:19:01 +0800
Message-ID: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:19:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95061

License-Update: delete a space at the beginning of some comments

Changelog:
=========
* mapfile.cc (write_mapfile): Check all calls to fprintf.
* Show file name in all diagnostics with a file involved.
* rescuebook.cc (copy_block): Exit with status 1 on fatal errors.
* main_common.cc (getnum): Show option name and valid range if error.
* main.cc, ddrescuelog.cc: Remove synonyms '*-logfile', '--pause'.
* ddrescuelog.cc: New option '-F, --format'.
* command_mode.cc, io.cc, loggers.cc: Missing '#include <algorithm>'.
* ddrescue.texi: Improve description of algorithm.
* check.sh: A POSIX shell is required to run the tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.25.bb => ddrescue_1.26.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.25.bb => ddrescue_1.26.bb} (87%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb
similarity index 87%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb
index cf24354f2..165e7040f 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.25.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb
@@ -7,11 +7,11 @@ SECTION = "console"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://main_common.cc;beginline=5;endline=16;md5=3ec288b2676528cd2b069364e313016f"
+                    file://main_common.cc;beginline=5;endline=16;md5=ad099df052bdd8297f490712285069da \
+                    "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[md5sum] = "99fd7a28bf9953d88534c7ee9ab5bd2a"
-SRC_URI[sha256sum] = "ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063"
+SRC_URI[sha256sum] = "e513cd3a90d9810dfdd91197d40aa40f6df01597bfb5ecfdfb205de1127c551f"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.25.1


