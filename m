Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D53C7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:10:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.9041.1678889404363348029
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qeTu4DbB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889402; i=@fujitsu.com;
	bh=JezAIlElVi7xcxTLiqRE6MpGDB3FxkB62RbGtudU73Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qeTu4DbBynUDPSG+KxMNnQkP3d96Tar7m9jgTyFpwyHAsuhDTgEUbc9irgKuaNJQy
	 aOjoKbovk27nKTlmSx38Ll6bSzUJ49CzYIek24HDFDh+vq7hx4tqMAWtxGarzgBuNS
	 oMD765dJqDsDjDzc2YiqD+h9bUBGCKST28Ze2SPYqbOpmKOp4nL5nYXUzTf+t/mvU+
	 X48+dn9YPdqr9S56kqJ3b156ok6aXp1BPbeA5CHL6uL0GERgw/xmnGxNgLzGz1KD3S
	 06ycpKZk2Pkb0Ou2j3kB6ThwwJEgCpYtumiDBH9xBjICWb7EffaJTEDn+EDhUdF+GQ
	 YJBKxttH+vG2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSXfXRcE
  Ug53hFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxuuLO1kKnnJUzDhi18DYw9HFyMUhJPCEUWLC
  tV/sXYycQM51JokXS1UgEnsYJT4v+M8GkmATkJK4cR/CFhHQl1g6ew8ziM0soCLx4ncPWLOwg
  JfE7FcLweIsAqoSGybvBYpzcPAKOEm8usQIEpYQUJCY8vA9WAmvgKDEyZlPWCDGSEgcfPGCGa
  JGUWL25WYWCLtConH6ISYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRvPi1KKy1CJdQyO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAQEwpTnPbwfi776/e
  IUZJDiYlUd4/awRShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwFl0QTBESLEpNT61Iy8wBRgVMW
  oKDR0mEN/U8UJq3uCAxtzgzHSJ1ilFRSpw3F6RPACSRUZoH1waLxEuMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHkfgEzhycwrgZv+CmgxE9Bi3nkCIItLEhFSUg1MCs9szSZZ1/RuEbV5pfx
  iPf/zrONz78T1PVY4aNG4bPX8U8ICjI9rIz8cquKZ9Ct61u/OxV+/7zS26E6e+JflaM1c18Yi
  GdeULXGyd4Puxa/86bNy1fOqddffLfl7J39/xhZ5cflnahejTp6K6gxyCLQof5kbnmZyZFflD
  jWtGz/OTA/XMeZllvyyJeyiavqUa6sV1vP7JmXE+TKXbX8gNIF7646mRB2vLVcSpFg2PFbUuC
  98qHhS69bJPLUL3m3aUxPk4nDj9ZI9rh+VHNXdblVObGzT+zxbJC99U3jSxP95ey4dWvL1y+b
  dz6d4zd59JXznnNlisvWz9ghasIg9S7iz48e19ZGRuw37XI8IFymxFGckGmoxFxUnAgAO+JQj
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1678889401!68082!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8070 invoked from network); 15 Mar 2023 14:10:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:10:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 444A7100347
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:01 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3499A10033F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:09:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.3 -> 5.31.4
Date: Wed, 15 Mar 2023 22:09:47 +0800
Message-ID: <1678889389-20817-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101558

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.3.bb => python3-web3_5.31.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.3.bb => python3-web3_5.31.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.3.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.3.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.4.bb
index 5c70febea..cc95c0600 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.3.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "4b2d420647c81856e3cf398996cd3cc80c719dc3a10881884c5c3b1467e4f850"
+SRC_URI[sha256sum] = "f763d339dd63f922920c8a53cb46e8ee47d9ea7efaba9b8cf006956661d874d0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


