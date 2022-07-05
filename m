Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B76ACCA47B
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:36:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.81192.1657003007710131055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CPNclaCN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003005; i=@fujitsu.com;
	bh=g7Mjh3x9GIRx8W8nA6eMBAqIzQby+MCNmc7GrAJwTnk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CPNclaCNuQDKQpctD23DFNvD7t5nEzyqkvl6Dydiv20AwDNQTb2NUSI5fDPsTZ5b1
	 k1daCDtF/5EeD1Pyy3XNXLQcbiiZ/kZrSX3sVZV0KU6uI9xjG6ZylgptgbPbFDOki3
	 4mETye/P1zLffAAjFbbcaP9wOky88Pc343GsCDEZia8NbTsy3A/dTSAeEWlczoccSx
	 3hVVcPs/PBetiGxtRIy3hCEylVW1LqNHWWF6yRmh/UOcedDL1OX7ycxG8OWMPDIJrH
	 rGnHlGmJ4i1WFevyr8AyvmGJ4RGbfXq43IJcRUUN3pBogBU2aBIHP7Z/PxbwcyO5VA
	 +Ol2AyNj3O1wA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpPv39uE
  kg2n7eSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owTTzMKFopW7Jq9iaWB8bZgFyMXh5DAQ0aJ
  vYfXMkM4l5kkjq34zw7h7GaUeLZlHZDDycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z1gN
  cICthJz/50As1mA4qt2Lwar5xVwkvj48zeYLSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRl
  Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMPLPQtI+C0n7AkamVYxWSUWZ6RkluYmZObqGBga6hoa
  mukDSyFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwKFOKGap3MP7v/al3
  iFGSg0lJlDfu6uEkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8zFeAcoJFqempFWmZOcAIgUlLc
  PAoifCuOA2U5i0uSMwtzkyHSJ1iNOb4++nvXmaOmV/bDjALseTl56VKifPuvgVUKgBSmlGaBz
  cIFrmXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz/r0ONIUnM68Ebt8roFOYgE65UXUA5JS
  SRISUVAOTT/imVXWeXo4hWywi1KS2vNfMbr3qNTXig+LdV4LbG4LPmb3OZ95wyrL0asekxS2s
  635Pk79YcTiv9WrVzAcWastXMbT0y+hfYFDoU6wNm/s3dH3fZNPYbYcXTitQWCUl+eRWBKeaz
  vbz8S1Mi85csXtYn7tYWqHy12deGT2nEMkH1a5spdm8N6M25d9ZzHRry9IipmiFYNcHPwRcuB
  7c2VAwOVxMdorvJtXwRb1zmar99Xc/9rmzdc/Hbbs2fPj6ZeKHY4duR/yLyYrgKX4u3uM2U6l
  EfPqWuAbhBbwba1UnPu01tfhaUZP3+p+hVcr/tVZRQn1aAedj3vMLxrHIrrqZWH/yzeOZ054s
  ZFZVYinOSDTUYi4qTgQAyTAhXVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1657003004!250043!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25127 invoked from network); 5 Jul 2022 06:36:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:36:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C98A61AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id BDF627C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:36:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fwupd: upgrade 1.7.6 -> 1.8.1
Date: Tue, 5 Jul 2022 14:36:18 +0800
Message-ID: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97703

Changelog:
=========
new features:
--------------
    Add archive writing support for devices with composite firmware
    Add a way to read device composite firmware in fwupdtool
    Allow clients to opt-in to showing updates with user-solvable problems
    Allow the device to pause polling when writing firmware
    Export the system and device battery levels on the D-Bus interface
    Log errors and warnings to the win32 eventlog when required
    Add X-UsbReceiver as an update category with icon usb-receiver

fixes bugs:
-------------
    Accurately return the last-set status to client tools
    Allow dumping flashrom firmware using fwupdtool
    Allow specifying a non-file D-Bus transport
    Allow to request post actions from fwupdtool
    Always be arch-explicit when installing OS deps
    Be more resilient when restarting the Redfish BMC
    Do not mark all Redfish updates as UPDATABLE
    Do not use 'dongle' to describe USB receiver hardware
    Download in-process when using fwupdtool
    Fix a critical warning on failed modem update
    Fix regression when probing PS175 devices
    Hardcode the Redfish filedata name to firmware.bin
    Set the Bluetooth version if REV has been set
    Switch the Windows installer from NSIS to MSI
    Use StartServiceCtrlDispatcherA for the daemon on Windows
    Use the native certificate store on Windows

new support:
------------
    Corsair KATAR PRO XT, SABRE PRO and KATAR PRO Wireless
    HP Thunderbolt Dock G4
    Lenovo ThinkPad Universal USB-C Dock
    More PixArt wireless devices
    More SunplusIT USB cameras
    Some UFS devices
    Steelseries Aerox 3 Wireless and Rival 3 Wireless

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_1.7.6.bb => fwupd_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.7.6.bb => fwupd_1.8.1.bb} (98%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb
similarity index 98%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb
index 53f1720b0..7576b846f 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "7ebe1514acb688d2649cecc392db929094da3f03cfc98a9c0faccabb084912fa"
+SRC_URI[sha256sum] = "5756466442eb9134fb40cdc8a46f9e01003247c8eac82fa5d8b16f6420375b79"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


