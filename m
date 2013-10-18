Return-Path: <joe@deserted.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BE9816BA14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:30:01 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id l12so1276026wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GVegTjkEACaFwKMxre7e6s4DpS2GvbD2+DlZGT+f0/g=;
	b=hE7mU9vVZGoLdVRyM62cWnuuYKkEt2KwfehMt0k0iDEKuEGD5UxAITyI6LEqOapqpw
	cIppV3DDpfUBIQ9BTqVhOiPxHenT7UEks5rvDOErux0bJPzGdzUAUJKk2aNfs8Q2DPtO
	vFA4FSz9ohSFhkvfrAIduKT741Aoc10Sch5Aie7tbXaXzcypb9zy+XGbdCz+uskfbBYy
	E4067hwIhlsIh5w5udUHi825icds++miZlt4wC1rn3cAKycsgVa2c8zyKXvt9DJnCzPV
	1HpYJgBpRfVFIgZIhYCl63Dg6rB30PjJo6aJTB7QQMUAfVhiFRSDTvxW0KOCwN+ZPMdb
	tceg==
X-Gm-Message-State: ALoCoQn7EHY9adM02b1gmzIWhfrqe4WqsGWcRZcL0j/71TQFzI+yYkPH9jSqeVKW9iLHW3lIcu6O
X-Received: by 10.194.120.68 with SMTP id la4mr3297732wjb.33.1382113803186;
	Fri, 18 Oct 2013 09:30:03 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id w10sm4997514wia.4.2013.10.18.09.30.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:30:02 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:29:57 -0400
From: Joe MacDonald <joe@deserted.net>
To: rongqing.li@windriver.com
Message-ID: <20131018162954.GA2456@deserted.net>
References: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
	<1381394085-7681-2-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1381394085-7681-2-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2 meta-networking] vsftpd: change default secure_chroot_dir
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
X-List-Received-Date: Fri, 18 Oct 2013 16:30:05 -0000
X-Groupsio-MsgNum: 46808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

Is this different from the patch I received from Ming Liu about a month
ago?  It doesn't look it at first glance, but I didn't diff the two.

-J.

[[oe] [PATCH 2/2 meta-networking] vsftpd: change default secure_chroot_dir]=
 On 13.10.10 (Thu 16:34) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Change default value of secure_chroot_dir to /var/run/vsftpd/empty, add
