Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 005F97D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x686ex0U005925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:15 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:41:10 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:55 +0800
Message-ID: <20190708063901.13914-3-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 3/9] keyutils: update to 1.6
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:24 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

remove patch now included in update:
keyutils-use-relative-path-for-link.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 files/keyutils-use-relative-path-for-link.patch | 28 -------------------------
 keyutils_1.5.10.bb => keyutils_1.6.bb           |  5 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 files/keyutils-use-relative-path-for-link.patch
 rename keyutils_1.5.10.bb => keyutils_1.6.bb (86%)

diff --git a/files/keyutils-use-relative-path-for-link.patch b/files/keyutils-use-relative-path-for-link.patch
deleted file mode 100644
index dde1af44a..000000000
--- a/files/keyutils-use-relative-path-for-link.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Subject: [PATCH] keyutils: use relative path for link
-
-The absolute path of the symlink will be invalid
-when populated in sysroot, so use relative path instead.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 824bbbf..8ce3a13 100644
---- a/Makefile
-+++ b/Makefile
-@@ -167,7 +167,7 @@ ifeq ($(NO_SOLIB),0)
- 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
- 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
- 	mkdir -p $(DESTDIR)$(USRLIBDIR)
--	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
-+	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
- endif
- 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
- 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
--- 
-2.11.0
-
diff --git a/keyutils_1.5.10.bb b/keyutils_1.6.bb
similarity index 86%
rename from keyutils_1.5.10.bb
rename to keyutils_1.6.bb
index a4222b9e9..1d7427da5 100644
--- a/keyutils_1.5.10.bb
+++ b/keyutils_1.6.bb
@@ -16,14 +16,13 @@ LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
 inherit siteinfo ptest
 
 SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
-           file://keyutils-use-relative-path-for-link.patch \
            file://keyutils-test-fix-output-format.patch \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "3771676319bc7b84b1549b5c63ff5243"
-SRC_URI[sha256sum] = "115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6"
+SRC_URI[md5sum] = "191987b0ab46bb5b50efd70a6e6ce808"
+SRC_URI[sha256sum] = "d3aef20cec0005c0fa6b4be40079885567473185b1a57b629b030e67942c7115"
 
 EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_ARLIB=1 \
-- 
2.14.4


