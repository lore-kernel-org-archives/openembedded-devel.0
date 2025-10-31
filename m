Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D35CCCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 05:37:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8339.1761889069238057219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 22:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kjBK3ZU4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761889069; x=1793425069;
  h=from:to:subject:date:message-id;
  bh=2e9HN4ap0nu3fsTjiZjY+sHrtoj0dU8+LBloYbVsNoM=;
  b=kjBK3ZU4S33NvzAcACHasuWLOr87Z5KMr8+bxNbpjrqut48e0pZMxJSs
   Hd7cXbO6gzkf+wEPiI9s6yqg6rczjp0N9hqct+Tp2VwFmlL2h93nowqqf
   qZ/fteeArb7SvRSuLpLZQb2g1CS7BsxuSU1TZ7+iwhYmwySHLh5cT7KJ3
   c7nN/MjXd4PZ6FNUGzcn45v6cCdg1yIt3KY7KZA2m1tdlwLEbVY9KlvIU
   5rNDUst+6wqUCYZCrTt9eTsaMeTxQOKcm9Nnf5NZpra/HUlgTgPwyWS05
   aUtwujAFeR+mnCH981I/Dc5RUAATMkCjhiaIsqSxOM2z+mGNHMz9YcPjq
   A==;
X-CSE-ConnectionGUID: h+uHeLcJRqaZ5lBKkhuxwA==
X-CSE-MsgGUID: OPNljJQbTWq2qHIr+K6+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="205676620"
X-IronPort-AV: E=Sophos;i="6.19,268,1754924400"; 
   d="scan'208";a="205676620"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:37:47 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4F6A0C02F77
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 05:37:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0B697180ABC3
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 05:37:47 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2BB89101731C
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 05:37:44 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] dovecot: Fix service start error
Date: Fri, 31 Oct 2025 13:37:37 +0800
Message-Id: <20251031053737.12912-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 05:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121222

1.Fix following dovecot.service starting error.
  dovecot[364]: doveconf: Fatal: Error in configuration file /etc/dovecot/dovecot.conf line 48: cert_file: open(/etc/dovecot/ssl-cert.pem) failed: No such file or directory
  systemd[1]: dovecot.service: Main process exited, code=exited, status=89/n/a
  systemd[1]: dovecot.service: Failed with result 'exit-code'.

2. There is no need to do "touch ${D}/etc/dovecot/dovecot.conf" as it was created by dovecot after dovecot was upgraded to 2.4.1-4.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index 5894c76bac..40cf991ae1 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -54,8 +54,11 @@ SYSTEMD_AUTO_ENABLE = "disable"
 do_install:append () {
     rm -rf ${D}${libdir}/dovecot/dovecot-config
     install -d 755 ${D}/etc/dovecot
-    touch ${D}/etc/dovecot/dovecot.conf
     chmod 644 ${D}/etc/dovecot/dovecot.conf
+    touch ${D}/etc/dovecot/ssl-key.pem
+    touch ${D}/etc/dovecot/ssl-cert.pem
+    chmod 600 ${D}/etc/dovecot/ssl-key.pem
+    chmod 600 ${D}/etc/dovecot/ssl-cert.pem
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
         install -m 0644 ${UNPACKDIR}/dovecot.service ${D}${systemd_unitdir}/system
         sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
-- 
2.43.0


