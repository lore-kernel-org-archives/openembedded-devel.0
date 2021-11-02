Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF33BC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:48 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.2281.1635879107422264571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=jNhyR0kA;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879107;
  x=1667415107;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jujA/+JC/UTM3WJZZjZ/w5ADU4zW4eu4c3TyyTrZcGQ=;
  b=jNhyR0kA0vB/OP+Xi2TWAEutopmhDO7eJ16you96/cdxk7lqJ406FuKY
   Usrbi3xxw0YUd+vFCZ/7UOWdLobBOlzRnqReiSf6KamzQqqpz0VZrsBZp
   yKHbXFzrxb1wdm9q3kBIywff4kpY4gmb8dIhoR234uhdCyIccANxBJmZX
   r9mnqU2lbUxzOVcGwhwFFNVbVYc34GGAgXWc1R3CiAWd/SaFdQ331gMj7
   qW5c3QQFkqcscd+9OwK85PKGg4EF44K/hEtPkySr5kGeArBBDYcfcZS6j
   FLPysHlivMxwo2EjY8VWw0kDX7DvqpTFJMRARnAxxl3qo6Q1I/fXm4knz
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 2/8] corosync: Do not install the
 /var/log/cluster directory
Date: Tue, 2 Nov 2021 19:51:38 +0100
Message-ID: <20211102185144.13556-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93783

/var/log is normally a link to /var/volatile/log and /var/volatile is a
tmpfs mount. So anything created in /var/log will not be available when
the tmpfs is mounted.

/var/log/cluster will be created in runtime.

This also drops the removal of the /var/run directory as it is no
longer created in the first place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-extended/corosync/corosync_3.0.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
index 016441be5..ec2a78527 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
@@ -45,7 +45,8 @@ do_install:append() {
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
     install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
 
-    rm -rf "${D}${localstatedir}/run"
+    rmdir ${D}${localstatedir}/log/cluster ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
 
     install -d ${D}${sysconfdir}/default/volatiles
     echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync

