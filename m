Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE2DC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 16:50:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18981.1678380621528144504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 08:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ayOPqBt3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432afb881=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329DhOEk008770
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 16:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=cXDdmt1h8sqeKr4ZUEdp3z+vRfG9txs+00UOjy1Njns=;
 b=ayOPqBt3em+jMYZyDaYZIXM65/8te2mI2Ul+8UIcpAxCc5yjhY3DBxqitYXhntiLu2mD
 0a8Hhkzu9SD9xWbmNsC4Y0UMxDc2cMHOUXr+658M/2ar90YrCyjxIeOBXNHTmv3b/cFC
 NohkkSO5AAhXutJghSL+65ehyaQlxFnEbVuOgoWN3wmuuVk0uPqAmxoNPevHE5PKSnqS
 Wp56gIllyduFgfoRoZyy5C9IxvmTuuUD77GlwJCAnKU2VtOL2dQC3XJbBusJpF9IO2lk
 mAl0o4atgKGtflVGftmpyopH3MpXbXekobecSLGnFZvLXeYr2NPywwG2BzNKO519MQJ7 2A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6hveh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 16:50:20 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 9 Mar 2023 08:50:19 -0800
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Thu, 9 Mar 2023 08:50:19 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] libidn: update to 1.41
Date: Thu, 9 Mar 2023 08:50:19 -0800
Message-ID: <20230309165019.585959-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 9UpLH_lxY_FI9yNS2v2rrXcbXzHOgl4j
X-Proofpoint-GUID: 9UpLH_lxY_FI9yNS2v2rrXcbXzHOgl4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_08,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 329DhOEk008770
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 16:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101458

Adjust dont-depend-on-help2man patch to apply.  Remove unneeded
format warnings patch.

Cosmetic changes to license files require new checksums.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../0001-idn-format-security-warnings.patch   | 180 ------------------
 .../libidn/dont-depend-on-help2man.patch      |  24 +--
 .../libidn/{libidn_1.36.bb =3D> libidn_1.41.bb} |  16 +-
 3 files changed, 21 insertions(+), 199 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libidn/libidn/0001-idn-forma=
t-security-warnings.patch
 rename meta-oe/recipes-extended/libidn/{libidn_1.36.bb =3D> libidn_1.41.=
bb} (66%)

