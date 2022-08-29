Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CB5C0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:32:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.67553.1661754748320554220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=grg/xl1G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661754746; i=@fujitsu.com;
	bh=mft6Eeo5pFVR2PPVxj6IbWl2/lCexCmPgeIpuEeJiX4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=grg/xl1GSf7ly0mokIPjbjiknIlENiT/urYsxlYPcuqLRRe773dDAFtaCHeYm1GLQ
	 toU+aUUgktqcKSeyxdC8155r0hsPYSl1Dkc34GGr1nqWeeQf6Bnw5AxVGhO5HWkhco
	 JIOs4P3o16e+DqS3twiWPOZshLWdkthZNpvC+smbwBD+YK2vLDNrF4/p56R51l3H8y
	 i9B0zM5WL8x/T8EozTUdPlA5Ai57+FaM72LpzMSru46Y6G9O5Ole4ha7oaMBESjOVe
	 Tt5PmWSeH5+lJBPK9E5vBPJ5Ud8xoe94vR431oVQjmaRvnhGDf5ypL4grQfdfQFxn+
	 C05uWIvBw/yXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWbcqlif
  Z4Nk0IYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePhL6OC5xwVEz7/Zm1gbODoYuTiEBJ4yCix
  58d7VgjnCpPEt4UT2CCcvYwSq2/sB8pwcrAJqElMv3UDzBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SxgI7Fs6Ro2EJtFQFWiq7eREcTmFXCUeHLgBhOILSGgIDHl4XuwXk4BJ4mWXW/BeoWAag5uW8
  sEUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKulNgzqx9qpprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6hrpGhuZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBQZxSzHhzB2Nr30+9Q4ySHExKorwm5jzJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4b0cC5QSLUtNTK9Iyc4ARBZOW4OBREuF95QCU5i0uSMwtzkyHSJ1iVJQS590YDZQQAElklO
  bBtcGi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7hKKApPJl5JXDTXwEtZgJa/HAJN8j
  ikkSElFQD09Fnp7ycjtzxeVjssfGBeGb1PxOr03+lm9oeT+MK6+KdYGtWqt8boyMw7/bh/oN7
  V3Pkqmyd/i29oPmhK+ffgAurOPS/ey+XU7fv4tjceMwyW6Vww21OpZq42ECFNNXcNeuXuzbrd
  zNd7ei7r3nh/1w2Dxee3wc9DHeUb230tc3is7CIe/Yoqr9FLFDd5VrSo+ptUX85ZsV4f6leaF
  /J9W2F/6YIXsfPpw1afdJ6t3Zx9Rp/Fd/zavr3mpK5xnNe569dcGz1nuJP23yP9DqfvNShtMJ
  /trXmP90qMSWxdymHrPbeDb2z94TitqvZelZpa3/sEj7WfoK9TvDKwsdC57ylW+XsrEqWbBE9
  cGqOEktxRqKhFnNRcSIAml/DkV0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1661754746!333738!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 896 invoked from network); 29 Aug 2022 06:32:26 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:32:26 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E20EA142
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:25 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C86D77B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:32:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] logwatch: upgrade 7.6 -> 7.7
Date: Mon, 29 Aug 2022 14:31:43 +0800
Message-ID: <1661754703-4722-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
References: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98504

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.6.bb => logwatch_7.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.6.bb => logwatch_7.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.7.bb
index 8cb88157db..37a94661aa 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "689f3c68b99ef7af7d3c7007c3ff0a55d5674bdbf9c01f69a9f187726d6d4baf"
+SRC_URI[sha256sum] = "2a10c2c73f85d2ec9d8e9be3f553b7b5849cf795b89a1c1379c99cc36a06adbd"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.25.1


