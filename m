Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1F7C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 23:39:22 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web08.2619.1637019560676269553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eyTHgFP3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637019548; i=@fujitsu.com;
	bh=aRXC0/hhTEK+9PJbgHyxWF8qswVbksdLLGApwQKGFJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eyTHgFP3QhJbbABcwDrQIWcURf0DeCyvBA+7+O11ZGdGEH9x6kzFFLrQ77bIjwt2/
	 44Ru0LmGrdqqFLPVqnu++ZWpuAwUT6OljVqhv9nNjCX1j/ZLi2BLNn7NPJkRwGfI5s
	 FurUbOrhKkjOIU1FINNtfGDC6KLzxvEkDYldUrfRot0hoDsMlYvnvhVir3UKvfvl6x
	 XlPZrhPqxH1I+tELz2qjR6pxtyvCEA6b81VRKu0Nw1HVBy47YPTrFOIUuBypPjqKdZ
	 ev3Djqv89dx8il6O/MIHsaICnERaywfhpQHPCFPHEh+OGU2fC5z8MLhgJqTOQ02s0F
	 T+iE7rR+v+PCA==
Received: from [100.113.2.75] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id CD/26-11692-C9FE2916;
 Mon, 15 Nov 2021 23:39:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRojv7/aR
  Eg6NfbCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ow/zTcZC05zVJx/sYSpgfETexcjF4eQwEwm
  iSVfrzJBOCcYJTrvf2HuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897CC2sICjxMN/p
  xlBbBYBVYkjf/+AxXkFnCTa+h+zgNgSAgoSUx6+B+rl4OAUcJbYfrwWJCwEVHLpSytUuaDEyZ
  lPWCDGS0gcfPGCGaJVUWL25WaoMRUSs2a1MU1g5J+FpGUWkpYFjEyrGC2SijLTM0pyEzNzdA0
  NDHQNDY11DXVNDfUSq3QT9VJLdZNT80qKEoGSeonlxXrFlbnJOSl6eaklmxiB4ZhSyGi8g/Hg
  6w96hxglOZiURHnjFk1KFOJLyk+pzEgszogvKs1JLT7EKMPBoSTBW/caKCdYlJqeWpGWmQOMD
  Zi0BAePkghv4i2gNG9xQWJucWY6ROoUo6KUOO/Lt0AJAZBERmkeXBssHi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuZd8Q5oCk9mXgnc9FdAi5mAFtvf6wdZXJKIkJJqYJq+IpQhbMNE0fC
  ZVU2dbSekec8v1n691P55yXOHFXL1B0sV7z48ksLKOqvvrNm2gk/1tQfYdL0WTm5NKXqy5I7g
  Zf9L0ZesNPduOLFy/a/yvxPKF3fuuPp4p2y9ZeXhd1U32RWPnVNYsH3/gmlTog6e0c7aNpfv7
  5LfpceOGkaXPj1vIHfAeK/zr5cXZdPW3T2xc5vVqdUzZ7zilToetVFaK0B/24vHIc2dWQXVh/
  OD36zP375tSVTgGZX/22YuavyePzljStZ3zqeqj+dtMPUzSvnGcOqH9j7ruesm1+xX7t65JKv
  w8+RsyX3X957Zzles/eu963JR9+XuO3Jmcu3QVJV6fHljnnHT3KK5lw38+ZVYijMSDbWYi4oT
  ARlAB4RCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1637019547!1048628!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27440 invoked from network); 15 Nov 2021 23:39:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 23:39:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AFNd1A6029756
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 23:39:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 23:39:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.26.0 -> 1.26.2
Date: Tue, 16 Nov 2021 07:38:49 +0800
Message-ID: <1637019529-79932-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637019529-79932-1-git-send-email-wangmy@fujitsu.com>
References: <1637019529-79932-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 23:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93961

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.26.0.bb => libmbim_1.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.26.0.bb => libmbim_1.26.2.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb
index d6b812c2ab..5cd2a7e074 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.26.2.bb
@@ -12,4 +12,4 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1e1f0926b22c77210442129eca689722ecf324ab9c9abf421a5c989f46e813cf"
+SRC_URI[sha256sum] = "10c77bf5b5eb8c92ba80e9b519923ad9b898362bc8e1928e2bc9a17eeba649af"
-- 
2.25.1


