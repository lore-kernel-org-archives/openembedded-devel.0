Received: from mail-yi0-f65.google.com ([209.85.218.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PaDrz-0000gT-Fn
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 21:52:39 +0100
Received: by yib12 with SMTP id 12so2293738yib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 12:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=paJNyiQbdZHB6G0sA8+ZHqpdKkGQChqc/efGq2epbCE=;
	b=sTBHcAILAdPoxI76LRh66/6Yzkb3Oo38q/1k5SGROujeItmVn5e59Lw9KnXzchBIAK
	++KYrXL1pUNFPtIx4RSXdaR2gPKsWqyemoYj7PBgd6smmobpqQ33WWp4s3tmVg3wiReH
	28REdTEJBy/zFAGt4MY8o+KndRcNVBsQZbO7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Br1TyZuOMYpZZPnGr2HdjojCFnLqvUIL7fzOEYnvE5opcWehPP2wbGQaULBn4XXb9E
	ORBkzEeawXwFetAeDgvSjIeOBmTp4TZdVQhXNavpVJAH1XFYud8DVJhetJ1L5IajEGy1
	vbZQkW4YiRr1AYN4oE9wK3PLzbLIAI/+Xcfbc=
Received: by 10.151.150.11 with SMTP id c11mr20876210ybo.413.1294174334867;
	Tue, 04 Jan 2011 12:52:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r6sm14160651yba.23.2011.01.04.12.52.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Jan 2011 12:52:14 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 14:51:36 -0600
Message-Id: <1294174296-23336-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] am-benchmarks: add platform support and correct makefile
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
X-List-Received-Date: Tue, 04 Jan 2011 20:52:39 -0000

  * Modify recipe name to include package version
  * add support for additional platforms am181x-evm and am180x-evm
  * Update the SRCREV
    * Fix pathname to Rules.make in each Makefile

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:
  * Removed PV since it is now in the filename
  * Removed ARCHITECTURE override for am180x and am181x since they are already covered under the SOC famile omapl138
---
 recipes/ti/am-benchmarks_1.2.bb |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/am-benchmarks_1.2.bb

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.2.bb
new file mode 100644
index 0000000..88b38e7
--- /dev/null
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -0,0 +1,36 @@
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
+SRCREV = "58"
+PR = "r2+svnr${SRCPV}"
+
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+
+ARCHITECTURE_dm365 = "arm9"
+ARCHITECTURE_omapl138 = "arm9"
+ARCHITECTURE_omap3 = "cortex-a8"
+ARCHITECTURE_ti816x = "cortex-a8"
+
+INSANE_SKIP_${PN} = "True"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk/${ARCHITECTURE}"
+
+do_compile() {
+	# don't build debug version
+	touch debug
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	make release
+}
+
+do_install() {
+	make DESTDIR=${D} install
+}
-- 
1.6.3.3



