Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4E7C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:34:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.1251.1667810042179456146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QWqxlufW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810044; i=@fujitsu.com;
	bh=WyzlQpoeCMESQd62y7I1bZiwHPpQHhKvEKm0pgci4A0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QWqxlufWHrjr4BLJ6k/bwB+hW2AXBgL4ruft7R1KGBmVi53JXJa/lqh0a2K6Cmscd
	 mslsAa3NoTy8n1bniq8sjdFxttcelcIraQGx16YGUoXCePgujAZQN9+287Ol33G5Gv
	 +jjSXZ1Lo8y/cDU3NnY7Rm/Ejn/XqfYxX4gWi9YCBwlj2FZ+OO2uNx8eUUKqNlQhkz
	 VcIormflZ0PpiGR4nTN1uzl789rWiJq9PC68Z0f8oak04YtGYnOoOtXCA2UAOliEh/
	 y8SHHtqD6RXdyKqEpj+JNlPNXelYfaXNbOSZEo7O2CYvuG1J1YghGzauwUU7MR27Tb
	 ETegbXoumZX4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWffPoYx
  kg9bDzBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bvzDXMBbs5K7a8WMDWwHiUo4uRi0NI4CGj
  xOLnd5kgnCtMEkuaHrNCOLsZJVY0XmPvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQE7iZ+7GsBsFqD44Y41QDUcHLwCThKPGmNBwhICChJTHr4Ha+UUcJZo3LqZFaRECKhkwb
  tgkDCvgKDEyZlPWCCmS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRvPi1KKy1CJdQ1O9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzA4E0pTuDewfho2R+9Q4ySHExKory/l2ckC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgvbERKCdYlJqeWpGWmQOMJJi0BAePkghv2D6gNG9xQWJucWY6ROoUoyXH1Nn/9jNzLAeTM7
  +2HWAWYsnLz0uVEue9thuoQQCkIaM0D24cLNovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mZd4DNIUnM68EbusroIOYgA6qLkgDOagkESEl1cC0nDVKQkjcZuLuNVPVRaeV2v1ymmWT+rb8
  0bO9t/zm3Tsv0fXv8d4NHsnpgRdOvUmZtdlkWlmoxZK2w3v9c7J8d3ZYRfjkcnYqLF5xlrn2/
  vcpH8yCU6bnz+ZZc6Wlffej5PL1ny4XZYcEhAq8MMlUOauqVe3r+TI7zk/afW3LqbyQVzqSWz
  cvbZPYdyBDY/23MyH/Oefkff10eUte35ffW9x5/3+7qv85KETrde0pw06z+50rly4o5r4qtDd
  xOn/Q0qaDy203dk95dneFr+ueq/tNFF2TRDOz7x+9t625+u05xYBvZxkXzV0lavriZfy1+3O0
  +3KC10ptW/7p+dYN3pP2PjVZ6aGgZHc9xe34IyWW4oxEQy3mouJEACEggdFxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1667810043!245795!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17910 invoked from network); 7 Nov 2022 08:34:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:34:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8798A153
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7B37E142
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:34:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:34:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.3 -> 6.2.4
Date: Mon, 7 Nov 2022 16:33:42 +0800
Message-ID: <1667810023-31001-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
References: <1667810023-31001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99460

From: Wang Mingyu <wangmy@fujitsu.com>

automatic update of translation strings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.2.3.bb => zabbix_6.2.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.3.bb => zabbix_6.2.4.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb
index 58d1f9ecc..7332e2820 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "2be7e57fb33a55fee71480598e317ffa6a8ee5a39639a7e1b42b2ea6872107b5"
+SRC_URI[sha256sum] = "e2526603d9b487a26046de3022e1722b66f4b25542886b3e40a8e2b3bbdbd3b5"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


