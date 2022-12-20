Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3F0C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:20:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.48687.1671538837323492996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MShciqws;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538835; i=@fujitsu.com;
	bh=GudPeiIo5sG80S7ZIE2+yWRYtloeQfecgi7OsdqRwyU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MShciqwsflAjnO7uSz2zw+z8LfO3vdYAWlAjtm/5hu1OC/avYxcwheJVV+b8joO4H
	 29ZDSMyUjws7rhG87FoqYygONTUSsdTQ8lSp33CPG6NH1UsT+L6ZjlHBHqVD+FkETr
	 Qiu4SU6uTFW9ZHG54FNBYtlMuVFJwnQrL1NpxmIpTHbFMX/UGucVwVZfGwO9TN+EmB
	 ADqByuBlXx0Me6XNwKZBWN02SsZKUefDSzJlnKLrUiLmyOWeB0JMNvzh9K5E94h50P
	 iXjCRFLdoSx9KrHZJpZ5wyqgNQxq6cDtL4Wsl3a9LbVNafSZbGgZRkPO/XDKZnj9cW
	 SNJvbRFouIadQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSXfyioX
  JBq96uCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz3bzeyFWznqtj0/wJbA+MDzi5GLg4hgSeM
  Eot2trNCONeZJPp2zmWBcPYwSnyaOIOxi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBOInP18+wgtgsAqoSv59tB6vnFXCUeH5xC9gcCQEFiSkP34P1cgo4Sey7txaolwNoma
  PE401OEOWCEidnPmGBGC8hcfDFC2aIVkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjNilOLylKLdI31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECgzelOH39DsZ3S//oHWKU5GBSEuUNC1+YLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCd8YioJxgUWp6akVaZg4wkmDSEhw8SiK8PbOB0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0
  uVEud9sRyoSACkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmNQKZwpOZVwK
  36RXQEUxARxy6NBfkiJJEhJRUA1Ps5il8D3JeNGyLCJJ7OWHiBzO1srubAwy+67nN/NO96xvv
  v1lhsa4PTUzeTlmj8+zMlh+75zRqMTrGvbMV6D/0ufnYrvhpK0UWn1pWtOaHZXr9oy2sJ7NuL
  J/90bBoRs+0XnvFxi3Po+6zZimtiDixW2vlu3uMujNFFxXf+/L17hGOpBmb2JVKDine401dfP
  KH/uOgQDndBsNg9jU6yYzV/Anmbx88algWv3kWpxd3INfODRdvi94qv5B1686fXunZAoVLeG6
  /3t6+oGCx6aXEC4t2++9l3fUoKjx5dVemvpGHyq0jdf06HPc2P8zdqaNl43C2V7flY+e0lKZP
  1/OuNX9jW1W5JkCjSzt9K9s5JZbijERDLeai4kQAnYMmlmUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1671538834!383579!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9959 invoked from network); 20 Dec 2022 12:20:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:20:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 976861000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8ADD21000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:20:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.69.0 -> 2.70.0
Date: Tue, 20 Dec 2022 20:19:46 +0800
Message-ID: <1671538789-7206-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100141

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.69.0.bb => python3-google-api-python-client_2.70.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.69.0.bb => python3-google-api-python-client_2.70.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb
index b66709045..0e0a14ad0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "03624a28b5ba94f3c3d44761081f5dbf8cabaa20c5c3a96c046457c5713efb9b"
+SRC_URI[sha256sum] = "262de094d5a30d337f59e66581019fed45b698c078397ac48dd323c0968236e7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


