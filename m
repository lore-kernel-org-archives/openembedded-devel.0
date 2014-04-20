Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9512A65DC4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:14:08 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so3004625eei.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Rcq7Bg8KdVbXXFWg4nfOIlX3VisuSSX07bu5gg4RUrI=;
	b=ehRSzj1y2W+RCB/x4XRU0fjwZkxdwDxWxBDsdTWY+3EB8c4HrckY+RNOVYV4NvoR4y
	oNsZ3hmbOyxVayjOiavNqKtHWH7TyCZJLq//17JYir1En/x5RdDiLECl2cvrtTBeGHQ3
	Ad8sZ+CSO/uNfq+7FczsQdUIwvKcfWD12wKj2cpONfXlZDm8ucQCMrOdp6A4RekTEK2K
	IqW1RDw2rXpF94bFMoGaoE1vxCTmmCOHsOmvs8eRqaL5YEA/A7EItktWWBdYjanBwpAV
	6pU/ZSKKjTtU+Qlxe4RK0ZF4ITBjA7+VgNdLn4wGzdDrWWa9GtaDIaAEcJgCzc4HpU9y
	LS9Q==
X-Received: by 10.14.207.68 with SMTP id m44mr103301eeo.79.1398003249085;
	Sun, 20 Apr 2014 07:14:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm94941108eew.19.2014.04.20.07.14.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:14:08 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:14:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420141413.GO2486@jama>
References: <1397640676-27955-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397640676-27955-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] rsyslog: add status command and minor fixes for initscript
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
X-List-Received-Date: Sun, 20 Apr 2014 14:14:11 -0000
X-Groupsio-MsgNum: 49352
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FX8H79VVjfzinewO"
Content-Disposition: inline

--FX8H79VVjfzinewO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2014 at 05:31:16PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> - add status command
> - remove the unsupported option:
>   rsyslogd: error: option -c is no longer supported - ignored
> - add --oknodo for do_start

Merged, thanks!

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/rsyslog/rsyslog/initscript    |   35 ++++++++++++++=
++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript b/meta-o=
e/recipes-extended/rsyslog/rsyslog/initscript
> index 8dee684..4121434 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> @@ -9,7 +9,8 @@ PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
>  NAME=3Drsyslog
>  RSYSLOGD=3Drsyslogd
>  RSYSLOGD_BIN=3D/usr/sbin/rsyslogd
> -RSYSLOGD_OPTIONS=3D"-c5"
> +# with rsyslog 7, -c is no longer supported
> +RSYSLOGD_OPTIONS=3D""
>  RSYSLOGD_PIDFILE=3D/var/run/rsyslogd.pid
>  SCRIPTNAME=3D/etc/init.d/$NAME
>  # Exit if the package is not installed
> @@ -27,7 +28,10 @@ do_start()
>          # Return
>          #   0 if daemon has been started
>          #   1 if daemon could not be started
> -        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON -=
- $DAEMON_ARGS || return 1
> +        #   if daemon had already been started, start-stop-daemon will r=
eturn 1
> +        #   so add -o/--oknodo(if nothing is done, exit 0)
> +        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON \
> +                             --oknodo -- $DAEMON_ARGS || return 1
>  }
>  #
>  # Function that stops the daemon/service
> @@ -56,6 +60,20 @@ do_reload() {
>          start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --n=
ame $NAME
>          return 0
>  }
> +
> +do_status() {
> +        NAME=3D$1
> +        PIDFILE=3D$2
> +        # -t: test only but not stop
> +        start-stop-daemon -K -t --quiet --pidfile $PIDFILE --name $NAME
> +        # exit with status 0 if process is found
> +        if [ "$?" =3D "0" ]; then
> +                return 0
> +        else
> +                return 1
> +        fi
> +}
> +
>  case "$1" in
>    start)
>          echo -n "starting $RSYSLOGD ... "
> @@ -82,8 +100,19 @@ case "$1" in
>          $0 stop
>          $0 start
>          ;;
> +  status)
> +        echo -n "status $RSYSLOGD ... "
> +        do_status "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
> +        if [ "$?" =3D "0" ]; then
> +                echo "running"
> +                exit 0       =20
> +        else
> +                echo "stopped"
> +                exit 1       =20
> +        fi
> +        ;;
>    *)
> -        echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload=
}" >&2
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|reload|force=
-reload}" >&2
>          exit 3
>          ;;
>  esac
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FX8H79VVjfzinewO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT1jUACgkQN1Ujt2V2gBzx1QCbByS2L9tBhvC2+wSWaPVOdtft
pz4AoI3ux+d17S7QRyO54yys0hh29g4M
=yAww
-----END PGP SIGNATURE-----

--FX8H79VVjfzinewO--
