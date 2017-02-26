Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3F9472F5B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2017 11:21:59 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o22so6250414wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2017 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wY8lyo0RzML7q9XywI9bHamhhL126H8+kpGCEMRpaMk=;
	b=IL9MMh/e8Cd9JtGk1LhakS1XcmbLI8PawMrrvuPOUDR5LG+bx71kDV3XG3lK1tjn/P
	gs7aC9D3IbATkQ/yUSbH1+jcDT0RXcrx9MnyF4846ST/fT0yONsZoFh4nH2M8ZJw6jCn
	wQM6JEShjcRUfxcaPAFi+WexXHrEraa3AhhFr14SljLpd7K8xJUbnqysoiW4CQ2c053X
	taSzg2KKsxQLgVItaBabtp7bUjYX8wuXab6pmQkhAySganxxY4sGkpGiE0z2urWEv5+B
	z+peLK83iEozhQW1BiePYHfz4SgQoYh5CSepAdaB7HoVLqSNuZb3JyAU65MDiit6imUS
	hy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wY8lyo0RzML7q9XywI9bHamhhL126H8+kpGCEMRpaMk=;
	b=UUmzVG9ibDnGUitTs1y7W0Q7H2LeiVZb7s8UIn70sbTXfY7HwEZdUyallcanOUQUSB
	jYPzr37B7Ldb8O6RnPPUETyHaPJfNM0IyqkYjduEKOASUSK5pfpaPfUa7lbY77Z0cM81
	QJ9nD7+2VNpBXgvkbLvESdoe2AkNwQNLwG07nV5XfDrA4Gafn/K73caMmmrd8ejHxsaa
	46j3nu3uRbO0L5Y34NHENu6RMqJ/+lvUV1MdhIxQ3vSOp2YndcVpXer3Didq1PsHRTQK
	1fGv/s7QuJQ9Qd/rxg4l3MPs8butHhvyTQnG21EVrYi7SIweegXO+G4+oLtDqaTOgQE+
	odpA==
X-Gm-Message-State: AMke39ljpJwTm1aDydohWKScSQdMu8d+MZZsj2VcYwPnC9X9hs2/Ntit2/gSAkipsIlv7g==
X-Received: by 10.223.171.229 with SMTP id s92mr10399253wrc.64.1488108120349; 
	Sun, 26 Feb 2017 03:22:00 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j18sm17888292wrb.33.2017.02.26.03.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Feb 2017 03:21:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2017 12:21:57 +0100
Message-Id: <20170226112157.21081-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH][meta-networking] Revert "Samba: use built-in libtevent"
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
X-List-Received-Date: Sun, 26 Feb 2017 11:22:00 -0000

http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111345.html

This reverts commit cd366899ed6f0f07d643fd4e54c1ccb91540fc23.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 754455eb6..0ba59c7d3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -33,7 +33,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libldb krb5 libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
 DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
@@ -74,7 +74,7 @@ SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pd
 SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
 SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
 
-SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
+SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
-- 
2.11.1


