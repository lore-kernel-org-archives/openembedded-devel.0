Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CF8C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:20:29 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.26568.1640614819899495852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EvwFn8mA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640614818; i=@fujitsu.com;
	bh=zmfFUo4ONo18i1qo1MAjHwMOb046qBmhQfHev2Y+m0s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EvwFn8mAvrLKgnOYFrIwbA2R9/sIUZzZ1eMt8QklkyL4UBty5Acv7Ro/2JRIs1OOx
	 FqbexbzWfkTko16FkDkduSocMBCcY21YXt+LOq0djDrjttjxOXn932fscV1tDVZhDL
	 Pg33D5zkP2/gB/j2bXdlUFoXQJbSITqZ1et8S6c/tlWt0qjw0p8/Lx4CUmrLOwmg0G
	 ecaWCaUniFH1nc0iceVWQ83XfgOcAFjjg9zNjqM68NgDg4aBi16uGXq/HiiNPniUd9
	 XS7CeOKhmTo1Flsf8pIxB4jfajmZQqE5qy9qfqjtYpYqcSHRuhsqMoINJ21VDelBWm
	 rd3fqoO9rn2Uw==
Received: from [100.115.68.34] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 B2/6F-06990-2ABC9C16; Mon, 27 Dec 2021 14:20:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeJIrShJLcpLzFFi42Kxs+EI0V14+mS
  iQcd2A4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPrvLksBZM4KiZvbGFtYFzA3sXIySEkMJNJ
  4uvu1C5GLiB7D6PEjMWrWUASbAK6EucerwUrEhHQl1g6ew9zFyMHh7CAs8TBHckgYRYBVYl9j
  x+xgti8Au4Sv+6tYQOxJQQUJKY8fM8MEReUODnzCdhIZgEJiYMvXoCNkRBQlJg9XR6ivELi9e
  FLzBMYeWYh6ZiFpGMBI9MqRrukosz0jJLcxMwcXUMDA11DQ1NdM0tdQ0tTvcQq3US91FLd5NS
  8kqJEoLReYnmxXmpxsV5xZW5yTopeXmrJJkZgOKUUux7ewbi776feIUZJDiYlUd7vE04mCvEl
  5adUZiQWZ8QXleakFh9ilOHgUJLgDT4FlBMsSk1PrUjLzAGGNkxagoNHSYT3HEiat7ggMbc4M
  x0idYpRUUqc99dJoIQASCKjNA+uDRZPlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ874EGc
  +TmVcCN/0V0GImoMUzHY6DLC5JREhJNTBt2PTSWWL925VTzAUdnSeoH4vaKqUlZKkV8OnsppS
  Fn1sYOt7lKzQtiJ6V8E5T9uRC7rVfvn3OOvYss1BX8aKO3+lNbpXrTFmnfwlbsIuT+Tur590N
  LBe4m7S71l/tDTjL4M3e0Ja1MH2P9E2X4OIsGWeOhba/r/1l7nj+vDp9n8bqout/tz6uMEi5n
  cX2VfHhZzZVN13efSnLJK6ZHUq9XVJTb6VsdObB/wkpVz99t24/F7W9VOFY5xfPp63HpRemVU
  yek1Re0dKYHPEv2vgVo+GP8zMvX+a4NuUd99Kw3c2qVpZRXLv/uG3S94plqq+edX+Kp80Xz7N
  pbN4HK820gqzMWV++19YMnDlx+WElluKMREMt5qLiRACQlPX7IgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-545.messagelabs.com!1640614817!216631!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7997 invoked from network); 27 Dec 2021 14:20:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:20:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BREKHxh032755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:20:17 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:20:16 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] glmark2: upgrade 2021.02 -> 2021.12
Date: Tue, 28 Dec 2021 07:20:10 +0800
Message-ID: <1640647210-3695-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:20:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94508

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 9f7ceebfb..2a8ce54c8 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -11,14 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "libpng jpeg udev"
 DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native wayland-protocols', '', d)}"
 
-PV = "2021.02+${SRCPV}"
+PV = "2021.12"
 
 SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https;branch=master \
     file://0001-fix-dispmanx-build.patch \
     file://0002-run-dispmanx-fullscreen.patch \
     "
-SRCREV = "4b2bbe803576d48f08367aa5441740f9319c21e7"
+SRCREV = "0858b450cd88c84a15b99dda9698d44e7f7e8c70"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


