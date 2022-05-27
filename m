Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DCBC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:40:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.2757.1653615653507341500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L1t4gMEZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615651; i=@fujitsu.com;
	bh=SBWn/Mc+jBkIbhAQzBx2vb2sbkOXZbe3dyUIjsIzFxI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L1t4gMEZ8HnQmSPQu6b3gMDgOxIFtuagWwqXip3cLOt+svZEKnr/bGgMjWrJPDtgJ
	 eFWsnVPaQq7wmBWfV/voGthJidjAMs1oUYQbFJfGluNyaUDukraK63T+IabxyGDPU0
	 AzOHdnb32NcJ+RsF91HDxwMiWz/R+t8HLRhWa7xAVmz9jRicokfLEVjeuE4YCxaCY1
	 JV2ZJFGEtV2Z1MjShRfKJFzc+ciAfLy83xIkWboGg03LT4ee6y/0ZZyIEwVG9Wh14C
	 xt+1l6SaG3MKrAcExEdXyg6YK5/kwqUarrugCyAxwyhIzsD4qBmlNrl5efj/6zYnsL
	 UlHerIQQ5TOjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8OxWVdJZ0K
  SwaV5VhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a1xslsBee4Ky4tOs7YwLiNq4uRi0NI4BGj
  xPyWJ+wQzlkmiTWHXrN2MXICOQcYJfZ3KIPYbAK6Ei9+LGYBsUUE9CWWzt7DDGILC/hIHH3Yy
  ARiswioShw6cJkRxOYVcJf4cXU1WL2EgILElIfvmSHighInZz4BizMLSEgcfPECKM4BVKMoMX
  u6PER5hcTrw5eYIWw1iavnNjFPYOSbhaR7FpLuBYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdYG
  kkbFeYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZg6KUUM1TvYPzf+1PvEKMk
  B5OSKG/mvf4kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8W7QmJAkJFqWmp1akZeYA4wAmLcHBo
  yTCqyQDlOYtLkjMLc5Mh0idYlSUEuf1AekTAElklObBtcFi7xKjrJQwLyMDA4MQT0FqUW5mCa
  r8K0ZxDkYlYd6nmkBTeDLzSuCmvwJazAS0OJ+3F2RxSSJCSqqByfju7IQqdt2eyvdLjqZbKPm
  s2hG//oefkrBKbOv36KzzV9fMe8c0/7JacNKyrBvzDe4a5iayTGnI6mtUXvao1KF8Q2Oc3ION
  +02ZHq47US8/tXJlrthb/i86F/XfseT9nCpqKMqUflHDPK/n0fXjy/dGPewWS87MN4u8GL2na
  ndW4jP+Avvz3yf79a5uyjl197TfueB7dXrJa+uNq2/7NVb1HmRrLLc7Nc/zgsjk7vzwBInzji
  6eCrq9M+7q3P3TZuMsaXbAeJnc/l+SLw5unrcgljfoAZOJ3BWd87HetSyPnvJ8fHvvktGp4Pi
  LUkFZG8pPaE+zExB8IGd5VcFZbKtjzY+WiWsMdk9jFfRUYinOSDTUYi4qTgQAREKInDgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1653615650!98084!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3250 invoked from network); 27 May 2022 01:40:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:40:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 87A432CA2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:40:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 786D089F
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:40:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:40:44 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.0.0 -> 4.1.0
Date: Fri, 27 May 2022 09:40:24 +0800
Message-ID: <1653615624-2555-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:40:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97300

Changelog:
==========
Added
------
    Support Python 3.11 (#13)
    Add Arabic language (jmoiron/humanize#256)
    Docs: add dark mode toggle and default to system preference (jmoiron/humanize#255)
    Documentation improvements (jmoiron/humanize#254)

Changed
-------
    Update repo links (#2)

Fixed
-------
    Removed VERSION from __all__ (#11)


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-humanize_4.0.0.bb => python3-humanize_4.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.0.0.bb => python3-humanize_4.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb
index 86eed7338..df5a4e9d5 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "ee1f872fdfc7d2ef4a28d4f80ddde9f96d36955b5d6b0dac4bdeb99502bddb00"
+SRC_URI[sha256sum] = "3a119b242ec872c029d8b7bf8435a61a5798f124b244a08013aec5617302f80e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


