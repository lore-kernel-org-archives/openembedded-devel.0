Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD7EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:51:51 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.2223.1635879109028395642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=n81KWg9v;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635879110;
  x=1667415110;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c4C20kSwU6GQbILId/aVHtqfaYH0BwN3KNl8zx7/ivI=;
  b=n81KWg9vM2PY8D1ZFfFEKlJ35giMsATVYzAhud59EGwGrYOp/5oV91KT
   8HGHbIi00/6/0UoYJ8nZDvUlVg0qS+YQa2G7vl5fVkLbPJnuxAyJVqTXT
   7o+0vnAFOOfrXeoRnd2aGvaEdp1vKR2+aIgyCcspkdXPBNg4jMxkap4dL
   hisjzvn2/fBvkUshwcJvghw6/eiiknH4bS+HrI/nLbf3ym7YHSkGDjJjS
   dNRxyU/IT78vc5cnQgkHD1ey1XZZRXuGWJEQK/UDC5ra4wE/pSmIQdLm/
   u1HtqU+ZdONJpPDRcsTZjj/AnClSpQ38gVE3eVczpxZNBVLZLA3sI6LPI
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe,meta-networking][PATCH 3/8] collectd: Do not install
 /var/log
Date: Tue, 2 Nov 2021 19:51:39 +0100
Message-ID: <20211102185144.13556-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211102185144.13556-1-pkj@axis.com>
References: <20211102185144.13556-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 18:51:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93787

Previously it installed an empty /var/log without anything in it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index b443afdb1..1c613b097 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -70,8 +70,8 @@ do_install:append() {
     # Fix configuration file to allow collectd to start up
     sed -i 's!^#FQDNLookup[ \t]*true!FQDNLookup   false!g' ${D}${sysconfdir}/collectd.conf
 
-    rmdir "${D}${localstatedir}/run"
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+    rmdir ${D}${localstatedir}/run ${D}${localstatedir}/log
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
 
     # Install systemd unit files
     install -d ${D}${systemd_unitdir}/system

