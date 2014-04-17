Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B801865E6A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:51:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3H1pxte020825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 18:51:59 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 16 Apr 2014 18:51:59 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] rsyslog: add status command and minor
	fixes for initscript
Thread-Index: AQHPWVjAoXqHErkgX0CU43wIbxwDwpsVC70w
Date: Thu, 17 Apr 2014 01:51:58 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BE8B48@ALA-MBA.corp.ad.wrs.com>
References: <1397640676-27955-1-git-send-email-jackie.huang@windriver.com>
	<534E515D.5090702@communistcode.co.uk>
In-Reply-To: <534E515D.5090702@communistcode.co.uk>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 17 Apr 2014 01:51:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
> Sent: Wednesday, April 16, 2014 5:46 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] rsyslog: add status command and minor =
fixes for initscript
>=20
> On 16/04/14 10:31, jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > - add status command
> > - remove the unsupported option:
> >   rsyslogd: error: option -c is no longer supported - ignored
> > - add --oknodo for do_start
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../recipes-extended/rsyslog/rsyslog/initscript    |   35 ++++++++++++=
++++++--
> >  1 file changed, 32 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> > b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> > index 8dee684..4121434 100644
> > --- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> > +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> > @@ -9,7 +9,8 @@ PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> >  NAME=3Drsyslog
> >  RSYSLOGD=3Drsyslogd
> >  RSYSLOGD_BIN=3D/usr/sbin/rsyslogd
> > -RSYSLOGD_OPTIONS=3D"-c5"
> > +# with rsyslog 7, -c is no longer supported RSYSLOGD_OPTIONS=3D""
> >  RSYSLOGD_PIDFILE=3D/var/run/rsyslogd.pid
> >  SCRIPTNAME=3D/etc/init.d/$NAME
> >  # Exit if the package is not installed @@ -27,7 +28,10 @@ do_start()
> >          # Return
> >          #   0 if daemon has been started
> >          #   1 if daemon could not be started
> > -        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON=
 -- $DAEMON_ARGS || return
> 1
> > +        #   if daemon had already been started, start-stop-daemon will=
 return 1
> > +        #   so add -o/--oknodo(if nothing is done, exit 0)
> > +        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON=
 \
> > +                             --oknodo -- $DAEMON_ARGS || return 1
> >  }
> >  #
> >  # Function that stops the daemon/service @@ -56,6 +60,20 @@
> > do_reload() {
> >          start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE -=
-name $NAME
> >          return 0
> >  }
> > +
> > +do_status() {
> > +        NAME=3D$1
> > +        PIDFILE=3D$2
> > +        # -t: test only but not stop
> > +        start-stop-daemon -K -t --quiet --pidfile $PIDFILE --name $NAM=
E
> > +        # exit with status 0 if process is found
> > +        if [ "$?" =3D "0" ]; then
> > +                return 0
> > +        else
> > +                return 1
> > +        fi
> > +}
> > +
> >  case "$1" in
> >    start)
> >          echo -n "starting $RSYSLOGD ... "
> > @@ -82,8 +100,19 @@ case "$1" in
> >          $0 stop
> >          $0 start
> >          ;;
> > +  status)
> > +        echo -n "status $RSYSLOGD ... "
> > +        do_status "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
> > +        if [ "$?" =3D "0" ]; then
> > +                echo "running"
> > +                exit 0
> > +        else
> > +                echo "stopped"
> > +                exit 1
> > +        fi
> > +        ;;
> >    *)
> > -        echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-relo=
ad}" >&2
> > +        echo "Usage: $SCRIPTNAME
> > + {start|stop|status|restart|reload|force-reload}" >&2
> >          exit 3
> >          ;;
> >  esac
> >
>=20
>=20
> Hi Jackie,
>=20
> I have a patch pending that fixes the rsyslog unsupported option. I don't=
 know if you want to take that
> and re-spin a v2 otherwise the patch will probably fail to apply.

Sorry I didn't notice that, I will take that and re-spin a v2.

Thanks,
Jackie

>=20
> Cheers,
>=20
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambridgeshire, UK
>   http://www.embed.me.uk
> --
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

