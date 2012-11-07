Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TW0ln-0002bO-0g
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2012 09:13:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA75vm23006231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Nov 2012 21:57:48 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 6 Nov 2012 21:57:46 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Nov 2012 13:57:45 +0800
Message-ID: <1352267865-3534-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] Apache2: Add libselinux dependency and Disable parallel install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2012 08:13:55 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

1. Add conditional dependency on libselinux to apache2.

2. Disable parallel make install
apache2 supports parallel make install, before installation,
it will firstly call build/mkdir.sh to create needed directories.
build/mkdir.sh first checks if a directory exists or not, if not,
it will create this directory, when mkdir.sh is called by many
instances parallel, it will introduce race, namely the result of
checking says one directory does not exist, but when it tries to
mkdir, this directory has been created by other instance.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.2.bb         |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index af7840d..c484a19 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -52,6 +52,12 @@ EXTRA_OECONF = "--enable-ssl \
 		--enable-mpms-shared \
 		ac_cv_have_threadsafe_pollset=no"
 
+PARALLEL_MAKEINST = ""
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[selinux] = "ac_cv_lib_selinux_is_selinux_enabled=yes, \
+        ac_cv_lib_selinux_is_selinux_enabled=no, libselinux,"
+
 do_configure_prepend() {
 	# FIXME: this hack is required to work around an issue with apr/apr-util
 	# Can be removed when fixed in OE-Core (also revert --with-* options above)
-- 
1.7.4.1



