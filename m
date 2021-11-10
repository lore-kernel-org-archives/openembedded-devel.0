Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1CCC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 16:31:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.584.1636561872678064863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 08:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417C2139F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 08:31:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFA4F3F718
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 08:31:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-webserver] nginx: use ln -rs
Date: Wed, 10 Nov 2021 16:31:05 +0000
Message-Id: <20211110163105.3466024-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 16:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93905

lnr is deprecated, use ln -rs directly instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
index 7637002f23..b99e29ef99 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -94,7 +94,7 @@ do_install () {
             >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
     install -d ${D}${sysconfdir}/${BPN}
-    lnr ${D}${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+    ln -rs ${D}${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
     install -d ${D}${NGINX_WWWDIR}
     mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
     chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
--=20
2.25.1


