Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02A6C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:23:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.3207.1663064594071755455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=laju7gat;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064592; i=@fujitsu.com;
	bh=LsPvtEHqT9d5aDghKPBJp68orf1iuOboysu+uS8Z0Bo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=laju7gat73nlcwOVvD91VyFd4nfm84hBJGdSnfbU4ArNY9GpAWqlIXVuXbLSTU27/
	 3kRWNDMzBLBpfBfnk0rRrfpabDFJkSua+Qfty+Ipt1UAPzTrVNrD3aUgbth9TBJ2gH
	 cfxAOj1tZC8LF+LoFeilT2O9MTCsRVbO8signT/9jUSo3++cPaXGS9K7wW/J3nSrap
	 dmvLdYHabKhVuR+zLbaZfR9zpnMn7Y0XgsoXk70DYfoxMTLyYNGPfQgvq0wCpx8U5t
	 sEeUeT5IOM20oE5F9w/MEG+LKu+n36LOGYKaQ1e/tXDmnjThJq6VNE8q/v2Ryx1+/B
	 FCQQHqwARIScQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSVcgSiH
  ZYNFxHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP9suXMBQ+5Ko5M2MTWwPiWs4uRi0NI4Amj
  RO/0XhYI5zqTxLrlN9ghnD2MEh1b7wM5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DV
  MPBISzgK3F3YylImEVAVWLjpBtMIDavgKPE8gk9YOUSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +gahQlZl9uZoGwKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TU20jU00Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzKlGIFvh2M
  zat+6h1ilORgUhLljfRSSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZsdAZQTLEpNT61Iy8wBR
  ghMWoKDR0mEdzNImre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rwzvYGKBECKMkrz4EbAov
  USo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeiTCgKTyZeSVwm14BHcEEdISRtTzIESWJCCm
  pBqYMPrnypB/VFVLub84v73R4KGQkGvs0JE3izJPoSdLrHKrYH+5sPv3sZmRzRAbv0Ymr2haq
  pZ7cIe449wPbEX9LwdlPxT76/ReS+XV+p5Ufe2rNeQnVOcs97/9cuCD/nKtxhGjljN91sWtyT
  3q7ZNVNYnsWb2ffrys/vat2+YIX98332k2d3V93Qf/uBc8DB9yn1VzqkX52PKhpspjUZ2PHHR
  ++Xptb+n99xo0JhwSn3fGVkYueHnO2XHHJ+Ya24omqATUHajadmxxZl8Z87PuDXTf38F6RKdZ
  2/zqHvav06MyTO2wjZ4d76ohITml6dMt0drejdcD+iurW76tlI47u/hw4QyCS3UPLjPc2m7sS
  S3FGoqEWc1FxIgALst68UQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1663064592!146152!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3159 invoked from network); 13 Sep 2022 10:23:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:23:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E3C831000E7
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:23:11 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D7124100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:23:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:23:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.0.3 -> 2.0.4
Date: Tue, 13 Sep 2022 18:23:01 +0800
Message-ID: <1663064581-3376-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:23:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98785

Changelog:
==========
 Add use_location_hints argument to document API for giving the option of ignoring XSI schema locations hints
 Fix import from locations hints with namespace mismatch (issue #324)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.0.3.bb => python3-xmlschema_2.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.0.3.bb => python3-xmlschema_2.0.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb
index 5c1c60f601..abc7c8a5d7 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "adef8cb1e6572fe095b56ae4243b3618f842b32adba98e1b1bab0bd014f2234e"
+SRC_URI[sha256sum] = "00d34f97c761c191c20e822899c490930d2c4c9ea6cc7e98f25360fde498f1ab"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


