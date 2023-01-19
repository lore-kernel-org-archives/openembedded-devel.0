Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68BDC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 08:37:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41184.1674117474080818937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 00:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=D+I4fsyz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0383abefc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J7go8c006328;
	Thu, 19 Jan 2023 00:37:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=GvwxDuKs/bJMYBjbQLWhrrhbrHRitX708Jzw/lFNjaA=;
 b=D+I4fsyzcYrMdZ6xUdfCMngvfMvdUsV4G52J752BphpU8jgVDtv8abVOXdXjq+akfEku
 bavT2iG/UGpwDZj8KD4/meDc8faHsq6R3rGxL7lOSWR+g5q2i3fP34VBdmf/Czs9q91V
 4/gv7covtdYIDX+lzeH0Vrz2bnD7Co8cybszCRLXXZkmm9ICdAuOn7b6maWnByyzrJhM
 EHC0dF4gWwTXrH4t37qlGGEEUA1fW98SyvpF7G8oCEaKKV1WLK2RzgPv2ZeuLhOSauv9
 Fz4+873cIiCUcQh+90uXfvsvZfDVr9tt9OHcz5Hhoejetgeb2VjPEuNIncYPd9QQ3ClC LA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6vuk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2023 00:37:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 00:37:51 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 00:37:50 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <Randy.MacLeod@windriver.com>
Subject: [meta-networking][PATCH] crda: remove recipe
Date: Thu, 19 Jan 2023 16:37:44 +0800
Message-ID: <20230119083744.33977-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 9epm-RGjLBYuysnNXygSk_h5kNYYXzH0
X-Proofpoint-ORIG-GUID: 9epm-RGjLBYuysnNXygSk_h5kNYYXzH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_07,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190070
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30J7go8c006328
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 08:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100653

From: Kai Kang <kai.kang@windriver.com>

CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
("cfg80211: support loading regulatory database as firmware file") added
support to use the kernel's firmware request API which looks for the
firmware on /lib/firmware. Because of this CRDA is legacy software for
older kernels, remove the recipe.

It could change regulatory domains with iw and wpa_supplicant.

