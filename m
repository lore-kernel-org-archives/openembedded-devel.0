Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D07F56D1C1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2013 05:59:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9Q5xTnE020964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 22:59:29 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 25 Oct 2013 22:59:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2013 01:59:26 -0400
Message-ID: <1382767166-3351-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382668647-27029-1-git-send-email-liezhi.yang@windriver.com>
References: <1382668647-27029-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver] [PATCH V3] cherokee: fix the installed but not shipped issue
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
X-List-Received-Date: Sat, 26 Oct 2013 05:59:27 -0000
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
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 2014ea1..2a732d5 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+               --with-wwwroot=${localstatedir}/www/cherokee \
 "
 
 do_install_append () {
@@ -48,6 +49,9 @@ FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
 FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
 FILES_libcherokee-base = "${libdir}/libcherokee-base${SOLIBS}"
 
+# Pack the htdocs
+FILES_${PN} += "${localstatedir}/www/cherokee"
+
 CONFFILES_${PN} = " \
                    ${sysconfdir}/cherokee/cherokee.conf \
                    ${sysconfdir}/init.d/cherokee \
-- 
1.7.10.4


