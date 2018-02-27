Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 08662787E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 07:35:24 +0000 (UTC)
X-AuditID: c0a80110-ee5ff70000000ea0-0d-5a9506a96e04
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 32.F0.03744.9A6059A5;
	Tue, 27 Feb 2018 08:20:09 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 08:18:42 +0100
Message-Id: <20180227071844.23571-2-johannes.pointner@br-automation.com>
In-Reply-To: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.2
References: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:05,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:10,
	Serialize complete at 27/02/2018 08:20:10,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 27.02.2018 08:20:08
X-TNEFEvaluated: 1
X-Disclaimed: 5935
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsVyYAWjje5KtqlRBv9PilhcPLyU2YHR49zG
	FYwBjFFcNimpOZllqUX6dglcGXtvcBacs684sbSXrYGxwbSLkZNDQsBE4mDnDqYuRi4OIYFN
	jBL37z9gB0nwCghKnJz5hAXEZhOwlTgy4SuYLSKgK/Hxw1xGEJtZwFri/fIFrCC2sICnxLTz
	f8B6WQRUJW61rWCGmOMhsf9kO1gvJ1DN3Rm/WCF6tSWWLXzNDHGEvMTCs1fBbCGg+vmbGthA
	DpIQ6GCW2LZyGitEkZDE6cVnmWHsNVs2sk5gFJiF5NZZSOYuYGRaxSiem5iZY6SXVKSbWFqS
	n5tYkpmfp5ecn7uJERJuAjsYd7/RPsQowMGoxMObwzA1Sog1say4MvcQowQHs5II78rFk6OE
	eFMSK6tSi/Lji0pzUosPMUpzsCiJ8+YkGUcJCaQnlqRmp6YWpBbBZJk4OKUaGPM7jzjN2TB1
	8ewZqxrvMi/nOHg+6LVtdXCdbf3LW215z3bPmimf/9PlZJXCFO0PtyIezN1/qsJ3RT/DST3v
	vmuvzvv6Xns86fcrjZTi//wTZ/jIa7/+mOTx7FBlaFqNUsGSXb1rdW3X+hXt9T+y9gTrCpvV
	9//EL9/2ccs7Gxstt9i+5F9z5I4qsRRnJBpqMRcVJwIApsYAvzMCAAA=
Subject: [meta-networking][PATCH 1/3] libtevent: update to version 0.9.36
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
X-List-Received-Date: Tue, 27 Feb 2018 07:35:25 -0000
Content-Transfer-Encoding: quoted-printable

