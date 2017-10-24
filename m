Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6FD6059E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 08:18:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9O8IhC8021049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 01:18:43 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Oct 2017 01:18:42 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Oct 2017 16:19:44 +0800
Message-ID: <1508833184-28676-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gnome-common: add PACKAGECONFIG for autoconf-archive
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
X-List-Received-Date: Tue, 24 Oct 2017 08:18:42 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add PACKAGECONFIG for autoconf-archive. Default to enable it to avoid
m4 file conflicts between gnome-common and autoconf-archive.

e.g.
IMAGE_INSTALL_append = " gnome-common autoconf-archive-dev"
bitbake <image>

We enable autoconf-archive PACKAGECONFIG to avoid the following error.

Error: Transaction check error:
  file /usr/share/aclocal/ax_check_enable_debug.m4 conflicts between attempted installs of gnome-common-3.18.0-r0.noarch and autoconf-archive-dev-2016.09.16-r0.core2_64
  file /usr/share/aclocal/ax_code_coverage.m4 conflicts between attempted installs of gnome-common-3.18.0-r0.noarch and autoconf-archive-dev-2016.09.16-r0.core2_64

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
index 06f3bb3..d874164 100644
--- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -14,6 +14,10 @@ SRC_URI[archive.sha256sum] = "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
 EXTRA_AUTORECONF = ""
 DEPENDS = ""
 
+# Default to enable autoconf-archive to avoid conflicts
+PACKAGECONFIG ??= "autoconf-archive"
+PACKAGECONFIG[autoconf-archive] = "--with-autoconf-archive, --without-autoconf-archive, autoconf-archive"
+
 FILES_${PN} += "${datadir}/aclocal"
 FILES_${PN}-dev = ""
 
-- 
1.9.1


