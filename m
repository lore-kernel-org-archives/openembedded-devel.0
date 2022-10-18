Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF873C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:16:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.1845.1666055806518447229
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l+PHb/Ww;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055804; i=@fujitsu.com;
	bh=IjlYkY3Gw7B9EHr7gsbqGUyQ1B1w0IFPmRtzAe5MBvU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l+PHb/WwGHTvDP7hauFxKqpzEvF8S8n2w1AVeCBiAVtGdmENVANHQPI6Q+rXPk8/L
	 IWXSiHfgXPxWtEh+nHrJRMOyukZ5+OKIvqEUU3dlUlg9zcgjZURpbND1AbHF2AEGQ3
	 u9uRFrZbcbeGGaTFEtaNgkwWK1YZ2wRSRNLhgmaRN9Ttl3fAd9ngcl0e/go9PM8Tlq
	 zbMFkzbFuAp6ktXWSGMd6NyEzMY99j7l4PDtgPLUMaxoVbXalaqIpZZj1lZSBsX5l4
	 ebr6cJb+GG+oabsK2Hc5imVEo8yDuGQSzcaUOWFFKQOyxNP0xD8zre7sRPRU+6cFvD
	 Sg1Eo3x4IuPWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8OxWbf6n2+
  ywcmZlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bWPvaC+ZwVvYd3MDcwnuHoYuTiEBJ4yCjR
  s/ArC4RzhUni3JmLTBDOAUaJXbPWM3cxcnKwCehKvPixmAXEFhHQl1g6ew9YXFggUOLlpg+sI
  DaLgKrEzbmX2EBsXgF3iTPbbjCB2BICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+A4hxANYoSs6
  fLQ5RXSMya1QbVqiZx9dwm5gmMfLOQdM9C0r2AkWkVo1lxalFZapGuqV5SUWZ6RkluYmaOXmK
  VbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmDIpRQnOO1gnLLsj94hRkkOJiVR
  3o4ZvslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHi1/gDlBItS01Mr0jJzgOEPk5bg4FES4Y06A
  5TmLS5IzC3OTIdInWJUlBLnjf8LlBAASWSU5sG1wWLuEqOslDAvIwMDgxBPQWpRbmYJqvwrRn
  EORiVhXg6Q7TyZeSVw018BLWYCWpyx3wtkcUkiQkqqgSl7522zzv8HL4iFy9Z+sWc4bdUdd8+
  Q0dNn2evso951l7o0J+UqLN5x5NSzc78DZOIYlv2dzvfdYf2L0P8CHD3yn6Zd+24W0bm86JRe
  6oqrOitZ+xLjUq7ff//7WnHnnR89NyYemVZUFMVbfohNym1fpOORrY+8nqVetmHtkAiI/MLUu
  erogxcPz97sO7vfxMUu8tuaL7GTeDMeKdW/OvRV+On+Z2KivXK33u7kYDG4UXiZ66MZW0Gm04
  dmtq6MvhOhr+N2z15jcMjg67Ho88td9jyc/yw6J2bi/+Q9krd39gmt0r4drvn72/3OGyd+FkT
  0te3cfL2kkM3BhSVD5I/uwY5l59OOVYXZ9u/2V7mmxFKckWioxVxUnAgAefADTzQDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1666055803!59961!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4168 invoked from network); 18 Oct 2022 01:16:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:16:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5B641150
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:16:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4F1CF142
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:16:43 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:16:42 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.4.0 -> 5.5.0
Date: Tue, 18 Oct 2022 09:16:33 +0800
Message-ID: <1666055793-2517-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99229

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-zopeinterface_5.4.0.bb => python3-zopeinterface_5.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.4.0.bb => python3-zopeinterface_5.5.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb
index b048c80e13..015ec0e3e7 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "5dba5f530fec3f0988d83b78cc591b58c0b6eb8431a85edd1569a0539a8a5a0e"
+SRC_URI[sha256sum] = "700ebf9662cf8df70e2f0cb4988e078c53f65ee3eefd5c9d80cf988c4175c8e3"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1


