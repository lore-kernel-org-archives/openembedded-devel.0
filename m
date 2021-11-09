Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E230FC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:35:59 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.12751.1636468558834777826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A9EZurI032720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 9 Nov 2021 06:35:57 -0800
Received: from otp-linux03.wrs.com (128.224.125.155) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 06:35:55 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: adjust control socket location
Date: Tue, 9 Nov 2021 16:35:30 +0200
Message-ID: <20211109143530.1526383-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.224.125.155]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 14:35:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93883

Commit [1] changed the pidfile dir to /var/run/syslog-ng. This also changed
the location where the control socket is searched for, causing the following
error with systemd:

root@qemux86-64:~# syslog-ng-ctl config
Error connecting control socket, socket='/var/run/syslog-ng/syslog-ng.ctl',
error='No such file or directory'

Update the systemd service file to point to the new location.

[1] 00d1d63e4f7f ("syslog-ng: provide correct PID directory location to
                   restart/stop syslog-ng daemon")

Signed-off-by: lmorales <luisalejandro.moralespena@windriver.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../files/syslog-ng.service-the-syslog-ng-service.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 0e1d09492..733480030 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -38,7 +38,7 @@ index 0ccc2b9..7f08c0e 100644
 -CONTROL_FILE=/var/run/syslog-ng.ctl
 -PID_FILE=/var/run/syslog-ng.pid
 +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
-+CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
++CONTROL_FILE=@LOCALSTATEDIR@/run/syslog-ng/syslog-ng.ctl
 +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
  OTHER_OPTIONS="--enable-core"
 -- 
-- 
2.25.1


