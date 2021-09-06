Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.16960.1630891288686044932
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LoFeZ0g6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630891287; i=@fujitsu.com;
	bh=X7dlkGYQGornMRtqNpZSAn7ovw4m2X9uAeDHA18rGMk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LoFeZ0g6D5Vaz/bLxU7ElDtmbDVMFBAJJJbS1LnKCHdIqxb40mKyb1x88S+Nd01xG
	 /R61erQBtWt4g5+z+IRR0Joo/4J/hD4CyJeGI0YSku/7E92lW94G9Eomm0L7DRadBL
	 3k2R7uHAWgaahFvlunV4G5dNqVyswUjAYKkgg0N/5vc6jJesuVszB77OIzblqsrHR3
	 7ii+xqCkwBVWFFXCl2X4XNv3e7QODu0DFOyZK0BzvPpaxcnWYSlWghOtv7p1hXAJJL
	 m2dXosrzcmD4fHMFvrFpah4Gy5h4oYdeNDA/tOMhP/EHdzL3E56AojYITYtj9YyXrG
	 J7X3CPOSJyq1g==
Received: from [100.113.2.26] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 34/7D-23460-61D65316; Mon, 06 Sep 2021 01:21:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYoiuWa5p
  oMOO9sMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHn72+2gkm8FVfvH2ZuYHzC3cXIxSEkMItJ
  YuLzB4wQznFGiU0LfrB1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC/hJTHm0nxHEZhFQkTgx7
  w5YPa+Au8S7/v3sILaEgILElIfvmSHighInZz4Bm8MsICFx8MULZogaRYntO8+wQNgVEq8PX2
  KewMgzC0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrqmhrqJVbpJuqlluomp+aVFCU
  CJfUSy4v1iitzk3NS9PJSSzYxAgMppZDReAfjwdcf9A4xSnIwKYnyatiZJgrxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4I3KAsoJFqWmp1akZeYAgxomLcHBoyTCeyIbKM1bXJCYW5yZDpE6xagoJ
  c5bDpIQAElklObBtcEi6RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7WeKApPJl5JXDTXw
  EtZgJa3PbQBGRxSSJCSqqBaVH75IojR+YXsN294Bws3b5lVoT64YBF3cL5ImfvVm6ZV9d14r5
  S4zWbeYsWJibMe8D14l3fn3NfE+vjpR5/v15mq1v/xYFpabe+92eXm2rXXWLvGK94P/cW98T/
  syOvxvf9PPuV/5bqPe5jHzilf3W9+JJ67ZYJv8IXC4/Opwn1utUqsT2MZ75OY76quY15gtP0A
  FXLIoMF9v/ibH8vMiu57TGxrd/7a+y65fE/ZDR7FQouZD68ten0r0wW0ch1RtVPWy8ZvTNQ5v
  C50nDhy5GfWtOkTIRDnj455FP+fMK1JF/p1b5T2Q2avEqDI3c7XJALPcTYd8hMpWnRmw8/9pU
  73TTqPnZsrZiasG3lfiWW4oxEQy3mouJEAEzrFZEfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1630891286!231703!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16230 invoked from network); 6 Sep 2021 01:21:26 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:21:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861LPtq022037
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:21:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:21:24 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.3.1 -> 1.3.2
Date: Mon, 6 Sep 2021 09:21:17 +0800
Message-ID: <1630891277-61511-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

CI: fix building wheels on GHA 
* ci: fix wheel build command
* ci: remove references to submodules
* ci: fix sdist command and remove Python 3.6 from the matrix
* ci: slightly alter invocation
* ci: disable emulation
* ci: smaller matrix
* ci: use a small matrix but with all python versions
* ci: use manylinux 2010 for CPython 3.9+
* ci: split again matrix per python version given how slow emulation is
Fix also the artifact upload
* ci: fix typo
* ci: typo

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...python3-kiwisolver_1.3.1.bb => python3-kiwisolver_1.3.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.3.1.bb => python3-kiwisolver_1.3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
index fb66619dbd..cf14c49e6c 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
 
-SRC_URI[md5sum] = "81012578317ddcfa3daed806142f8fed"
-SRC_URI[sha256sum] = "950a199911a8d94683a6b10321f9345d5a3a8433ec58b217ace979e18f16e248"
+SRC_URI[sha256sum] = "fc4453705b81d03568d5b808ad8f09c77c47534f6ac2e72e733f9ca4714aa75c"
 
 inherit pypi setuptools3
 
-- 
2.25.1

