Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 12DE87F265
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 14:33:01 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y17so30595274wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DE20P3yIk7dv8AJDQhlNvL1VI6c+DswuqWQXD8o2k58=;
	b=Cj7uv5Vpt+BGx+lZkIZHTkc6QhvQQO0BA+MgThqxD44g8T8m/O57Zxp2d+U3C2MRK7
	+RpmSTuxe9jFukczR7vn/UFVWwoRPZcu3NxgA+iBwFBvBr2Ee6nUewMNpF7cfUQK1KRQ
	sCPQ4t07zV0xehGzRORJAukvLnpFWkc1aTXsNf30CaZlhOx7/uyfTgXV8/jVyusfnvax
	mPpmSf2I1yFSbSSH3rLp5z3wdWy9EN62xC6JLhWnvCIMJ2UjuHF8DI6uMoBDlTq7xIho
	4tvmZT9VD0WXZNRtERmqu7VUXqszmVnBvVRBNmO3253ObUHb3lPHmFaHfyiE9RIxz5iz
	g8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DE20P3yIk7dv8AJDQhlNvL1VI6c+DswuqWQXD8o2k58=;
	b=kV6H/g6abqim94H1eFzl1epv7YqgewxNOK2hA/MXwu+Pzg7mm/nspYqqKeDYw3T8vf
	92mS81Kx/6YvmxGTPDZocN2TfPrUpO3WDZaGDdCXguPxqhpWF/4Y2U75Wnxn8Ke3xgjE
	7fuBhn9//PwHAbN4J6WcqKiJYTl6aPjcwGuMdBsq+Ntn3y3CAoQmy6xg9pVe7ZQVkg83
	hahECIKPtsCDya+MboDQ6ramwNYHnruae81Z3NMAa/cZ9s5zWjyEcmEE17aTXSH5pFtm
	+Cv5FxAr5ZQvY3QfePiUqOK4Q0332+JO04doaow1NL5B+7tmrN601wI1nyAn8lXfSnZ+
	VUdQ==
X-Gm-Message-State: APjAAAXp1qAJIjSOXv+N827nYtRvi8AOsxjQuwLd4WrqD8RWyDwIMQ1k
	sKJ3p5rw0YRuNwA+hh31yLfENZpC
X-Google-Smtp-Source: APXvYqzIpCLShDGYh4x9lLMrgPA72NsC49D0LtW1vzwuyzZ69eHr4d7BP0kABL8013HWVHmuOpVVkg==
X-Received: by 2002:adf:f288:: with SMTP id k8mr65133358wro.301.1577629982348; 
	Sun, 29 Dec 2019 06:33:02 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f65sm17730081wmf.2.2019.12.29.06.33.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 06:33:01 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Dec 2019 14:32:59 +0000
Message-Id: <20191229143259.92362-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ostree: Tidy FILES_${PN} using PACKAGE_BEFORE_PN
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
X-List-Received-Date: Sun, 29 Dec 2019 14:33:02 -0000

Use PACKAGE_BEFORE_PN to pick files out of the install tree before
FILES_${PN} gets there, so we can just list necessary additions rather
than everything.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-extended/ostree/ostree_2019.6.bb  | 23 +++++--------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
index 19955e973a85..bcf511b9025d 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
@@ -104,7 +104,7 @@ do_install_append_class-native() {
     create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="${STAGING_LIBDIR_NATIVE}/ostree/ostree-grub-generator"
 }
 
-PACKAGES += " \
+PACKAGE_BEFORE_PN = " \
     ${PN}-dracut \
     ${PN}-grub \
     ${PN}-mkinitcpio \
@@ -112,22 +112,11 @@ PACKAGES += " \
     ${PN}-trivial-httpd \
 "
 
-FILES_${PN} = " \
-    ${bindir}/ostree \
-    ${bindir}/rofiles-fuse \
-    ${datadir}/${BPN} \
-    ${datadir}/gir-1.0 \
-    ${nonarch_libdir}/${BPN}/ostree-remount \
-    ${libdir}/girepository-1.0 \
-    ${libdir}/lib*${SOLIBS} \
-    ${libdir}/ostree/ostree-grub-generator \
-    ${libdir}/tmpfiles.d/ostree-tmpfiles.conf \
-    ${sysconfdir}/ostree/remotes.d \
-    ${systemd_unitdir}/system-generators/ostree-system-generator \
-    ${systemd_unitdir}/system/ostree-finalize-staged.path \
-    ${systemd_unitdir}/system/ostree-finalize-staged.service \
-    ${systemd_unitdir}/system/ostree-remount.service \
+FILES_${PN} += " \
+    ${nonarch_libdir}/${BPN} \
     ${nonarch_libdir}/tmpfiles.d \
+    ${systemd_unitdir}/system \
+    ${systemd_unitdir}/system-generators \
 "
 FILES_${PN}-dracut = " \
     ${sysconfdir}/dracut.conf.d \
@@ -142,7 +131,7 @@ FILES_${PN}-mkinitcpio = " \
     ${libdir}/initcpio \
 "
 FILES_${PN}-switchroot = " \
-    ${nonarch_libdir}/ostree/ostree-prepare-root \
+    ${nonarch_libdir}/${BPN}/ostree-prepare-root \
     ${systemd_unitdir}/system/ostree-prepare-root.service \
 "
 FILES_${PN}-trivial-httpd = " \
-- 
2.17.1


