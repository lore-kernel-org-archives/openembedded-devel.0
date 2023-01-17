Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED7BC6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 04:22:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.189519.1673929347981232644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 20:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=m/tMPj+a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03812cce2c=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H4KYSX032041
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 20:22:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=mHH6pdSokX8a72SCH5dZquLJmafc7gJk+vUVBPOchG0=;
 b=m/tMPj+aOXllQmXESIjumayTwgbTPrj8WaCgW9l+xYl2bVn1IzQt6axMigBH0kaTyxll
 BpXwVzWVjbQbj7ZIIFziSk42kg7AyqCC5Y6yMfFI5aoGKbSlx50g0uJSx2awpv20c5eU
 tKDsrgU2SpAwOMRlNcUQMSJfRzREYZ4VYhzd8dKXsAasJ0X59aG60Lhk/M1S4+5Hu5/T
 bX9paw/p24GACaXDf2m7EOIUVc4R+BU0kCq++pIU5UjgFcl7JfEXsG74jBBEzo1Qeuti
 PtKzMi97qmimsoIsl7Kpv+QPazxKYraqjw6qz9oRrirE64064KrXNSKPK6bUA7X4C09u Kg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6tcp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 20:22:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 20:22:26 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 20:22:26 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] crda: 3.18 -> 4.15
Date: Tue, 17 Jan 2023 12:22:23 +0800
Message-ID: <20230117042223.29411-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: rzU520wVz5ELzTavJPFDX4lw4xTvEQz4
X-Proofpoint-ORIG-GUID: rzU520wVz5ELzTavJPFDX4lw4xTvEQz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_01,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30H4KYSX032041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 04:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100586

From: Kai Kang <kai.kang@windriver.com>

Update crda from 3.18 to 4.15:

* use git repo in SRC_URI that no tar archive found for recent releases
* drop fix-gcc-6-unused-variables.patch and make.patch
* rebase patches

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-Makefile-respect-LDFLAGS-for-libreg.patch | 12 ++++++---
 .../crda/crda/crda-4.14-python-3.patch        | 11 +++++++-
 ...o-not-run-ldconfig-if-destdir-is-set.patch | 13 ++++++++--
 .../crda/fix-gcc-6-unused-variables.patch     | 11 --------
 ...-linking-of-libraries-used-by-reglib.patch |  8 +++---
 .../recipes-connectivity/crda/crda/make.patch | 25 -------------------
 .../crda/{crda_3.18.bb =3D> crda_4.15.bb}       |  9 +++----
 7 files changed, 37 insertions(+), 52 deletions(-)
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/fix-gcc-6-unused-variables.patch
 delete mode 100644 meta-networking/dynamic-layers/meta-python/recipes-co=
nnectivity/crda/crda/make.patch
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/c=
rda/{crda_3.18.bb =3D> crda_4.15.bb} (80%)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-netwo=
rking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make=
file-respect-LDFLAGS-for-libreg.patch
index 16800d506..d61ea8069 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
@@ -7,20 +7,24 @@ Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
 Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+
+Rebase for crda 4.15.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile b/Makefile
-index 2879896..1650db8 100644
+index 528a14e..31f1b5e 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/=
*.pem)
 =20
- $(LIBREG): regdb.h reglib.h reglib.c
+ $(LIBREG): reglib.c regdb.h reglib.h
  	$(NQ) '  CC  ' $@
--	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LIBREGLDLIBS)
-+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LDFLAGS) $(LIBREGLDLIBS)
+-	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $<=
 $(LIBREGLDLIBS)
++	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $<=
 $(LDFLAGS) $(LIBREGLDLIBS)
 =20
  install-libreg-headers:
  	$(NQ) '  INSTALL  libreg-headers'
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/m=
eta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
index 9125d0ab9..6c209dc37 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/crda-4.14-python-3.patch
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/crda-4.14-python-3.patch
@@ -3,6 +3,15 @@ https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D9=
c50acec16bc7c33d6dc122c007
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Rebase for crda 4.15.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+ utils/key2pub.py | 28 +++++++++++++++-------------
+ 1 file changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/utils/key2pub.py b/utils/key2pub.py
+index 22fda55..2a4980b 100755
 --- a/utils/key2pub.py
 +++ b/utils/key2pub.py
 @@ -1,22 +1,22 @@
