Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id CDD826D610
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:40:22 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so4034825eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IRW/AVNFzPR4YYkOchyP9D/xtS0bpDr3bD5LLRDW7gI=;
	b=Z+Mer4m7fxvw+PbiMRrYWh/oFQUibY0z4qu7yx9txDGkfTTTKJcdIaz4Ijnan+3F85
	GDh2j2fUCPbefdLcjU6LuACA9oQyeASgcuhmyMuBgujSThz0Ebpx+RzOiqRW3rdcIkXH
	RXr+fHTOzSNKU5RcfyIy2NgfmYYx46Eq3h74l7rlCSxzWbQ0fK47U/ujcoVl4Jk6gPTf
	vhoRznEwMLWEebsE4YScupRb+4iKEYxesy1nwVNBFJpGW1z3ttNkughSnkAfb4ZIrRxQ
	gAfQ/U0VlIsuZ6DRxSSzSFr+PADLpef/4k/XWTNmnz0FmP0MeFfHa9fgBpJor7JTikst
	RHFw==
X-Received: by 10.14.212.72 with SMTP id x48mr2195363eeo.0.1384965623960;
	Wed, 20 Nov 2013 08:40:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	v45sm11785971eef.11.2013.11.20.08.40.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:40:23 -0800 (PST)
Date: Wed, 20 Nov 2013 17:40:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131120164026.GS3708@jama>
References: <1384917768-28022-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
MIME-Version: 1.0
In-Reply-To: <1384917768-28022-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] gateone: Updated to version 1.2
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
X-List-Received-Date: Wed, 20 Nov 2013 16:40:24 -0000
X-Groupsio-MsgNum: 47211
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRtLtq+kfJNLc57H"
Content-Disposition: inline

--QRtLtq+kfJNLc57H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 03:22:48AM +0000, Dan McDougall wrote:
> This new version of Gate One uses a new configuration file format which
> means the old server.conf is gone.  It now stores configuration files in
> /etc/gateone/conf.d.  The /opt/gateone directory is also gone and
> instead the package installs like a regular Python module in
> site-packages.  SSL certificates/keys are stored in /etc/gateone/ssl/.
>=20
> The new version requires python-tornado 3.1.1 (which was submitted
> earlier today) and the python-futures package (which was also submitted
> today).
>=20
> An 80oe.conf file has been added specific to OpenEmbedded that replaces
> the old pre-configured server.conf functionality.
>=20
> The old patch that removes the init script checks has been deprecated by
> the use of the --skip_init_scripts option which is now being passed to
> setup.py.
>=20
> Lastly, Gate One 1.2 is about twice as fast (benchmarked) as Gate One
> 1.1 on the Beaglebone platform.
>=20
> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> ---
>  ...move-init-check-it-looks-outside-the-sysr.patch | 38 ----------------=
------
>  .../recipes-connectivity/gateone/gateone/80oe.conf | 23 +++++++++++++
>  .../gateone/gateone/server.conf                    |  5 ---
>  .../recipes-connectivity/gateone/gateone_git.bb    | 32 ++++++++++------=
--
>  .../gateone/gateone/gateone.service                |  2 +-
>  5 files changed, 43 insertions(+), 57 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/gateone/gateone/0001-set=
up.py-remove-init-check-it-looks-outside-the-sysr.patch
>  create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
>  delete mode 100644 meta-oe/recipes-connectivity/gateone/gateone/server.c=
onf

2013-11-20 17:39:42
URL:http://patchwork.openembedded.org/patch/62017/mbox/ [8592] ->
"pw-am-62017.patch" [1]
Applying: gateone: Updated to version 1.2
error:
meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-init-chec=
k-it-looks-outside-the-sysr.patch:
does not exist in index
error: patch failed:
meta-oe/recipes-connectivity/gateone/gateone_git.bb:1
error: meta-oe/recipes-connectivity/gateone/gateone_git.bb: patch does
not apply
error:
meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service:
does not exist in index
Patch failed at 0001 gateone: Updated to version 1.2
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


