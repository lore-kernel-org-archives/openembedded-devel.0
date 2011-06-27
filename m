Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QbKUn-0006I5-06
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 00:41:33 +0200
Received: by ywa12 with SMTP id 12so2170523ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 15:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=uW9H2LeBOB+Exju+uZaEM1zkUrC2o3mUX2l6krLvqUU=;
	b=MLMgPtiyB3+gaLcyqynPAQnZXcLzqDslUXqenxoMqrJRUzRVn0RBe80/AkfcfrSi5t
	JZ8m1EYNQEkMnFKKQwBx55acoIpEtiRIgeY3Trcrfq4nkGeKhYIZ0l2CGOcUsF8fdZD2
	QlVbTAZDCtB5A21V+qen96K3jo6JUC7cUcAI0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=n8zphVFHD9vnw+CkZV/k5wzpGkG0T7G/gg+niS+IdFB3Tk/3pr5S2lU1szSY3Yk38a
	7OnKlHsISH+Wa0tihPGqCssv6Otm/Y5tVLLxIFI48UqeFQdHSnSQzRoFLaTjEIIBtGJu
	goxN/0jIId7sb+gsD6jf7W7+X+ZilbPoOTTto=
Received: by 10.151.115.10 with SMTP id s10mr5230959ybm.271.1309214270536;
	Mon, 27 Jun 2011 15:37:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w70sm3783110yhl.17.2011.06.27.15.37.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 15:37:50 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 17:35:25 -0500
Message-Id: <1309214125-3523-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Mon, 27 Jun 2011 22:41:33 -0000

* Remove platform dependencies and use architecture dependencies instead
* Use OE BASE_PACKAGE_ARCH to determine architecture
* Update the SRCREV to revision 65
* Update the recipe revision to 1.3
NOTE - architecure dependency and INSANE_SKIP can be removed once CFLAGS can be passed into CCSv5 project makefile

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/am-benchmarks_1.3.bb |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/am-benchmarks_1.3.bb

diff --git a/recipes/ti/am-benchmarks_1.3.bb b/recipes/ti/am-benchmarks_1.3.bb
new file mode 100644
index 0000000..f4182b3
--- /dev/null
+++ b/recipes/ti/am-benchmarks_1.3.bb
@@ -0,0 +1,31 @@
+#NOTE: This package is currently only supported for the Angstrom
+#      distribution.  Other distributions and toolchains may or
+#      may not work.
+
+DESCRIPTION = "AM Benchmarks"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
+LICENSE = "BSD"
+SECTION = "system"
+PRIORITY = "optional"
+
+SRCREV = "65"
+PR = "r2+svnr${SRCPV}"
+
+INSANE_SKIP_${PN} = "True"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	# don't build debug version
+	touch debug
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export ARCH=${BASE_PACKAGE_ARCH}
+	make release 
+}
+
+do_install() {
+	export ARCH=${BASE_PACKAGE_ARCH}
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4



