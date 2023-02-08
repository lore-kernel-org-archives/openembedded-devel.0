Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCD7C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:11:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.3778.1675843895456712200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WZEXd7OI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843893; i=@fujitsu.com;
	bh=z2gB7RFQIsyvYSdq0MrUNxXHCx4/4dnL4LTMtE4InYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WZEXd7OI2YTeOzyzrbAD3sd6oODufloE9FM09wVh7dajSn13fkz/Wvquzig4g/+hv
	 VUnUGm0LthRwPn8gYKtsyga9WFJ6Akr/dtmgdUkEiIDoRqzExugep365ARioAmnvEE
	 6jSwk1vtBuWdEEOybGtJjf21pZcIMwW+/SD/wgObuAvBfoq2h/TZl5qWxrh0xdpe/Z
	 OLlu132ohzLOAFve/RyFAPL6+nWNTxghF3XhBsR7VF1vkyOkWkGNEVsIWs8Bcp7xrY
	 L+1HKQnbCL2iAPFD2Bvh5tZTML2HCjomlT/qz21hB/Gm7Kg2JuzDH9cNrz+uC9qtsp
	 8J5uQfxxVlYFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORpGsc+Tj
  Z4PBNM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePcijtsBRskK/5e/cLYwLhMrIuRi0NI4CGj
  xKx5KxkhnKtMEs0Nm6GcPYwS6xt3snQxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAv8eHdEbB6FqD4houzgGo4OHgFnCTWPAwACUsIKEhMefgerJVTwFmi7dM0VhBbCKhkx6
  4DYHFeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbqGxnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHhm1KcMGMH46++v3qHGCU5mJREeT3FHicL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCNCAfKCRalpqdWpGXmAGMJJi3BwaMkwhsZCpTmLS5IzC3OTIdInWI05ti0r+sAM0fnfiApxJ
  KXn5cqJc57FWSSAEhpRmke3CBYjF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwbEAY0hSc
  zrwRu3yugU5iATglRfQhySkkiQkqqgclWL3P2Ar8vnHIGigu4eJffPxTDcPPWxmMif4O9JhmL
  FV6N1jNJUTxnafaTL32W/OeT8/sWR3I/eVPffjrN44qu125peZ9bre2BE9JWNx5e575R9XFfI
  K967hz9JsunS6JDTpRuXm3P6x/0hG/55gqxD4F7bgs7fe+pOTXz4bMz6zpSNvg/XSF2cck7fu
  b0ZMVrYvKL5bKOypVO0E5vL8nqv6oUKDLzH/tkLZ/QL+W2CYue/4sPs1zJYrT+mZTN8SSHJcd
  Wsl9ee8fT6czfZy9Zc7nFXm17nvtugo5JWHPghEruqZu/LL0Yz6U54XROwt0j55Xvehg5XTzv
  8S6rKT1tI1PyqyUxVwQXtG/IUlViKc5INNRiLipOBABak62YbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1675843891!313017!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10323 invoked from network); 8 Feb 2023 08:11:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:11:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B7991B0
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3F9AC1AE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:11:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastnumbers: upgrade 3.2.1 -> 4.0.1
Date: Wed, 8 Feb 2023 16:11:15 +0800
Message-ID: <1675843877-11285-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
References: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100981

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2021.

Changelog:
==========
- Removed a nasty memory leak that would cause every number returned
  from 'fastnumbers' to never get freed.
- Added 'check_real', 'check_float', 'check_int', and 'check_intlike'
 to provide a more flexible interface than 'isreal', 'isfloat', 'isint',
 and 'isintlike', respectively
- Added 'try_real', 'try_float', 'try_int', and 'try_forceint'
 to provide a more flexible interface than 'fast_real', 'fast_float', 'fast_int',
 and 'fast_forceint', respectively
- Added Python 3.11 support
- 'query_type' now sets 'allow_underscores' to 'False' by default
- Complete rewrite into C++
- All functions now use use 'METH_FASTCALL' to pass arguments from
  Python to C
- Always parse integers using 'int64_t' instead of using 'long' to ensure
  we can always quickly parse at least 18 digits
- Parsing floats now always uses the fast and robust parser
  ['fast_float::from_chars()'](https://github.com/fastfloat/fast_float)
- 'isreal', 'isfloat', 'isint', and 'isintlike' are deprecated in
  favor of 'check_real', 'check_float', 'check_int', and 'check_intlike',
  though they will never be removed from the API
- 'fast_real', 'fast_float', 'fast_int', and 'fast_forceint' are deprecated in
  favor of 'try_real', 'try_float', 'try_int', and 'try_forceint',
  though they will never be removed from the API
- Support for Python 3.6
- Removed the undocumented 'dig', 'max_exp', 'min_exp', and 'max_int_len'
  module-level constants, as they are now meaningless

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-fastnumbers_3.2.1.bb                | 10 ----------
 .../python/python3-fastnumbers_4.0.1.bb                | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
deleted file mode 100644
index 0db33052f..000000000
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_3.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Super-fast and clean conversions to numbers."
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
-
-PYPI_PACKAGE = "fastnumbers"
-
-SRC_URI[sha256sum] = "44f92b42e7e9f2ed77ba5cb7d664f05c17e43d4586718ed6cd3b3fffa0e67f33"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb
new file mode 100644
index 000000000..e3a0c6c0f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_4.0.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Super-fast and clean conversions to numbers."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
+
+PYPI_PACKAGE = "fastnumbers"
+
+SRC_URI[sha256sum] = "3e7d74b1debb44c4803c0fea59a63d0785d6a26ebcb902e2262b3c3fba81b400"
+
+inherit pypi setuptools3
-- 
2.34.1


