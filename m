Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4150C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 20:53:15 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.2680.1645217593974066417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 12:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=P7SgA8qW;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645217594;
  x=1676753594;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dF1wXh1l7oRhvqepHX8tv42XA9ndj9RMI2SM1ArIKhk=;
  b=P7SgA8qWA9GqXtIFi6E3DKLtA7x3lMQZLoCSuRlyevSa+QBNLaOl53ZR
   fSIczDb9iPDqM9acPhe5CQ9LwgjMcOyuOUlY6MbGgJ3P4BEXFtQ0h/+9X
   WtSk45ql6kkX7nL0cnELiIOLuoPc5JEfMhVR0N55E0JirBkgDFQG+FGCn
   29D0SZ6GHpU+Iyv/jeuQozp28RMMlY6vCvxwrAc4hA2prrNwSuEpzQ+Yl
   9MBd23ZJm5VLwCfpwgWcN+ADwyuFOengFPtgD26tsqL8IFfDkoLnarzQs
   ObK9ozLKz68ShAnp1q0YTT/mSL4V4k5omQb8upU4r5XpGoA6mxiemrize
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [honister][meta-oe][PATCH] syslog-ng: adjust control socket location
Date: Fri, 18 Feb 2022 21:53:07 +0100
Message-ID: <20220218205307.8773-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 20:53:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95381

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

