Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F45C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.8256.1676196134910546708
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 02:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AW8jUf0z;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676196133; i=@fujitsu.com;
	bh=2Cdj4fg+M4jF0q9MzTX3rfcaLNSiE651RgozRnMW9K0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AW8jUf0zmfGSfrHl0e4XLWRuRe8ImJFkdMZW25rtZiAMwezomUleI2y6fpHBjcNuc
	 Q42LISDRbfg4pLKz/bjTTaqoM5iUId3MEvO0EDOfS5S/p5cCpdyvSAoB/X9DYCRrKT
	 U47PEzQe6XLAUn01bIgE10EldpY1uOMpKd5nAL9MFa+QQlyGaT1cpl8uchsLHpdkAq
	 +ps4Ybew1GrsaQeBw8AVut0On5Mm6rzck1wXQyeAXQ7wuvHGmhqfMnqNbJi7VdLxwo
	 C1cXla4kq2qAXirrkLOW18DikogXTe3rVlWZg9IK9hwVtVhBcFXQjBoMVcqGRC+iYu
	 Q8WVk+OEgt0wg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqKuy80W
  ywZHN2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brFbYF77grVm/YxNrA+Iyri5GLQ0jgCaPE
  uwtfGbsYOYGcG0wSn5bmQST2MkrM+L6LBSTBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvRM/NBiYQm0VAVeJf830wm1fASWLOuwNgcyQEFCSmPHwP1ssp4Cwx48x3qMVOEtv7u1
  gg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzdDzamUaP3wC8pWk7h6bhPzBEbBWUjaZyFpX8DItIr
  RtDi1qCy1SNdUL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7Vk
  EyMwcFOK1XbtYJzQ91fvEKMkB5OSKO+yzU+ThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw3tj+I
  llIsCg1PbUiLTMHGEUwaQkOHiURXvF1QGne4oLE3OLMdIjUKUZFKXHeDyB9AiCJjNI8uDZY5F
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz7fgvQFJ7MvBK46a+AFjMBLWaQegqyuCQRISX
  VwOS87pzS4g3x73PkyhrNrq59nm7fGbUh5vm0Jftn2UT9LquYqX311+Ujp7XW29fEKqv4NUQk
  vlAIUetqUeULZi29IXLBcYWb4uain4whTZrLF3TLB4nyNt/Kf8j0z2j2qt16Jt2eqZ0s5dGcM
  nF8ja1OXLs56nwEJwpyb1sSpzw57YVtRnrMiW8WVjdk4kx5BV8FBz/cs6vpkOwMM/FDhzgvyG
  yMfJIstHua0Lztv2/uz3xa/L6kbJ38E/kPu42Peultf9SZsJY9fkrp4XOayxLbvvAKyQuXa1t
  ve6bsN2Fv1UaOjw8svXhvlJ/m5l+pavs3cpKlOPfjG80V+3J+FNznnFFTuEU2X+fs6lNpSizF
  GYmGWsxFxYkAco4oylcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-548.messagelabs.com!1676196132!236008!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14354 invoked from network); 12 Feb 2023 10:02:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-25.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 10:02:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 66064100182
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 594CB100043
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 10:02:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.1.1 -> 2.2.1
Date: Sun, 12 Feb 2023 18:01:51 +0800
Message-ID: <1676196111-13722-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
References: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101052

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Fix mixed content extension without explicit mixed attribute (issue #334)
 Refine string serialization of XML resources and data elements
 Switch to use elementpath v4
 Fix sequence_type property for XSD types
 Remove XsdElement.get_attribute(): unused and doesn't work as expected

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.1.1.bb => python3-xmlschema_2.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.1.1.bb => python3-xmlschema_2.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb
index ff7e9696d..f643a140f 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "5ca34ff15dd3276cfb2e3e7b4c8dde4b7d4d27080f333a93b6c3f817e90abddf"
+SRC_URI[sha256sum] = "035939104bacd0ccefcd591220cce90d160d71f17189ee332a011c3fd05c086d"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


