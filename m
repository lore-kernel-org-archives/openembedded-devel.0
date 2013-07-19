Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD6366B0F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 14:58:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6JEwIMF015411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 07:58:18 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 19 Jul 2013 07:58:18 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 3BB667FE3;
	Fri, 19 Jul 2013 10:58:15 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 3329E404D8; Fri,
	19 Jul 2013 10:58:16 -0400 (EDT)
Date: Fri, 19 Jul 2013 10:58:16 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130719145816.GA3832@windriver.com>
References: <1374200365-25862-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1374200365-25862-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0
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
X-List-Received-Date: Fri, 19 Jul 2013 14:58:17 -0000
X-Groupsio-MsgNum: 45421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

[[meta-networking][PATCH v2] Upgrade vsftpd to 3.0.0] On 13.07.19 (Fri 10:1=
9) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Upgrade vsftpd to 3.0.0 with below modification:
> 1. more strict access limitation, like: do not allow anonymous access
> 2. use vsftpd.ftpusers and vsftpd.user_list to confine user access
> 3. enable pam if DISTRO_FEATURE includes pam
> 4. enable tcp-wrapper
> 5. install vsftpd.conf with 0600 permission, not 0755
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../recipes-daemons/vsftpd/files/vsftpd.conf       |   43 ++++++++++++++=
+++---
>  .../recipes-daemons/vsftpd/files/vsftpd.ftpusers   |   15 +++++++
>  .../recipes-daemons/vsftpd/files/vsftpd.user_list  |   20 +++++++++
>  .../makefile-destdir.patch                         |    4 +-
>  .../makefile-libs.patch                            |    2 +-
>  .../makefile-strip.patch                           |    6 +--
>  .../vsftpd-3.0.0/nopam-with-tcp_wrappers.patch     |   17 ++++++++
>  .../{vsftpd-2.3.5 =3D> vsftpd-3.0.0}/nopam.patch     |    0
>  .../vsftpd-3.0.0/vsftpd-tcp_wrappers-support.patch |   25 ++++++++++++
>  .../vsftpd/{vsftpd_2.3.5.bb =3D> vsftpd_3.0.0.bb}    |   40 ++++++++++++=
+++---
>  10 files changed, 154 insertions(+), 18 deletions(-)
>  mode change 100755 =3D> 100644 meta-networking/recipes-daemons/vsftpd/fi=
les/vsftpd.conf
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.f=
tpusers
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.u=
ser_list
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 =3D> vsftpd-=
3.0.0}/makefile-destdir.patch (95%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 =3D> vsftpd-=
3.0.0}/makefile-libs.patch (92%)
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 =3D> vsftpd-=
3.0.0}/makefile-strip.patch (68%)
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/n=
opam-with-tcp_wrappers.patch
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd-2.3.5 =3D> vsftpd-=
3.0.0}/nopam.patch (100%)
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/v=
sftpd-tcp_wrappers-support.patch
>  rename meta-networking/recipes-daemons/vsftpd/{vsftpd_2.3.5.bb =3D> vsft=
pd_3.0.0.bb} (44%)
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf b/m=
eta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
> old mode 100755
> new mode 100644
> index 08f91e0..bb19294
> --- a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
> @@ -12,17 +12,17 @@
>  listen=3DYES
> =20
>  # Allow anonymous FTP? (Beware - allowed by default if you comment this =
out).
> -anonymous_enable=3DYES
> +anonymous_enable=3DNO
>  #
>  # Uncomment this to allow local users to log in.
> -#local_enable=3DYES
> +local_enable=3DYES
>  #
>  # Uncomment this to enable any form of FTP write command.
>  write_enable=3DYES
>  #
>  # Default umask for local users is 077. You may wish to change this to 0=
22,
>  # if your users expect that (022 is used by most other ftpd's)
> -#local_umask=3D022
> +local_umask=3D022
>  #
>  # Uncomment this to allow the anonymous FTP user to upload files. This o=
nly
>  # has an effect if the above global write enable is activated. Also, you=
 will
> @@ -54,7 +54,7 @@ connect_from_port_20=3DYES
>  #xferlog_file=3D/var/log/vsftpd.log
>  #
>  # If you want, you can have your log file in standard ftpd xferlog format
> -#xferlog_std_format=3DYES
> +xferlog_std_format=3DYES
>  #
>  # You may change the default value for timing out an idle session.
>  #idle_session_timeout=3D600
> @@ -64,7 +64,7 @@ connect_from_port_20=3DYES
>  #
>  # It is recommended that you define on your system a unique user which t=
he
>  # ftp server can use as a totally isolated and unprivileged user.
> -#nopriv_user=3Dftpsecure
> +#nopriv_user=3Dftp
>  #
>  # Enable this and the server will recognise asynchronous ABOR requests. =
Not
>  # recommended for security (the code is non-trivial). Not enabling it,
> @@ -105,4 +105,35 @@ connect_from_port_20=3DYES
>  # sites. However, some broken FTP clients such as "ncftp" and "mirror" a=
ssume
>  # the presence of the "-R" option, so there is a strong case for enablin=
g it.
>  #ls_recurse_enable=3DYES
> -
> +#
> +# This string is the name of the PAM service vsftpd will use.
> +pam_service_name=3Dvsftpd
> +#
> +# This option is examined if userlist_enable is activated. If you set th=
is
> +# setting to NO, then users will be denied login  unless  they are  expl=
icitly=20
> +# listed  in the file specified by userlist_file.  When login is denied,=
 the=20
