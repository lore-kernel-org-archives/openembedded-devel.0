Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D27C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:06:09 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.4464.1638421567272936590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VnUnG6a0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638421565; i=@fujitsu.com;
	bh=oQnWR/FnIWjBFD9VjsxgMfWV7Hw/WtMmCmuB+P5nNcM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VnUnG6a0G9lVhLcCFHfI2Yyk8vCxIXagwmB7oRtjFo5gteMwApVUThpLoQ3/lRDpH
	 lio03TKdpCOas/FqYZ1rr9K9kzG5s7UtrtccS7enKJ5kt9F9ZqVEmXOVc3rT2PoYlQ
	 jxIT4YZDof3S+x7H4e31dhFfBDkensazOeoDXW7hrHgvDH34+Bkj96hVBtk/qtJ6Bm
	 SGLaE856r4t8wAVnlRzddoccnk0CjY327FQorbAVM5TPxeM5uCOToonn9kUq5nbPkE
	 vH0ne7btj3jx3giAAab4oWgsGqLLTBh1bAI0cu4HlD0dHbjypCFHVsjFesFF9lYOOb
	 jL1tuI/a7WVTg==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id A8/07-14731-D3458A16;
 Thu, 02 Dec 2021 05:06:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqGsbsiL
  RoHMLk8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFoWzNrwXKxijeTX7M0MD4S7mLk4hASeMIo
  sb19NSOEc4FJounhMnYIZzejROf5OUAZTg42AV2Jc4/XsoPYIgL6Ektn72EGsYUFvCReTrkFZ
  HNwsAioSFy/6wdi8gq4S8x+FQJSISGgIDHl4Xuwal4BQYmTM5+wgNjMAhISB1+8AOuUEFCUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYxWSUWZ6RkluYmZObqGBga6hoamuqa
  6RsbGeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgYGXUsz6cgfj9L6feocY
  JTmYlER5nQJWJArxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4H0YCJQTLEpNT61Iy8wBRgFMWoKDR
  0mE93EQUJq3uCAxtzgzHSJ1ilGXo3nS8u3MQix5+XmpUuK8W0GKBECKMkrz4EbAIvISo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWHecpApPJl5JXCbXgEdwQR0xOFZy0GOKElESEk1MEmuuNP
  RfVtgZ9sr78L8ze45vZv/lGSduTfrrYj9e+tIppSesOwPWwyu3PcP/pV8rrznw6aW179stt+f
  Nq+q9cDnP2HfZx5IuXY059X9XR8WrefNnsDe2/794L04vszrN/J+vfuivD/2hHPOuyL+7lOLL
  n1JuCj2NJJLci9b9blJ1484XHyR+CWzyuvVzCK3M4u2H9TOWSFT7cDBUqzd3x3JHlZcfP2gmN
  QZgfZ/UwSVFyapszUc5HPkrbY6YGEafPaXgdbVVh3ue5Yvlqeq3DDjDpGJWTHVv+q6XVCO2UF
  zyb9RcX21k3Mc5ofE/csvFdHYutvu1OTGyZ/qQiJuH90j+Pmb2ISQ0zw3mnMC1iqxFGckGmox
  FxUnAgA4kmqCQwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1638421564!79853!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11729 invoked from network); 2 Dec 2021 05:06:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 05:06:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 894BF1009EF
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 05:06:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7E63210024D
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 05:06:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 05:05:47 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] vboxguestdrivers: upgrade 6.1.28 -> 6.1.30
Date: Thu, 2 Dec 2021 13:05:37 +0800
Message-ID: <1638421537-2534-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 05:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94172

Changelog:
VMM: Fixed 6.1.28 regression preventing VMs starting when using Hyper-V mode on Windows 10
GUI: Fixed inability to complete First Run wizard after browsing for an external image
GUI: Fixed crash on macOS Big Sur while browsing for an external image from First Run wizard
GUI: Fixed bug on Windows with inability to save taken screenshot under a folder with native name (bug #15561)
GUI: Fixed bug on X11 with drag and drop initiated on single mouse click in VM storage settings
GUI: Fixed settings check on machines not supporting hardware virtualization
GUI: Non critical media related errors should not cause modal pop-up error messages
Host-only networking: Fixed crash parsing /etc/vbox/networks.conf
DVD: Fixed drive lock handling across VM reset
VBoxHeadless: Fixed crash when running on macOS Monterey (bug #20636)
VBoxManage: Fixed incorrect help text for "hostonlyif"
vboximg-mount: Error message if no image is specified
macOS host: fix multiple bugs specific to macOS Monterey in installer and startup of kernel extensions
macOS host: show message indicating the unsupported CPU on M1 based Macs and abort installation
Linux host: For all distribution specific packages (deb/rpm format) fix the packaging so that the feature for unattended installation of guest OSes works
Linux host and guest: Introduced initial support for kernel 5.16
Shared Clipboard: Improved communication between guest and host when guest has no clipboard data to report
Linux Guest Additions: Allow running only one VBoxDRMClient instance (bug #19373)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.28.bb => vboxguestdrivers_6.1.30.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
index 014fe30bbc..099d82ae42 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.30.bb
@@ -16,8 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
-SRC_URI[sha256sum] = "8d34993d8e9c0cf35e7bd44dd26c8c757f17a3b7d5a64052f945d00fd798ebfe"
+SRC_URI[sha256sum] = "3c60a29375549ffc148aaebe859be91b27c19d6fa2deefde1373c4f6da8f18ef"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


