Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0B77169F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 09:32:57 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so1031904wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 01:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zgukvnGT2XyplUZLE3sn6ihgUbz0SeHhJSPn+Wu6c/k=;
	b=xfsq9Nc6PG+6x+czIlX/dGckzsRkwz6F/bcM/JaTIi65fohlht9T77gZsSMx6ytu6y
	HM1VzFafOe7E57oSaD/7tj0Y2yWm5MuEqjHfRgOQz57YXWaXOPb61PkzxI/sy9vK5MV5
	hNOOtAjTTAMWTkryeI8bqp/gkD6TOSXo1DmHrkJH2gI90L7xF4qbRidp2rtumpJ8DCex
	UeX22OHoLsN7U7eG/8G1ESTRMOh4YA7MMN7qW9/RQoZzfIb9B9jZbKH+xtvfagjoot7Q
	ZvmBOvMy3OL9pBTiSGlWFZMoNkOCcywhcsVifcsAHQ7748qed3HE8Y3wRF1v62wFie+d
	kk1Q==
X-Received: by 10.194.81.1 with SMTP id v1mr168555wjx.50.1420795977541;
	Fri, 09 Jan 2015 01:32:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fp2sm25011487wib.8.2015.01.09.01.32.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 01:32:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Jan 2015 10:33:01 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150109093301.GA3137@jama>
References: <1420785339-18761-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420785339-18761-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [met-oe][PATCH] crash: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jan 2015 09:33:04 -0000
X-Groupsio-MsgNum: 53781
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2015 at 02:35:39PM +0800, Lei Maohui wrote:
> crash core analysis suite
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../0001-cross_add_configure_option.patch          |  34 ++++++
>  .../crash/crash-7.0.9/0001-lzo_snappy.patch        |  39 +++++++
>  .../7001force_define_architecture.patch            |  13 +++
>  .../7002cross_add_configure_option.patch           |  21 ++++
>  .../crash/crash-7.0.9/7003cross_ranlib.patch       |  10 ++
>  .../crash/crash-7.0.9/config-site.crash-7.0.9      |   1 +
>  .../crash/crash-7.0.9/lzo_snappy.patch             | 100 +++++++++++++++=
++
>  .../crash/crash-7.0.9/use_system_readline.patch    | 120 +++++++++++++++=
++++++
>  meta-oe/recipes-kernel/crash/crash_7.0.9.bb        |  59 ++++++++++
>  meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak    |  62 +++++++++++

We don't need .bak files.

>  10 files changed, 459 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_a=
dd_configure_option.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_sna=
ppy.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_de=
fine_architecture.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_ad=
d_configure_option.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ra=
nlib.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.=
crash-7.0.9
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.p=
atch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_r=
eadline.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb
>  create mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak
>=20
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_conf=
igure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_ad=
d_configure_option.patch
> new file mode 100644
> index 0000000..229647f
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_o=
ption.patch
> @@ -0,0 +1,34 @@
> +From cbaaa42933bb27b1bcff4c7d71d54c913201ee88 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Fri, 9 Jan 2015 11:51:18 +0900
> +Subject: [PATCH] cross_add_configure_option
> +
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 9c44633..39bebd0 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -229,7 +229,7 @@ gdb_merge: force
> + 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
> + 	@rm -f ${PROGRAM}
> + 	@if [ ! -f ${GDB}/config.status ]; then \
> +-	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=
=3D/usr/lib/debug \
> ++	  (cd ${GDB}; ./configure --host=3D${GDB_TARGET} --build=3D${GDB_HOST}=
 --with-separate-debug-dir=3D/usr/lib/debug \
> + 	    --with-bugurl=3D"" --with-expat=3Dno --with-python=3Dno; \
> + 	  make --no-print-directory CRASH_TARGET=3D${TARGET}; echo ${TARGET} >=
 crash.target) \