> volatiles entry for it, to ensure it won't fail to start by xinetd.
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../vsftpd/files/change-secure_chroot_dir.patch    |   55 ++++++++++++++=
++++++
>  meta-networking/recipes-daemons/vsftpd/files/init  |    2 +-
>  .../vsftpd/files/volatiles.99_vsftpd               |    2 +
>  .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    7 ++-
>  4 files changed, 64 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/change-s=
ecure_chroot_dir.patch
>  create mode 100644 meta-networking/recipes-daemons/vsftpd/files/volatile=
s.99_vsftpd
>=20
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/change-secure_c=
hroot_dir.patch b/meta-networking/recipes-daemons/vsftpd/files/change-secur=
e_chroot_dir.patch
> new file mode 100644
> index 0000000..e7a673e
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_d=
ir.patch
> @@ -0,0 +1,55 @@
> +vsftpd: change secure_chroot_dir default value
> +
> +Upstream-Status: Pending
> +
> +Change secure_chroot_dir pointing to a volatile directory.
> +
> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +---
> + INSTALL       |    6 +++---
> + tunables.c    |    2 +-
> + vsftpd.conf.5 |    2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff -urpN a/INSTALL b/INSTALL
> +--- a/INSTALL	2013-09-13 10:23:57.504972397 +0800
> ++++ b/INSTALL	2013-09-13 10:25:25.664971779 +0800
> +@@ -27,11 +27,11 @@ user in case it does not already exist.=20
> + [root@localhost root]# useradd nobody
> + useradd: user nobody exists
> +=20
> +-2b) vsftpd needs the (empty) directory /usr/share/empty in the default
> ++2b) vsftpd needs the (empty) directory /var/run/vsftpd/empty in the def=
ault
> + configuration. Add this directory in case it does not already exist. e.=
g.:
> +=20
> +-[root@localhost root]# mkdir /usr/share/empty/
> +-mkdir: cannot create directory `/usr/share/empty': File exists
> ++[root@localhost root]# mkdir /var/run/vsftpd/empty/
> ++mkdir: cannot create directory `/var/run/vsftpd/empty': File exists
> +=20
> + 2c) For anonymous FTP, you will need the user "ftp" to exist, and have a
> + valid home directory (which is NOT owned or writable by the user "ftp").
> +diff -urpN a/tunables.c b/tunables.c
> +--- a/tunables.c	2013-09-13 10:26:29.554972817 +0800
> ++++ b/tunables.c	2013-09-13 10:27:18.104972210 +0800
> +@@ -254,7 +254,7 @@ tunables_load_defaults()
> +   /* -rw------- */
> +   tunable_chown_upload_mode =3D 0600;
> +=20
> +-  install_str_setting("/usr/share/empty", &tunable_secure_chroot_dir);
> ++  install_str_setting("/var/run/vsftpd/empty", &tunable_secure_chroot_d=
ir);
> +   install_str_setting("ftp", &tunable_ftp_username);
> +   install_str_setting("root", &tunable_chown_username);
> +   install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
> +diff -urpN a/vsftpd.conf.5 b/vsftpd.conf.5
> +--- a/vsftpd.conf.5	2013-09-13 10:09:33.774972462 +0800
> ++++ b/vsftpd.conf.5	2013-09-13 10:10:41.914971989 +0800
> +@@ -969,7 +969,7 @@ This option should be the name of a dire
> + directory should not be writable by the ftp user. This directory is used
> + as a secure chroot() jail at times vsftpd does not require filesystem a=
ccess.
> +=20
> +-Default: /usr/share/empty
> ++Default: /var/run/vsftpd/empty
> + .TP
> + .B ssl_ciphers
> + This option can be used to select which SSL ciphers vsftpd will allow f=
or
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/init b/meta-net=
working/recipes-daemons/vsftpd/files/init
> index d0ec010..513f407 100755
> --- a/meta-networking/recipes-daemons/vsftpd/files/init
> +++ b/meta-networking/recipes-daemons/vsftpd/files/init
> @@ -2,7 +2,7 @@
>  DAEMON=3D/usr/sbin/vsftpd
>  NAME=3Dvsftpd
>  DESC=3D"FTP Server"
> -ARGS=3D""
> +ARGS=3D"/etc/vsftpd.conf"
>  FTPDIR=3D/var/lib/ftp
> =20
>  test -f $DAEMON || exit 0
> diff --git a/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vs=
ftpd b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
> new file mode 100644
> index 0000000..0f80776
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
> @@ -0,0 +1,2 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d root root 0755 /var/run/vsftpd/empty none
> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/met=
a-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> index 7677477..09de1e9 100644
> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
> @@ -14,6 +14,8 @@ SRC_URI =3D "https://security.appspot.com/downloads/vsf=
tpd-${PV}.tar.gz \
>             file://vsftpd.conf \
>             file://vsftpd.user_list \
>             file://vsftpd.ftpusers \
> +           file://change-secure_chroot_dir.patch \
> +           file://volatiles.99_vsftpd \
>  "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271 \
> @@ -40,7 +42,7 @@ LDFLAGS_append =3D" -lcrypt -lcap"
>  do_configure() {
>      # Fix hardcoded /usr, /etc, /var mess.
>      cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstat=
edir}:g \
> -    |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed=
 s:\"/etc:\"${sysconfdir}:g > tunables.c.new
> +    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
>      mv tunables.c.new tunables.c
>  }
> =20
> @@ -60,6 +62,9 @@ do_install() {
> =20
>      install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>      install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
> +    install -d ${D}/${sysconfdir}/default/volatiles
> +    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/def=
ault/volatiles/99_vsftpd
> +
>      if ! test -z "${PAMLIB}" ; then
>          install -d ${D}${sysconfdir}/pam.d/
>          cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
--=20
-Joe MacDonald.
:wq

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJhYgIACgkQwFvcllog0XwKKwCeNPeMzcVhj/JhbvusNBNfLMZ6
XBUAnA7Q8ovTa+fnnj/A8elIZGkoGOcH
=evKV
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
