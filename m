Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AD6C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:04:19 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.7719.1637593457553324909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dXDKtm0B;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593455; i=@fujitsu.com;
	bh=7W+FwsYhAZP02jGFSER8PtbgcvTkE6lkdEHctz2gdRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dXDKtm0BhV6AB0Cg09NPX/P8E3s1yqh7Mw3iEtabrcyQcGGpwzAyRGanqgNI0YH02
	 kmIAignY4npk7aoUnywvXgjJnbj+H2iVHKAVI/6L+KUmgB7U3U1s3jIHewgKPdduA3
	 hqmrR/QQJasb122PfvYzq+PLm7sp1sAe6Miy/POgO+YRqioB86JIUYNdmLT5qlZ4tF
	 SseEqyVBIrrVF9yUYYgjUsb1Vzpa64M+pVxQTvIYol1EtAt5yrL7dpvRhRGPdD2i9z
	 8PVm9ssO+FBX2ro/VnRNlKPE/oAgZqlOp0zZyE47OSNQkCcTPXhkZEaWjNSksUHP0i
	 qxFMuZ17kDNSA==
Received: from [100.113.7.250] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id D9/C1-25178-F61BB916;
 Mon, 22 Nov 2021 15:04:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqJu/cXa
  iwZFuWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN35yHmgnXCFUsnXWRuYPwj0MXIxSEk8IRR
  Yv3Kq4wQzgUmiaZlN1kgnBOMEhOnzmHqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATuLFq3lg9SwCqhLPF74Hq+cVcJKYMGUiC4gtIaAgMeXhe7BeTgFniUvzjoD1CgHVvF
  i5ih2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjPUnAqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXVNdA2NDfQSq3ST9FJLdZNT80qKEoGyeonlxXrFlbnJ
  OSl6eaklmxiBQZxSyNK0g/H3qw96hxglOZiURHmNZs9OFOJLyk+pzEgszogvKs1JLT7EKMPBo
  STB+3gdUE6wKDU9tSItMwcYUTBpCQ4eJRFeB5A0b3FBYm5xZjpE6hSjopQ478ENQAkBkERGaR
  5cGyyKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0FMoUnM68EbvoroMVMQItPH58Osrg
  kESEl1cCUYsDVYGQSMjX85//Xc8xeTw4JT+68Khav+m6m051DPWX3a8KZRZee0/1+ddMmiYe+
  zbGObdaHJrPUpmyakHZExFae486E3wfDL3m/DVFIMJxc4C3/NozV7/iUjxKhqoVTlz7hbW/Ta
  +X0Y4n/9OHH8tWlvXWi9ofyrvtKJNtP6m5+kXfmUhl/tj0Tu/P9NntbmRCvrtb/KtmqH9Je7f
  c0/bxcpT2pwfDf9aubisy93NYoM5w5tlIuOdZzw6MHK5eJeDKwnvKb0q5UnVZuyXvXxOvsp6U
  cD3c16IVoHeQPKDufHeNWUfAs7Hjfvw02vQVWAbmLyiztUj/MVwm/ICNR6c038/fiTY+lVKun
  KLEUZyQaajEXFScCAA/HXFxdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1637593455!430088!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19239 invoked from network); 22 Nov 2021 15:04:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:04:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F090310024A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DCDB010023C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:04:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:04:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 10.3.2 -> 10.4.0
Date: Mon, 22 Nov 2021 23:03:49 +0800
Message-ID: <1637593430-99394-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593430-99394-1-git-send-email-wangmy@fujitsu.com>
References: <1637593430-99394-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:04:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94098

Changelog is as follows:
Handling of Weak Cryptography Algorithms

From the qpdf CLI, the --allow-weak-crypto is now required to suppress a warning
when explicitly creating PDF files using RC4 encryption. While qpdf will always
retain the ability to read and write such files, doing so will require explicit
acknowledgment moving forward. For qpdf 10.4, this change only affects the
command-line tool. Starting in qpdf 11, there will be small API changes to
require explicit acknowledgment in those cases as well.

Bug Fixes:
Fix potential bounds error when handling shell completion that could occur when
given bogus input.
Properly handle overlay/underlay on completely empty pages (with no resource
dictionary).
Fix crash that could occur under certain conditions when using --pages with
files that had form fields.

Library Enhancements:
Make QPDF::findPage functions public.
Add methods to Pl_Flate to be able to receive warnings on certain recoverable
conditions.
Add an extra check to the library to detect when foreign objects are inserted
directly (instead of using QPDF::copyForeignObject) at the time of insertion
rather than when the file is written. Catching the error sooner makes it much
easier to locate the incorrect code.

CLI Enhancements:
Improve diagnostics around parsing --pages command-line options

Packaging Changes:
The Windows binary distribution is now built with crypto provided by OpenSSL 3.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_10.3.2.bb => qpdf_10.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.3.2.bb => qpdf_10.4.0.bb} (91%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
similarity index 91%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
index cfbe529f33..964becf1dd 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.3.2.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[sha256sum] = "062808c40ef8741ec8160ae00168638a712cfa1d4bf673e8e595ab5eba1da947"
+SRC_URI[sha256sum] = "9ac6e691cc3f35a9fe44632e3fba727e1b6ef21181c0a883287abf5cf97ae222"
 
 inherit autotools-brokensep gettext
 
-- 
2.25.1


