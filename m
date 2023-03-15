Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B9FC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.8930.1678889192965640017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O2zM0p34;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889190; i=@fujitsu.com;
	bh=yXZRvZRBMSCa2GcV4g18YUS1yra+6RtC/OnWgYcB6XY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=O2zM0p34XFU07S79bDtHZkGQCwvM4FqW4GHmyBavCGTcD02oeEszSEMgM1XV+CBtU
	 UF+RhCIObCI26rKievjaK1gNGNgI/T2UfNlWVCQRXtoCF5XPFyOBLQ0Zb2LN+eXq3o
	 KOeTzoDQEnvhXVmhpSTTRungHnlT3nvRhmUzD8Umi7FsYAYEacsigyGlKkxpBwWsPF
	 cQJ5oS9WxgvwyZXRTQNlrFMIWQQfM5bzePn8Q/xkUdOVt1xIPNPOPusFNSMh1WcqS8
	 aDigKdz7sZZnVt2QwWnL70VnFfDDY0WrAaKlZ6DiyaopPztvYZBYi6I3opexoqdXES
	 4xohEca4QGArA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWffZBcE
  UgzNveCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy5Rz4xFUzkrug/fZ2pgXE7VxcjF4eQwANG
  iUUn/7JBOJeZJH5/O8LcxcgJ5OxhlNgw0wrEZhOQkrhx/z8biC0ioC+xdPYesBpmARWJF7972
  EFsYYE4iWnPr4LZLAKqEtsXnGcBsXkFnCQOvbnFBGJLCChITHn4HqyXU8BZ4sXJ0ywQu5wkFi
  1uYYWoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl1jvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA0E0pZu7bwfi196/eIUZJDiYlUd4/awRShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw/
  jsjmCIkWJSanlqRlpkDjCOYtAQHj5IIb+p5oDRvcUFibnFmOkTqFKOilDjvX5CEAEgiozQPrg
  0Wu5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMuA9nOk5lXAjf9FdBiJqDFvPMEQBaXJCK
  kpBqYbL6UnFrlnPrxj6KPs7bp/YeiGfrqqXVrVZJLV/Z+mTVP7N6csPuPZwb0q+z9rVHx6Y7B
  wQWSoRd7uZOF8l/df7Hz7W9x1yNPyw++zK9VNYvUjTkYlbie20qu+sHN06trVoqF1XXy6s+dM
  e21SIT31ONZVw8sC9+39olBUfO0jZMkVapMH+/8F3b5g7GjTObiVzbB93r7ipienvnlEzX338
  43r021BY4oBqi0zpvzP2BiU9W17RMfbitUm71+dVZj/OHWF3yKnS+TPgbcq+07ML/53ptH/vc
  mbK+N+JHz3djP2vGjxFSZxev1dhdOcM5gchfkVRTcrJl49uue9TsmH754i+XNtXv9Sd0xs7cp
  xCqxFGckGmoxFxUnAgA3E8cjWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1678889189!122264!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23115 invoked from network); 15 Mar 2023 14:06:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:06:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CBEB27C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:29 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BF2A973
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:06:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.80.0 -> 2.81.0
Date: Wed, 15 Mar 2023 22:06:05 +0800
Message-ID: <1678889166-20681-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
References: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101546

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.80.0.bb => python3-google-api-python-client_2.81.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.80.0.bb => python3-google-api-python-client_2.81.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb
index 75f9cf143..d471d9aaa 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.80.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "51dd62d467da7ad3df63c3f0e6fca84266ce50c2218691204b2e8cd651a0719a"
+SRC_URI[sha256sum] = "8faab0b9b19d3797b455d33320c643253b6761fd0d3f3adb54792ab155d0795a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


