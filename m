Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944E1C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 01:12:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.5349.1645146730226132164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 17:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=KAWuXRtH;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645146730;
  x=1676682730;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iZw5qjS2xFv8Cw4Jh9qNwGaUWFCPaaVRH71uFR1XdWs=;
  b=KAWuXRtHiGC1N38797CrGF0+e02epj1gnmXm1xjwY5WBC+UTG4mVEQz0
   7LcCxaclJK31CReYA+aXHtg9lXwrh+gyWx9gHDmzXIHN1mdLEbLK2J2HZ
   vEE02LA70Iwy8fLGCLnhG3cp8WChuKAfL3kiv00JXrTBjp62h3NvXUCbW
   FT/bDIXrH95r5TCoiByEsjpbUd/Z2TFyw7OjFQn6vtEEmoi1WjVgpCb9m
   n5tuZ+6bXxQ56ywyvOX1k/vT5e2aE25kVmHDtaGI93jSM5xis3ReU7ZFp
   q5AYAxY5IuvzDg+kwcCvvMWLZNAjN+pvRbe6Gns9GmU1D43mrtowaWnQ5
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: adjust control socket location
Date: Fri, 18 Feb 2022 02:12:04 +0100
Message-ID: <20220218011204.5913-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 01:12:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95367

From: Ovidiu Panait <ovidiu.panait@windriver.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This has already been backported to the hardknott branch, but is missing
in honister...

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

