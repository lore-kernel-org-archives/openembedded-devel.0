Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8F796D7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:03:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBAA343F021904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 02:03:04 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 02:03:04 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Dec 2013 18:03:01 +0800
Message-ID: <1386669781-26578-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH meta-webserver] modphp: enable endian check
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
X-List-Received-Date: Tue, 10 Dec 2013 10:03:04 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Previously, modphp estimates endian on host rather than checks it on
target. If the host is little-endian and the target is big-endian,
modphp claims that endian is little. As a result, a memory location
that it is not allowed to access when calling libphp5.so module on
target. It will occur segmentation fault.
This patch enables endian check support for modphp.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 19f1be9..425faa2 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -44,6 +44,8 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --enable-mbstring \
                 --with-config-file-path=${sysconfdir}/php/apache2-php5"
 
+EXTRA_OECONF += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)}"
+
 PACKAGECONFIG ??= "mysql"
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"
-- 
1.7.9.5


