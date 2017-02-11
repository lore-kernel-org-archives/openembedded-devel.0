Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id D79716093B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2017 14:17:52 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 0BED8800CC;
	Sat, 11 Feb 2017 15:17:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 10l9aToE30yL; Sat, 11 Feb 2017 15:17:51 +0100 (CET)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id A2F81800A7;
	Sat, 11 Feb 2017 15:17:51 +0100 (CET)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2017 15:17:45 +0100
Message-Id: <20170211141745.3380-1-gyurco@freemail.hu>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Sat, 11 Feb 2017 14:17:54 -0000

Since Samba uses libtevent-internal.h in some places, it is
incompatible with external libtevent versions if they're not
the same as the built-in, and just crashes.

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 0ba59c7..754455e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -33,7 +33,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libldb krb5 libbsd libaio libpam"
 DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
@@ -74,7 +74,7 @@ SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pd
 SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
 SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
 
-SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
+SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
-- 
2.9.3


