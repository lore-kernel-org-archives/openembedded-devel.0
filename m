Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FA0C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:05:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.62135.1638198305143418946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fiauPYSt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198303; i=@fujitsu.com;
	bh=XiQ9yJUio5ukR1tdD23ZP/dAatUWOZHKTmnj7lumHTY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fiauPYStLtCrzfCmf86Y8xgSU1dBx6oH3rJm/sLDltn4h+5hH2NhCn1V/aaivoziP
	 pY2Kdjwhwubu1yJYBVpPBTlyk329DMCmXJCXiaW51E0p8YLLOM/EYlT3NrG5zhUfES
	 eg6TVZDq5ueQPQABz4zIL9JssHgyMU27Zql1/c4CbmsJkJuaf/VLfTuP3R3C5mrScr
	 JhgJLnB3x+56euGn/YMyhvA61u6rIswFddvSVOFfdRD46vjYInyXHMMfG5i9h0DifB
	 odo9/CaVYuBxP+GhXL9jBBBjOvhCZ7IHurcRDRth/8Y/oL0GaAtrA7SXnyo9bJFjLQ
	 Dp9Q1EHwOekfQ==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id DD/46-12056-F1CE4A16;
 Mon, 29 Nov 2021 15:05:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxRVfuzZJ
  Eg63LjSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrP/vZCm4KVSzo/sXcwHhUoIuRi0NIYCaT
  xJZl69i7GDmBnBOMEhtXi4DYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA1YvLOAt0fzwC
  lMXIwcHi4CqxNE+N5Awr4CzxOkjq8BaJQQUJKY8fM8MEReUODnzCQvEGAmJgy9eMEPUKErMvt
  zMAmFXSMya1cY0gZF3FpKWWUhaFjAyrWK0TCrKTM8oyU3MzNE1NDDQNTQ01TXWNbTQS6zSTdR
  LLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDK+UYmahHYzr+37qHWKU5GBSEuXNWrIk
  UYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb/8roJxgUWp6akVaZg4w1GHSEhw8SiK8xS+A0rzFB
  Ym5xZnpEKlTjLocB28uWcQsxJKXn5cqJc57EmSGAEhRRmke3AhY3F1ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMx7G2QKT2ZeCdymV0BHMAEd8XbpYpAjShIRUlINTNMCAhVD5MLYZ/Mkztq
  fw3hjmf8UyajU3HTJnVcXL/r+KH2B1s60sm/Pkm/Mmn3dXfHFD81X67T0J6yeJv5ir45oDsup
  XJ0Y79OSbS8370q/+Thg2sM7k4qu9qRJxsgfFZBTi1JRYGuo7ih7qddRFOixJrg0eIHX5ui5t
  rH3F/DmLb0gd662/uCTXSX/p/Y8mLT1FIPwRsNwj/CZVnZ/4tcYhq3cKN21f31vdYjYxeDX34
  tOP2ybcKcreLFMYOg/ERXdE9v/yIlvUprrzBwdMPfXHHHho0WO/17oeplmrivNe5vSX7qo5pj
  03Yjyuxu6v7YaXN57MVt6W3mAUH7mIq3OTSxcb2e6eEdfuGSdr8RSnJFoqMVcVJwIAD3FJT42
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1638198302!239168!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13253 invoked from network); 29 Nov 2021 15:05:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:05:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1ATF4v3E030174
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:05:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:04:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] pure-ftpd: upgrade 1.0.49 -> 1.0.50
Date: Mon, 29 Nov 2021 23:04:44 +0800
Message-ID: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 15:05:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94135

License-Update: year updated to 2021.

Changelog
==========
This version fixes some really old issues, the most significant one being
excessive memory use for large memory listings.

When virtual quotas were used, transfers were not aborted after the limit was
reached; files were only removed at the end of a transfer. That should now be fixed.

Support for MD5, SHA1 and the MySQL PASSWORD() function were removed for
password hashing. You should now use scrypt, argon2 or the system crypt(3) function.

The server used to reject class E reserved network ranges. People reported that
Linux containers may use them, so this is now accepted.

Finally, it is now possible to recursively include additional files in a
configuration file, with the new Include directive.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pure-ftpd/{pure-ftpd_1.0.49.bb => pure-ftpd_1.0.50.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.49.bb => pure-ftpd_1.0.50.bb} (77%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
similarity index 77%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
index 5a8e9c1305..e29d0633ad 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.49.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e25e28bc568d70eb26c3a91387c86ccb"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a4496a14dea009df36c612707d455d02"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,8 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[md5sum] = "451879495ba61c1d7dcfca8dd231119f"
-SRC_URI[sha256sum] = "767bf458c70b24f80c0bb7a1bbc89823399e75a0a7da141d30051a2b8cc892a5"
+SRC_URI[sha256sum] = "abe2f94eb40b330d4dc22b159991f44e5e515212f8e887049dccdef266d0ea23"
 
 inherit autotools
 
-- 
2.25.1


