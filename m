Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B87FC742A7
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:16:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.13482.1678428961137254041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C6IFbx/7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428959; i=@fujitsu.com;
	bh=kVSt4G8f/Uf1p3KRzq9qTmVOTcrjSQj1bJZXw8UUBh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C6IFbx/7jcRstrbB3RiUFM4O/AeJWb5N6EtB/C4eYePFY5sL9TYgHpHHSuVyJZPl9
	 NTTI2UxzX+wwYblyc9a89gs26dyVXXjmP2O2PMS3/n8brU+ly8ju0N5TQiZfZmy+ej
	 Spn7xL9OXC+0sSTA7YSrmKIBtUZZJJL+DEsGJbR4z5+H7KUp+WuhDbkVn0rDQ3t0cc
	 nQabRoX3AuTTgMkE7A5YXkNtiesENlky2go20+hkFejaQ43lQmu6r48lKE6d+VMq0T
	 UZiRgT36xAM7TJ8ZUkRDoEcUI7v5WC+jwCHzARv77KHN1b7AuFxGxVrOct+WBhMVY1
	 +q2i7gLOUwhfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSVfuNFe
  KQUOvocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH/6Qz2gvecFY/mbGVqYHzN0cXIySEk8IRR
  YvPm5C5GLiD7OpPE+ca17BCJPYwSu7f6gNhsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N0DV
  i8s4Cgx//8ToDgHB4uAqsSppyEgYV6g8K9jU1lAbAkBBYkpD9+DtXIKOEncfdvHArHKUeL3k8
  XsEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZeboeZUSDROP8QEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2ikl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYuCnFKsk7GL/1/dU7xCjJwaQkyqucypUixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ37
  wmgnGBRanpqRVpmDjCKYNISHDxKIrysO4DSvMUFibnFmekQqVOMuhxPr17ZyyzEkpeflyolzs
  t6HKhIAKQoozQPbgQsoi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuaVALmEJzOvBG7TK6A
  jmICO2LWFA+SIkkSElFQDk9PMO57uklNMpCzcbmmHtJz8tH1Pz1fvQhapRDX1glf8+adOHrse
  /Gmryd13aY6cNanvGv+Ucosw7D7+JK1vu5rPoje72jlLd/2JFHGbsfh+mmdwwC2H+akTn8acd
  bi84dQHnjuBX048P/goI3uK9s1pR+7sE/9tbeL41zT6wcYH8gsDO9W+r721ueH6hz75+rS7CR
  svX9lYP9fT+v7v8w9W3q2Um5vWeycqlO+v6JYJ3CaeidM3vqniYZN8EmTZw7P71AxttqzHcr1
  sAcvmfdNT/Wrvupvr4jWfGy/6vkzTWzjnzXODjynf9H6+VemI2lY0JcPhxuSpoq6LttlqXX3W
  zM3+/KBdyrdLGq+PpPkpsRRnJBpqMRcVJwIApL9sOWMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1678428958!50133!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22696 invoked from network); 10 Mar 2023 06:15:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:15:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 82C89100346
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:58 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7699B10032D
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:15:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/11] satyr: upgrade 0.40 -> 0.42
Date: Fri, 10 Mar 2023 14:15:36 +0800
Message-ID: <1678428937-7700-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
References: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101481

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Find crash thread before stacktrace is normalized
Normalize both gdb stacktrace and the crash frame (rhbz#2168223)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.40.bb => satyr_0.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.40.bb => satyr_0.42.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.40.bb b/meta-oe/recipes-support/satyr/satyr_0.42.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.40.bb
rename to meta-oe/recipes-support/satyr/satyr_0.42.bb
index 1ce28f1f0..62cdad6fb 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.40.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.42.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native python3targetconfig pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
            "
-SRCREV = "61addf12d15ef9d0bff5e3cc26e08d08a4f88094"
+SRCREV = "23483cebb238df86cda8b6529e3c58080dc2029d"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.34.1


