Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B941FC64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:07:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.6887.1677928024711008601
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Gq0EZFu6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928023; i=@fujitsu.com;
	bh=wOLbFYhX9qZRopdg67g2A4PcPqIZ6Bx9lgjvAs9b2DI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Gq0EZFu6QevUmSMPp8zXc+ODqnb4IOx35q18RYoSQ3CtRCj1T+Q2NyraIansxz/3r
	 yJZwXPzX56RkxFeGW1IKTxhVoadJXFBdCNB87fAwBAj/Vqgn0cA0QiW8n7AZaYKVBJ
	 PuVl1airnsDLPNRlbTYN1ZG7sURoz7bVwRswLGCXlI89KkkAEnkHyRXtvCY/sBGQPk
	 f8sMr+gPgpRkBn4r49Wg8l6hObp6VbwDG/OIBiuyPlTlUb2Sd4eNEZ+W4smVlY3jst
	 wDJrBYMECDXluYt13aVqkc0y83AVG4dJDrJLSOJ+q+vrGpSYzrDgy4QCMUzB2tHXEb
	 U1lcZTm5/2JGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBumxpx
  i8Oe9sMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtGxagNjwXXOihdH1rI0ML7j6GLk4hASeMIo
  0bp0PiOEc4NJ4tnstWwQzh5GiYMP7gFlODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCV2L5sGVg9C1D80JR7TCA2r4CTRM+05WD1EgIKElMevgezOQWcJZr+fQKzhYBqbrxvZ4
  GoF5Q4OfMJC8R8CYmDL15A9SpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGRaxWh
  anFpUllqka6yXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJ
  ERi8KcXMfTsYv/b+1TvEKMnBpCTKO4mVIUWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+MKnOKk
  GBRanpqRVpmDjCSYNISHDxKIrxbRIDSvMUFibnFmekQqVOMilLivALKQAkBkERGaR5cGyx6Lz
  HKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t2iAjSFJzOvBG76K6DFTECLNU4zgCwuSURISTU
  wmZ+MEnib8LeepyVzzYSCj1xxOgFHankcj9hctWH+ctaUi5k78sT1yUYfqp4px+jf/btC63Ji
  5jadmlIm+TCTd3ezrKVyU/WL3/+ecttr7qJp/rsjn8997B7CenLnj/5Xq6UX7P00fZLh5cP8H
  UZT8zxeyd590fpKLc7d4dmhM/1PKleyCvmu3p7NuvCYpMjkuZ9FTv0rvF099btH85RlzVciYz
  Pib1tL8Zjx/vm1aK9N1NmMqx9N9guw9smF6H19+zZH8C5vdk9MzTeHn4GlKvv4ujRlzmyvedq
  +Zte+GyUhp7rWTJm5xV/0W7tY0SSF1RdbWfaUTP55cLN35/70VRKaMzxv1u3b8YmNw1tooxJL
  cUaioRZzUXEiAD7q4QtZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1677928022!149643!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14307 invoked from network); 4 Mar 2023 11:07:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:07:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EB43910019D
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:07:01 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE621100043
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:07:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:07:00 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.25.1 -> 2.26.0
Date: Sat, 4 Mar 2023 19:06:44 +0800
Message-ID: <1677928005-22986-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
References: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101369

From: Wang Mingyu <wangmy@fujitsu.com>

Feature
=========
    Collection of small improvements to pyav (#939) (b0dc210)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.25.1.bb => python3-imageio_2.26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.25.1.bb => python3-imageio_2.26.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb
index 9a9205c37..79e6dd731 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.25.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.26.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "6021d42debd2187e9c781e494a49a30eba002fbac1eef43f491bbc731e7a6d2b"
+SRC_URI[sha256sum] = "169f1642cdb723133fe8fe901887f4f1b39bc036458c4664f1f9d256226ced35"
 
 inherit pypi setuptools3
 
-- 
2.34.1


