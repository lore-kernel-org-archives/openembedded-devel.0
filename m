Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id BB1C76D12B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:08:29 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so1984147eak.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2013 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VyXzg6RvT5RqZgD0vAixlrW+PvPdqqFswkUxyh7/Vf0=;
	b=kBowYa7MdgLNh0RZ9ms3MW2HKKY1wbzSyu+w99Q75fKE3nxXLH2roNrtxfBI8PGTV8
	aw5HQyOIS2eynqv963RceFpUA9tTE8syrZLWJKk/2IZOPEAEmlonkmBAgKT6K0+OOO6+
	6VqZmZj4kQImYbTWuEC/L/O4BbhjibAocs328L8GA+6aTnJeKJdFPeyhLWJrI+MLE96G
	KAy/UuQiwiADH6ZxIZhNxBni2sJdpuFkY0QxTLE2HPQR7HnRCClZxJ8N7K3Ce5eL9VsD
	pod4OdfCfHXKzKgTznDV424HiuHfrItESeklKg++uRGKTxcLaUawLMY5PkUP1ptRNz3J
	VVBg==
X-Received: by 10.15.86.74 with SMTP id h50mr2333384eez.90.1383304111074;
	Fri, 01 Nov 2013 04:08:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id s3sm6417440eeo.3.2013.11.01.04.08.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 04:08:30 -0700 (PDT)
Date: Fri, 1 Nov 2013 12:08:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131101110833.GP32015@jama>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama>
MIME-Version: 1.0
In-Reply-To: <20131031081012.GC32015@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 11:08:31 -0000
X-Groupsio-MsgNum: 46975
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZMy3ZKywLyoHonN"
Content-Disposition: inline

--7ZMy3ZKywLyoHonN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 09:10:12AM +0100, Martin Jansa wrote:
> On Thu, Oct 31, 2013 at 02:40:47AM -0500, b40527@freescale.com wrote:
> > From: Zongchun Yu <Zongchun.Yu@freescale.com>
> >=20
> > *tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
> > systems which gives you the ability to use previously captured traffic
> > in libpcap format to test a variety of network devices.
> >=20
> > Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> > ---
> >  .../files/tcpreplay-3.4.4-cross-compile.patch      |   90 ++++++++++++=
++++++++
> >  .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   13 +++
> >  .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   23 +++++
> >  3 files changed, 126 insertions(+)
> >  create mode 100755 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3=
=2E4.4-cross-compile.patch
> >  create mode 100644 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3=
=2E4.4-no-bfp-support.patch
> >  create mode 100644 meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
>=20
> Looks like something for meta-networking?

it fails to detect libpcap in my world builds:

| checking for libpcap... /home/jenkins/oe/shr-core-branches/shr-core/tmp-e=
glibc/sysroots/qemuarm/usr
| checking for library containing pcap_close... no
| configure: error: Unable to link libpcap in /home/jenkins/oe/shr-core-bra=
nches/shr-core/tmp-eglibc/sysroots/qemuarm/usr
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tcpreplay/3.4.4-r0/tcpreplay-3.4.4/config.log
| This file contains any messages produced by compilers while
| running configure, to aid debugging if configure makes a mistake.

| configure:18128: checking for libpcap
| configure:18170: result: /home/jenkins/oe/shr-core-branches/shr-core/tmp-=
eglibc/sysroots/qemuarm/usr
| configure:18180: checking for library containing pcap_close
| configure:18211: arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb=
-interwork --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/sysroots/qemuarm -o conftest -D_U_=3D"__attribute__((unused))" -O2 -pipe=
 -g -feliminate-unused-debug-types -Wall -O3 -std=3Dgnu99 -Wextra -Wno-vari=