> +# denial is issued before the user is asked for a password.
> +userlist_deny=3DYES
> +#
> +# If enabled, vsftpd will load a list of usernames, from the filename gi=
ven by
> +# userlist_file.  If a user tries to log in using  a  name in  this  fil=
e,  they
> +# will be denied before they are asked for a password. This may be usefu=
l in=20
> +# preventing cleartext passwords being transmitted. See also userlist_de=
ny.
> +userlist_enable=3DYES
> +#
> +# If enabled,  vsftpd  will display directory listings with the time in =
your
> +# local time zone. The default is to display GMT. The times returned by =
the
> +# MDTM FTP command are also affected by this option.
> +use_localtime=3DYES
> +#
> +# If set to YES, local users will be (by default) placed in a chroot() j=
ail in
> +# their home directory after login.  Warning: This  option has  security=
 =20
> +# implications,  especially  if  the users have upload permission, or sh=
ell access.
> +# Only enable if you know what you are doing.  Note that these security =
implications
> +# are not vsftpd specific. They apply to all FTP daemons which offer to =
put=20
> +# local  users in chroot() jails.
> +chroot_local_user=3DYES
> +#
> +allow_writeable_chroot=3DYES
> +#
> +tcp_wrappers=3DYES
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers=
 b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
> new file mode 100644
> index 0000000..096142f
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.ftpusers
> @@ -0,0 +1,15 @@
> +# Users that are not allowed to login via ftp
> +root
> +bin
> +daemon
> +adm
> +lp
> +sync
> +shutdown
> +halt
> +mail
> +news
> +uucp
> +operator
> +games
> +nobody
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_lis=
t b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
> new file mode 100644
> index 0000000..d283e3d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.user_list
> @@ -0,0 +1,20 @@
> +# vsftpd userlist
> +# If userlist_deny=3DNO, only allow users in this file
> +# If userlist_deny=3DYES (default), never allow users in this file, and
> +# do not even prompt for a password.
> +# Note that the default vsftpd pam config also checks /etc/vsftpd.ftpuse=
rs
> +# for users that are denied.
> +root
> +bin
> +daemon
> +adm
> +lp
> +sync
> +shutdown
> +halt
> +mail
> +news
> +uucp
> +operator
> +games
> +nobody
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile=
-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefi=
le-destdir.patch
> similarity index 95%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-=
destdir.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-de=
stdir.patch
> index ee37f26..1980d09 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdi=
r.patch
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-destdi=
r.patch
> @@ -7,8 +7,8 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.c=
om>
>  diff --git a/Makefile b/Makefile
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -24,21 +24,21 @@ vsftpd: $(OBJS)
> - 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS) $(LDFLAGS)
> +@@ -24,21 +24,21 @@
> + 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
>  =20
>   install:
>  -	if [ -x /usr/local/sbin ]; then \
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile=
-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-=
libs.patch
> similarity index 92%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-=
libs.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-li=
bs.patch
> index 6a419db..9a10f72 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.p=
atch
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-libs.p=
atch
> @@ -10,7 +10,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel=
=2Ecom>
>  diff --git a/Makefile b/Makefile
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -5,7 +5,7 @@ IFLAGS  =3D -idirafter dummyinc
> +@@ -5,7 +5,7 @@
>   #CFLAGS =3D -g
>   CFLAGS	=3D	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
>  =20
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile=
-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile=
-strip.patch
> similarity index 68%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-=
strip.patch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-st=
rip.patch
> index a2e0cd0..fd31600 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.=
patch
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/makefile-strip.=
patch
> @@ -7,11 +7,11 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel=
=2Ecom>
>  diff --git a/Makefile b/Makefile
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -6,7 +6,6 @@ IFLAGS  =3D -idirafter dummyinc
> - CFLAGS	=3D	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
> +@@ -9,7 +9,6 @@ CFLAGS	=3D	-O2 -fPIE -fstack-protector --param=3Dssp-buf=
fer-size=3D4 \
> + 	#-pedantic -Wconversion
>  =20
>   LIBS	=3D	-lssl -lcrypto -lnsl -lresolv
>  -LINK	=3D	-Wl,-s
> + LDFLAGS	=3D	-fPIE -pie -Wl,-z,relro -Wl,-z,now
>  =20
>   OBJS	=3D	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
> - 		tunables.o ftpdataio.o secbuf.o ls.o \
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-wi=
th-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0=
/nopam-with-tcp_wrappers.patch
> new file mode 100644
> index 0000000..fdcf3a0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam-with-tcp_=
wrappers.patch
> @@ -0,0 +1,17 @@
> +Disable PAM
> +
> +Upstream-Status: Inappropriate [config]
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
> +--- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
> ++++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
> +@@ -2,7 +2,7 @@
> + #define VSF_BUILDDEFS_H
> +=20
> + #define VSF_BUILD_TCPWRAPPERS
> +-#define VSF_BUILD_PAM
> ++#undef VSF_BUILD_PAM
> + #undef VSF_BUILD_SSL
> +=20
> + #endif /* VSF_BUILDDEFS_H */
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.pa=
tch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
> similarity index 100%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.pat=
ch
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/nopam.patch
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-t=
cp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3=
=2E0.0/vsftpd-tcp_wrappers-support.patch
> new file mode 100644
> index 0000000..69745b3
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.0/vsftpd-tcp_wrap=
pers-support.patch
> @@ -0,0 +1,25 @@
> +Enable tcp_wrapper.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + builddefs.h |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/builddefs.h b/builddefs.h
> +index e908352..0106d1a 100644
> +--- a/builddefs.h
> ++++ b/builddefs.h
> +@@ -1,7 +1,7 @@
> + #ifndef VSF_BUILDDEFS_H
> + #define VSF_BUILDDEFS_H
> +=20
> +-#undef VSF_BUILD_TCPWRAPPERS
> ++#define VSF_BUILD_TCPWRAPPERS
> + #define VSF_BUILD_PAM
> + #undef VSF_BUILD_SSL
> +=20
> +--=20
> +1.7.1
> +
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> similarity index 44%
> rename from meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> rename to meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index f146910..845f0a9 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -4,18 +4,33 @@ SECTION =3D "network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271"
> =20
> -DEPENDS =3D "libcap openssl"
> +DEPENDS =3D "libcap openssl tcp-wrappers"

