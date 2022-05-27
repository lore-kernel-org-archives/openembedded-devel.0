Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976BEC433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:16:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.2525.1653614169448050075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f323rnii;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614167; i=@fujitsu.com;
	bh=sdeulNA3yQKMec7sjTAwjLRf1Acn+My/+J/itFub5UE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f323rnii0LeLuWooIU+G0vkPq0Yu3yKykCd4ToPQN1MdhbjgOsRpKI+MLjnkMyg0n
	 4T7mMmFG/Z+tbviU6tkf371dPJGzagHmJYsCH8ntH2lfs4Ls0NoC0mhXrn9O+lQQx7
	 VixGxyT9I+e5YRrWeVOInLFTNc4dI7pJeCBJADSZMcpakgd7ENWKqckIiSSfIdwjtb
	 HEF0ZONBlm4eDMOKFZuoIoEv6fVsX0XSy/d0tFpR9oC3iM4LrmWrEyYPhUfywH59OZ
	 cdebeyqVszWO1xcvCEPM3Y56k5kiv5j6V4SHNGveXvuULQQq2mX++l+r0CvtqZbEdh
	 fwkMNM1zj5TUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqBumNiH
  J4NdzDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd13esBat4KlqaZjM3MC7g7mLk5BASeMIo
  cXKrZBcjF5B9gUli/9/FzBDOSUaJ4+cPMYFUsQmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  TuILSzgJ3F84xI2EJsFKH7m3WmwXl4Bd4nuLz1g9RICChJTHr5nhogLSpyc+YQFYo6ExMEXL6
  BqlCROrPjIBGFXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqGBga6
  hoamusa6hpaVeYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUMx/fwTil
  76feIUZJDiYlUd7Me/1JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4ZylNSBISLEpNT61Iy8wBR
  ghMWoKDR0mEV0kGKM1bXJCYW5yZDpE6xagoJc77RAUoIQCSyCjNg2uDReUlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8vcpAU3gy80rgpr8CWswEtDiftxdkcUkiQkqqgWnxsYlS21SvWTB
  /C+Rwvrc2Me3Zw1nC5pN+/2K65BcSNEvz4T4en8t3ug+8VzFu28LzI22fHo/CnO8qWyadWvGN
  q/pU+qTkL6cvLNrXf6q7J1ngb3j67bkmS182mxw4ydk97+PNyc0qJSetNA9f1HuTbsV1svIzh
  /3mu/4RvEk8/PVSOxi+Btt3P85e6LLH57xOk850da2yA62pLC1Z8sZRm/z4n2/ufvhz7pEXSc
  nGqkKhTvMXCHOtET6evu2T/SypvAPbju/7tT9ZMyE+95jE/ZP37eTPPZ2b+azq/O/jU37PXRB
  36dRaF7O5E/2nLgi2tEh5y777z+eYfLa+Tk/Hk39yD3q1b9Q+OeFL2n8fJZbijERDLeai4kQA
  E52ojUUDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1653614166!33716!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31769 invoked from network); 27 May 2022 01:16:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:16:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 30CFA100199
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2439F10018C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:15:43 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 5.0.0 -> 5.1.0
Date: Fri, 27 May 2022 09:15:27 +0800
Message-ID: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97288

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update: Copyright year updated to 2022.

Changelog:
Add cache decorator parameters as wrapper function attributes.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-cachetools_5.0.0.bb => python3-cachetools_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.0.0.bb => python3-cachetools_5.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb
index f2974f7e3..98a7f3d8f 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb
@@ -6,7 +6,7 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=439a07e400525964c3c82684146e46eb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec55353c80c662e4255f8889a0ca558"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "486471dfa8799eb7ec503a8059e263db000cdda20075ce5e48903087f79d5fd6"
+SRC_URI[sha256sum] = "8b3b8fa53f564762e5b221e9896798951e7f915513abf2ba072ce0f07f3f5a98"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


