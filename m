Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F61C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 09:07:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.7816.1676192854666867051
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 01:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vro+TgHG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676192853; i=@fujitsu.com;
	bh=lvYvvzwTUwTPFsP0lzyuA6TbHOzIOyEqlZs04MW30Rc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vro+TgHGrZxAVsgXUgFHVixsGoNAG2MVPhut5jwQIUSJI3dhLRPDY9VkoFG5VZ3qb
	 t9tsauwKquYtStYK5uUba9XGYjfqlZULC3gq9pPiyZop/6j5Z1w/7iJCQLQqT59puo
	 2cs8rihfeVG/DX+bsg0lFgBJJcKM/8qtI1tp37wz+7RWCLrvxdsZhJ0uR2O05amIF3
	 wlb+/bPOdxFtmb1rQ3ZFePwETTzDeHYiZS2e5/Y3Gt2PulEJ0oPrVAm/PxpF4iRxAr
	 rQdQnsOHRbgmQVq498u7nnQ6ZuiJ13bOk7LozYaw1YFgCbDeACCWOM57BxAovI2pDv
	 xZlLM7Z97PpSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpBuy5kW
  yQecncYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWqWfsBXM5K5oWBTQwHuXoYuTiEBJ4yCgx
  /dFqRgjnKpPE1SM72CCcvYwS7efPMHUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAlcWtJF1gNi4CqxIbL81hAbF4BJ4nX708xgtgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCslWj/8grLVJK6e28Q8gZF/FpL2WUjaFzAyrWI0LU4tKkst0jXSSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS4ByiSWF+ulFhfrFVfmJuek6OWllmxiBIZiSrFq/w7Gtb1/9Q4x
  SnIwKYnyLtv8NFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBC/L6hfJQoJFqempFWmZOcC4gElLc
  PAoifBWLQBK8xYXJOYWZ6ZDpE4xKkqJ85qD9AmAJDJK8+DaYLF4iVFWSpiXkYGBQYinILUoN7
  MEVf4VozgHo5Iw79FVQFN4MvNK4Ka/AlrMBLSYQeopyOKSRISUVANT20M7thOH9HjzVV7OXN7
  3Ys/HNKfGOzVakmebZfLOrNydezRRvcZtyevZBerTfpyfufquZyuHl4zT+h2NPYwqpzq7+Tc3
  HgtPP3xVZi3L5Bmut1l2aujfqFTNk9x0sVrgj/5N52L+pLi91+Yu83K3tVHqnXR8Ym1nyt3M+
  Qnh21yjn225UHl13bqJYrNjvDe91S7JPvvPyKSBr6t3XsWankntp5kc7noEbXh386uQ0+fGZQ
  aad05LlKzbf8/LuPCYi0Q6Y8vdT79mas+J2cMb+8pN3+ic7Qmu+4tl1MWfWHif9NA1Us15tdl
  I0ulq43GpVRG5IiwLyxr/H4hgPFESssSkZ98tq84nb4SFdxsrsRRnJBpqMRcVJwIAc4N7CkAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1676192852!482285!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9328 invoked from network); 12 Feb 2023 09:07:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 09:07:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1F2B71B4
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:32 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 139981AE
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 09:07:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbem: upgrade 1.5.0 -> 1.6.0
Date: Sun, 12 Feb 2023 17:07:15 +0800
Message-ID: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101043

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.5.0.bb => python3-pywbem_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.5.0.bb => python3-pywbem_1.6.0.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb
index d109fa460..cbf2a7a33 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "c5f7e458c2530c61358fbc6333be74faf366aace78eae33741431267adf32610"
+SRC_URI[sha256sum] = "e26ab0324475ee5329d74971f942b4b315b6ac0edaf278e70e16b5603278ef98"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.34.1


