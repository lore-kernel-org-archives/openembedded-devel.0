Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <carher@gmail.com>) id 1Q63Tx-0006tk-5R
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 18:15:25 +0200
Received: by gxk3 with SMTP id 3so1796175gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2011 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NEItjwHYIfaS1/eFcVxiWtSfatVb8HvQ776JCYq5dhQ=;
	b=HpPEJ/sOe5goWGK99gJAEWKsZAMQ7DGdUBuo3DI3zfCh9c04EGudWA3pmQqwSWQbI+
	uGhlTtoTaBSxZRdiv1SKUlmaXgFuMY1a2oV5UEvJYAqD/vQEeKI9O7TjgbHI0qcPSnO5
	W0mlvs/PEoTcJfFe+0CLTqMwBRo7aA/0fJoDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=N2sYKvw3DKLjZmCYEaKlXKnd/Z8UJtqXS9OTvnC7IojwHf27QjZQeLCDIeKFw1ZIoH
	A8UkzXCGQgbFiwUTNV0tQnbNLotfIJPgptYwwpjP6HCKfmLGeA+8vja6VNl6HMGFKCnG
	2e9I0oStEQxXiN3Z/Fr480XIFwPmpjTMOFC2Q=
Received: by 10.150.2.16 with SMTP id 16mr5203606ybb.280.1301760802101;
	Sat, 02 Apr 2011 09:13:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id d14sm3439803ana.26.2011.04.02.09.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Apr 2011 09:13:20 -0700 (PDT)
From: Carlos Hernandez <carher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 12:13:16 -0400
Message-Id: <1301760796-10105-1-git-send-email-c-hernandez8@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Cc: Carlos Hernandez <c-hernandez8@ti.com>
Subject: [PATCH 1/1] lmbench: rename 'line' binary as 'lm_line'
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
X-List-Received-Date: Sat, 02 Apr 2011 16:15:25 -0000

Both lmbench and util-linux-ng packages provide own /usr/bin/line binaries.
Even though the binaries name is the same, their functionality is different.
This patch renames lmbench's line binary as lm_line to avoid conflicts with
util-linux-ng.
script/config-run is also modified (patch) to call lm_line instead of line.
Signed-off-By: Carlos Hernandez <c-hernandez8@ti.com>
---
 recipes/lmbench/lmbench/rename-line-binary.patch |   11 +++++++++++
 recipes/lmbench/lmbench_3.0-a9.bb                |    6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 recipes/lmbench/lmbench/rename-line-binary.patch

diff --git a/recipes/lmbench/lmbench/rename-line-binary.patch b/recipes/lmbench/lmbench/rename-line-binary.patch
new file mode 100644
index 0000000..997143b
--- /dev/null
+++ b/recipes/lmbench/lmbench/rename-line-binary.patch
@@ -0,0 +1,11 @@
+--- patches/scripts/config-run	2006-11-26 15:11:04.000000000 -0500
++++ patches/scripts/config-run	2011-04-01 09:35:50.000000000 -0400
+@@ -224,7 +224,7 @@ fi
+ 
+ echo "Hang on, we are calculating your cache line size."
+ ../bin/$OS/msleep 250
+-LINE_SIZE=`../bin/$OS/line -M ${MB}M`
++LINE_SIZE=`../bin/$OS/lm_line -M ${MB}M`
+ export LINE_SIZE
+ echo "OK, it looks like your cache line is $LINE_SIZE bytes."
+ echo ""
diff --git a/recipes/lmbench/lmbench_3.0-a9.bb b/recipes/lmbench/lmbench_3.0-a9.bb
index 1e2598a..65771a4 100644
--- a/recipes/lmbench/lmbench_3.0-a9.bb
+++ b/recipes/lmbench/lmbench_3.0-a9.bb
@@ -3,12 +3,13 @@ DESCRIPTION = "Tools for performance analysis."
 LICENSE = "GPL"
 RDEPENDS_${PN} = "debianutils"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
-	   file://lmbench-run"
+	   file://lmbench-run \
+          file://rename-line-binary.patch"
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
@@ -56,6 +57,7 @@ do_install () {
 	install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
 	install -d ${D}${datadir}/lmbench/scripts
 	install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
+	mv ${D}${bindir}/line ${D}${bindir}/lm_line
 }
 
 FILES_${PN} += "${datadir}/lmbench"
-- 
1.7.0.4