adic-macros -Wfatal-errors -I/home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/sysroots/qemuarm/usr/include  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed conftest.c /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglib=
c/sysroots/qemuarm/usr/lib/libpcap.a >&5
| ./pcap-linux.c:525: error: undefined reference to 'nl_socket_alloc'
| ./pcap-linux.c:532: error: undefined reference to 'genl_connect'
| ./pcap-linux.c:538: error: undefined reference to 'genl_ctrl_alloc_cache'
| ./pcap-linux.c:546: error: undefined reference to 'genl_ctrl_search_by_na=
me'
| ./pcap-linux.c:558: error: undefined reference to 'nl_socket_free'
| ./pcap-linux.c:540: error: undefined reference to 'nl_geterror'
| ./pcap-linux.c:556: error: undefined reference to 'nl_cache_free'
| ./pcap-linux.c:565: error: undefined reference to 'genl_family_put'
| ./pcap-linux.c:566: error: undefined reference to 'nl_cache_free'
| ./pcap-linux.c:567: error: undefined reference to 'nl_socket_free'
| ./pcap-linux.c:678: error: undefined reference to 'nlmsg_alloc'
| ./pcap-linux.c:685: error: undefined reference to 'genl_family_get_id'
| ./pcap-linux.c:685: error: undefined reference to 'genlmsg_put'
| ./pcap-linux.c:687: error: undefined reference to 'nla_put'
| ./pcap-linux.c:689: error: undefined reference to 'nl_send_auto_complete'
| ./pcap-linux.c:697: error: undefined reference to 'nl_wait_for_ack'
| ./pcap-linux.c:709: error: undefined reference to 'nlmsg_free'
| ./pcap-linux.c:716: error: undefined reference to 'nlmsg_free'
| ./pcap-linux.c:691: error: undefined reference to 'nl_geterror'
| ./pcap-linux.c:702: error: undefined reference to 'nlmsg_free'
| ./pcap-linux.c:699: error: undefined reference to 'nl_geterror'
| ./pcap-linux.c:582: error: undefined reference to 'nlmsg_alloc'
| ./pcap-linux.c:589: error: undefined reference to 'genl_family_get_id'
| ./pcap-linux.c:589: error: undefined reference to 'genlmsg_put'
| ./pcap-linux.c:591: error: undefined reference to 'nla_put'
| ./pcap-linux.c:592: error: undefined reference to 'nla_put'
| ./pcap-linux.c:593: error: undefined reference to 'nla_put'
| ./pcap-linux.c:595: error: undefined reference to 'nl_send_auto_complete'
| ./pcap-linux.c:623: error: undefined reference to 'nl_wait_for_ack'
| ./pcap-linux.c:637: error: undefined reference to 'nlmsg_free'
| ./pcap-linux.c:616: error: undefined reference to 'nl_geterror'
| collect2: error: ld returned 1 exit status
| configure:18211: $? =3D 1



>=20
> >=20
> > diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cr=
oss-compile.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4=
-cross-compile.patch
> > new file mode 100755
> > index 0000000..226f97a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-com=
pile.patch
> > @@ -0,0 +1,90 @@
> > +Uptream-Status: Inappropriate [embedded specific]
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -402,7 +402,6 @@
> > +=20
> > + dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces=
 an important
> > + dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
> > +-libpcap_version_096=3Dno
> > + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> > + #include <string.h>
> > + #include <stdlib.h>
> > +@@ -419,11 +418,12 @@
> > +             exit(0);
> > +=20
> > +     exit(1);
> > +-]]), [
> > +-    libpcap_version_096=3Dyes
> > +-])
> > ++]]),
> > ++ [libpcap_version_096=3Dyes],
> > ++ [libpcap_version_096=3Dno],
> > ++ [libpcap_version_096=3Dyes]
> > ++)
> > +=20
> > +-libpcap_ver8=3Dno
> > + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> > + #include <string.h>
> > + #include <stdlib.h>
> > +@@ -444,13 +444,12 @@
> > +         exit(0);
> > +=20
> > +     exit(1);
> > +-]]), [
> > +-    libpcap_ver8=3Dyes
> > +-], [
> > +-    libpcap_ver8=3Dno
> > +-])
> > ++]]),
> > ++ [libpcap_ver8=3Dyes],
> > ++ [libpcap_ver8=3Dno],
> > ++ [libpcap_ver8=3Dyes]
> > ++)
> > +=20
> > +-libpcap_ver7=3Dno
> > + AC_RUN_IFELSE(AC_LANG_PROGRAM([[
> > + #include <string.h>
> > + #include <stdlib.h>
> > +@@ -469,11 +468,11 @@
> > +             exit(0);
> > +=20
> > +     exit(1);
> > +-]]), [
> > +-    libpcap_ver7=3Dyes
> > +-], [
> > +-    libpcap_ver7=3Dno
> > +-])
> > ++]]),
> > ++ [libpcap_ver7=3Dyes],
> > ++ [libpcap_ver7=3Dno],
> > ++ [libpcap_ver7=3Dyes]
> > ++)
> > +=20
> > + if test x$libpcap_ver8 =3D xyes ; then
> > +     AC_MSG_RESULT(>=3D 0.8.0)
> > +@@ -761,8 +760,8 @@
> > +=20
> > + have_bpf=3Dno
> > + dnl Check for BSD's BPF
> > +-AC_MSG_CHECKING(for BPF device sending support)
> > +-AC_TRY_RUN([
> > ++AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> > ++[AC_TRY_RUN([
> > + #include <stdio.h>
> > + #include <stdlib.h>
> > + #include <sys/types.h>
> > +@@ -796,8 +795,11 @@
> > +             [Do we have BPF device support?])
> > +     AC_MSG_RESULT(yes)
> > +     have_bpf=3Dyes
> > +-],[
> > +-    AC_MSG_RESULT(no)
> > ++],
> > ++[AC_MSG_RESULT(no)],
> > ++[AC_MSG_ERROR([cross-compiling,
> > ++  presetting ac_cv_have_bpf=3D(yes|no) will help])]
> > ++)
> > + ])
> > +=20
> > +=20
> > diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no=
-bfp-support.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.=
4-no-bfp-support.patch
> > new file mode 100644
> > index 0000000..70fa959
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-su=
pport.patch
> > @@ -0,0 +1,13 @@
> > +Uptream-Status: Inappropriate [embedded specific]
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -758,6 +758,8 @@
> > +     AC_MSG_RESULT(no)
> > + ])
> > +=20
> > ++ac_cv_have_bpf=3Dno
> > ++
> > + have_bpf=3Dno
> > + dnl Check for BSD's BPF
> > + AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
> > diff --git a/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/met=
a-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> > new file mode 100644
> > index 0000000..98c9c4a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Use previously captured traffic to test network devices"
> > +
> > +HOMEPAGE =3D "http://tcpreplay.synfin.net/"
> > +SECTION =3D "console/network"
> > +
> > +LICENSE =3D "GPLv3"
> > +LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Dc33cccf72cc1603e8a72a8=
4811ae3ac8"
> > +
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcprep=
lay-${PV}.tar.gz \
> > +           file://tcpreplay-3.4.4-cross-compile.patch \
> > +           file://tcpreplay-3.4.4-no-bfp-support.patch \
> > +           "
> > +SRC_URI[md5sum] =3D "22725feb9b2590809f9350308ec65180"
> > +SRC_URI[sha256sum] =3D "7a809c58ddec86407fd6e5597ac883d7874a19bea81d71=
6bb2b1c6e3b0e7b58f"
> > +
> > +DEPENDS =3D "libpcap"
> > +
> > +EXTRA_OECONF +=3D "--with-libpcap=3D${STAGING_DIR_HOST}/usr"
> > +
> > +inherit siteinfo autotools
> > +
> > --=20
> > 1.7.9.7
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7ZMy3ZKywLyoHonN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJzi7EACgkQN1Ujt2V2gBy3sgCffigOA7z8K0N/D8Qj5n55q6i+
twkAoKFG4213gVmT+XOC4f2lRzZiC+O6
=18sS
-----END PGP SIGNATURE-----

--7ZMy3ZKywLyoHonN--
