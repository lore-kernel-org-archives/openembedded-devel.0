Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 324B460796
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:46:27 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so84201112wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fVkpensaDu4eLJrvUX+IUsDUNgTjNIiRcVq8OjkKLCE=;
	b=sazzUnLTmH31gSX2ifkSlbsK1nIudjuz2Qoq8wGmj63GVcm+sAa0WTJl5+LlZAI3Jq
	JCx1y1zVjjfdH70IJW5L00xQ2oOvqglgATxWbwzVow1Iu3TbbLHmp7b96++kfNeHOtK+
	S9/hOhUt0t0+FSMl+rOhSUx+rB1dZsJNn+7+HNT+KsHCPcIH7RdGnV44PPpXdIeo2aur
	jgx5sAvggs6t2OuywB7k1VYTxDsgL6k8r37W/b/7N1TyNwsAtzdzTydVv514ilKLuduV
	uamtGCcAedxYbNPAzZadESe1Fm0rOpVG+RnFOUp8nWC0YtBhvFlf0wxQillruJ7FC0Yr
	V8DQ==
X-Received: by 10.194.110.230 with SMTP id id6mr66851432wjb.67.1451493988183; 
	Wed, 30 Dec 2015 08:46:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w4sm66234952wje.49.2015.12.30.08.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 08:46:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 17:50:00 +0100
Message-Id: <1451494201-30941-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][jethro][master][meta-networking 1/2] cifs-utils: add PACKAGECONFIG for pam
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
X-List-Received-Date: Wed, 30 Dec 2015 16:46:29 -0000

* otherwise there are unpackaged files:
ERROR: QA Issue: cifs-utils: Files/directories were installed but not shipped in any package:
  /usr/lib/security
  /usr/lib/security/pam_cifscreds.so
  /usr/lib/security/.debug
  /usr/lib/security/.debug/pam_cifscreds.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
cifs-utils: 4 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 49a1aec..34630da 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[cifscreds] = "--enable-cifscreds,--disable-cifscreds,keyutils"
 # when enabled, it creates ${sbindir}/cifs.upcall and --ignore-fail-on-non-empty in do_install_append is needed
 PACKAGECONFIG[cifsupcall] = "--enable-cifsupcall,--disable-cifsupcall,krb5 libtalloc keyutils"
+PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disable-pam,libpam keyutils"
 
 inherit autotools pkgconfig
 
@@ -27,4 +28,6 @@ do_install_append() {
     rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
 }
 
+FILES_${PN} += "${base_libdir}/security"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 RRECOMMENDS_${PN} = "kernel-module-cifs"
-- 
2.6.4


