Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.80105.1629439897499388925
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eIXbNUhL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629439895; i=@fujitsu.com;
	bh=2oF8R+G5TMHz7YtkM44cdvejX3xSMC95IG5JHy5c89s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eIXbNUhLJs+fbuSDE/O0EzVhHh9hXVbDtFMTp9gAVgjCx6sAEdIkeGwBc3aIL5NAe
	 7KJ3CdB/CYJjiUCw6oTysd6Q2GzAgW+mw3VuqFAtaHjaQCUXCKxWEYdlCXALK8R8vn
	 bjJJCtKblCC0IC0XaBEirivDIg6wiE4qiW9IshX/kYSbvGafx6LdeNTQSyx+GznV4v
	 Vfggm2Vyvx5jq2l3Rs33wkbNlix8RQHCS206y5wOpqtGon4sg+PCeIu7ZDLX1xC05C
	 MHwDuMwpPQqgrwHJox19BD+8J1deqLPPwcQA+XSLJ/PCzfk0ViQzvFTBh4ffIZN3RK
	 PZcejbfp6esJA==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 97/D4-31512-7974F116; Fri, 20 Aug 2021 06:11:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8MRqjvdXT7
  RoGW7isXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHjyyPGgoW8FW9+TGJuYDzF3cXIxSEkMJtJ
  4viSv6wQzglGiU0tBxm7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwkFhyc
  A8biM0ioCrxdMtTMJtXwEni8soTYL0SAgoSUx6+B+vlFHCWuHlyG9h8IaCarnPNTBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCYw8s9C0jILScsCRqZVjBZJRZnpGSW5iZk5uoY
  GBrqGhka6hpYWuoYWZnqJVbpJeqmluuWpxSW6hnqJ5cV6xZW5yTkpenmpJZsYgQGZUnBs1w7G
  t68/6B1ilORgUhLlVTWTTxTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRvlCpQTLEpNT61Iy8wBR
  gdMWoKDR0mEt9gZKM1bXJCYW5yZDpE6xRjL8WbtkkXMHG/B5Oa5S4Fk2727QLIdTM5ccHA1M8
  csMHm//RCQfAAihVjy8vNSpcR5O92AhgqADM0ozYNbCUsElxhlpYR5GRkYGIR4ClKLcjNLUOV
  fMYpzMCoJ864FmcKTmVcCd9kroKOZgI4WUpUFObokESEl1cC03vJ10WfN+d3qrAe/+n+YvnR/
  aU2P3Nezr8py/EzCLorZzU5ht7e9mXCf73bsBsYz7n9fShfK5uuqsDuu3xR2+Gl90LbEVo3f5
  3alLwp9Wp8cFbAl7NXJZ6VNKnuUbl/tfF3kwfRjHVvZqSla+b7/9SIZP3NO3r1+z/X3VpV6e+
  /2h96MemgSNnXBf9GAjVuuvDz4LXdKr0HnTLlO3kN5L/+eaz9x8bSNLLs/7+RVH1by5nlH3Nv
  EvO7g7c11Sj1NnL5fj6yx1fwQ/un1kxkNezhsrQ9muIW43N+zx4rllf232tcvPbMYnxpWiv0x
  qgp43/A1Ye9SC27GSdWJLn8luZ3nHw8KO7lzTfmTSJMlSizFGYmGWsxFxYkAk/g25H8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-291.messagelabs.com!1629439895!956!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29556 invoked from network); 20 Aug 2021 06:11:35 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:11:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6BZ7J002248
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:11:35 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:11:33 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opensc: upgrade 0.21.0 -> 0.22.0
Date: Fri, 20 Aug 2021 14:11:11 +0800
Message-ID: <1629439871-46349-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1629439871-46349-1-git-send-email-wangmy@fujitsu.com>
References: <1629439871-46349-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Use standard paths for file cache on Linux and OSX
Various issues of memory/buffer handling in legacy drivers mostly
reported by oss-fuzz and coverity (tcos, oberthur, isoapplet, iasecc,
westcos, gpk, flex, dnie, mcrd, authentic, belpic)
Add threading test to pkcs11-tool
Add support to generate generic secret keys
opensc-explorer: Print information about LCS (Life cycle status byte)
Add support for Apple's arm64 (M1) binaries, removed TokenD.
A seperate installer with TokenD (and without arm64 binaries) will be available.
Support for gcc11 and its new strict aliasing rules
Initial support for building with OpenSSL 3.0
pkcs15-tool: Write data objects in binary mode
Avoid limited size of log messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensc/{opensc_0.21.0.bb => opensc_0.22.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.21.0.bb => opensc_0.22.0.bb} (96%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
similarity index 96%
rename from meta-oe/recipes-support/opensc/opensc_0.21.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index ea832ec0f4..e8bb505e44 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -12,7 +12,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
 #v0.21.0
-SRCREV = "30180986a08cf71fe4af4b50251a8bb5b1ab95af"
+SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
           "
 DEPENDS = "virtual/libiconv openssl"
-- 
2.25.1

