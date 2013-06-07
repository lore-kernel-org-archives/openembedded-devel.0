Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 068226A597
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2013 16:15:38 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so3727141eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2013 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bAe2YWhmLDg66TBKb88EwvmXAvobd0A4OebDZhoPnzA=;
	b=HfYLhcBt3vl4ncXni/s5At9QIdgL1uF7LX/p9w84+JLFOGisxQswhDOX6LvgBrlMVs
	0DORKX6aVuswK2nCvpM3gSsIQ8HqRDLbgoAhadzBcKzXZDyTl8j3QlR32EctImlRYebS
	svtOEkM75PqkOscrN9dSi0FP54tLmBQTsu4ActbKPf3j9KsEkgj4Cb88d/6ewPlrGBTO
	Davy6cZrS6/X/Du++32RliSarytkT7ZXWg83SZw/w5SMfHaoU/KsVW3FOZ/t5Ty9AOAq
	/PKkSftGjxkGXKjX+NtdkWoARLzA/lmBASNEfUJc6IIr8Ak8NBEvyDBNRbRVDkjaZ+1T
	QHtw==
X-Received: by 10.14.150.11 with SMTP id y11mr33344803eej.54.1370621739669;
	Fri, 07 Jun 2013 09:15:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	u11sm2281728eev.12.2013.06.07.09.15.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 09:15:39 -0700 (PDT)
Date: Fri, 7 Jun 2013 18:15:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130607161558.GH22710@jama>
References: <1370297720-9983-1-git-send-email-dan.mcgregor@usask.ca>
MIME-Version: 1.0
In-Reply-To: <1370297720-9983-1-git-send-email-dan.mcgregor@usask.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [meta-oe][PATCH] Add sysv init script for gateone.
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
X-List-Received-Date: Fri, 07 Jun 2013 16:15:39 -0000
X-Groupsio-MsgNum: 44981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7vAdt9JsdkkzRPKN"
Content-Disposition: inline

--7vAdt9JsdkkzRPKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2013 at 04:15:20PM -0600, Dan McGregor wrote:
> ---

Commit subject usually starts with name of changed component:

gateone: Add sysv init script

and missing SOB line, I've added both for you, so it's now in queue for
jenkins (no need to resend v2 unless someone else sends more review
comments).

>  .../gateone/gateone/gateone-init                   | 47 ++++++++++++++++=
++++++
>  .../recipes-connectivity/gateone/gateone_git.bb    |  7 +++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/gateone-=
init
>=20
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone-init b/=
meta-oe/recipes-connectivity/gateone/gateone/gateone-init
> new file mode 100644
> index 0000000..a1cf5ce
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gateone/gateone/gateone-init
> @@ -0,0 +1,47 @@
> +#!/bin/sh -e
> +### BEGIN INIT INFO
> +# Provides:          gateone
> +# Required-Start:    networking
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Gateone HTML5 ssh client
> +# Description:       Gateone HTML5 terminal emulator and SSH client.
> +### END INIT INFO
> +
> +. /etc/init.d/functions
> +
> +NAME=3Dgateone
> +DAEMON=3D/var/lib/gateone/gateone.py
> +PIDFILE=3D/var/run/gateone.pid
> +WORKDIR=3D/var/lib/gateone
> +
> +do_start() {
> +    cd $WORKDIR
> +    /usr/bin/python $DAEMON > /dev/null 2>&1 &
> +    cd $OLDPWD
> +}
> +
> +do_stop() {
> +    kill -TERM `cat $PIDFILE`
> +}
> +
> +case "$1" in
> +    start)
> +        echo "Starting gateone"
> +        do_start
> +        ;;
> +    stop)
> +        echo "Stopping gateone"
> +        do_stop
> +        ;;
> +    restart|force-reload)
> +        echo "Restart gateone"
> +        do_stop
> +        sleep 1
> +        do_start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
> +        exit 1
> +        ;;
> +esac
> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-o=
e/recipes-connectivity/gateone/gateone_git.bb
> index e5b8527..85c32cc 100644
> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> @@ -10,11 +10,12 @@ SRC_URI =3D "git://github.com/liftoff/GateOne.git \
>             file://gateone-avahi.service \
>             file://server.conf \
>             file://gateone.service \
> +           file://gateone-init \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit distutils allarch python-dir systemd
> +inherit distutils allarch python-dir systemd update-rc.d
> =20
>  export prefix =3D "${localstatedir}/lib"
> =20
> @@ -28,6 +29,9 @@ do_install_append() {
>     =20
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/sy=
stem
> +
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gat=
eone
>  }
> =20
>  FILES_${PN} =3D "${localstatedir}/lib ${localstatedir}/log ${localstated=
ir}/volatile/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
> @@ -63,3 +67,4 @@ RDEPENDS_${PN} =3D "file \
>  "
> =20
>  SYSTEMD_SERVICE_${PN} =3D "gateone.service"
> +INITSCRIPT_NAME =3D "gateone"
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7vAdt9JsdkkzRPKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyBz4ACgkQN1Ujt2V2gBxt0ACbBu53QMxJdVX4lTLQjUqZMVeE
/3wAoKK2fxbgtkDqK9C7jSWDgjLZIj5z
=f7cx
-----END PGP SIGNATURE-----

--7vAdt9JsdkkzRPKN--
