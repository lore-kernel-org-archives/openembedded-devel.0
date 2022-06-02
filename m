Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B808C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:38:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.1721.1654133919448805125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Kt1pkosF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133917; i=@fujitsu.com;
	bh=ClKpjVoGWkETvR2FqpAghYAR3abzDxMOXwVkxqbmjDY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Kt1pkosFlZlnWWFZvUrVLemntRwIPPK9nEl3fN0vzhpu0LxcdhZZtvAn91a4fqG0n
	 yUJHIxJ7mGMde7iOO3ZdH8oj0ZPZ3vDYx6K3xrJvc0DhWlQOomJmm6BznnDHWJbhtQ
	 /cWehRhuvDYCoRstNhHdTTt4BrpL2+4lef373yTTc20kKXU1ZbHyWgyzga7Rdvvrr3
	 +FrXnIjgtqmhW+EbURZnPHXJ0F8A+CmJkwG48A9lJwbB27ziBihB+qVoWimSMldi1q
	 kwZdO26rceDKhi7p586vFZ7BFX71jXe8BPx8hiQi6xwM3rkXlxCjaPTnLrPGPQfGAR
	 T3ziyE0dONpEg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORpDtXZEa
  Swazr3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a6q3kF77gqbk/XbmCcydXFyMkhJPCQUaLh
  ZXUXIxeQfZZJYsXMFkYIZz+jxMKzfSwgVWwCuhIvfiwGs0UE9CWWzt7DDGILC8RJvH3xhw3EZ
  hFQkTi68DETiM0r4CFxrXEVI4gtIaAgMeXhe2aIuKDEyZlPwOYwC0hIHHzxAijOAVSjKDF7uj
  xEeYXE68OXmCFsNYmr5zYxT2Dkm4WkexaS7gWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjXU
  NzS31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L08lJLNjECAy+lWHHzDsaJK3/qHWKU
  5GBSEuXd6Tg9SYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr4fwjCQhwaLU9NSKtMwcYBTApCU4e
  JREePMYgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLnvQQyQwCkKKM0D24ELCIvMcpKCf
  MyMjAwCPEUpBblZpagyr9iFOdgVBLmDQeZwpOZVwK36RXQEUxAR1z7NgXkiJJEhJRUA1OJ0Pz
  CGSunrn7u931C4/Lols/Zt5Y/379zzYKVuxLCfv/WMdTtmq2lW9npE3CFKTsqJSBn4X7ROY9k
  vPfZCNmf3R+4umSy8aFcl+tuYufzXm3LnDc75PNu4RDDOZVpu18+Yb+52jT+M99X/bvpE78r/
  FU/yvgp/ER/R2ed8fmWnAXPFmZMCxBhu3YssSu69/dlVfv4FJkY/2IHw2qXUL7U/JvHPB2L2/
  My1qQYxS7wdBEQbbV+Ul3mt7h607Z4vZQt/1+nRt6deUXmwVGjK4p7BI37p76zfqXfzGPh6nS
  xe0nOWxaLXcfOvBGsm/M+L7Jao+jiRP38iaXtFm9fR9749m+HudWzR9Pv7r6fdE2JpTgj0VCL
  uag4EQCLIyQZQwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-548.messagelabs.com!1654133917!57793!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21431 invoked from network); 2 Jun 2022 01:38:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:38:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D42EDD78
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C75A0D61
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:36 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:38:16 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.48.0 -> 2.49.0
Date: Thu, 2 Jun 2022 09:38:08 +0800
Message-ID: <1654133888-29447-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97375

Changelog:
https://github.com/googleapis/google-api-python-client/releases/tag/v2.49.0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.48.0.bb => python3-google-api-python-client_2.49.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.48.0.bb => python3-google-api-python-client_2.49.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb
index 35caae152..660262e62 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.49.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "600c43d7eac6e3536fdcad1d14ba9ee503edf4c7db0bd827e791bbf03b9f1330"
+SRC_URI[sha256sum] = "629bbde991ce2d9697c6da37f2416f7aeb01ba01505b166066a415b3c3ce1dfc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