>=20
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-r=
emove-init-check-it-looks-outside-the-sysr.patch b/meta-oe/recipes-connecti=
vity/gateone/gateone/0001-setup.py-remove-init-check-it-looks-outside-the-s=
ysr.patch
> deleted file mode 100644
> index ef3a95b..0000000
> --- a/meta-oe/recipes-connectivity/gateone/gateone/0001-setup.py-remove-i=
nit-check-it-looks-outside-the-sysr.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From a65ad6683688bb427efefe5e52137928c2736137 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Thu, 4 Apr 2013 13:04:03 +0200
> -Subject: [PATCH] setup.py: remove init check, it looks outside the sysro=
ot
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - setup.py | 14 --------------
> - 1 file changed, 14 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 00c8ba1..4568679 100755
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -112,20 +112,6 @@ redhat_script =3D os.path.join(setup_dir, 'scripts/=
init/gateone-redhat.sh')
> - gentoo_script =3D os.path.join(setup_dir, 'scripts/init/gateone-gentoo.=
sh')
> - temp_script_path =3D os.path.join(setup_dir, 'build/gateone')
> - temp_confd_path =3D os.path.join(setup_dir, 'build/gateone')
> --if os.path.exists('/etc/debian_version'):
> --    shutil.copy(debian_script, temp_script_path)
> --elif os.path.exists('/etc/redhat-release'):
> --    shutil.copy(redhat_script, temp_script_path)
> --elif os.path.exists('/etc/gentoo-release'):
> --    shutil.copy(gentoo_script, temp_script_path)
> --    conf_file =3D [('/etc/conf.d', [
> --        os.path.join(setup_dir, 'scripts/conf/gateone')
> --    ])]
> --
> --if os.path.exists(temp_script_path):
> --    init_script =3D [('/etc/init.d', [
> --        temp_script_path
> --    ])]
> -=20
> - # Put it all together
> - data_files =3D (
> ---=20
> -1.8.1.4
> -
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf b/met=
a-oe/recipes-connectivity/gateone/gateone/80oe.conf
> new file mode 100644
> index 0000000..cde98bc
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
> @@ -0,0 +1,23 @@
> +// Some custom Gate One settings for OpenEmbedded
> +{
> +    "*": {
> +        "gateone": { // These settings apply to all of Gate One
> +            "log_file_max_size": 5242880, // 5 megabyte logs for OE by d=
efault (default would normally be 100Mb)
> +            "log_file_num_backups": 2, // Default is normally 10
> +            "origins": ["*"], // Every device has a unique origin
> +            "logging": "info",
> +            "pid_file": "/var/run/gateone.pid",
> +            "session_dir": "/tmp/gateone",
> +            "user_dir": "/var/lib/gateone/users"
> +        },
> +        "terminal": {
> +            // Disabling session logging for embedded devices is a good =
idea (limited/slow storage)
> +            "session_logging": false,
> +            "syslog_session_logging": false
> +//             "commands": {
> +//                 // For some reason this doesn't work (never asks for =
the password)
> +//                 "login": "setsid /bin/login" // Normally this would e=
mulate logging into the host console
> +//             }
> +        }
> +    }
> +}
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone/server.conf b/m=
eta-oe/recipes-connectivity/gateone/gateone/server.conf
> deleted file mode 100644
> index 988b0d0..0000000
> --- a/meta-oe/recipes-connectivity/gateone/gateone/server.conf
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -session_logging =3D False
> -origins =3D "*"
> -command =3D "/var/lib/gateone/plugins/ssh/scripts/ssh_connect.py -S '/tm=
p/gateone/%SESSION%/%SHORT_SOCKET%' --sshfp -a '-oUserKnownHostsFile=3D%USE=
RDIR%/%USER%/ssh/known_hosts'"
> -log_file_prefix =3D "/var/log/gateone.log"
> -
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-o=
e/recipes-connectivity/gateone/gateone_git.bb
> index c5586b5..9c41a3b 100644
> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> @@ -1,40 +1,46 @@
>  DESCRIPTION =3D "HTML5 (plugin-free) web-based terminal emulator and SSH=
 client"
>  LICENSE =3D "AGPLv3"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dee5b168fc7de89a0cadc49e27=
830aa2c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D834cbc6995db88433db17cdf8=
953a428"
> +HOMEPAGE =3D "http://liftoffsoftware.com/Products/GateOne"
> =20
> -PR =3D "r8"
> +PR =3D "r1"
> =20
> -PV =3D "1.1"
> -SRCREV =3D "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
> +PV =3D "1.2"
> +SRCREV =3D "1528d324088fc1c180b7fdf50f5b5c1af057eef6"
>  SRC_URI =3D "git://github.com/liftoff/GateOne.git \
>             file://gateone-avahi.service \
> -           file://server.conf \
> +           file://80oe.conf \
>            "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit distutils allarch
> +inherit distutils
> +export prefix =3D "${localstatedir}"
> =20
> -export prefix =3D "${localstatedir}/lib"
> +DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
> +    --prefix=3D${prefix} \
> +    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=3D${PYTHON_SITEPACKAGES_DIR} \
> +    --install-scripts=3D${bindir} \
> +    --skip_init_scripts"
> =20
>  do_install_append() {
> -	install -d ${D}${localstatedir}/log/${BPN}
> -
>  	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
>  	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avah=
i/services/
> =20
> -	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
> +	install -m 0755 -d ${D}${sysconfdir}/gateone/conf.d/
> +	install -m 0644 ${WORKDIR}/80oe.conf ${D}${sysconfdir}/gateone/conf.d/8=
0oe.conf
>  }
> =20
> -FILES_${PN} =3D "${localstatedir}/lib ${localstatedir}/log ${base_libdir=
} ${sysconfdir} ${libdir}/python*"
> -RDEPENDS_${PN} =3D "file \
> -                  mime-support \
> +FILES_${PN} =3D "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconf=
dir} ${libdir}/python*"
> +RDEPENDS_${PN} =3D "mime-support \
>                    openssh-ssh \
>                    python-compression \
>                    python-crypt \
>                    python-datetime \
>                    python-email \
>                    python-fcntl \
> +                  python-futures \
>                    python-html \
>                    python-imaging \
>                    python-io \
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/ga=
teone.service b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/g=
ateone.service
> index 7ff6002..7b14d3e 100644
> --- a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.s=
ervice
> +++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.s=
ervice
> @@ -4,7 +4,7 @@ ConditionPathExists=3D|/var/lib/gateone
> =20
>  [Service]
>  WorkingDirectory=3D/var/lib/gateone
> -ExecStart=3D/usr/bin/python gateone.py
> +ExecStart=3D/usr/bin/python /usr/bin/gateone
> =20
>  [Install]
>  WantedBy=3Dmulti-user.target
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRtLtq+kfJNLc57H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKM5foACgkQN1Ujt2V2gByuygCfaSmd08d6yk0EvKMn+HRRgXa1
8JIAoLVxpg1TcIYU2dpuTTIAvVl/0mPE
=67tJ
-----END PGP SIGNATURE-----

--QRtLtq+kfJNLc57H--
