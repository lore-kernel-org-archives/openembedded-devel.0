Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBC7C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:44:45 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.4250.1646822684752345826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qL6be8EQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822683; i=@fujitsu.com;
	bh=O0UAhIvGvsjgQ9fh0cvaXbF0HhSeynqc/bTiqk/okQg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qL6be8EQ1j0E6ucvferMoGWAlm8S+B0n/FvEz4YxnhQy8VB6XB7p1rQwycLgO7pTO
	 v6cUV8aAUAjw3S2jf3mmPnJLbTlo2sP7iyKDzyxn1dN/kKT6jFYGkKzPcVVEa4Uk30
	 66ujc94N6KxUoak2eCyfzuYQfFxtifHP+Dvu0Yvk8sEZ4J2e7RKm+pxGHEjsjfXJ3W
	 TBiS+u0NtGk9OEhakxHNjlLJBbEMI1vr5I5tbPIQtaQW2XmW6oV4q4AfRscgUDf6Mi
	 Zx9tjEywiTcCh/1z3zgQlESuer3JGzydQ9thEhPgrHtancIjjQ2lfCFIYZ6XP0WOPT
	 cPP9D6XgneB4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqCvVqpF
  kMOmRjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFu6T/mgo+cFVfebWNvYGzn7GLk4hASeMIo
  8XvFDmYI5wKTxJwlz1ggnOOMErs3zWPtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBX4u+2A4wgNgtQ/GnLOxYQm1fASeLivnawGgkBBYkpD9+D9XIKOEu8OD2TDcQWAqo5ff
  oHM0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGu6SizPSMktzEzBxdQwMDXUNDU10zU11DCyO9xCrdRL3UUt3k1LySokSgtF5iebFeanGx
  XnFlbnJOil5easkmRmA4pxQ7btvBeKrvp94hRkkOJiVRXplgjSQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErydTUA5waLU9NSKtMwcYGzBpCU4eJREeD/XAKV5iwsSc4sz0yFSpxgVpcR53zQDJQ
  RAEhmleXBtsHi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYl68FaApPZl4J3PRXQIuZgBb
  bGamBLC5JREhJNTD59v2es/P7ygvOsf5W0/jCHWuL4rJY3IrFHs38Zrq1Y4Kiy7X3Lxnve222
  1ZgRsrW57Pn6gjV3Jtd8zTvOKeHM0tHA6W38uENnmsx73sjS7Ay94w2PNy+LaXpYdrK5fztn+
  6Mai/8fS9hza+cKSNboTIo799PjeHjLzo73ZoEL+mOXtvIK3u/cfH7zRQOpbyd1Tx111igPO8
  1SsnaJ9MndmgtWHVy7k7Vsw8cuQ0vm2h621zfK0spN3zE85Un/9TL32n21E49+H+94u8/KVmh
  B14kTC6Zui39QzPFdOpJ/X/elOeJJEx8w1Kie57/y9GlyyalJFa/3B+Rxnsm+MOmy32azLy4X
  omos3efcu7ZYiaU4I9FQi7moOBEAFxrxJWIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-545.messagelabs.com!1646822682!3444!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23914 invoked from network); 9 Mar 2022 10:44:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:44:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2B82510019A
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:44:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1DAD8100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:44:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:44:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.16.0 -> 2.16.1
Date: Wed, 9 Mar 2022 18:44:03 +0800
Message-ID: <1646822643-61935-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
References: <1646822643-61935-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:44:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95901

Changelog:
=========
Ignore TIFF XResolution or YResolution with 0 in the denominator.
Add section on freezing
Update "python_requires" to 3.7+

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.16.0.bb => python3-imageio_2.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.16.0.bb => python3-imageio_2.16.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb
index 04d5b9c95e..d1d318d5ae 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.16.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "7f7d8d8e1eb6f8bb1d15e0dd93bee3f72026a4c3b96e9c690e42f403f7bdea3e"
+SRC_URI[sha256sum] = "7f123cb23a77ac5abe8ed4e7ad6a60831a82de2c5d123463dcf1d4278c4779d2"
 
 inherit pypi setuptools3
 
-- 
2.25.1


