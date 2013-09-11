Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4213B6162B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 00:54:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B0t149016640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:55:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Sep 2013 17:55:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Sep 2013 08:55:00 +0800
Message-ID: <1378860900-20020-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-webserver][V2] apache2: add apxs to SSTATE_SCAN_FILES
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
X-List-Received-Date: Wed, 11 Sep 2013 00:55:00 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

apxs is installed under /usr/bin/crossscripts of sysroot, its hardcode paths
should be handled when store or extracts the sstate archives.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
index f230f94..58e4396 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
@@ -26,6 +26,8 @@ S = "${WORKDIR}/httpd-${PV}"
 
 inherit autotools update-rc.d
 
+SSTATE_SCAN_FILES += "apxs"
+
 CFLAGS_append = " -DPATH_MAX=4096"
 CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
 EXTRA_OECONF = "--enable-ssl \
-- 
1.7.10.4

