Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIVIi-0004Wy-ST
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:51:03 +0100
Received: by ywg8 with SMTP id 8so377256ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=cVA+bYdzND47PUrzTdDojGx9W9h6eF8E33ED1wgAsLQ=;
	b=Eecuw1S2twtPVNquds6UksGGeRto5GRb1rmA3g70qGKe8WILbmVBBm6pmYwjNQE0IP
	lZPjZhwRCOSDiJH69bhimJW4/Pj0N2ZHSo0EecluD9ZEP6SMVEO77mEs6z0koomRDCBW
	z6QoaApt7+FFjH8PK53G+IBs3RBp6QcfnBEsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=N3UQi79VC+BCll4D6n/phcaidv6WoHU142Q698Ful4OQA4mYJQXXuHqBJ1JkbmXdp2
	8coYSlY4G4uWHriSBHATlgCuNOdo8LJ6Se1M9nbOZobMf98yG5cFPamutgPBj3BFbMTH
	w7lH+YwaHsicSKxMv0P4vVkBKFuJTjr3gZXjQ=
Received: by 10.91.12.18 with SMTP id p18mr10523283agi.48.1289951393909; Tue,
	16 Nov 2010 15:49:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:49:33 -0800 (PST)
In-Reply-To: <1289064751-20094-1-git-send-email-moncelier@devlife.org>
References: <1289064751-20094-1-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:49:33 -0800
Message-ID: <AANLkTimUMMhoKSgxWBO31Qr=C5n+agJf6xBehAOwvef8@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 09/11] pathfinder: Added pathfinder (X.509 path verification)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2010 23:51:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:32 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> =C2=A0* PathFinder is designed to provide a mechanism for any program to
> =C2=A0 =C2=A0 =C2=A0 =C2=A0perform RFC3280-compliant path validation of X=
509 certificates, even
> =C2=A0 =C2=A0 =C2=A0 =C2=A0when some of the intermediate certificates are=
 not present on the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local machine.
>
> =C2=A0* pathfinder can be used with opkg to provide verification of remot=
e
> =C2=A0 =C2=A0ssl certificates
> ---
> =C2=A0recipes/pathfinder/files/pathfinderd.conf | =C2=A0 21 +++++++++++++=
++++++
> =C2=A0recipes/pathfinder/files/pathfinderd.init | =C2=A0 32 +++++++++++++=
++++++++++++++++
> =C2=A0recipes/pathfinder/pathfinder.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 22 +++++++++++++++++++
> =C2=A0recipes/pathfinder/pathfinder_1.1.3.bb =C2=A0 =C2=A0| =C2=A0 11 +++=
+++++++
> =C2=A0recipes/pathfinder/pathfinder_svn.bb =C2=A0 =C2=A0 =C2=A0| =C2=A0 1=
1 ++++++++++
> =C2=A05 files changed, 97 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/pathfinder/files/pathfinderd.conf
> =C2=A0create mode 100644 recipes/pathfinder/files/pathfinderd.init
> =C2=A0create mode 100644 recipes/pathfinder/pathfinder.inc
> =C2=A0create mode 100644 recipes/pathfinder/pathfinder_1.1.3.bb
> =C2=A0create mode 100644 recipes/pathfinder/pathfinder_svn.bb
>
> diff --git a/recipes/pathfinder/files/pathfinderd.conf b/recipes/pathfind=
er/files/pathfinderd.conf
> new file mode 100644
> index 0000000..9c285a8
> --- /dev/null
> +++ b/recipes/pathfinder/files/pathfinderd.conf
> @@ -0,0 +1,21 @@
> +<!DOCTYPE busconfig PUBLIC
> + "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> + =C2=A0 =C2=A0<policy user=3D"root">
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow own=3D"ca.carillon.pathfinder"/>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_destination=3D"ca.carillon.pathf=
inder"/>
> + =C2=A0 =C2=A0</policy>
> +
> + =C2=A0 =C2=A0<!--
> + =C2=A0 =C2=A0<policy user=3D"pathfinderd">
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow own=3D"ca.carillon.pathfinder"/>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_destination=3D"ca.carillon.pathf=
inder"/>
> + =C2=A0 =C2=A0</policy>
> + =C2=A0 =C2=A0-->
> +
> + =C2=A0 =C2=A0<policy context=3D"default">
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<deny own=3D"ca.carillon.pathfinder"/>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_destination=3D"ca.carillon.pathf=
inder"/>
> + =C2=A0 =C2=A0</policy>
> +</busconfig>
> diff --git a/recipes/pathfinder/files/pathfinderd.init b/recipes/pathfind=
er/files/pathfinderd.init
> new file mode 100644
> index 0000000..a20b4c1
> --- /dev/null
> +++ b/recipes/pathfinder/files/pathfinderd.init
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +DAEMON=3D/usr/sbin/pathfinderd
> +NAME=3Dpathfinderd
> +DESC=3D"pathfinderd: X509 Path Verification Daemon"
> +PIDFILE=3D/var/run/pathfinderd/pathfinderd.pid
> +ARGS=3D"-d"
> +
> +test -f $DAEMON || exit 0
> +
> +case "$1" in
> + =C2=A0 =C2=A0start)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n "Starting $DESC: $NAME"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile =
$PIDFILE --exec $DAEMON -- $ARGS
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "."
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0stop)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n "Stopping $DESC: $NAME"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --pidfile $=
PIDFILE --exec $DAEMON
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "."
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0restart)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0$0 stop
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0$0 start
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> + =C2=A0 =C2=A0*)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "Usage: $0 {start|stop|restart}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> +esac
> +
> +exit 0
> diff --git a/recipes/pathfinder/pathfinder.inc b/recipes/pathfinder/pathf=
inder.inc
> new file mode 100644
> index 0000000..ce1d832
> --- /dev/null
> +++ b/recipes/pathfinder/pathfinder.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A tool to perform RFC3280-compliant path validation of =
X509 certificates"
> +
> +LICENSE =3D "LGPL"

