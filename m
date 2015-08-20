Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 31E4C767D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:48:01 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so11504465wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ope+65OwqCHZ+WTYdEcoxVmJSBlrwQOkBcL9x/rGwdo=;
	b=dwJQ2HqKmP0sZMFJbPP3B8n5y03yGawOPuW+L+mB0FuJA3WtDuR2yhoXUF6FBMuw5C
	kNSbUecNHx5iynvHYdrB8zwutRRciLEoafnqS1ud+36OnFrBrgjuSZ/ROFIbfmFu2beV
	dyHgbKC0VbNHtH8nFDbkEq1IrGybWwDPd9H5I0iur4hIyjI1kA4NtX5jxm0Ecf8spL44
	h1045W2D807xh7006a6vhbnaOdKy9p5WWFapeCM26AEd5hhTdyaABbE35IMMJLMu3/JD
	BDLonqq7rtekicn1Qa3ALSglUxL24Ma2vCLqza6ZkMj2925js278yt7D2eBuSvMQql66
	cgrA==
X-Received: by 10.180.188.131 with SMTP id ga3mr15188270wic.69.1440089281319; 
	Thu, 20 Aug 2015 09:48:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v8sm6311246wjr.15.2015.08.20.09.47.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 09:48:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 18:48:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820164827.GL2446@jama>
References: <1440088125-1120-1-git-send-email-jkrishnanjanappa@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1440088125-1120-1-git-send-email-jkrishnanjanappa@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-filesystems][PATCH] xfsdump: add new recipe
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
X-List-Received-Date: Thu, 20 Aug 2015 16:48:02 -0000
X-Groupsio-MsgNum: 56850
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00hq2S6J2Jlg6EbK"
Content-Disposition: inline

