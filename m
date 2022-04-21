Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EBAC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:13:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6985.1651130012012541900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=okni/O02;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130009; i=@fujitsu.com;
	bh=SGBM3Eaxd4t2mK29YWllpDfwZ2Q7m+bSAztojoIo6mQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=okni/O02hUUz+jNYhxv7QYrvNatBzvcv4OcroPVI4TW19WM4bOqlYGdt8YSNAUj5X
	 dcUxICdTl9Kb3EQl1kIeRvD46jtBVjhN5KwyrEUQbFUJa4CmvDh0tWl0rdOLw3FTIk
	 nk8UGPMNNyN2Y+cGp6HNdRzV8bSs9PaZkHsVlgMN/V2ieJ0rkqg4fs8JMQJHmEUwZQ
	 eMEZvpadLklTZOSqkF0Grhq4mgws63ebDkUp3LNYsnjfwgZM4RZLDPiYfTki9dtTfY
	 oxkodcUnD9EO6AOiQZU6MIX2j9GVxDeXkkwdV3d14tm7b3JOrY5zcx6o4oBZY+dfUG
	 20CBjAZsO9bFw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqDvTLiv
  J4O0dCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNwk23BfO6KVTtkGhi7uboYuTiEBJ4wSvTs
  v8MC4Vxgkrh34T1rFyMnkHOAUeLUCncQm01AV+LFj8UsILaIgL7E0tl7mEFsYQFfiQ2ff7CB2
  CwCqhIdl6ayg9i8Ah4Se7svMoLYEgIKElMevmeGiAtKnJz5BGwOs4CExMEXL4DiHEA1ihKzp8
  tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0S6pKDM9oyQ3MTNH19DAQNfQ0FTXHEi
  ZmeklVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMvpdht2Q7GfX0/9Q4x
  SnIwKYnyWplmJQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4FWwBsoJFqWmp1akZeYAYwEmLcHBo
  yTCK2MMlOYtLkjMLc5Mh0idYtTluLtw715mIZa8/LxUKXHedFugIgGQoozSPLgRsLi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNxRkCk9mXgncpldARzABHbGyKBPkiJJEhJRUAxPH9xm
  XFjjFXDPMXnVZ32GT6JrfFzikVwfPC9bW/PT82dVJrUt4GdwKmz2jzz45l3ra6KcrY/HUVxre
  pmkTw0vVfilt3rnFXG21dvbd3OmLgoQ/zm8/tij2vv2DgtYaIbXAq5svM3g551yZpnZiSab4F
  p8XAtfsu499vntG8bvBbrWdco9n/ZwUUJPwX/Ouw/s1mW+PLNy13Vw5c7nsiiyLjjMqLpNTbO
  bybchjqC79uV9/5yRu3+zwrl93v31/sPjCmen6cyWnfdv4ZzL/mi8y0/0+SZ3TClJtDe3wfs6
  lI3o9NmHLM74y5yamwv5ZrlL+/LwiHn/ufnH63B2VJ14am7qH/eRaPZPrE4XEcmYrsRRnJBpq
  MRcVJwIAYFQv80YDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-528.messagelabs.com!1651130009!25883!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5649 invoked from network); 28 Apr 2022 07:13:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:13:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E20C4100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:13:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D2F3210018B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:13:28 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:13:13 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.17.0 -> 2.18.0
Date: Thu, 21 Apr 2022 17:58:14 +0800
Message-ID: <1650535094-15264-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96831

Fix
==========
    Do not pass optional kwargs by position in tifffile (#794) (512fe11)
    Ensure pts increases even if pyav doesn't flush the frame immediately (#787) (5b74e8d)

Feature
=========
    Allow writing bayer formats in pyav (#788) (4596262)

Other
======
    Update imopen types (#793) (7ecea02)


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-imageio_2.17.0.bb => python3-imageio_2.18.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.17.0.bb => python3-imageio_2.18.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb
index 53f61e8827..2aa6b096bd 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.18.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "b21f009e52eb22b02b839f3bf2ae5374aaf0886317313c1358c6014e5383b539"
+SRC_URI[sha256sum] = "090898c48532631ab11c74ae743e64c24dabda45c16db46f7e3bec9e2d8f422f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