Version >=3D 0.9.34 needed to build samba 4.7.5.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../{options-0.9.33.patch =3D> options-0.9.36.patch} | 68 ++++++++++------=
------
 .../{libtevent=5F0.9.33.bb =3D> libtevent=5F0.9.36.bb}   |  6 +-
 2 files changed, 35 insertions(+), 39 deletions(-)
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.9.33=
.patch =3D> options-0.9.36.patch} (81%)
 rename meta-networking/recipes-support/libtevent/{libtevent=5F0.9.33.bb =
=3D> libtevent=5F0.9.36.bb} (89%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/options-0.=
9.33.patch b/meta-networking/recipes-support/libtevent/libtevent/options-0.=
9.36.patch
similarity index 81%
rename from meta-networking/recipes-support/libtevent/libtevent/options-0.9=
.33.patch
rename to meta-networking/recipes-support/libtevent/libtevent/options-0.9.3=
6.patch
index 84b1a3688..363c5867c 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/options-0.9.33.pa=
tch
+++ b/meta-networking/recipes-support/libtevent/libtevent/options-0.9.36.pa=
tch
@@ -1,7 +1,7 @@
-From c00f6d35bdc06dffb54daa815e57b44210a5de04 Mon Sep 17 00:00:00 2001
+From c3e2e4f89cf37b27609fd02ad67eb02d0015cc1e Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 21 Sep 2016 09:57:49 +0800
-Subject: [PATCH] tevent: Add configure options for packages
+Subject: [PATCH 1/1] tevent: Add configure options for packages
=20
 Add configure options for the following packages:
  - acl
@@ -19,30 +19,12 @@ Modified to apply to version 0.9.33.
=20
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
- lib/replace/system/wscript=5Fconfigure |  6 ++-
- lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++---=
-----
- wscript                              |  7 ++-
- 3 files changed, 79 insertions(+), 19 deletions(-)
- mode change 100755 =3D> 100644 wscript
+ lib/replace/wscript | 89 ++++++++++++++++++++++++++++++++++++++++--------=
-----
+ wscript             |  7 ++++-
+ 2 files changed, 73 insertions(+), 23 deletions(-)
=20
-diff --git a/lib/replace/system/wscript=5Fconfigure b/lib/replace/system/w=
script=5Fconfigure
-index 2035474..10f9ae7 100644
---- a/lib/replace/system/wscript=5Fconfigure
-+++ b/lib/replace/system/wscript=5Fconfigure
-@@ -1,6 +1,10 @@
- #!/usr/bin/env python
-=20
--conf.CHECK=5FHEADERS('sys/capability.h')
-+import Options
-+
-+if Options.options.enable=5Flibcap:
-+    conf.CHECK=5FHEADERS('sys/capability.h')
-+
- conf.CHECK=5FFUNCS('getpwnam=5Fr getpwuid=5Fr getpwent=5Fr')
-=20
- # solaris varients of getXXent=5Fr
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index fc43e1a..12d2a70 100644
+index 2c638b7..079761d 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set=5Foptions(opt):
@@ -118,32 +100,33 @@ index fc43e1a..12d2a70 100644
      conf.CHECK=5FHEADERS('port.h')
      conf.CHECK=5FHEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5p=
aram.h sys/fs/vx/quota.h')
      conf.CHECK=5FHEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/m=
ode.h sys/ndir.h sys/priv.h')
-@@ -73,7 +121,9 @@ def configure(conf):
-=20
-     conf.CHECK=5FCODE('', headers=3D'rpc/rpc.h rpcsvc/yp=5Fprot.h', defin=
e=3D'HAVE=5FRPCSVC=5FYP=5FPROT=5FH')
+@@ -101,7 +149,8 @@ def configure(conf):
+     conf.CHECK=5FHEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sys=
macros.h')
+     conf.CHECK=5FHEADERS('xfs/libxfs.h netgroup.h')
 =20
 -    conf.CHECK=5FHEADERS('valgrind.h valgrind/valgrind.h valgrind/memchec=
k.h')
 +    if Options.options.enable=5Fvalgrind:
 +        conf.CHECK=5FHEADERS('valgrind.h valgrind/valgrind.h valgrind/mem=
check.h')
-+
      conf.CHECK=5FHEADERS('nss=5Fcommon.h nsswitch.h ns=5Fapi.h')
      conf.CHECK=5FHEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs=
.h')
      conf.CHECK=5FHEADERS('utmp.h utmpx.h lastlog.h')
-@@ -248,17 +298,18 @@ def configure(conf):
+@@ -294,22 +343,18 @@ def configure(conf):
 =20
      conf.CHECK=5FFUNCS('prctl dirname basename')
 =20
+-    strlcpy=5Fin=5Fbsd =3D False
+-
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK=5FFUNCS('strlcpy strlcat'):
--        conf.CHECK=5FFUNCS=5FIN('strlcpy strlcat', 'bsd', headers=3D'bsd/=
string.h',
--                checklibc=3DTrue)
+-        if conf.CHECK=5FFUNCS=5FIN('strlcpy strlcat', 'bsd', headers=3D'b=
sd/string.h',
+-                               checklibc=3DTrue):
+-            strlcpy=5Fin=5Fbsd =3D True
 -    if not conf.CHECK=5FFUNCS('getpeereid'):
 -        conf.CHECK=5FFUNCS=5FIN('getpeereid', 'bsd', headers=3D'sys/types=
.h bsd/unistd.h')
 -    if not conf.CHECK=5FFUNCS=5FIN('setproctitle', 'setproctitle', header=
s=3D'setproctitle.h'):
 -        conf.CHECK=5FFUNCS=5FIN('setproctitle', 'bsd', headers=3D'sys/typ=
es.h bsd/unistd.h')
--
--    if not conf.CHECK=5FFUNCS('closefrom'):
--        conf.CHECK=5FFUNCS=5FIN('closefrom', 'bsd', headers=3D'bsd/unistd=
.h')
+-    if not conf.CHECK=5FFUNCS('setproctitle=5Finit'):
+-        conf.CHECK=5FFUNCS=5FIN('setproctitle=5Finit', 'bsd', headers=3D'=
sys/types.h bsd/unistd.h')
 +    if Options.options.enable=5Flibbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK=5FFUNCS('strlcpy strlcat'):
@@ -153,12 +136,25 @@ index fc43e1a..12d2a70 100644
 +            conf.CHECK=5FFUNCS=5FIN('getpeereid', 'bsd', headers=3D'sys/t=
ypes.h bsd/unistd.h')
 +        if not conf.CHECK=5FFUNCS=5FIN('setproctitle', 'setproctitle', he=
aders=3D'setproctitle.h'):
 +            conf.CHECK=5FFUNCS=5FIN('setproctitle', 'bsd', headers=3D'sys=
/types.h bsd/unistd.h')
-+
+=20
+-    if not conf.CHECK=5FFUNCS('closefrom'):
+-        conf.CHECK=5FFUNCS=5FIN('closefrom', 'bsd', headers=3D'bsd/unistd=
.h')
 +        if not conf.CHECK=5FFUNCS('closefrom'):
 +            conf.CHECK=5FFUNCS=5FIN('closefrom', 'bsd', headers=3D'bsd/un=
istd.h')
 =20
      conf.CHECK=5FCODE('''
                  struct ucred cred;
+@@ -660,7 +705,7 @@ removeea setea
+     # look for a method of finding the list of network interfaces
+     for method in ['HAVE=5FIFACE=5FGETIFADDRS', 'HAVE=5FIFACE=5FAIX', 'HA=
VE=5FIFACE=5FIFCONF', 'HAVE=5FIFACE=5FIFREQ']:
+         bsd=5Ffor=5Fstrlcpy =3D ''
+-        if strlcpy=5Fin=5Fbsd:
++        if Options.options.enable=5Flibbsd:
+             bsd=5Ffor=5Fstrlcpy =3D ' bsd'
+         if conf.CHECK=5FCODE('''
+                            #define %s 1
+diff --git a/wscript b/wscript
+index 94d190f..742f779 100644
 --- a/wscript
 +++ b/wscript
 @@ -22,7 +22,12 @@ def set=5Foptions(opt):
@@ -176,5 +172,5 @@ index fc43e1a..12d2a70 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 --=20
-2.8.3
+2.16.2
=20
diff --git a/meta-networking/recipes-support/libtevent/libtevent=5F0.9.33.b=
b b/meta-networking/recipes-support/libtevent/libtevent=5F0.9.36.bb
similarity index 89%
rename from meta-networking/recipes-support/libtevent/libtevent=5F0.9.33.bb
rename to meta-networking/recipes-support/libtevent/libtevent=5F0.9.36.bb
index f50830069..a83851ea4 100644
--- a/meta-networking/recipes-support/libtevent/libtevent=5F0.9.33.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent=5F0.9.36.bb
@@ -7,12 +7,12 @@ DEPENDS +=3D "libtalloc"
 RDEPENDS=5Fpython-tevent =3D "python"
=20
 SRC=5FURI =3D "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
-           file://options-0.9.33.patch \
+           file://options-0.9.36.patch \
 "
 LIC=5FFILES=5FCHKSUM =3D "file://tevent.h;endline=3D26;md5=3D4e458d658cb25=
e21efc16f720e78b85a"
=20
-SRC=5FURI[md5sum] =3D "527a43f35b4251e46f28921342895223"
-SRC=5FURI[sha256sum] =3D "22712ee981fd4298fcd5f3afb27d87a72257cebad37812cf=
bd3da5d968ed1bdc"
+SRC=5FURI[md5sum] =3D "87d67bca75b231814435c47bec0aff8a"
+SRC=5FURI[sha256sum] =3D "bd2b6be3fd1601ed7f176e99111e322c57d58e425cc149ee=
80c7dd4fed263b4c"
=20
 inherit waf-samba
=20
--=20
2.16.2