@@ -77,7 +86,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              idx =3D 0
 @@ -118,7 +118,7 @@ struct key_params {
 =20
- static const struct key_params keys[] __attribute__((unused))=3D {
+ static const struct key_params __attribute__ ((unused)) keys[] =3D {
  ''')
 -    for n in xrange(n + 1):
 +    for n in range(n + 1):
diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networki=
ng/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-l=
dconfig-if-destdir-is-set.patch
index 3ef35ee54..b5bce40a9 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/do-not-run-ldconfig-if-destdir-is-set.patch
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/do-not-run-ldconfig-if-destdir-is-set.patch
@@ -7,12 +7,21 @@ Upstream-Status: Backport [http://www.spinics.net/lists=
/linux-wireless/msg126028
 Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
=20
+Rebase patch for crda 4.15.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 6ca26f3..528a14e 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -132,7 +132,9 @@ install-libreg:
+@@ -127,7 +127,9 @@ install-libreg:
  	$(NQ) '  INSTALL  libreg'
  	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
- 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+ 	$(Q)$(INSTALL) -m 644 $(LIBREG) $(DESTDIR)/$(LIBDIR)/
 +ifndef DESTDIR
  	$(Q)ldconfig
 +endif
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
ity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networ=
king/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linkin=
g-of-libraries-used-by-reglib.patch
index 812e98379..a7fb22a72 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/fix-linking-of-libraries-used-by-reglib.patch
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda/fix-linking-of-libraries-used-by-reglib.patch
@@ -15,7 +15,7 @@ Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/Makefile b/Makefile
-index a3ead30..da2dcc3 100644
+index 528a14e..acd818b 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -30,7 +30,7 @@ CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
@@ -45,10 +45,10 @@ index a3ead30..da2dcc3 100644
 =20
 @@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/=
*.pem)
 =20
- $(LIBREG): regdb.h reglib.h reglib.c
+ $(LIBREG): reglib.c regdb.h reglib.h
  	$(NQ) '  CC  ' $@
--	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^
-+	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $^=
 $(LIBREGLDLIBS)
+-	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $<
++	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIBREG) $<=
 $(LIBREGLDLIBS)
 =20
  install-libreg-headers:
  	$(NQ) '  INSTALL  libreg-headers'
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
ity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipe=
s-connectivity/crda/crda_4.15.bb
similarity index 80%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivi=
ty/crda/crda_3.18.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda_4.15.bb
index 2f4d4dac9..dd2df3222 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda_3.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crd=
a/crda_4.15.bb
@@ -6,20 +6,19 @@ LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D=
8743a2c359037d4d329a31e79eabe
=20
 DEPENDS =3D "python3-m2crypto-native libnl libgcrypt"
=20
-SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP}.ta=
r.xz \
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.g=
it;branch=3Dmaster \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
-           file://fix-gcc-6-unused-variables.patch \
            file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
-           file://make.patch \
            file://use-target-word-size-instead-of-host-s.patch \
            file://fix-issues-when-USE_OPENSSL-1.patch \
            file://crda-4.14-python-3.patch \
            file://0001-Make-alpha2-to-be-3-characters-long.patch \
            file://0001-reglib-Remove-unused-variables.patch \
 "
-SRC_URI[md5sum] =3D "0431fef3067bf503dfb464069f06163a"
-SRC_URI[sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa=
7aa921b01e8ecdbf"
+SRCREV =3D "6aeea99ceeec85dd7a9202ee39c7f3b2a8f5195d"
+
+S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig python3-dir python3native siteinfo
=20
--=20
2.17.1