Refs
1. https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree/R=
EADME#n8
2. https://wireless.wiki.kernel.org/en/developers/Regulatory/CRDA

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-Make-alpha2-to-be-3-characters-long.patch |  31 ------
 ...-Makefile-respect-LDFLAGS-for-libreg.patch |  29 -----
 .../0001-reglib-Remove-unused-variables.patch |  59 ----------
 .../crda/crda/crda-4.14-python-3.patch        | 101 ------------------
 ...o-not-run-ldconfig-if-destdir-is-set.patch |  21 ----
 .../crda/fix-gcc-6-unused-variables.patch     |  11 --
 .../crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 ----------
 ...-linking-of-libraries-used-by-reglib.patch |  57 ----------
 .../recipes-connectivity/crda/crda/make.patch |  25 -----
 ...e-target-word-size-instead-of-host-s.patch |  34 ------
 .../recipes-connectivity/crda/crda_3.18.bb    |  40 -------
 11 files changed, 466 deletions(-)
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/crda-4.14-python-3.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/fix-gcc-6-unused-variables.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/make.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda_3.18.bb

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-netwo=
rking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make=
-alpha2-to-be-3-characters-long.patch
deleted file mode 100644
index f1d2cbc5a..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/0001-Make-alpha2-to-be-3-characters-long.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 078e962d345fd0536fe7ba797485ee1a4159c032 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Feb 2022 09:18:30 -0800
-Subject: [PATCH] Make alpha2 to be 3 characters long
-
-Fixes buffer overflow
-reglib.c:969:9: error: 'sscanf' may overflow; destination buffer in argu=
ment 3 has size 2, but the corresponding specifier may require size 3 [-W=
error,-Wfortify-source]
-                      alpha2,
-                      ^
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- reglib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/reglib.c b/reglib.c
-index e00e9b8..8565a0b 100644
---- a/reglib.c
-+++ b/reglib.c
-@@ -958,7 +958,7 @@ reglib_parse_rules(FILE *fp, struct ieee80211_regdom=
ain *trd)
- static int reglib_parse_country_dfs(char *line, struct ieee80211_regdom=
ain *rd)
- {
- 	char dfs_region_alpha[9];
--	char alpha2[2];
-+	char alpha2[3];
- 	int hits;
-=20
- 	memset(rd, 0, sizeof(*rd));
---=20
-2.35.1
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-netwo=
rking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make=
file-respect-LDFLAGS-for-libreg.patch
deleted file mode 100644
index 16800d506..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1e1a78b7b4fa1662b4447aa19c15b1e839b7e9db Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-klie=
ser@phytec.de>
-Date: Wed, 24 Aug 2016 10:58:45 +0200
-Subject: [PATCH] Makefile: respect LDFLAGS for libreg
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 2879896..1650db8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/=
*.pem)
-=20
- $(LIBREG): regdb.h reglib.h reglib.c
- 	$(NQ) '  CC  ' $@
--	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LIBREGLDLIBS)
-+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LDFLAGS) $(LIBREGLDLIBS)
-=20
- install-libreg-headers:
- 	$(NQ) '  INSTALL  libreg-headers'
---=20
-1.9.1
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/0001-reglib-Remove-unused-variables.patch b/meta-networking=
/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-reglib-Re=
move-unused-variables.patch
deleted file mode 100644
index c6c3c53f1..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/0001-reglib-Remove-unused-variables.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 1bd6ff9d10c83afbc9954fc38b953e9167e6d4a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 28 Aug 2022 14:01:55 -0700
-Subject: [PATCH] reglib: Remove unused variables
-
-These counters are not used anywhere therefore delete them
-Fixes
-reglib.c:1015:15: error: variable 'i' set but not used [-Werror,-Wunused=
-but-set-variable]
-        unsigned int i =3D 0;
-                     ^
-reglib.c:1062:15: error: variable 'lines' set but not used [-Werror,-Wun=
used-but-set-variable]
-        unsigned int lines =3D 0;
-                     ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- reglib.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/reglib.c b/reglib.c
-index 8565a0b..6c62c2c 100644
---- a/reglib.c
-+++ b/reglib.c
-@@ -1012,7 +1012,6 @@ static int reglib_find_next_country_stream(FILE *f=
p)
- {
- 	fpos_t prev_pos;
- 	int r;
--	unsigned int i =3D 0;
-=20
- 	while(1) {
- 		char line[1024];
-@@ -1030,7 +1029,6 @@ static int reglib_find_next_country_stream(FILE *f=
p)
- 		line_p =3D fgets(line, sizeof(line), fp);
- 		if (line_p =3D=3D line) {
- 			if (strspn(line, "\n") =3D=3D strlen(line)) {
--				i++;
- 				continue;
- 			}
- 			if (strncmp(line, "country", 7) !=3D 0)
-@@ -1059,7 +1057,6 @@ struct ieee80211_regdomain *reglib_parse_country(F=
ILE *fp)
-=20
- FILE *reglib_create_parse_stream(FILE *f)
- {
--	unsigned int lines =3D 0;
- 	FILE *fp;
-=20
- 	fp =3D tmpfile();
-@@ -1076,7 +1073,6 @@ FILE *reglib_create_parse_stream(FILE *f)
- 		if (line_p =3D=3D line) {
- 			if (strchr(line, '#') =3D=3D NULL) {
- 				fputs(line, fp);
--				lines++;
- 			}
- 			continue;
- 		} else
---=20
-2.37.2
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/m=
eta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
deleted file mode 100644
index 9125d0ab9..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/crda-4.14-python-3.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Imported from Gentoo
-https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D9c50acec16bc7c33d=
6dc122c007d713e7fbecf9c
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/utils/key2pub.py
-+++ b/utils/key2pub.py
-@@ -1,22 +1,22 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-=20
- import sys
- try:
-        from M2Crypto import RSA
--except ImportError, e:
-+except ImportError as e:
-        sys.stderr.write('ERROR: Failed to import the "M2Crypto" module:=
 %s\n' % e.message)
-        sys.stderr.write('Please install the "M2Crypto" Python module.\n=
')
-        sys.stderr.write('On Debian GNU/Linux the package is called "pyt=
hon-m2crypto".\n')
-        sys.exit(1)
-=20
- def print_ssl_64(output, name, val):
--    while val[0] =3D=3D '\0':
-+    while val[0:1] =3D=3D b'\0':
-         val =3D val[1:]
-     while len(val) % 8:
--        val =3D '\0' + val
-+        val =3D b'\0' + val
-     vnew =3D []
-     while len(val):
--        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], va=
l[6], val[7]))
-+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4], val[4:5], =
val[5:6], val[6:7], val[7:8]))
-         val =3D val[8:]
-     vnew.reverse()
-     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew)))
-@@ -34,13 +34,13 @@ def print_ssl_64(output, name, val):
-     output.write('};\n\n')
-=20
- def print_ssl_32(output, name, val):
--    while val[0] =3D=3D '\0':
-+    while val[0:1] =3D=3D b'\0':
-         val =3D val[1:]
-     while len(val) % 4:
--        val =3D '\0' + val
-+        val =3D b'\0' + val
-     vnew =3D []
-     while len(val):
--        vnew.append((val[0], val[1], val[2], val[3], ))
-+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4]))
-         val =3D val[4:]
-     vnew.reverse()
-     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew)))
-@@ -81,21 +81,21 @@ struct pubkey {
-=20
- static struct pubkey keys[] __attribute__((unused))=3D {
- ''')
--    for n in xrange(n + 1):
-+    for n in range(n + 1):
-         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
-     output.write('};\n')
-     pass
-=20
- def print_gcrypt(output, name, val):
-     output.write('#include <stdint.h>\n')
--    while val[0] =3D=3D '\0':
-+    while val[0:1] =3D=3D b'\0':
-         val =3D val[1:]
-     output.write('static const uint8_t %s[%d] =3D {\n' % (name, len(val=
)))
-     idx =3D 0
-     for v in val:
-         if not idx:
-             output.write('\t')
--        output.write('0x%.2x, ' % ord(v))
-+        output.write('0x%.2x, ' % (v if sys.version_info[0] >=3D3 else =
ord(v)))
-         idx +=3D 1
-         if idx =3D=3D 8:
-             idx =3D 0
-@@ -118,7 +118,7 @@ struct key_params {
-=20
- static const struct key_params keys[] __attribute__((unused))=3D {
- ''')
--    for n in xrange(n + 1):
-+    for n in range(n + 1):
-         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
-     output.write('};\n')
-    =20
-@@ -136,7 +136,7 @@ except IndexError:
-     mode =3D None
-=20
- if not mode in modes:
--    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|=
'.join(modes.keys()))
-+    print('Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|=
'.join(modes.keys())))
-     sys.exit(2)
-=20
- output =3D open(outfile, 'w')
-@@ -154,3 +154,5 @@ for f in files:
-     idx +=3D 1
-=20
- modes[mode][1](output, idx - 1)
-+
-+output.close()
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networki=
ng/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-l=
dconfig-if-destdir-is-set.patch
deleted file mode 100644
index 3ef35ee54..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/do-not-run-ldconfig-if-destdir-is-set.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 23 Aug 2014 12:27:34 -0700
-Subject: crda: Do not run ldconfig if DESTDIR is set
-
-Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless/m=
sg126028.html]
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
---- a/Makefile
-+++ b/Makefile
-@@ -132,7 +132,9 @@ install-libreg:
- 	$(NQ) '  INSTALL  libreg'
- 	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
- 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
-+ifndef DESTDIR
- 	$(Q)ldconfig
-+endif
-=20
- %.o: %.c regdb.h $(LIBREG)
- 	$(NQ) '  CC  ' $@
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynamic-=
layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variab=
les.patch
deleted file mode 100644
index 747804d34..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/fix-gcc-6-unused-variables.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- crda-3.18/utils/key2pub.py.orig	2016-06-18 09:54:23.671326113 -0400
-+++ crda-3.18/utils/key2pub.py	2016-06-18 09:54:34.387326300 -0400
-@@ -115,7 +115,7 @@
- 	.n =3D _n, .len_n =3D sizeof(_n),	\
- }
-=20
--static const struct key_params keys[] =3D {
-+static const struct key_params keys[] __attribute__((unused))=3D {
- ''')
-     for n in xrange(n + 1):
-         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dynam=
ic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_=
OPENSSL-1.patch
deleted file mode 100644
index 1bb5c638f..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/fix-issues-when-USE_OPENSSL-1.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 8d2164a090f17286ea8291f30a123595cf447dc3 Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Wed, 30 Nov 2016 10:27:36 +0800
-Subject: [PATCH] crda: fix issues when 'USE_OPENSSL=3D1'.
-
-Fxed the below issues if configured with 'USE_OPENSSL=3D1':
-a. keys-ssl.c uses BN_ULONG but doesn't include the openssl headers lead=
ing
-   to build failures:
-   keys-ssl.c:2:8: error: unknown type name 'BN_ULONG'
-   static BN_ULONG e_0[1] =3D {
-
-b. The large unqualified constants also break building:
-   keys-ssl.c:8:2: warning: overflow in implicit constant conversion [-W=
overflow]
-     0x63a2705416a0d8e1, 0xdc9fca11c8ba757b,
-
-c. keys-ssl.c: error: 'keys' defined but not used [-Werror=3Dunused-vari=
able]
-   static struct pubkey keys[] =3D {
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-Upstream-Status: Pending
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- utils/key2pub.py | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/utils/key2pub.py b/utils/key2pub.py
-index 401d58a..3ae00b8 100755
---- a/utils/key2pub.py
-+++ b/utils/key2pub.py
-@@ -24,7 +24,7 @@ def print_ssl_64(output, name, val):
-     for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
-         if not idx:
-             output.write('\t')
--        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(v1),=
 ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
-+        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (ord(v=
1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
-         idx +=3D 1
-         if idx =3D=3D 2:
-             idx =3D 0
-@@ -60,6 +60,7 @@ def print_ssl_32(output, name, val):
- def print_ssl(output, name, val):
-     import os
-     output.write('#include <stdint.h>\n')
-+    output.write('#include <openssl/bn.h>\n')
-     if os.getenv('TARGET_BITS') =3D=3D '64':
-         return print_ssl_64(output, name, val)
-     else:
-@@ -78,7 +79,7 @@ struct pubkey {
-=20
- #define KEYS(e,n)	{ KEY(e), KEY(n), }
-=20
--static struct pubkey keys[] =3D {
-+static struct pubkey keys[] __attribute__((unused))=3D {
- ''')
-     for n in xrange(n + 1):
-         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
---=20
-1.9.1
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networ=
king/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linkin=
g-of-libraries-used-by-reglib.patch
deleted file mode 100644
index 812e98379..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/fix-linking-of-libraries-used-by-reglib.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 890f5bf2654b695a866262d72bfa9750af921a3b Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 23 Aug 2014 12:26:37 -0700
-Subject: [PATCH] Fix linking of libraries used by libreg
-
-The math and crypto libraries are called by and need to be linked to
-libreg.so, not to the executables.
-
-Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless/m=
sg126027.html]
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a3ead30..da2dcc3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -30,7 +30,7 @@ CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
- CFLAGS +=3D -Wall -g
- LDLIBREG +=3D -lreg
- LDLIBS +=3D $(LDLIBREG)
--LDLIBS +=3D -lm
-+LIBREGLDLIBS +=3D -lm
- LIBREG +=3D libreg.so
- LDFLAGS +=3D -L ./
-=20
-@@ -40,13 +40,13 @@ all_noverify: $(LIBREG) crda intersect regdbdump db2=
rd optimize
-=20
- ifeq ($(USE_OPENSSL),1)
- CFLAGS +=3D -DUSE_OPENSSL -DPUBKEY_DIR=3D\"$(RUNTIME_PUBKEY_DIR)\" `pkg=
-config --cflags openssl`
--LDLIBS +=3D `pkg-config --libs openssl`
-+LIBREGLDLIBS +=3D `pkg-config --libs openssl`
-=20
- $(LIBREG): keys-ssl.c
-=20
- else
- CFLAGS +=3D -DUSE_GCRYPT
--LDLIBS +=3D -lgcrypt
-+LIBREGLDLIBS +=3D -lgcrypt
-=20
- $(LIBREG): keys-gcrypt.c
-=20
-@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/=
*.pem)
-=20
- $(LIBREG): regdb.h reglib.h reglib.c
- 	$(NQ) '  CC  ' $@
--	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^
-+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LIBREGLDLIBS)
-=20
- install-libreg-headers:
- 	$(NQ) '  INSTALL  libreg-headers'
---=20
-2.7.4
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/rec=
ipes-connectivity/crda/crda/make.patch
deleted file mode 100644
index 0b737852c..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/make.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-These headers are not related to any Make rule but they do appear in
-compiling of libreg.so, specifying .h files in compiler cmdline is flagg=
ed
-as error by clang
-
-| clang-4.0: error: cannot specify -o when generating multiple output fi=
les
-| make: *** [libreg.so] Error 1
-
-This is how we see headers in cmdline
--O2 -fpic -std=3Dgnu
-99 -Wall -Werror -pedantic -Wall -g -DUSE_GCRYPT -DCONFIG_LIBNL30 `pkg-c=
onfig --cflags libnl-3.0`  -o libreg.so -shared -Wl,-soname,libreg.so
-regdb.h reglib.h reglib.c keys-gcrypt.c -Wl,-O1 -Wl,--hash-style=3Dgnu -=
Wl,--as-needed -L ./ -lm -lgcrypt
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Makefile.kk	2016-11-15 04:54:53.338670000 +0000
-+++ a/Makefile	2016-11-15 04:55:07.718670000 +0000
-@@ -114,7 +114,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
- 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
- 	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
-=20
--$(LIBREG): regdb.h reglib.h reglib.c
-+$(LIBREG): reglib.c
- 	$(NQ) '  CC  ' $@
- 	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LDFLAGS) $(LIBREGLDLIBS)
-=20
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-network=
ing/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-=
word-size-instead-of-host-s.patch
deleted file mode 100644
index 100b765f2..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/use-target-word-size-instead-of-host-s.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c1c42513edd27c97341f2033af77c13a4724eb8f Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Fri, 25 Nov 2016 16:48:01 +0800
-Subject: [PATCH] crda: Use target word size instead of host's.
-
-In key2pub.py, the codes check the wordsize
-of the host machine but not the target's, this fix
-fetches the wordsize of target from the build system.
-
-Upstream-Status: Pending
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- utils/key2pub.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/key2pub.py b/utils/key2pub.py
-index 3e84cd2..401d58a 100755
---- a/utils/key2pub.py
-+++ b/utils/key2pub.py
-@@ -58,9 +58,9 @@ def print_ssl_32(output, name, val):
-     output.write('};\n\n')
-=20
- def print_ssl(output, name, val):
--    import struct
-+    import os
-     output.write('#include <stdint.h>\n')
--    if len(struct.pack('@L', 0)) =3D=3D 8:
-+    if os.getenv('TARGET_BITS') =3D=3D '64':
-         return print_ssl_64(output, name, val)
-     else:
-         return print_ssl_32(output, name, val)
---=20
-1.9.1
-
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipe=
s-connectivity/crda/crda_3.18.bb
deleted file mode 100644
index 2f4d4dac9..000000000
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda_3.18.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY =3D "Wireless Central Regulatory Domain Agent"
-HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
-SECTION =3D "net"
-LICENSE =3D "copyleft-next-0.3.0"
-LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D8743a2c359037d4d3=
29a31e79eabeffe"
-
-DEPENDS =3D "python3-m2crypto-native libnl libgcrypt"
-
-SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP}.ta=
r.xz \
-           file://do-not-run-ldconfig-if-destdir-is-set.patch \
-           file://fix-linking-of-libraries-used-by-reglib.patch \
-           file://fix-gcc-6-unused-variables.patch \
-           file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
-           file://make.patch \
-           file://use-target-word-size-instead-of-host-s.patch \
-           file://fix-issues-when-USE_OPENSSL-1.patch \
-           file://crda-4.14-python-3.patch \
-           file://0001-Make-alpha2-to-be-3-characters-long.patch \
-           file://0001-reglib-Remove-unused-variables.patch \
-"
-SRC_URI[md5sum] =3D "0431fef3067bf503dfb464069f06163a"
-SRC_URI[sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa=
7aa921b01e8ecdbf"
-
-inherit pkgconfig python3-dir python3native siteinfo
-
-# Recursive make problem
-EXTRA_OEMAKE =3D "MAKEFLAGS=3D DESTDIR=3D${D} LIBDIR=3D${libdir}/crda LD=
LIBREG=3D'-Wl,-rpath,${libdir}/crda -lreg' \
-                UDEV_RULE_DIR=3D${nonarch_base_libdir}/udev/rules.d/"
-TARGET_BITS =3D "${SITEINFO_BITS}"
-export TARGET_BITS
-
-do_compile() {
-    oe_runmake all_noverify
-}
-
-do_install() {
-    oe_runmake SBINDIR=3D${sbindir}/ install
-}
-
-RDEPENDS:${PN} =3D "udev wireless-regdb"
--=20
2.17.1


