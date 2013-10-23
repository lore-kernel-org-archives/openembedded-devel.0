Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 066AC6CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 09:14:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9N9EGQa002714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 02:14:16 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 23 Oct 2013 02:14:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Oct 2013 05:14:12 -0400
Message-ID: <1382519652-15717-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-webserver] [PATCH] cherokee: fix the installed but not shipped issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2013 09:14:15 -0000
Content-Type: text/plain

We will get the following ERROR/WARN if we enable the
installed-vs-shipped check in QA:

ERROR: QA Issue: cherokee: Files/directories were installed but not shipped
  /srv
  /srv/www
  /srv/www/htdocs
  /srv/www/htdocs/index.html
  /srv/www/htdocs/images
  /srv/www/htdocs/images/cherokee-logo.png
  /srv/www/htdocs/images/default-bg.png
  /srv/www/htdocs/images/favicon.ico
  /srv/www/htdocs/images/powered_by_cherokee.png

I think that we can pack these files into cherokee just like what
apache2 does.

Fedora 17 also packs them

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 2014ea1..dff662a 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -48,6 +48,9 @@ FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
 FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
 FILES_libcherokee-base = "${libdir}/libcherokee-base${SOLIBS}"
 
+# Pack the htdocs
+FILES_${PN} += "${servicedir}"
+
 CONFFILES_${PN} = " \
                    ${sysconfdir}/cherokee/cherokee.conf \
                    ${sysconfdir}/init.d/cherokee \
-- 
1.7.10.4


