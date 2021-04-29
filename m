Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.3096.1619678210197397193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dhgj6828;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678208; i=@fujitsu.com;
	bh=px8nYB1cm5h05nHxdeszT2twIE2EbPq1f+E2hO1BN8E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Dhgj6828TAo1SSnE9gG3qIxvQY1lv4SlXUS99qDY+HeFzMD8YDr29r/1Rr1akRjV2
	 qiO0s3uaGeuAw4K3136PYdZEiPh1pgLOfekuHC33Z8oTNjbw9OMh+pANb0mEIuaf+S
	 aumZMhTiPwKkZwbWhKJrP2USm1FSpFM4q6gabY8b0oWvKCKN/R6kJPimmF3s6DNkEF
	 C4gKmV6Pg1Wr/2M9v6PKr0a3p6i3kAoZgU65dm0loqkpamfjD1Lv0FH/TZzLU3aysA
	 +hKrYGtj7+30ab7xtOT2ENZ7Rnv7umtzOrI1u2h1vCujGHpa5XBll9nBj+liu9+dUi
	 a+4JXwLT3QqdQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 33/B2-33844-0045A806; Thu, 29 Apr 2021 06:36:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0WUI6Uo
  w+P2L0+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzeg99Iy1oJu34umlzAbGe9xdjJwcQgKzmSR+
  vy3vYuQCso8zSszd284EkmAT0JHoeNHNAmKLCOhLLJ29hxnEFhbwlnjbMQ8sziKgKnH41GZ2E
  JtXwE1ifeNeMFtCQEFiysP3zBBxQYmTM5+A1TMLSEgcfPGCGaJGUWL7zjMsEHalxPZpZxknMP
  LMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuqa6RsYWeolVukl6qaW6yal5JUWJQFm
  9xPJiveLK3OScFL281JJNjMAwSilkfbeD8dnrD3qHGCU5mJREebd0diYI8SXlp1RmJBZnxBeV
  5qQWH2KU4eBQkuAtDe5KEBIsSk1PrUjLzAGGNExagoNHSYQ3NgAozVtckJhbnJkOkTrFqCglz
  isI0icAksgozYNrg8XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvAEgU3gy80rgpr8CWs
  wEtHjZ+TaQxSWJCCmpBqYdnaYnl69eWvvomqVHRhufyx8/przNt5yd93guPHbwZDrD9FeLJc5
  VfOc/FuGfV6N29r2t5bHoXptyubjLrhqzctIvNgfu94j7uMnyvYS6zQYWBdXZIW9W10rOc7Ge
  2Bq94WhwdCS7u0RUWlrTyw2CO7htPDZs+Wm46vzS6b+znroZ/xdi5Pq+P2HBm1ezZb3unj3+I
  XL5jKMF54/P9LO84cW46/bM+30HlileZHFszdP/bBR9b4MLN4Nx0LKS1NwpK1NPP16/mlGFre
  bDHc/t+63EtN9v3LDtGp9bQsqtP95mX9/t4/TkZzYqyN/MMfvIX45HyvnFfUcmVHepuphbZBr
  trcn47SV94ZfphXwlluKMREMt5qLiRACxNJbBHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-238.messagelabs.com!1619678207!211840!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20214 invoked from network); 29 Apr 2021 06:36:48 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:36:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6alLP028425
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:36:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:36:46 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.18 -> 6.4.19
Date: Fri, 30 Apr 2021 02:36:40 +0800
Message-ID: <1619721400-4605-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Change distribition to distribution.
Specific permission is granted for the GPLed code in this distribution to be linked to OpenSSL without invoking GPL clause 2(b).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb} (83%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
similarity index 83%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
index 7254a4713a..aead5e9f0f 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=06a8d16599e1d0b131390bec01fb571c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ad73c6bd421c137fbf18cf8b92474186"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f"
+SRC_URI[sha256sum] = "cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