--00hq2S6J2Jlg6EbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 09:58:45PM +0530, Jagadeesh Krishnanjanappa wrote:
> The xfsdump package contains xfsdump, xfsrestore and a
> number of other utilities for administering XFS filesystems.
> xfsdump examines files in a filesystem, determines which
> need to be backed up, and copies those files to a
> specified disk, tape or other storage medium.
>=20
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  .../xfsdump/files/remove-install-as-user.patch     | 205 +++++++++++++++=
++++++
>  .../recipes-utils/xfsdump/xfsdump_3.1.4.bb         |  37 ++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/remove-i=
nstall-as-user.patch
>  create mode 100644 meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.=
bb
>=20
> diff --git a/meta-filesystems/recipes-utils/xfsdump/files/remove-install-=
as-user.patch b/meta-filesystems/recipes-utils/xfsdump/files/remove-install=
-as-user.patch
> new file mode 100644
> index 0000000..e761db3
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsdump/files/remove-install-as-user=
=2Epatch
> @@ -0,0 +1,205 @@
> +remove install as user
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + include/buildmacros |  2 +-
> + include/install-sh  | 95 ++++++++--------------------------------------=
-------
> + 2 files changed, 14 insertions(+), 83 deletions(-)
> +
> +diff --git a/include/buildmacros b/include/buildmacros
> +index 7a01880..0840d55 100644
> +--- a/include/buildmacros
> ++++ b/include/buildmacros
> +@@ -30,7 +30,7 @@ OBJECTS =3D $(ASFILES:.s=3D.o) \
> + 	  $(LFILES:.l=3D.o) \
> + 	  $(YFILES:%.y=3D%.tab.o)
> +=20
> +-INSTALL	=3D $(TOPDIR)/install-sh -o $(PKG_USER) -g $(PKG_GROUP)
> ++INSTALL	=3D $(TOPDIR)/install-sh
> +=20
> + IMAGES_DIR =3D $(TOPDIR)/all-images
> + DIST_DIR =3D $(TOPDIR)/dist
> +diff --git a/include/install-sh b/include/install-sh
> +index c952a71..b9d66f7 100755
> +--- a/include/install-sh
> ++++ b/include/install-sh
> +@@ -24,11 +24,11 @@
> + #       set           set      |    yes        yes
> + #
> + _usage() {
> +-    echo "Usage: $prog [-o owner] [-g group] [-m mode] -d directory"
> +-    echo "or     $prog [-D] [-o owner] [-g group] [-m mode] file direct=
ory/file"
> +-    echo "or     $prog [-o owner] [-g group] [-m mode] file [file ...] =
directory"
> ++    echo "Usage: $prog [-m mode] -d directory"
> ++    echo "or     $prog [-m mode] file directory/file"
> ++    echo "or     $prog [-m mode] file [file ...] directory"
> +     echo "or     $prog -S file target  (creates \"target\" symlink)"
> +-    echo "or     $prog -T lt_arg [-o owner] [-g group] [-m mode] libtoo=
l.lai directory"
> ++    echo "or     $prog -T lt_arg [-m mode] libtool.lai directory"
> +     echo ""
> +     echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables aff=
ect the"
> +     echo "behaviour of this command - see comments in the script."
> +@@ -38,32 +38,6 @@ _usage() {
> +     exit 1
> + }
> +=20
> +-_chown ()
> +-{
> +-    _st=3D255
> +-    if [ $# -eq 3 ] ; then
> +-	chown $1:$2 $3
> +-	_st=3D$?
> +-	if [ $_st -ne 0 ] ; then
> +-	    if [ $REAL_UID !=3D '0' ] ; then
> +-		if [ ! -f $DIST_ROOT/.chown.quiet ] ; then
> +-		    echo '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D'
> +-		    echo Ownership of files under ${DIST_ROOT:-/}
> +-		    echo cannot be changed
> +-		    echo '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D'
> +-		    if [ -n "$DIST_ROOT" ] ; then
> +-			touch $DIST_ROOT/.chown.quiet
> +-		    fi
> +-		fi
> +-	       _st=3D0
> +-	    fi    =20
> +-	fi
> +-    fi
> +-
> +-    return $_st
> +-}
> +-
> +-
> + _manifest ()
> + {=20
> +     echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
> +@@ -77,9 +51,6 @@ Sflag=3Dfalse
> + Tflag=3Dfalse
> + DIRMODE=3D755
> + FILEMODE=3D644
> +-OWNER=3D`id -u`
> +-GROUP=3D`id -g`
> +-REAL_UID=3D$OWNER
> +=20
> + # default is to install and don't append manifest
> + INSTALL=3Dtrue
> +@@ -94,24 +65,16 @@ MANIFEST=3D:
> +=20
> + if $INSTALL
> + then
> +-    CP=3Dcp; LN=3Dln; MKDIR=3Dmkdir; CHMOD=3Dchmod; CHOWN=3D_chown
> ++    CP=3Dcp; LN=3Dln; MKDIR=3Dmkdir; CHMOD=3Dchmod;
> + else
> +-    CP=3Dtrue; LN=3Dtrue; MKDIR=3Dtrue; CHMOD=3Dtrue; CHOWN=3Dtrue
> ++    CP=3Dtrue; LN=3Dtrue; MKDIR=3Dtrue; CHMOD=3Dtrue;
> + fi
> +=20
> +-[ -n "$DIST_ROOT" -a $REAL_UID -ne 0 ] && CHOWN=3Dtrue
> +-
> +-while getopts "Dcm:d:S:o:g:T:" c $*
> ++while getopts "Dcm:d:S:T:" c $*
> + do
> +    case $c in
> +    c)
> + 	;;
> +-   g)
> +-	GROUP=3D$OPTARG
> +-	;;
> +-   o)
> +-	OWNER=3D$OPTARG
> +-	;;
> +    m)
> + 	DIRMODE=3D`expr $OPTARG`
> + 	FILEMODE=3D$DIRMODE
> +@@ -146,18 +109,7 @@ then
> +     # first usage
> +     #
> +     $MKDIR -p $dir=20
> +-    status=3D$?
> +-    if [ $status -eq 0 ]
> +-    then
> +-	$CHMOD $DIRMODE $dir
> +-	status=3D$?
> +-    fi
> +-    if [ $status -eq 0 ]
> +-    then
> +-	$CHOWN $OWNER $GROUP $dir
> +-	status=3D$?
> +-    fi
> +-    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
> ++    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
> + elif $Sflag
> + then
> +     #
> +@@ -203,7 +155,7 @@ then
> + 			install_name=3D$target/$solib
> + 			$CP $solib $install_name
> + 			status=3D$?
> +-			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIS=
T_ROOT}
> ++			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
> + 			break
> + 		fi
> + 	done
> +@@ -254,7 +206,7 @@ then
> + 	install_name=3D$target/$old_library
> + 	$CP $old_library $install_name
> + 	status=3D$?
> +-	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#=
$DIST_ROOT}
> ++	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
> + 	;;
> +     *)
> + 	echo "$prog: -T $lt_install invalid"
> +@@ -267,7 +219,6 @@ then
> + 	if [ $status -eq 0 ]
> + 	then
> + 		$CHMOD $FILEMODE $install_name
> +-		$CHOWN $OWNER $GROUP $install_name
> + 	fi
> + 	;;
> +     esac
> +@@ -292,23 +243,10 @@ else
> + 	then=20
> + 	    if [ -f $dir/$f ]
> + 	    then
> +-		$CHMOD $FILEMODE $dir/$f
> +-		status=3D$?
> +-		if [ $status -eq 0 ]
> +-		then
> +-		    $CHOWN $OWNER $GROUP $dir/$f
> +-		    status=3D$?
> +-		fi
> +-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
> ++		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
> + 	    else
> + 		$CHMOD $FILEMODE $dir
> +-		status=3D$?
> +-		if [ $status -eq 0 ]
> +-		then
> +-		    $CHOWN $OWNER $GROUP $dir
> +-		    status=3D$?
> +-		fi
> +-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$dir ${dir#$DIST_ROOT}
> ++		$MANIFEST f $FILEMODE $HERE/$dir ${dir#$DIST_ROOT}
> + 	    fi
> + 	fi
> +     else
> +@@ -334,14 +272,7 @@ else
> + 	    status=3D$?
> + 	    if [ $status -eq 0 ]
> + 	    then
> +-		$CHMOD $FILEMODE $dir/$f
> +-		status=3D$?
> +-		if [ $status -eq 0 ]
> +-		then
> +-		    $CHOWN $OWNER $GROUP $dir/$f
> +-		    status=3D$?
> +-		fi
> +-		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
> ++		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
> + 	    fi
> + 	    [ $status -ne 0 ] && break
> + 	done
> +--=20
> +1.8.1.2
> +
> diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/me=
ta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
> new file mode 100644
> index 0000000..4d152b1
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "XFS Filesystem Dump Utility"
> +DESCRIPTION =3D "The xfsdump package contains xfsdump, xfsrestore and a \
> +               number of other utilities for administering XFS filesyste=
ms.\
> +               xfsdump examines files in a filesystem, determines which \
> +               need to be backed up, and copies those files to a \
> +               specified disk, tape or other storage medium."
> +HOMEPAGE =3D "http://oss.sgi.com/projects/xfs"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D15c832894d10ddd00dfcf57be=
e490ecc"
> +DEPENDS =3D "xfsprogs attr"
> +
> +SRC_URI =3D "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz=
 \
> +	   file://remove-install-as-user.patch \
> +          "
> +SRC_URI[md5sum] =3D "a8b1761be5feb363131e7b506639ad4c"
> +SRC_URI[sha256sum] =3D "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0=
df6d4c5cc1960943"
> +
> +inherit autotools
> +B =3D "${S}"

Why don't you use autotools-brokensep?

The same does apply to dmapi recipe.

> +
> +PARALLEL_MAKE =3D ""
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[gettext] =3D "--enable-gettext=3Dyes,--enable-gettext=3Dno=
,gettext"
> +
> +EXTRA_OEMAKE +=3D "'LIBTOOL=3D${HOST_SYS}-libtool' V=3D1"
> +
> +do_configure () {
> +    export DEBUG=3D"-DNDEBUG"
> +    oe_runconf
> +}
> +
> +do_install () {
> +    export DIST_ROOT=3D${D}
> +    oe_runmake install=20
> +    oe_runmake install-dev
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--00hq2S6J2Jlg6EbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXWBNsACgkQN1Ujt2V2gByaAgCcC0U3XipEWIUTdDAnoywdg2rn
b3QAoIsu76gxGkOKonwrIkNO+wrzNBkh
=axHV
-----END PGP SIGNATURE-----

--00hq2S6J2Jlg6EbK--