> + 	else make --no-print-directory rebuild; fi
> +@@ -277,7 +277,7 @@ force:
> +=20
> + make_configure: force
> + 	@rm -f configure
> +-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNI=
NG_OPTIONS}
> ++	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_=
OPTIONS}
> +=20
> + clean: make_configure
> + 	@./configure ${CONF_TARGET_FLAG} -q -b
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.pat=
ch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch
> new file mode 100644
> index 0000000..8eb668d
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch
> @@ -0,0 +1,39 @@
> +From aab7f6d5ba37d85932783434f923d5bf21b4c13f Mon Sep 17 00:00:00 2001
> +From: leimh <leimaohui@cn.fujitsu.com>
> +Date: Wed, 7 Jan 2015 15:34:54 +0900
> +Subject: [PATCH 1/2] lzo_snappy
> +
> +---
> + Makefile   | 2 +-
> + diskdump.c | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 68521b8..3397eeb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -225,7 +225,7 @@ all: make_configure
> + gdb_merge: force
> + 	@if [ ! -f ${GDB}/README ]; then \
> + 	  make --no-print-directory gdb_unzip; fi
> +-	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
> ++	@echo "${LDFLAGS} -lz -llzo2 -lsnappy -ldl -rdynamic" &gt; ${GDB}/gdb/=
mergelibs
> + 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
> + 	@rm -f ${PROGRAM}
> + 	@if [ ! -f ${GDB}/config.status ]; then \
> +diff --git a/diskdump.c b/diskdump.c
> +index 3d33fdc..95b92ee 100644
> +--- a/diskdump.c
> ++++ b/diskdump.c
> +@@ -23,6 +23,8 @@
> +  * GNU General Public License for more details.
> +  */
> +=20
> ++#define LZO
> ++#define SNAPPY
> + #include "defs.h"
> + #include "diskdump.h"
> +=20
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_ar=
chitecture.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_defin=
e_architecture.patch
> new file mode 100644
> index 0000000..0d44c7f
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architect=
ure.patch
> @@ -0,0 +1,13 @@
> +diff -uprN crash-5.1.8.org/configure.c crash-5.1.8/configure.c
> +--- crash-5.1.8.org/configure.c	2011-09-17 04:01:12.000000000 +0900
> ++++ crash-5.1.8/configure.c	2012-09-13 13:28:45.393344108 +0900
> +@@ -391,6 +391,9 @@ get_current_configuration(struct support
> + 			arch_mismatch(sp);
> + 	}
> +=20
> ++	/** Force define archtecture */
> ++	target_data.target =3D FORCE_DEFINE_ARCH;
> ++
> +         if ((fp =3D fopen("Makefile", "r")) =3D=3D NULL) {
> + 		perror("Makefile");
> + 		goto get_release;
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_confi=
gure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_=
configure_option.patch
> new file mode 100644
> index 0000000..dc594eb
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_configure_op=
tion.patch
> @@ -0,0 +1,21 @@
> +diff -uprN crash-6.1.1.org/Makefile crash-6.1.1/Makefile
> +--- crash-6.1.1.org/Makefile	2012-11-20 05:57:31.000000000 +0900
> ++++ crash-6.1.1/Makefile	2012-12-27 20:51:34.100833890 +0900
> +@@ -223,7 +223,7 @@ gdb_merge: force
> + 	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
> + 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
> + 	@if [ ! -f ${GDB}/config.status ]; then \
> +-	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=
=3D/usr/lib/debug \
> ++	  (cd ${GDB}; ./configure --host=3D${GDB_TARGET} --build=3D${GDB_HOST}=
 --with-separate-debug-dir=3D/usr/lib/debug \
> + 	    --with-bugurl=3D"" --with-expat=3Dno --with-python=3Dno; \
> + 	  make --no-print-directory CRASH_TARGET=3D${TARGET}; echo ${TARGET} >=
 crash.target) \
> + 	else (cd ${GDB}/gdb; make --no-print-directory CRASH_TARGET=3D${TARGET=
};); fi
> +@@ -254,7 +254,7 @@ force:
> +=20
> + make_configure: force
> + 	@rm -f configure
> +-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNI=
NG_OPTIONS}
> ++	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_=
OPTIONS}
> +=20
> + clean: make_configure
> + 	@./configure ${CONF_TARGET_FLAG} -q -b
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.pa=
tch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
> new file mode 100644
> index 0000000..d567fa0
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
> @@ -0,0 +1,10 @@
> +--- crash-5.1.8/Makefile.orig	2011-12-27 11:21:58.220652105 +0900
> ++++ crash-5.1.8/Makefile	2011-12-27 11:22:29.563651593 +0900
> +@@ -285,6 +285,7 @@
> +=20
> + library: make_build_data ${OBJECT_FILES}
> + 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
> ++	${RANLIB} ${PROGRAM}lib.a=20
> +=20
> + gdb: force
> + 	rm -f ${GDB_OFILES}
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7=
=2E0.9 b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
> new file mode 100644
> index 0000000..d6fc22f
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
> @@ -0,0 +1 @@
> +bash_cv_have_mbstate_t=3Dyes
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch b/=
meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch
> new file mode 100644
> index 0000000..820a17d
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch
> @@ -0,0 +1,100 @@
> +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> +<html xmlns=3D'http://www.w3.org/1999/xhtml' xml:lang=3D'en' lang=3D'en'>
> +<head>
> +<title>crash.git - crash</title>
> +<meta name=3D'generator' content=3D'cgit v0.10.1'/>
> +<meta name=3D'robots' content=3D'index, nofollow'/>
> +<link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit-data/cgit.css'/>
> +<link rel=3D'shortcut icon' href=3D'/favicon.ico'/>
> +<link rel=3D'alternate' title=3D'Atom feed' href=3D'http://pkgs.fedorapr=
oject.org/cgit/crash.git/atom/lzo_snappy.patch?h=3Dmaster' type=3D'applicat=
ion/atom+xml'/>
> +</head>
> +<body>
> +<div id=3D'cgit'><table id=3D'header'>
> +<tr>
> +<td class=3D'logo' rowspan=3D'2'><a href=3D'/cgit/'><img src=3D'/cgit-da=
ta/cgit.png' alt=3D'cgit logo'/></a></td>
> +<td class=3D'main'><a href=3D'/cgit/'>index</a> : <a title=3D'crash.git'=
 href=3D'/cgit/crash.git/'>crash.git</a></td><td class=3D'form'><form metho=
