Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25E6F77055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:13:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9JBDClg023085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Oct 2015 04:13:12 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 19 Oct 2015 04:13:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Mon, 19 Oct 2015 19:00:47 +0800
Message-ID: <1445252447-16496-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd: fix permission bits of drbd.service
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
X-List-Received-Date: Mon, 19 Oct 2015 11:13:14 -0000
Content-Type: text/plain

The permission bits should be 0644 instead of 0755.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e.in-fix-permission-bits-for-drbd.service.patch | 25 ++++++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_8.9.3.bb       |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
new file mode 100644
index 0000000..90dd1f8
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+Subject:  Makefile.in: fix permission bits for drbd.service
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ scripts/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.in b/scripts/Makefile.in
+index 402b93b..4a45407 100644
+--- a/scripts/Makefile.in
++++ b/scripts/Makefile.in
+@@ -65,7 +65,7 @@ endif
+ # yes, debian apparently allows installing both types from the same package
+ ifneq ($(initscripttype),sysv)		# "systemd" or "both"
+ 	install -d $(DESTDIR)$(systemdunitdir)
+-	install -m 755 drbd.service $(DESTDIR)$(systemdunitdir)/
++	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
+ 	install -d $(DESTDIR)/lib/drbd/
+ 	install -m 755 drbd $(DESTDIR)/lib/drbd/
+ 	install -d $(DESTDIR)$(tmpfilesdir)/
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
index 2971280..44459b5 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
            file://0001-Makefile.in-don-t-compile-documentation.patch \
+           file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
           "
 SRC_URI[md5sum] = "09c9c33c041e1f4f85dd359f9e0b0f24"
 SRC_URI[sha256sum] = "011050578c153bf4fef86e03749304ff9f333b7af3512c5c395e0e870a0445bd"
-- 
1.9.1


