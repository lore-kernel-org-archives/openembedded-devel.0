Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9243AC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 03:32:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.4038.1658460725249742484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 20:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AH77HLwm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658460723; i=@fujitsu.com;
	bh=vUWs6VGbPx4WlAGL9W99Oo4Qh6GKg9dYa3kugtPrnZk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AH77HLwm2w6Jys9QtM50yUBYKtEsk2vmdrZrPklu2Byarbgzvh3hMH3sN/DSkWmBA
	 JgSQ+ANd3hKJ/u6JtJHDKIz+gEEBkSPVdsTS6BNBemfb+ac58cVnD8YrQTF+cVuuRW
	 qERlpf2z08oetvbK3DINYELeUiTxGKSLN0iOY/dLUJ9oDgB4uDsfh8CFmP+nv5F8Wa
	 8J6xjO6YGG9M+WWegvgZJzm8Sos23gpXRbHn9PC9de7T4WEZLxa7H7LBQV8Zzq/wM6
	 4CaZwI478Je++ATMeV9K129i398CbJn9jwrQZkfYhLnWUo3hiOqTDFcHoiY8vwmhTT
	 wHbZCO6mT3zkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqGskdSv
  JYMEEeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP608fMBbN4Kh7PWs3cwNjL3cXIxSEk8IRR
  YtmKU+wQznUmias/FrNBOCcZJd5/vM3axcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrCAv0Tb8xdgNSxA8Ykn28B6eQXcJVpvX2YBsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXUNdI0NzvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwLBMKWa8uYOx
  te+n3iFGSQ4mJVHePuFbSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeJ/xA+UEi1LTUyvSMnOAM
  QKTluDgURLhLQNp5S0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO9+caAiAZCijNI8uBGweL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3hwjQFJ7MvBK4Ta+AjmACOsLc/AbIESWJCCm
  pBiatHplTXEr/pHJZjxvbsqdXz/qiULgn9YA7+/P0ljbfc6emOb6rWLJy7eHD2aZ7dfSPdUs8
  3Mm/qeu6Us/S+1kf1Q0adnisXh70X8M3r0105poa5u9cV6dbFkvkc7/9lqIalx7vLnr0XP2Sl
  I9Mpv/mS3Sldvpb/So3kmMLsnsQHyi+xVg4/mzhA5WStDmse63mz6mQ32Jm0NV+ut7pddnZn/
  Y/t4cf85vyl81iWUPUhhtbqq8ekNp15PyV+7fn5Kz6ftPTk4e1/0lZ6nFTF93UWyKb52+5s2n
  xz+XiuR0fEqZrTA5KO7zIQ+p/MfO22l7xHq2HUw3cvh7UlRCoDZO6vK0rt0ChL/XptFl77imx
  FGckGmoxFxUnAgDWkxMYUgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1658460722!134154!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12127 invoked from network); 22 Jul 2022 03:32:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 03:32:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 22A9C100193
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 04:32:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1639A100191
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 04:32:02 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 04:32:00 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portalocker: upgrade 2.4.0 ->
 2.5.1
Date: Fri, 22 Jul 2022 11:31:50 +0800
Message-ID: <1658460710-27310-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 03:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97943

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Add dependence python3-fcntl python3-logging

Changelog:
===========
Added clear warning when locking in non-blocking mode without specifying
either EXCLUSIVE or SHARED mode. Fixes #77

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...3-portalocker_2.4.0.bb => python3-portalocker_2.5.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.4.0.bb => python3-portalocker_2.5.1.bb} (61%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb
similarity index 61%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb
index e3b55a7eab..55037d1ebd 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.4.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.5.1.bb
@@ -4,8 +4,13 @@ LICENSE = "PSF-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9273424c73af966635d66eb53487e14"
 
-SRC_URI[sha256sum] = "a648ad761b8ea27370cb5915350122cd807b820d2193ed5c9cc28f163df637f4"
+SRC_URI[sha256sum] = "ae8e9cc2660da04bf41fa1a0eef7e300bb5e4a5869adfb1a6d8551632b559b2b"
 
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-fcntl \
+        ${PYTHON_PN}-logging \
+"
-- 
2.25.1