diff --git a/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-secur=
ity-warnings.patch b/meta-oe/recipes-extended/libidn/libidn/0001-idn-form=
at-security-warnings.patch
deleted file mode 100644
index d5fb8e7c8..000000000
--- a/meta-oe/recipes-extended/libidn/libidn/0001-idn-format-security-war=
nings.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-Subject: [PATCH] idn: fix printf() format security warnings
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../../libidn-1.32/src/idn.c: In function 'main':
-| ../../libidn-1.32/src/idn.c:172:7: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|        error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be spe=
cified"));
-|        ^~~~~
-| ../../libidn-1.32/src/idn.c:187:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|      fprintf (stderr, _("Type each input string on a line by itself, "
-|      ^~~~~~~
-| ../../libidn-1.32/src/idn.c:202:4: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|     error (EXIT_FAILURE, errno, _("input error"));
-|     ^~~~~
-| ../../libidn-1.32/src/idn.c:220:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|         _("could not convert from UTF-8 to UCS-4"));
-|         ^
-| ../../libidn-1.32/src/idn.c:245:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|         _("could not convert from UTF-8 to UCS-4"));
-|         ^
-| ../../libidn-1.32/src/idn.c:281:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|       _("could not convert from UTF-8 to UCS-4"));
-|       ^
-| ../../libidn-1.32/src/idn.c:340:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|       _("could not convert from UCS-4 to UTF-8"));
-|       ^
-| ../../libidn-1.32/src/idn.c:364:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|       _("could not convert from UCS-4 to UTF-8"));
-|       ^
-| ../../libidn-1.32/src/idn.c:442:8: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|         _("could not convert from UCS-4 to UTF-8"));
-|         ^
-| ../../libidn-1.32/src/idn.c:498:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|       _("could not convert from UTF-8 to UCS-4"));
-|       ^
-| ../../libidn-1.32/src/idn.c:527:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|      _("could not convert from UTF-8 to UCS-4"));
-|      ^
-| ../../libidn-1.32/src/idn.c:540:6: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|       error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
-|       ^~~~~
-| ../../libidn-1.32/src/idn.c:551:5: error: format not a string literal =
and no format arguments [-Werror=3Dformat-security]
-|      _("could not convert from UTF-8 to UCS-4"));
-|      ^
-
-Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-
-Upstream-Status: Pending
-
----
- src/idn.c | 27 ++++++++++++++-------------
- 1 file changed, 14 insertions(+), 13 deletions(-)
-
-diff --git a/src/idn.c b/src/idn.c
-index f2fee11..c6e5caa 100644
---- a/src/idn.c
-+++ b/src/idn.c
-@@ -169,7 +169,7 @@ main (int argc, char *argv[])
-       (args_info.idna_to_unicode_given ? 1 : 0) +
-       (args_info.nfkc_given ? 1 : 0) !=3D 1)
-     {
--      error (0, 0,
-+      error (0, 0, "%s",
- 	     _("only one of -s, -e, -d, -a, -u or -n can be specified"));
-       usage (EXIT_FAILURE);
-     }
-@@ -183,7 +183,7 @@ main (int argc, char *argv[])
-=20
-   if (!args_info.quiet_given
-       && args_info.inputs_num =3D=3D 0 && isatty (fileno (stdin)))
--    fprintf (stderr, _("Type each input string on a line by itself, "
-+    fprintf (stderr, "%s", _("Type each input string on a line by itsel=
f, "
- 		       "terminated by a newline character.\n"));
-=20
-   do
-@@ -195,7 +195,7 @@ main (int argc, char *argv[])
- 	  if (feof (stdin))
- 	    break;
-=20
--	  error (EXIT_FAILURE, errno, _("input error"));
-+	  error (EXIT_FAILURE, errno, "%s", _("input error"));
- 	}
-=20
-       if (strlen (line) > 0)
-@@ -213,7 +213,7 @@ main (int argc, char *argv[])
- 	  if (!q)
- 	    {
- 	      free (p);
--	      error (EXIT_FAILURE, 0,
-+	      error (EXIT_FAILURE, 0, "%s",
- 		     _("could not convert from UTF-8 to UCS-4"));
- 	    }
-=20
-@@ -238,7 +238,7 @@ main (int argc, char *argv[])
- 	  if (!q)
- 	    {
- 	      free (r);
--	      error (EXIT_FAILURE, 0,
-+	      error (EXIT_FAILURE, 0, "%s",
- 		     _("could not convert from UTF-8 to UCS-4"));
- 	    }
-=20
-@@ -275,7 +275,7 @@ main (int argc, char *argv[])
- 	  q =3D stringprep_utf8_to_ucs4 (p, -1, &len);
- 	  free (p);
- 	  if (!q)
--	    error (EXIT_FAILURE, 0,
-+	    error (EXIT_FAILURE, 0, "%s",
- 		   _("could not convert from UTF-8 to UCS-4"));
-=20
- 	  if (args_info.debug_given)
-@@ -334,7 +334,7 @@ main (int argc, char *argv[])
- 	  r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
- 	  free (q);
- 	  if (!r)
--	    error (EXIT_FAILURE, 0,
-+	    error (EXIT_FAILURE, 0, "%s",
- 		   _("could not convert from UCS-4 to UTF-8"));
-=20
- 	  p =3D stringprep_utf8_to_locale (r);
-@@ -358,7 +358,7 @@ main (int argc, char *argv[])
- 	  q =3D stringprep_utf8_to_ucs4 (p, -1, NULL);
- 	  free (p);
- 	  if (!q)
--	    error (EXIT_FAILURE, 0,
-+	    error (EXIT_FAILURE, 0, "%s",
- 		   _("could not convert from UCS-4 to UTF-8"));
-=20
- 	  if (args_info.debug_given)
-@@ -436,7 +436,7 @@ main (int argc, char *argv[])
- 	  if (!q)
- 	    {
- 	      free (p);
--	      error (EXIT_FAILURE, 0,
-+	      error (EXIT_FAILURE, 0, "%s",
- 		     _("could not convert from UCS-4 to UTF-8"));
- 	    }
-=20
-@@ -492,7 +492,7 @@ main (int argc, char *argv[])
- 	  r =3D stringprep_ucs4_to_utf8 (q, -1, NULL, NULL);
- 	  free (q);
- 	  if (!r)
--	    error (EXIT_FAILURE, 0,
-+	    error (EXIT_FAILURE, 0, "%s",
- 		   _("could not convert from UTF-8 to UCS-4"));
-=20
- 	  p =3D stringprep_utf8_to_locale (r);
-@@ -521,7 +521,7 @@ main (int argc, char *argv[])
- 	      if (!q)
- 		{
- 		  free (p);
--		  error (EXIT_FAILURE, 0,
-+		  error (EXIT_FAILURE, 0, "%s",
- 			 _("could not convert from UTF-8 to UCS-4"));
- 		}
-=20
-@@ -535,7 +535,8 @@ main (int argc, char *argv[])
- 	  r =3D stringprep_utf8_nfkc_normalize (p, -1);
- 	  free (p);
- 	  if (!r)
--	    error (EXIT_FAILURE, 0, _("could not do NFKC normalization"));
-+	    error (EXIT_FAILURE, 0, "%s",
-+		   _("could not do NFKC normalization"));
-=20
- 	  if (args_info.debug_given)
- 	    {
-@@ -545,7 +546,7 @@ main (int argc, char *argv[])
- 	      if (!q)
- 		{
- 		  free (r);
--		  error (EXIT_FAILURE, 0,
-+		  error (EXIT_FAILURE, 0, "%s",
- 			 _("could not convert from UTF-8 to UCS-4"));
- 		}
-=20
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2m=
an.patch b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man=
.patch
index 0863530f2..46938bccf 100644
--- a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patc=
h
+++ b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patc=
h
@@ -1,23 +1,23 @@
 Upstream-Status: Inappropriate [disable feature]
=20
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurdd libidn-1.26/doc/Makefile.am libidn-1.26/doc/Makefile.am
---- libidn-1.26/doc/Makefile.am	2012-09-18 11:25:45.000000000 +0300
-+++ libidn-1.26/doc/Makefile.am	2013-02-08 07:41:24.591431462 +0200
-@@ -49,15 +49,9 @@
-
+--- libidn-1.41.orig/doc/Makefile.am
++++ libidn-1.41/doc/Makefile.am
+@@ -73,16 +73,9 @@ BUILT_SOURCES =3D example.txt example2.txt
+=20
  # Man pages.
-
+=20
 -dist_man_MANS =3D idn.1 $(gdoc_MANS)
 +dist_man_MANS =3D $(gdoc_MANS)
  MAINTAINERCLEANFILES =3D $(dist_man_MANS)
-
--idn.1: $(top_srcdir)/src/idn.c $(top_srcdir)/src/idn.ggo \
--		$(top_srcdir)/configure.ac
--	$(HELP2MAN) \
+=20
+-idn.1: $(top_srcdir)/src/idn.c $(top_srcdir)/src/idn.ggo $(top_srcdir)/=
.version
+-	$(MAKE) -C ../lib
+-	$(MAKE) -C ../src
+-	$(AM_V_GEN)$(HELP2MAN) \
 -		--name=3D"Internationalized Domain Names command line tool" \
 -		--output=3D$@ $(top_builddir)/src/idn$(EXEEXT)
 -
  # GDOC
-
- GDOC_BIN =3D $(srcdir)/gdoc
+=20
+ gdoc_TEXINFOS =3D
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.36.bb b/meta-oe/rec=
ipes-extended/libidn/libidn_1.41.bb
similarity index 66%
rename from meta-oe/recipes-extended/libidn/libidn_1.36.bb
rename to meta-oe/recipes-extended/libidn/libidn_1.41.bb
index 0dea4aff5..b4303a162 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.36.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.41.bb
@@ -3,24 +3,26 @@ DESCRIPTION =3D "Implementation of the Stringprep, Puny=
code and IDNA specification
 HOMEPAGE =3D "http://www.gnu.org/software/libidn/"
 SECTION =3D "libs"
 LICENSE =3D "(LGPL-2.1-or-later | LGPL-3.0-only) & GPL-3.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddf4be47940a91ee69556f5f71eed4=
aec \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df95a3dc99fecfa9a0c4e726d4b5d8=
22f \
                     file://COPYING.LESSERv2;md5=3D4fbd65380cdd2559510790=
08b364516c \
                     file://COPYING.LESSERv3;md5=3De6a600fd5e1d9cbde2d983=
680233ad02 \
                     file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
-                    file://COPYINGv3;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
-                    file://lib/idna.h;endline=3D21;md5=3Dc381d797e2d7fbd=
ace7c147b1285d076 \
-                    file://src/idn.c;endline=3D20;md5=3D7d88aa87b0494d69=
0bdf7748fe08d536"
+                    file://COPYINGv3;md5=3D11cc2d3ee574f9d6b7ee797bdce4d=
423 \
+                    file://lib/idna.h;endline=3D21;md5=3D176de4fe1d98e59=
d743d3b12a850e4cb \
+                    file://src/idn.c;endline=3D20;md5=3Ddd17b9093355bf66=
9e2ea108d2defbd0 \
+                   "
+                  =20
 DEPENDS =3D "virtual/libiconv autoconf-archive"
=20
 inherit pkgconfig autotools gettext texinfo gtk-doc
=20
 SRC_URI =3D "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://0001-idn-format-security-warnings.patch \
            "
=20
-SRC_URI[md5sum] =3D "813c7b268d1051ca02c3610986126f38"
-SRC_URI[sha256sum] =3D "14b67108344d81ba844631640df77c9071d9fb0659b08032=
6ff5424e86b14038"
+#SRC_URI[md5sum] =3D "813c7b268d1051ca02c3610986126f38"
+#SRC_URI[sha256sum] =3D "14b67108344d81ba844631640df77c9071d9fb0659b0803=
26ff5424e86b14038"
+SRC_URI[sha256sum] =3D "884d706364b81abdd17bee9686d8ff2ae7431c5a14651047=
c68adf8b31fd8945"
=20
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ o=
r LGPLv3
 # so package command into a separate package
--=20
2.25.1


