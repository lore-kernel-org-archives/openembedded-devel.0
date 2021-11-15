Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C4EC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 23:39:14 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.2574.1637019550825627615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eN5JEGSE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637019549; i=@fujitsu.com;
	bh=+uzFwPONHattGcWRhGMA8+rlFRnJvaaZ3Gn2wkZ20Rg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eN5JEGSE3EtyBMaTTEFq0Vv96kSeHsn1wHnNiGmqFnXJJ4bAVqRe/Bm5l936Egt5P
	 Bxbc4JDiLfzbiXJtvzgT1JWV1SVqGaiVLdEqJylECwrZxbiZ2wSHWZY/GPUWbKtzEN
	 DtIsEQw63eWBtmZGBMAV+qdeOIsIL09HulMODXbu9O2zZspzbX5sPPJdPfQf4+Glab
	 coRcOOXAdiEHMkn08etl/DKWBG1bnRZMfFZf5cRKX6spi6DQ4UJCd4U9QAEwg4jyQC
	 h5elUdclRXyzDLllCcsfH1SMiJOaCvyoaG/27HuFfUh3S33GbOBsfdZldiIEdeO+Sn
	 j9WEQnEhwzZMg==
Received: from [100.112.198.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id C0/DC-17294-C9FE2916;
 Mon, 15 Nov 2021 23:39:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MRojv7/aR
  EgxnHLCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox9Vy8zF5zmqHixciNjA+NH9i5GLg4hgZlM
  Ejf+PmWCcE4wSsx/PZ+li5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9hBbGEBf4kfu
  7+wdTFycLAIqEpMPB0OEuYVcJJYu/E/WLmEgILElIfvmSHighInZz5hgRgjIXHwxQuoGkWJ2Z
  ebWSDsColZs9qYJjDyzkLSMgtJywJGplWM5klFmekZJbmJmTm6hgYGuoaGRrqGlma6ZiZ6iVW
  6SXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHBlVJwxGEH4/3XH/QOMUpyMCmJ8sYtmpQo
  xJeUn1KZkVicEV9UmpNafIhRhoNDSYK37jVQTrAoNT21Ii0zBxjoMGkJDh4lEd7EW0Bp3uKCx
  NzizHSI1CnGcI43a5csYuZ4Cybb7t0Fku1gcuaCg6uZOWaByfvth4DkAxApxJKXn5cqJc778i
  3QOAGQcRmleXDLYJF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw74p3QFN4MvNK4G56BXQ
  uE9C59vf6Qc4tSURISTUw+YlfzQ0xZLSVy5L78s2+eUWJ5XqJ/I+ps9rYHxvltTOEhjluruls
  4jA4x86iZ/ZBdFLb/Knbnl15sY/JqTEtPmNZ50zJUKaLqV8Dl4qsCKj7ax3vW/ac/2nmqdTpE
  yR+VTJFiVhx5HOvrGrt35/h99ErcKOM9bfTNewvepxyiqoOSi10XJ8a9E1+R4qvzKKtW5wNl7
  5fcMRN5ti/Y8+6VL3nZj89NpG1IDN22qHjy3u3mprOvHJqwQyjYIEPN27tLrPyub660u9/oLz
  8juR9VxY+3XtRJoVPZtaHx7GXH2vYtrQ6VO9ZZbvVpCrKWu9xw2EBBal/N3lWSk2zLjP1uvM8
  m/92897Tfi6LAqcrsRRnJBpqMRcVJwIAAuYFrl8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-285.messagelabs.com!1637019547!553560!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8420 invoked from network); 15 Nov 2021 23:39:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 23:39:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AFNd1A4029756
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 23:39:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 23:39:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210905.0 ->
 5.9.20211114.0
Date: Tue, 16 Nov 2021 07:38:48 +0800
Message-ID: <1637019529-79932-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 23:39:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93960

Make:  fill "end:" fields

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210905.0.bb => ctags_5.9.20211114.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210905.0.bb => ctags_5.9.20211114.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb
index 4cc1c12b65..cde7c7a0ef 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210905.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "ca81123303640582358ce7b8a4e466615950a1f7"
+SRCREV = "a668cb155609d5a322963e1ed9a0c0147c8be597"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