I think this is incorrect based on PACKAGECONFIG[tcp-wrappers] being
added below.  Rather than doing another round, though, I've removed that
piece of your change.  Just FYI.

-J.

> =20
>  SRC_URI =3D "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>             file://makefile-destdir.patch \
>             file://makefile-libs.patch \
>             file://makefile-strip.patch \
> -           file://nopam.patch \
>             file://init \
> -           file://vsftpd.conf"
> +           file://vsftpd.conf \
> +           file://vsftpd.user_list \
> +           file://vsftpd.ftpusers \
> +"
> =20
> -SRC_URI[md5sum] =3D "01398a5bef8e85b6cf2c213a4b011eca"
> -SRC_URI[sha256sum] =3D "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca96=
5f6e2f60879e54f1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271 \
> +                        file://COPYRIGHT;md5=3D04251b2eb0f298dae376d9245=
4f6f72e \
> +                        file://LICENSE;md5=3D654df2042d44b8cac8a5654fc5b=
e63eb"
> +SRC_URI[md5sum] =3D "ad9fa952558c2c5b0426ccaccff0f972"
> +SRC_URI[sha256sum] =3D "ef70205dcd0c7f03b008b9578fb44c0cbe31e66daab8cfaf=
b9904747c17fc2a8"
> +
> +PACKAGECONFIG ??=3D "tcp-wrappers"
> +PACKAGECONFIG[tcp-wrappers] =3D ",,tcp-wrappers"
> +SRC_URI +=3D"${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://v=
sftpd-tcp_wrappers-support.patch', '', d)}"
> +
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> +RDEPENDS_${PN} +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plu=
gin-listfile', '', d)}"
> +PAMLIB =3D "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASE=
LIBDIR} -lpam', '', d)}"
> +NOPAM_SRC =3D"${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://=
nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
> +SRC_URI +=3D "${@base_contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SR=
C}', d)}"
> =20
>  inherit update-rc.d useradd
> =20
> @@ -29,15 +44,28 @@ do_configure() {
>      mv tunables.c.new tunables.c
>  }
> =20
> +do_compile() {
> +   oe_runmake "LIBS=3D-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
> +}
> +
>  do_install() {
>      install -d ${D}${sbindir}
>      install -d ${D}${mandir}/man8
>      install -d ${D}${mandir}/man5
>      oe_runmake 'DESTDIR=3D${D}' install
>      install -d ${D}${sysconfdir}
> -    install -m 0755 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
> +    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
> +
> +    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
> +    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> +    if ! test -z ${PAMLIB} ; then
> +        install -d ${D}${sysconfdir}/pam.d/
> +        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
> +        sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfd=
ir}/pam.d/vsftpd
> +        sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsf=
tpd
> +    fi
>  }
> =20
>  INITSCRIPT_PACKAGES =3D "${PN}"
--=20
-Joe MacDonald.
:wq

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHpVAQACgkQPN8S4W6ZZnfACACcDHLV1T4HFIl5kLMB4GeWxWsR
xe0An0cNk5pXA+0pxFxRffomY4VGA3cY
=YZig
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
