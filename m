Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5B3C4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6261.1640012566767446202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IjK5Rxxh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012564; i=@fujitsu.com;
	bh=jujKyKg5rAizR49K58PrjmYtG3I2nUrz0518j26vOF4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IjK5Rxxh2MGpHwLNiGd+mP+wpDgqrgwUpM/tbu0yosa0MYpkGZcWCogpOKSLl3ecw
	 qaBnKbE+FekLg4FAJ/17QuG2dHkz41zBxilkw0pKlp9x71M09ZMyOhUy/2YLevC90F
	 YtKPxDl3UMTtV9FyvA0fxMiH1cttTWsq0Y49z1cniPtypfMvb6QlwJ1skjNNzATvJL
	 f3m/nRQwXcGQC4+QvXCKmR71nCF5lriVfF0j1QVGSWMq5uJnlfRnQoS/6shjwpur2m
	 BqE1ZQ6fxXV9//IJlXf9FmNlTzwj03t9fM3O1pBe3qa9sICY0Irf8lPc9yXh7Blzeh
	 hqxa2cbM0ltDA==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 0E/64-13695-41B90C16;
 Mon, 20 Dec 2021 15:02:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSVd49oF
  EgyPLjS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owF+4wKznFWfPlxkaWB8QpHFyMXh5DAE0aJ
  R0cfsUE4F5gk/u/eCuWcYJS48nY9YxcjJwebgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAtYS7bsfg9WwCKhKzJi2BqyGV8BR4uWSN2A1EgIKElMevgeLcwo4SXydthhoPgfQMkeJt4
  +LIcoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJhVlpmeU5CZm5ugaGhjoGhqa6proWhrrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEBnBKMUvsDsatfT/1DjFKcjApifLy+x5IFOJLyk+pzEgszogvKs1JLT7EKMPBo
  STB+3MGUE6wKDU9tSItMwcYTTBpCQ4eJRHeJpA0b3FBYm5xZjpE6hSjopQ4b9wsoIQASCKjNA
  +uDRbBlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86aDTOHJzCuBm/4KaDET0GKl8P0gi0s
  SEVJSDUxF85sbmV2NXEwiW+0OW8lJVgQIFvRMubfhk/aUd+L+kq9uaf+75mS9sEjGo3Ud57Pf
  Vxhu3no+R+nuGYN4h59fO9/sC6/f8+Bf2hmnhyVPg35NOndfkiMp/IiVeHfzxKMbf3191Oinz
  tla+1tYMJnBJOOiq3HSKx4P7oLgbJ/FAUlP72SvOr//f9srm48KyX8/OgXanrX107BqXpc14U
  1IjmzSjw3qva9ZuTcUn3y+aYeWjn/mrKUZ9XYP3iR/2BraVbW9aKF+Qmf8Ru/K0EvJ7Z0/Pil
  Zm4lr37D+9snv9+LFcvO09jbeXFX1SqXpqejXx9XfnzJxKxdIBr7L77GXNprbwbF7CuvZkDLn
  OUosxRmJhlrMRcWJAJmVGPRbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1640012563!5719!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22108 invoked from network); 20 Dec 2021 15:02:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:02:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 63E0C100459
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5737B1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:02:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.38 -> 0.39
Date: Mon, 20 Dec 2021 23:02:21 +0800
Message-ID: <1640012542-3632-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012542-3632-1-git-send-email-wangmy@fujitsu.com>
References: <1640012542-3632-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:02:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94448

Changelog:
=========
Use g_malloc() and g_free() instead of malloc()/free() in many instances
Fix call to a deprecated in Python tests
Add test case for sr_rpm_package_cmp()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.38.bb => satyr_0.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.38.bb => satyr_0.39.bb} (94%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.38.bb b/meta-oe/recipes-support/satyr/satyr_0.39.bb
similarity index 94%
rename from meta-oe/recipes-support/satyr/satyr_0.38.bb
rename to meta-oe/recipes-support/satyr/satyr_0.39.bb
index 4cfa977c8..732a1440e 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.38.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.39.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "ad0030f071b7ce7eb748eca3c31cb381038e2b21"
+SRCREV = "f8a0dbfe7fcc6e44f03d66ca5c81363aea318380"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1