version please

> +DEPENDS =3D "wvstreams openldap boost"
> +RDEPENDS =3D "dbus"
> +HOMEPAGE =3D "http://code.google.com/p/pathfinder-pki/"
> +
> +INC_PR =3D "0"

should be r0

> +
> +inherit cmake pkgconfig update-rc.d
> +
> +INITSCRIPT_NAME =3D "pathfinderd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +do_install_append() {
> + =C2=A0install -d ${D}/${sysconfdir}/init.d/
> + =C2=A0install -m 755 "${WORKDIR}/pathfinderd.init" "${D}/etc/init.d/pat=
hfinderd"
> +
> + =C2=A0install -d ${D}/${sysconfdir}/dbus-1/system.d/
> + =C2=A0install ${WORKDIR}/pathfinderd.conf ${D}/${sysconfdir}/dbus-1/sys=
tem.d/
> +
> +}
> diff --git a/recipes/pathfinder/pathfinder_1.1.3.bb b/recipes/pathfinder/=
pathfinder_1.1.3.bb
> new file mode 100644
> index 0000000..ab8aa65
> --- /dev/null
> +++ b/recipes/pathfinder/pathfinder_1.1.3.bb
> @@ -0,0 +1,11 @@
> +require pathfinder.inc
> +
> +SRC_URI =3D "http://pathfinder-pki.googlecode.com/files/${PN}-${PV}-Sour=
ce.tar.gz \
> + =C2=A0file://pathfinderd.init \
> + =C2=A0file://pathfinderd.conf \
> +"
> +
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI[md5sum] =3D "6985ea14da6dff30c3c4e5cfc8b3d0f7"
> +SRC_URI[sha256sum] =3D "a81b09a306aa997980d76f2b6e9215e7b3a91ed4c5fb413b=
3c4d30513a5e1031"
> diff --git a/recipes/pathfinder/pathfinder_svn.bb b/recipes/pathfinder/pa=
thfinder_svn.bb
> new file mode 100644
> index 0000000..f17943e
> --- /dev/null
> +++ b/recipes/pathfinder/pathfinder_svn.bb
> @@ -0,0 +1,11 @@
> +require pathfinder.inc
> +
> +SRC_URI =3D "svn://pathfinder-pki.googlecode.com/svn/trunk;module=3Dpath=
finder;proto=3Dhttp \
> + =C2=A0file://pathfinderd.init \
> + =C2=A0file://pathfinderd.conf \
> +"
> +
> +SRCREV =3D "224"
> +PV =3D "1.1.3+svnr${SRCPV}"
> +PR =3D "${INC_PR}.0"
> +S =3D "${WORKDIR}/${PN}"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