d=3D'get' action=3D''>
> +<select name=3D'h' onchange=3D'this.form.submit();'>
> +<option value=3D'f10'>f10</option>
> +<option value=3D'f11'>f11</option>
> +<option value=3D'f12'>f12</option>
> +<option value=3D'f13'>f13</option>
> +<option value=3D'f14'>f14</option>
> +<option value=3D'f15'>f15</option>
> +<option value=3D'f16'>f16</option>
> +<option value=3D'f17'>f17</option>
> +<option value=3D'f18'>f18</option>
> +<option value=3D'f19'>f19</option>
> +<option value=3D'f20'>f20</option>
> +<option value=3D'f21'>f21</option>
> +<option value=3D'f7'>f7</option>
> +<option value=3D'f8'>f8</option>
> +<option value=3D'f9'>f9</option>
> +<option value=3D'master' selected=3D'selected'>master</option>
> +</select> <input type=3D'submit' name=3D'' value=3D'switch'/></form></td=
></tr>
> +<tr><td class=3D'sub'>crash</td><td class=3D'sub right'>Jesse Keating</t=
d></tr></table>
> +<table class=3D'tabs'><tr><td>
> +<a href=3D'/cgit/crash.git/'>summary</a><a href=3D'/cgit/crash.git/refs/=
'>refs</a><a href=3D'/cgit/crash.git/log/lzo_snappy.patch'>log</a><a class=
=3D'active' href=3D'/cgit/crash.git/tree/lzo_snappy.patch'>tree</a><a href=
=3D'/cgit/crash.git/commit/lzo_snappy.patch'>commit</a><a href=3D'/cgit/cra=
sh.git/diff/lzo_snappy.patch'>diff</a><a href=3D'/cgit/crash.git/stats/lzo_=
snappy.patch'>stats</a></td><td class=3D'form'><form class=3D'right' method=
=3D'get' action=3D'/cgit/crash.git/log/lzo_snappy.patch'>
> +<select name=3D'qt'>
> +<option value=3D'grep'>log msg</option>
> +<option value=3D'author'>author</option>
> +<option value=3D'committer'>committer</option>
> +<option value=3D'range'>range</option>
> +</select>
> +<input class=3D'txt' type=3D'text' size=3D'10' name=3D'q' value=3D''/>
> +<input type=3D'submit' value=3D'search'/>
> +</form>
> +</td></tr></table>
> +<div class=3D'path'>path: <a href=3D'/cgit/crash.git/tree/'>root</a>/<a =
href=3D'/cgit/crash.git/tree/lzo_snappy.patch'>lzo_snappy.patch</a></div><d=
iv class=3D'content'>blob: 73d2a4f713c045c4e9f046890bf88153442c8493 (<a hre=
f=3D'/cgit/crash.git/plain/lzo_snappy.patch'>plain</a>)
> +<table summary=3D'blob content' class=3D'blob'>
> +<tr><td class=3D'linenumbers'><pre><a id=3D'n1' href=3D'#n1'>1</a>
> +<a id=3D'n2' href=3D'#n2'>2</a>
> +<a id=3D'n3' href=3D'#n3'>3</a>
> +<a id=3D'n4' href=3D'#n4'>4</a>
> +<a id=3D'n5' href=3D'#n5'>5</a>
> +<a id=3D'n6' href=3D'#n6'>6</a>
> +<a id=3D'n7' href=3D'#n7'>7</a>
> +<a id=3D'n8' href=3D'#n8'>8</a>
> +<a id=3D'n9' href=3D'#n9'>9</a>
> +<a id=3D'n10' href=3D'#n10'>10</a>
> +<a id=3D'n11' href=3D'#n11'>11</a>
> +<a id=3D'n12' href=3D'#n12'>12</a>
> +<a id=3D'n13' href=3D'#n13'>13</a>
> +<a id=3D'n14' href=3D'#n14'>14</a>
> +<a id=3D'n15' href=3D'#n15'>15</a>
> +<a id=3D'n16' href=3D'#n16'>16</a>
> +<a id=3D'n17' href=3D'#n17'>17</a>
> +<a id=3D'n18' href=3D'#n18'>18</a>
> +<a id=3D'n19' href=3D'#n19'>19</a>
> +<a id=3D'n20' href=3D'#n20'>20</a>
> +<a id=3D'n21' href=3D'#n21'>21</a>
> +<a id=3D'n22' href=3D'#n22'>22</a>
> +</pre></td>
> +<td class=3D'lines'><pre><code>--- crash-7.0.2/diskdump.c.orig
> ++++ crash-7.0.2/diskdump.c
> +@@ -23,6 +23,8 @@
> +  * GNU General Public License for more details.
> +  */
> +=20
> ++#define LZO
> ++#define SNAPPY
> + #include "defs.h"
> + #include "diskdump.h"
> +=20
> +--- crash-7.0.2/Makefile.orig
> ++++ crash-7.0.2/Makefile
> +@@ -223,7 +223,7 @@ all: make_configure
> + gdb_merge: force
> + 	@if [ ! -f ${GDB}/README ]; then \
> + 	  make --no-print-directory gdb_unzip; fi
> +-	@echo "${LDFLAGS} -lz -ldl -rdynamic" &gt; ${GDB}/gdb/mergelibs
> ++	@echo "${LDFLAGS} -lz -llzo2 -lsnappy -ldl -rdynamic" &gt; ${GDB}/gdb/=
mergelibs
> + 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" &gt; ${GDB}/gdb/mergeobj
> + 	@rm -f ${PROGRAM}
> + 	@if [ ! -f ${GDB}/config.status ]; then \
> +</code></pre></td></tr></table>
> +</div> <!-- class=3Dcontent -->
> +<div class=3D'footer'>generated  by cgit v0.10.1 at 2015-01-06 08:46:27 =
(GMT)</div>
> +</div> <!-- id=3Dcgit -->
> +</body>
> +</html>
> diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline=
=2Epatch b/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.pat=
ch
> new file mode 100644
> index 0000000..f992d25
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.patch
> @@ -0,0 +1,120 @@
> +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> +<html xmlns=3D'http://www.w3.org/1999/xhtml' xml:lang=3D'en' lang=3D'en'>
> +<head>
> +<title>crash.git - crash</title>
> +<meta name=3D'generator' content=3D'cgit v0.10.1'/>
> +<meta name=3D'robots' content=3D'index, nofollow'/>
> +<link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit-data/cgit.css'/>
> +<link rel=3D'shortcut icon' href=3D'/favicon.ico'/>
> +<link rel=3D'alternate' title=3D'Atom feed' href=3D'http://pkgs.fedorapr=
oject.org/cgit/crash.git/atom/use_system_readline.patch?h=3Dmaster' type=3D=
'application/atom+xml'/>
> +</head>
> +<body>
> +<div id=3D'cgit'><table id=3D'header'>
> +<tr>
> +<td class=3D'logo' rowspan=3D'2'><a href=3D'/cgit/'><img src=3D'/cgit-da=
ta/cgit.png' alt=3D'cgit logo'/></a></td>
> +<td class=3D'main'><a href=3D'/cgit/'>index</a> : <a title=3D'crash.git'=
 href=3D'/cgit/crash.git/'>crash.git</a></td><td class=3D'form'><form metho=
