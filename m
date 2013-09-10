Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89BF26161F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8A5hKBZ023862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Sep 2013 22:43:20 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 9 Sep 2013 22:43:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2013 13:43:18 +0800
Message-ID: <1378791798-724-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-webserver] apache2: add apxs to SSTATE_SCAN_FILES
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
X-List-Received-Date: Tue, 10 Sep 2013 05:43:19 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

apxs is installed under /usr/bin/crossscripts of sysroot, its hardcode paths
should be handled when store or extracts the sstate archives.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
index f230f94..fa14b07 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
@@ -26,6 +26,8 @@ S = "${WORKDIR}/httpd-${PV}"
 
 inherit autotools update-rc.d
 
+SSTATE_SCAN_FILES = "*.la *-config *_config apxs"
+
 CFLAGS_append = " -DPATH_MAX=4096"
 CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
 EXTRA_OECONF = "--enable-ssl \
-- 
1.7.10.4


