Return-Path: <ts@ferncast.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9162C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:21:43 +0000 (UTC)
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de [80.67.31.101])
 by mx.groups.io with SMTP id smtpd.web11.12946.1737728493939490320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 06:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ferncast.de, ip: 80.67.31.101, mailfrom: ts@ferncast.de)
Received: from [78.35.245.211] (helo=ferncast-thomas.fritz.box)
	by smtprelay06.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <ts@ferncast.de>)
	id 1tbKYt-000000006me-2G8D;
	Fri, 24 Jan 2025 15:21:31 +0100
From: Thomas Schlien <ts@ferncast.de>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Schlien <ts@ferncast.de>
Subject: [meta-oe][PATCH] collectd: add PACKAGECONFIG for dpdk
Date: Fri, 24 Jan 2025 15:21:18 +0100
Message-ID: <20250124142117.3369843-2-ts@ferncast.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: dHNAZmVybmNhc3QuZGU=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 14:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115061

Signed-off-by: Thomas Schlien <ts@ferncast.de>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index ade688df7b..36aad73b19 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --wit
 PACKAGECONFIG[rrdtool] = "--enable-rrdtool,--disable-rrdtool,rrdtool"
 PACKAGECONFIG[rrdcached] = "--enable-rrdcached,--disable-rrdcached,rrdtool"
 PACKAGECONFIG[python] = "--enable-python,--disable-python"
+PACKAGECONFIG[dpdk] = "--with-libdpdk,--without-libdpdk,dpdk"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \

