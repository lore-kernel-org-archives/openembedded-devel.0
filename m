Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50C6F71A96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 06:34:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9O6Yvqm014338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2016 23:34:58 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 23 Oct 2016 23:34:57 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Oct 2016 14:35:03 +0800
Message-ID: <1477290904-11557-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1477290904-11557-1-git-send-email-Qi.Chen@windriver.com>
References: <1477290904-11557-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] librelp: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2016 06:34:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This is a project under rsyslog. Add its recipe as it's needed by
the new version of rsyslog.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb
new file mode 100644
index 0000000..84c2583
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.12.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A reliable logging library"
+HOMEPAGE = "https://github.com/rsyslog/libfastjson"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
+
+DEPENDS = "gmp nettle libidn zlib gnutls"
+
+SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https"
+
+SRCREV = "02c3be4f5c39fec59d05cd8b75b08dbba04098ad"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
1.9.1


