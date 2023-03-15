Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE7CC7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.8998.1678889339114949738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gcwxvY5B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889337; i=@fujitsu.com;
	bh=JKYYza95llYKm4F6hv2pNRO0JBkhHSnNyNKiH0M5r10=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gcwxvY5BXM4oTCyzOjN346FtfxPAFZ4ao9EIFoqIoT6tdowHsqCVsmTvL0FOqfdyQ
	 2Yhw/tCIUTrW88zRAruaYndz7yBF5GA8vSPCj8M/5UV6vhVLntZKq1YEEOkL6RBBBd
	 NCOBa4QhoAYVaHwHmE13RvJwwyiSb5UxhSGq5IunLE0FbeE2Bpod9YFxd/NGtiWfeA
	 C7ZfZ3BKATV1CakpsvVnyKvvTOQXbXtS9rCLF5j1TvO45UcZMpSWqokrLSz+QbqnQE
	 MjUH1ogBNQvvWic5ben5m5tHCs9haHDpRgsqy+GRsmo5Z8F7Vedom0jN1f26/9nLgN
	 eS7DqZDAoUs4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqFt5UTD
  FYNoudouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePix3vMBRO4Kl6cFmpgXM3ZxcjFISTwhFHi
  wMm5jBDOdSaJDbufs0M4exglXr3uZ+5i5ORgE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawQIDEjtOvGUFsFgFViUst51hBbF4BJ4nemTvBaiQEFCSmPHwP1ssp4Cxx7fpzli5GDqBlTh
  IH7tZBlAtKnJz5hAVivITEwRcvmCFaFSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNbTQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRi5Q87GJf2/dU7xCjJwaQkyvtnjUCKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qnef2cEU4QEi1LTUyvSMnOAcQSTluDgURLhTT0PlOYtLkjMLc5Mh0idYlSUEuf9C5IQAElklO
  bBtcFi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5lINt5MvNK4Ka/AlrMBLSYd54AyOK
  SRISUVAPT5DuG7Gt+vf71rfsir9fe0uWiD0MyzjRHaAVMNrz2uW/eBFaXCN8du6+3b1LdsfhZ
  Tk6enOFLnaBVi+cVh4qu9dt+eO5b27P6y8TSI6bNtZu13XmNy/sjik/XiZ1/eXzTlL93zaYwH
  xXcUFQ/X9hiKs8p4cNi60MtdXZVxSuuayvdqn++vYlXzdiPoX57ZJTi8RUTvkg3/JT1SDo34c
  eOGXX5r/QeWv3fqHb/9cQXKkfTZ090PVD/rUdu7/b0Y+zf6laqf1hmHS0dyVqb5LNsTYWKQah
  ZMcPUZ4+uzrqQyVW3Y8r/r7/Djq5YMa3W6ORU04KU3fG/8k+enVm91NOuxDrd31T775Vr9fJl
  c09OPKPEUpyRaKjFXFScCAC3O9h/WAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1678889336!120601!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8503 invoked from network); 15 Mar 2023 14:08:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:08:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9E901001A5
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:08:56 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BDFC41001A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:08:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:08:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.2.0 -> 3.2.1
Date: Wed, 15 Mar 2023 22:08:34 +0800
Message-ID: <1678889317-20778-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
References: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101554

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
----------
    #884: Fixed hang in worksteal scheduler.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.2.0.bb => python3-pytest-xdist_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.2.0.bb => python3-pytest-xdist_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb
index a3b28835c..02e5400b7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "fa10f95a2564cd91652f2d132725183c3b590d9fdcdec09d3677386ecf4c1ce9"
+SRC_URI[sha256sum] = "1849bd98d8b242b948e472db7478e090bf3361912a8fed87992ed94085f54727"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