d=3D'get' action=3D''>
> +<select name=3D'h' onchange=3D'this.form.submit();'>
> +<option value=3D'f10'>f10</option>
> +<option value=3D'f11'>f11</option>
> +<option value=3D'f12'>f12</option>
> +<option value=3D'f13'>f13</option>
> +<option value=3D'f14'>f14</option>
> +<option value=3D'f15'>f15</option>
> +<option value=3D'f16'>f16</option>
> +<option value=3D'f17'>f17</option>
> +<option value=3D'f18'>f18</option>
> +<option value=3D'f19'>f19</option>
> +<option value=3D'f20'>f20</option>
> +<option value=3D'f21'>f21</option>
> +<option value=3D'f7'>f7</option>
> +<option value=3D'f8'>f8</option>
> +<option value=3D'f9'>f9</option>
> +<option value=3D'master' selected=3D'selected'>master</option>
> +</select> <input type=3D'submit' name=3D'' value=3D'switch'/></form></td=
></tr>
> +<tr><td class=3D'sub'>crash</td><td class=3D'sub right'>Jesse Keating</t=
d></tr></table>
> +<table class=3D'tabs'><tr><td>
> +<a href=3D'/cgit/crash.git/'>summary</a><a href=3D'/cgit/crash.git/refs/=
'>refs</a><a href=3D'/cgit/crash.git/log/use_system_readline.patch'>log</a>=
<a class=3D'active' href=3D'/cgit/crash.git/tree/use_system_readline.patch'=
>tree</a><a href=3D'/cgit/crash.git/commit/use_system_readline.patch'>commi=
t</a><a href=3D'/cgit/crash.git/diff/use_system_readline.patch'>diff</a><a =
href=3D'/cgit/crash.git/stats/use_system_readline.patch'>stats</a></td><td =
class=3D'form'><form class=3D'right' method=3D'get' action=3D'/cgit/crash.g=
it/log/use_system_readline.patch'>
> +<select name=3D'qt'>
> +<option value=3D'grep'>log msg</option>
> +<option value=3D'author'>author</option>
> +<option value=3D'committer'>committer</option>
> +<option value=3D'range'>range</option>
> +</select>
> +<input class=3D'txt' type=3D'text' size=3D'10' name=3D'q' value=3D''/>
> +<input type=3D'submit' value=3D'search'/>
> +</form>
> +</td></tr></table>
> +<div class=3D'path'>path: <a href=3D'/cgit/crash.git/tree/'>root</a>/<a =
href=3D'/cgit/crash.git/tree/use_system_readline.patch'>use_system_readline=
=2Epatch</a></div><div class=3D'content'>blob: a6e04c4e6017c4818d5245357f5e=
649ba684f14c (<a href=3D'/cgit/crash.git/plain/use_system_readline.patch'>p=
lain</a>)
> +<table summary=3D'blob content' class=3D'blob'>
> +<tr><td class=3D'linenumbers'><pre><a id=3D'n1' href=3D'#n1'>1</a>
> +<a id=3D'n2' href=3D'#n2'>2</a>
> +<a id=3D'n3' href=3D'#n3'>3</a>
> +<a id=3D'n4' href=3D'#n4'>4</a>
> +<a id=3D'n5' href=3D'#n5'>5</a>
> +<a id=3D'n6' href=3D'#n6'>6</a>
> +<a id=3D'n7' href=3D'#n7'>7</a>
> +<a id=3D'n8' href=3D'#n8'>8</a>
> +<a id=3D'n9' href=3D'#n9'>9</a>
> +<a id=3D'n10' href=3D'#n10'>10</a>
> +<a id=3D'n11' href=3D'#n11'>11</a>
> +<a id=3D'n12' href=3D'#n12'>12</a>
> +<a id=3D'n13' href=3D'#n13'>13</a>
> +<a id=3D'n14' href=3D'#n14'>14</a>
> +<a id=3D'n15' href=3D'#n15'>15</a>
> +<a id=3D'n16' href=3D'#n16'>16</a>
> +<a id=3D'n17' href=3D'#n17'>17</a>
> +<a id=3D'n18' href=3D'#n18'>18</a>
> +<a id=3D'n19' href=3D'#n19'>19</a>
> +<a id=3D'n20' href=3D'#n20'>20</a>
> +<a id=3D'n21' href=3D'#n21'>21</a>
> +<a id=3D'n22' href=3D'#n22'>22</a>
> +<a id=3D'n23' href=3D'#n23'>23</a>
> +<a id=3D'n24' href=3D'#n24'>24</a>
> +<a id=3D'n25' href=3D'#n25'>25</a>
> +<a id=3D'n26' href=3D'#n26'>26</a>
> +<a id=3D'n27' href=3D'#n27'>27</a>
> +<a id=3D'n28' href=3D'#n28'>28</a>
> +<a id=3D'n29' href=3D'#n29'>29</a>
> +<a id=3D'n30' href=3D'#n30'>30</a>
> +<a id=3D'n31' href=3D'#n31'>31</a>
> +<a id=3D'n32' href=3D'#n32'>32</a>
> +</pre></td>
> +<td class=3D'lines'><pre><code>--- crash-7.0.4/cmdline.c.orig
> ++++ crash-7.0.4/cmdline.c
> +@@ -42,7 +42,8 @@ static int verify_args_input_file(char *
> + #define READLINE_LIBRARY
> +=20
> + #include &lt;readline.h&gt;
> +-#include &lt;rldefs.h&gt;
> ++#define vi_mode 0
> ++#define emacs_mode 1
> + #include &lt;history.h&gt;
> +=20
> + static void readline_init(void);
> +--- crash-7.0.4/Makefile.orig
> ++++ crash-7.0.4/Makefile
> +@@ -200,7 +200,7 @@ TAR_FILES=3D${SOURCE_FILES} Makefile ${GPL
> + 	${EXTENSION_SOURCE_FILES} ${MEMORY_DRIVER_FILES}
> + CSCOPE_FILES=3D${SOURCE_FILES}
> +=20
> +-READLINE_DIRECTORY=3D./${GDB}/readline
> ++READLINE_DIRECTORY=3D/usr/include/readline
> + BFD_DIRECTORY=3D./${GDB}/bfd
> + GDB_INCLUDE_DIRECTORY=3D./${GDB}/include
> +=20
> +@@ -228,7 +228,7 @@ gdb_merge: force
> + 	@rm -f ${PROGRAM}
> + 	@if [ ! -f ${GDB}/config.status ]; then \
> + 	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=
=3D/usr/lib/debug \
> +-	    --with-bugurl=3D"" --with-expat=3Dno --with-python=3Dno; \
> ++	    --with-bugurl=3D"" --with-expat=3Dno --with-python=3Dno --with-sys=
tem-readline; \
> + 	  make --no-print-directory CRASH_TARGET=3D${TARGET}; echo ${TARGET} &=
gt; crash.target) \
> + 	else (cd ${GDB}/gdb; make --no-print-directory CRASH_TARGET=3D${TARGET=
};); fi
> + 	@if [ ! -f ${PROGRAM} ]; then \
> +</code></pre></td></tr></table>
> +</div> <!-- class=3Dcontent -->
> +<div class=3D'footer'>generated  by cgit v0.10.1 at 2015-01-06 08:46:44 =
(GMT)</div>
> +</div> <!-- id=3Dcgit -->
> +</body>
> +</html>
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb b/meta-oe/recipe=
s-kernel/crash/crash_7.0.9.bb
> new file mode 100644
> index 0000000..efec061
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "Kernel analysis utility for live systems, netdump, diskdump=
, kdump, LKCD or mcore dumpfiles"
> +DESCRIPTION =3D "The core analysis suite is a self-contained tool that c=
an be used to\
> +investigate either live systems, kernel core dumps created from the\
> +netdump, diskdump and kdump packages from Red Hat Linux, the mcore kerne=
l patch\
> +offered by Mission Critical Linux, or the LKCD kernel patch."
> +
> +HOMEPAGE =3D "http://people.redhat.com/anderson"
> +SECTION =3D "devel"
> +
> +inherit gettext
> +
> +DEPENDS =3D "zlib readline"
> +
> +SRC_URI =3D "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.g=
z \
> +           file://7001force_define_architecture.patch \=20
> +           file://7003cross_ranlib.patch \
> +           file://0001-cross_add_configure_option.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "d70ad2ed0f6d210ed11e88b8e977f5fd"
> +SRC_URI[sha256sum] =3D "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697=
c209dc48d13a577e"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fa=
e504"
> +
> +EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
> +                GDB_TARGET=3D"${TARGET_SYS}" \
> +                GDB_HOST=3D"${BUILD_SYS}" \
> +                '
> +do_configure() {
> +    :
> +}
> +
> +do_compile_prepend() {
> +   case ${TARGET_ARCH} in
> +                arm*)     ARCH=3DARM ;;
> +                i*86*)    ARCH=3DX86 ;;
> +                powerpc*) ARCH=3DPPC ;;
> +                x86_64*)  ARCH=3DX86_64 ;;
> +        esac
> +
> +    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
> +    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CF=
LAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=3D-D_FILE_OFFSET_BITS=3D64\"/g' ${S}/co=
nfigure.c
> +    sed -i 's/&gt;/>/g' ${S}/Makefile
> +}
> +do_compile() {
> +    oe_runmake ${EXTRA_OEMAKE}
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}/${mandir}/man8
> +    install -d ${D}${includedir}/crash
> +
> +    oe_runmake DESTDIR=3D${D} install
> +    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
> +    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
> +}  =20
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak b/meta-oe/re=
cipes-kernel/crash/crash_7.0.9.bb.bak
> new file mode 100644
> index 0000000..8d559ee
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak
> @@ -0,0 +1,62 @@
> +SUMMARY =3D "Kernel analysis utility for live systems, netdump, diskdump=
, kdump, LKCD or mcore dumpfiles"
> +DESCRIPTION =3D "The core analysis suite is a self-contained tool that c=
an be used to\
> +investigate either live systems, kernel core dumps created from the\
> +netdump, diskdump and kdump packages from Red Hat Linux, the mcore kerne=
l patch\
> +offered by Mission Critical Linux, or the LKCD kernel patch."
> +
> +HOMEPAGE =3D "http://people.redhat.com/anderson"
> +SECTION =3D "devel"
> +
> +inherit gettext
> +
> +DEPENDS =3D "zlib readline"
> +CONFIG_SITE=3D"${WORKDIR}/config-site.${P}"
> +PARALLEL_MAKEINST =3D ""
> +
> +SRC_URI =3D "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.g=
z \
> +           file://7001force_define_architecture.patch \=20
> +           file://7003cross_ranlib.patch \
> +           file://config-site.${P} \
> +           file://0001-cross_add_configure_option.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "d70ad2ed0f6d210ed11e88b8e977f5fd"
> +SRC_URI[sha256sum] =3D "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697=
c209dc48d13a577e"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fa=
e504"
> +
> +EXTRA_OEMAKE =3D 'RPMPKG=3D"${PV}" \
> +                GDB_TARGET=3D"${TARGET_SYS}" \
> +                GDB_HOST=3D"${BUILD_SYS}" \
> +                '
> +do_configure() {
> +    :
> +}
> +
> +do_compile_prepend() {
> +   case ${TARGET_ARCH} in
> +                arm*)     ARCH=3DARM ;;
> +                i*86*)    ARCH=3DX86 ;;
> +                powerpc*) ARCH=3DPPC ;;
> +                x86_64*)  ARCH=3DX86_64 ;;
> +        esac
> +
> +    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
> +    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CF=
LAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=3D-D_FILE_OFFSET_BITS=3D64\"/g' ${S}/co=
nfigure.c
> +    sed -i 's/&gt;/>/g' ${S}/Makefile
> +}
> +do_compile() {
> +    oe_runmake ${EXTRA_OEMAKE}
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}/${mandir}/man8
> +    install -d ${D}${includedir}/crash
> +
> +    oe_runmake DESTDIR=3D${D} install
> +    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
> +    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
> +}  =20
> +
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSvoE0ACgkQN1Ujt2V2gBxisQCdHl1oFIzrZwwQ6i4NZFAIQTN/
8BIAn0I4adkdwuFkeVnh7M+z/aqY1SLK
=wb68
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
