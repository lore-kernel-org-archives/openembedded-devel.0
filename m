Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.5015.1610523718698586799
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 23:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
X-Originating-IP: 88.162.151.131
Received: from [192.168.1.67] (unknown [88.162.151.131])
	(Authenticated sender: thomas.perrot@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DA434E0011;
	Wed, 13 Jan 2021 07:41:55 +0000 (UTC)
Message-ID: <1848ce044b32e29c15ff31f6178d3bf10cc5b140.camel@bootlin.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: add new recipe
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2021 08:41:55 +0100
In-Reply-To: <CAMKF1srZiPJgs7bdhejPnLi_zXUtV4ajEnaGpa5vASQD5rUtFg@mail.gmail.com>
References: <20210111155249.2557435-1-thomas.perrot@bootlin.com>
	 <CAMKF1squ9PC1Xz5F_wnuZKWaDQQesLtaU37iFjN6xt3GcMOLvQ@mail.gmail.com>
	 <CAMKF1sp7mn92x2GMNVJDRmt-cyFmcL1Fk4UvCNR_OKKiR2HGfw@mail.gmail.com>
	 <a39a3a32426e4eb6321f71c5c2e864d14be57d4a.camel@bootlin.com>
	 <CAMKF1srZiPJgs7bdhejPnLi_zXUtV4ajEnaGpa5vASQD5rUtFg@mail.gmail.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-Groupsio-MsgNum: 88736
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-XyOgl4kMkq5DqajaSlyg"

--=-XyOgl4kMkq5DqajaSlyg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Tue, 2021-01-12 at 00:53 -0800, Khem Raj wrote:
> Just test it in your environment and see if it does not break things.
>=20

I test it in my environment and it does not break anything.

Best regards,
Thomas

> On Tue, Jan 12, 2021 at 12:50 AM Thomas Perrot
> <thomas.perrot@bootlin.com> wrote:
> >=20
> > Hello Khem,
> >=20
> > On Mon, 2021-01-11 at 14:01 -0800, Khem Raj wrote:
> > > also see
> > > https://github.com/pkg/term/issues/49
> > >=20
> > Thanks, I saw you submitted a patch fixing this build issue. Do you
> > need me to have a hand in on another point?
> >=20
> > Best regards,
> > Thomas
> >=20
> > > On Mon, Jan 11, 2021 at 1:55 PM Khem Raj <raj.khem@gmail.com>
> > > wrote:
> > > >=20
> > > > Hi Thomas
> > > >=20
> > > > This fails on mips see
> > > > https://errors.yoctoproject.org/Errors/Details/540902/
> > > >=20
> > > > # github.com/pkg/term/termios
> > > > ../../../../pkg/mod/github.com/pkg/term@v0.0.0-20180730021639-bffc=
007b7fd5
> > > > /termios/termios_linux.go:78:61:
> > > > attr.Ispeed undefined (type *syscall.Termios has no field or
> > > > method
> > > > Ispeed)
> > > > ../../../../pkg/mod/github.com/pkg/term@v0.0.0-20180730021639-bffc=
007b7fd5
> > > > /termios/termios_linux.go:81:61:
> > > > attr.Ospeed undefined (type *syscall.Termios has no field or
> > > > method
> > > > Ospeed)
> > > >=20
> > > > I think these perhaps can be fixed in term package maybe just
> > > > comment them out.
> > > >=20
> > > > Thanks
> > > > -Khem
> > > >=20
> > > >=20
> > > > On Mon, Jan 11, 2021 at 7:53 AM Thomas Perrot <
> > > > thomas.perrot@bootlin.com> wrote:
> > > > >=20
> > > > > InfluxDB is a time series database designed to handle high
> > > > > write
> > > > > and query
> > > > > loads.
> > > > >=20
> > > > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > > ---
> > > > > =C2=A0.../recipes-dbs/influxdb/influxdb/influxdb=C2=A0=C2=A0=C2=
=A0 | 235 +++++++
> > > > > =C2=A0.../influxdb/influxdb/influxdb.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 586
> > > > > ++++++++++++++++++
> > > > > =C2=A0.../recipes-dbs/influxdb/influxdb_1.7.10.bb=C2=A0=C2=A0 |=
=C2=A0 63 ++
> > > > > =C2=A03 files changed, 884 insertions(+)
> > > > > =C2=A0create mode 100755 meta-oe/recipes-
> > > > > dbs/influxdb/influxdb/influxdb
> > > > > =C2=A0create mode 100644 meta-oe/recipes-
> > > > > dbs/influxdb/influxdb/influxdb.conf
> > > > > =C2=A0create mode 100644 meta-oe/recipes-
> > > > > dbs/influxdb/influxdb_1.7.10.bb
> > > > >=20
> > > > > diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/influxdb
> > > > > b/meta-oe/recipes-dbs/influxdb/influxdb/influxdb
> > > > > new file mode 100755
> > > > > index 000000000..ffb29c3ae
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-dbs/influxdb/influxdb/influxdb
> > > > > @@ -0,0 +1,235 @@
> > > > > +#!/bin/bash
> > > > > +### BEGIN INIT INFO
> > > > > +# Provides:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 influxd
> > > > > +# Required-Start:=C2=A0=C2=A0=C2=A0 $all
> > > > > +# Required-Stop:=C2=A0=C2=A0=C2=A0=C2=A0 $remote_fs $syslog
> > > > > +# Default-Start:=C2=A0=C2=A0=C2=A0=C2=A0 2 3 4 5
> > > > > +# Default-Stop:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 1 6
> > > > > +# Short-Description: Start the InfluxDB process
> > > > > +### END INIT INFO
> > > > > +set -x
> > > > > +# If you modify this, please make sure to also edit
> > > > > influxdb.service
> > > > > +
> > > > > +# Command-line options that can be set in
> > > > > /etc/default/influxdb.=C2=A0 These will override
> > > > > +# any config file values.
> > > > > +DEFAULT=3D/etc/default/influxdb
> > > > > +
> > > > > +# Daemon options
> > > > > +INFLUXD_OPTS=3D
> > > > > +
> > > > > +# Process name ( For display )
> > > > > +NAME=3Dinfluxdb
> > > > > +
> > > > > +# User and group
> > > > > +USER=3Dinfluxdb
> > > > > +GROUP=3Dinfluxdb
> > > > > +
> > > > > +# Check for sudo or root privileges before continuing
> > > > > +if [ "$UID" !=3D "0" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 echo "You must be root to run this script"
> > > > > +=C2=A0=C2=A0=C2=A0 exit 1
> > > > > +fi
> > > > > +
> > > > > +# Daemon name, where is the actual executable If the daemon
> > > > > is
> > > > > not
> > > > > +# there, then exit.
> > > > > +DAEMON=3D/usr/bin/influxd
> > > > > +if [ ! -x $DAEMON ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 echo "Executable $DAEMON does not exist!"
> > > > > +=C2=A0=C2=A0=C2=A0 exit 5
> > > > > +fi
> > > > > +
> > > > > +# Configuration file
> > > > > +CONFIG=3D/etc/influxdb/influxdb.conf
> > > > > +
> > > > > +# PID file for the daemon
> > > > > +PIDFILE=3D/var/run/influxdb/influxd.pid
> > > > > +PIDDIR=3D`dirname $PIDFILE`
> > > > > +if [ ! -d "$PIDDIR" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 mkdir -p $PIDDIR
> > > > > +=C2=A0=C2=A0=C2=A0 chown $USER:$GROUP $PIDDIR
> > > > > +fi
> > > > > +
> > > > > +# Max open files
> > > > > +OPEN_FILE_LIMIT=3D65536
> > > > > +
> > > > > +if [ -r /lib/lsb/init-functions ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 source /lib/lsb/init-functions
> > > > > +fi
> > > > > +
> > > > > +# Logging
> > > > > +if [ -z "$STDOUT" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 STDOUT=3D/var/log/influxdb/influxd.log
> > > > > +fi
> > > > > +
> > > > > +if [ ! -f "$STDOUT" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 mkdir -p $(dirname $STDOUT)
> > > > > +fi
> > > > > +
> > > > > +if [ -z "$STDERR" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 STDERR=3D/var/log/influxdb/influxd.log
> > > > > +fi
> > > > > +
> > > > > +if [ ! -f "$STDERR" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 mkdir -p $(dirname $STDERR)
> > > > > +fi
> > > > > +
> > > > > +# Override init script variables with DEFAULT values
> > > > > +if [ -r $DEFAULT ]; then
> > > > > +=C2=A0=C2=A0=C2=A0 source $DEFAULT
> > > > > +fi
> > > > > +
> > > > > +function log_failure_msg() {
> > > > > +=C2=A0=C2=A0=C2=A0 echo "$@" "[ FAILED ]"
> > > > > +}
> > > > > +
> > > > > +function log_success_msg() {
> > > > > +=C2=A0=C2=A0=C2=A0 echo "$@" "[ OK ]"
> > > > > +}
> > > > > +
> > > > > +function start() {
> > > > > +=C2=A0=C2=A0=C2=A0 # Check if config file exist
> > > > > +=C2=A0=C2=A0=C2=A0 if [ ! -r $CONFIG ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_failure_msg "con=
fig file $CONFIG doesn't exist
> > > > > (or
> > > > > you don't have permission to view)"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 4
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 # Check that the PID file exists, and check =
the actual
> > > > > status of process
> > > > > +=C2=A0=C2=A0=C2=A0 if [ -f $PIDFILE ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PID=3D"$(cat $PIDFIL=
E)"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if kill -0 "$PID" &>=
/dev/null; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 # Process is already up
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 log_success_msg "$NAME process is already
> > > > > running"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 return 0
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 su -s /bin/sh -c "to=
uch $PIDFILE" $USER &>/dev/null
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $? -ne 0 ]; the=
n
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 log_failure_msg "$PIDFILE not writable, check
> > > > > permissions"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 exit 5
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 # Bump the file limits, before launching the=
 daemon.
> > > > > These
> > > > > will
> > > > > +=C2=A0=C2=A0=C2=A0 # carry over to launched processes.
> > > > > +=C2=A0=C2=A0=C2=A0 ulimit -n $OPEN_FILE_LIMIT
> > > > > +=C2=A0=C2=A0=C2=A0 if [ $? -ne 0 ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_failure_msg "Una=
ble to set ulimit to
> > > > > $OPEN_FILE_LIMIT"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 # Launch process
> > > > > +=C2=A0=C2=A0=C2=A0 echo "Starting $NAME..."
> > > > > +=C2=A0=C2=A0=C2=A0 if command -v start-stop-daemon &>/dev/null;=
 then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start-stop-daemon \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --background \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --chuid $USER:$GROUP \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --start \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --quiet \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --pidfile $PIDFILE \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 --exec $DAEMON \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 -- \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 -config $CONFIG \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 $INFLUXD_OPTS >>$STDOUT 2>>$STDERR
> > > > > +=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local CMD=3D"$DAEMON=
 -config $CONFIG $INFLUXD_OPTS
> > > > > > > $STDOUT 2>>$STDERR &"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 su -s /bin/sh -c "$C=
MD" $USER
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 # Sleep to verify process is still up
> > > > > +=C2=A0=C2=A0=C2=A0 sleep 1
> > > > > +=C2=A0=C2=A0=C2=A0 echo $(pidof influxd) > $PIDFILE
> > > > > +=C2=A0=C2=A0=C2=A0 if [ -f $PIDFILE ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # PIDFILE exists
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PID=3D"$(cat $PIDFIL=
E)"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if kill -0 "$PID" &>=
/dev/null; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 # PID up, service running
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 log_success_msg "$NAME process was started"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 return 0
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 log_failure_msg "$NAME process was unable to=
 start"
> > > > > +=C2=A0=C2=A0=C2=A0 exit 1
> > > > > +}
> > > > > +
> > > > > +function stop() {
> > > > > +=C2=A0=C2=A0=C2=A0 # Stop the daemon.
> > > > > +=C2=A0=C2=A0=C2=A0 if [ -f $PIDFILE ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local PID=3D"$(cat $=
PIDFILE)"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if kill -0 $PID &>/d=
ev/null; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 echo "Stopping $NAME..."
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 # Process still up, send SIGTERM and remove
> > > > > PIDFILE
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 kill -s TERM $PID &>/dev/null && rm -f
> > > > > "$PIDFILE"
> > > > > &>/dev/null
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 n=3D0
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 while true; do
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Enter loop to ensure process is stopped
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 kill -0 $PID &>/dev/null
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$?" !=3D "0" ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Process stopped, bre=
ak from loop
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_success_msg "$NAME=
 process was
> > > > > stopped"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Process still up after signal, sleep and
> > > > > wait
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep 1
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 n=3D$(expr $n + 1)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $n -eq 30 ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # After 30 seconds, se=
nd SIGKILL
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Timeout exceeded=
, sending
> > > > > SIGKILL..."
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kill -s KILL $PID &>/d=
ev/null
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [ $? -eq 40 ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # After 40 seconds, er=
ror out
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_failure_msg "could=
 not stop $NAME
> > > > > process"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 1
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 done
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 log_success_msg "$NAME process already stopp=
ed"
> > > > > +}
> > > > > +
> > > > > +function restart() {
> > > > > +=C2=A0=C2=A0=C2=A0 # Restart the daemon.
> > > > > +=C2=A0=C2=A0=C2=A0 stop
> > > > > +=C2=A0=C2=A0=C2=A0 start
> > > > > +}
> > > > > +
> > > > > +function status() {
> > > > > +=C2=A0=C2=A0=C2=A0 # Check the status of the process.
> > > > > +=C2=A0=C2=A0=C2=A0 if [ -f $PIDFILE ]; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PID=3D"$(cat $PIDFIL=
E)"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if kill -0 $PID &>/d=
ev/null; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 log_success_msg "$NAME process is running"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0 exit 0
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +=C2=A0=C2=A0=C2=A0 log_failure_msg "$NAME process is not runnin=
g"
> > > > > +=C2=A0=C2=A0=C2=A0 exit 1
> > > > > +}
> > > > > +
> > > > > +case $1 in
> > > > > +=C2=A0=C2=A0=C2=A0 start)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 stop)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stop
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 restart)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 restart
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 status)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 version)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $DAEMON version
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 *)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # For invalid argume=
nts, print the usage message.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "Usage: $0 {sta=
rt|stop|restart|status|version}"
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 2
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
> > > > > +esac
> > > > > diff --git a/meta-oe/recipes-
> > > > > dbs/influxdb/influxdb/influxdb.conf
> > > > > b/meta-oe/recipes-dbs/influxdb/influxdb/influxdb.conf
> > > > > new file mode 100644
> > > > > index 000000000..21c0926f2
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-dbs/influxdb/influxdb/influxdb.conf
> > > > > @@ -0,0 +1,586 @@
> > > > > +### Welcome to the InfluxDB configuration file.
> > > > > +
> > > > > +# The values in this file override the default values used
> > > > > by
> > > > > the system if
> > > > > +# a config option is not specified. The commented out lines
> > > > > are
> > > > > the configuration
> > > > > +# field and the default value used. Uncommenting a line and
> > > > > changing the value
> > > > > +# will change the value used at runtime when the process is
> > > > > restarted.
> > > > > +
> > > > > +# Once every 24 hours InfluxDB will report usage data to
> > > > > usage.influxdata.com
> > > > > +# The data includes a random ID, os, arch, version, the
> > > > > number
> > > > > of series and other
> > > > > +# usage data. No data from user databases is ever
> > > > > transmitted.
> > > > > +# Change this option to true to disable reporting.
> > > > > +# reporting-disabled =3D false
> > > > > +
> > > > > +# Bind address to use for the RPC service for backup and
> > > > > restore.
> > > > > +# bind-address =3D "127.0.0.1:8088"
> > > > > +
> > > > > +###
> > > > > +### [meta]
> > > > > +###
> > > > > +### Controls the parameters for the Raft consensus group
> > > > > that
> > > > > stores metadata
> > > > > +### about the InfluxDB cluster.
> > > > > +###
> > > > > +
> > > > > +[meta]
> > > > > +=C2=A0 # Where the metadata/raft database is stored
> > > > > +=C2=A0 dir =3D "/var/lib/influxdb/meta"
> > > > > +
> > > > > +=C2=A0 # Automatically create a default retention policy when
> > > > > creating a database.
> > > > > +=C2=A0 # retention-autocreate =3D true
> > > > > +
> > > > > +=C2=A0 # If log messages are printed for the meta service
> > > > > +=C2=A0 # logging-enabled =3D true
> > > > > +
> > > > > +###
> > > > > +### [data]
> > > > > +###
> > > > > +### Controls where the actual shard data for InfluxDB lives
> > > > > and
> > > > > how it is
> > > > > +### flushed from the WAL. "dir" may need to be changed to a
> > > > > suitable place
> > > > > +### for your system, but the WAL settings are an advanced
> > > > > configuration. The
> > > > > +### defaults should work for most systems.
> > > > > +###
> > > > > +
> > > > > +[data]
> > > > > +=C2=A0 # The directory where the TSM storage engine stores TSM
> > > > > files.
> > > > > +=C2=A0 dir =3D "/var/lib/influxdb/data"
> > > > > +
> > > > > +=C2=A0 # The directory where the TSM storage engine stores WAL
> > > > > files.
> > > > > +=C2=A0 wal-dir =3D "/var/lib/influxdb/wal"
> > > > > +
> > > > > +=C2=A0 # The amount of time that a write will wait before
> > > > > fsyncing.
> > > > > A duration
> > > > > +=C2=A0 # greater than 0 can be used to batch up multiple fsync
> > > > > calls.=C2=A0 This is useful for slower
> > > > > +=C2=A0 # disks or when WAL write contention is seen.=C2=A0 A va=
lue of
> > > > > 0s
> > > > > fsyncs every write to the WAL.
> > > > > +=C2=A0 # Values in the range of 0-100ms are recommended for non=
-
> > > > > SSD
> > > > > disks.
> > > > > +=C2=A0 # wal-fsync-delay =3D "0s"
> > > > > +
> > > > > +
> > > > > +=C2=A0 # The type of shard index to use for new shards.=C2=A0 T=
he
> > > > > default
> > > > > is an in-memory index that is
> > > > > +=C2=A0 # recreated at startup.=C2=A0 A value of "tsi1" will use=
 a disk
> > > > > based index that supports higher
> > > > > +=C2=A0 # cardinality datasets.
> > > > > +=C2=A0 # index-version =3D "inmem"
> > > > > +
> > > > > +=C2=A0 # Trace logging provides more verbose output around the
> > > > > tsm
> > > > > engine. Turning
> > > > > +=C2=A0 # this on can provide more useful output for debugging t=
sm
> > > > > engine issues.
> > > > > +=C2=A0 # trace-logging-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # Whether queries should be logged before execution. Ver=
y
> > > > > useful for troubleshooting, but will
> > > > > +=C2=A0 # log any sensitive data contained within a query.
> > > > > +=C2=A0 # query-log-enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Validates incoming writes to ensure keys only have val=
id
> > > > > unicode characters.
> > > > > +=C2=A0 # This setting will incur a small overhead because every
> > > > > key
> > > > > must be checked.
> > > > > +=C2=A0 # validate-keys =3D false
> > > > > +
> > > > > +=C2=A0 # Settings for the TSM engine
> > > > > +
> > > > > +=C2=A0 # CacheMaxMemorySize is the maximum size a shard's cache
> > > > > can
> > > > > +=C2=A0 # reach before it starts rejecting writes.
> > > > > +=C2=A0 # Valid size suffixes are k, m, or g (case insensitive,
> > > > > 1024 =3D
> > > > > 1k).
> > > > > +=C2=A0 # Values without a size suffix are in bytes.
> > > > > +=C2=A0 # cache-max-memory-size =3D "1g"
> > > > > +
> > > > > +=C2=A0 # CacheSnapshotMemorySize is the size at which the engin=
e
> > > > > will
> > > > > +=C2=A0 # snapshot the cache and write it to a TSM file, freeing
> > > > > up
> > > > > memory
> > > > > +=C2=A0 # Valid size suffixes are k, m, or g (case insensitive,
> > > > > 1024 =3D
> > > > > 1k).
> > > > > +=C2=A0 # Values without a size suffix are in bytes.
> > > > > +=C2=A0 # cache-snapshot-memory-size =3D "25m"
> > > > > +
> > > > > +=C2=A0 # CacheSnapshotWriteColdDuration is the length of time a=
t
> > > > > +=C2=A0 # which the engine will snapshot the cache and write it =
to
> > > > > +=C2=A0 # a new TSM file if the shard hasn't received writes or
> > > > > deletes
> > > > > +=C2=A0 # cache-snapshot-write-cold-duration =3D "10m"
> > > > > +
> > > > > +=C2=A0 # CompactFullWriteColdDuration is the duration at which
> > > > > the
> > > > > engine
> > > > > +=C2=A0 # will compact all TSM files in a shard if it hasn't
> > > > > received
> > > > > a
> > > > > +=C2=A0 # write or delete
> > > > > +=C2=A0 # compact-full-write-cold-duration =3D "4h"
> > > > > +
> > > > > +=C2=A0 # The maximum number of concurrent full and level
> > > > > compactions
> > > > > that can run at one time.=C2=A0 A
> > > > > +=C2=A0 # value of 0 results in 50% of runtime.GOMAXPROCS(0) use=
d
> > > > > at
> > > > > runtime.=C2=A0 Any number greater
> > > > > +=C2=A0 # than 0 limits compactions to that value.=C2=A0 This se=
tting
> > > > > does
> > > > > not apply
> > > > > +=C2=A0 # to cache snapshotting.
> > > > > +=C2=A0 # max-concurrent-compactions =3D 0
> > > > > +
> > > > > +=C2=A0 # CompactThroughput is the rate limit in bytes per secon=
d
> > > > > that
> > > > > we
> > > > > +=C2=A0 # will allow TSM compactions to write to disk. Note that
> > > > > short
> > > > > bursts are allowed
> > > > > +=C2=A0 # to happen at a possibly larger value, set by
> > > > > CompactThroughputBurst
> > > > > +=C2=A0 # compact-throughput =3D "48m"
> > > > > +
> > > > > +=C2=A0 # CompactThroughputBurst is the rate limit in bytes per
> > > > > second
> > > > > that we
> > > > > +=C2=A0 # will allow TSM compactions to write to disk.
> > > > > +=C2=A0 # compact-throughput-burst =3D "48m"
> > > > > +
> > > > > +=C2=A0 # If true, then the mmap advise value MADV_WILLNEED will
> > > > > be
> > > > > provided to the kernel with respect to
> > > > > +=C2=A0 # TSM files. This setting has been found to be problemat=
ic
> > > > > on
> > > > > some kernels, and defaults to off.
> > > > > +=C2=A0 # It might help users who have slow disks in some cases.
> > > > > +=C2=A0 # tsm-use-madv-willneed =3D false
> > > > > +
> > > > > +=C2=A0 # Settings for the inmem index
> > > > > +
> > > > > +=C2=A0 # The maximum series allowed per database before writes
> > > > > are
> > > > > dropped.=C2=A0 This limit can prevent
> > > > > +=C2=A0 # high cardinality issues at the database level.=C2=A0 T=
his
> > > > > limit
> > > > > can be disabled by setting it to
> > > > > +=C2=A0 # 0.
> > > > > +=C2=A0 # max-series-per-database =3D 1000000
> > > > > +
> > > > > +=C2=A0 # The maximum number of tag values per tag that are
> > > > > allowed
> > > > > before writes are dropped.=C2=A0 This limit
> > > > > +=C2=A0 # can prevent high cardinality tag values from being
> > > > > written
> > > > > to a measurement.=C2=A0 This limit can be
> > > > > +=C2=A0 # disabled by setting it to 0.
> > > > > +=C2=A0 # max-values-per-tag =3D 100000
> > > > > +
> > > > > +=C2=A0 # Settings for the tsi1 index
> > > > > +
> > > > > +=C2=A0 # The threshold, in bytes, when an index write-ahead log
> > > > > file
> > > > > will compact
> > > > > +=C2=A0 # into an index file. Lower sizes will cause log files t=
o
> > > > > be
> > > > > compacted more
> > > > > +=C2=A0 # quickly and result in lower heap usage at the expense =
of
> > > > > write throughput.
> > > > > +=C2=A0 # Higher sizes will be compacted less frequently, store
> > > > > more
> > > > > series in-memory,
> > > > > +=C2=A0 # and provide higher write throughput.
> > > > > +=C2=A0 # Valid size suffixes are k, m, or g (case insensitive,
> > > > > 1024 =3D
> > > > > 1k).
> > > > > +=C2=A0 # Values without a size suffix are in bytes.
> > > > > +=C2=A0 # max-index-log-file-size =3D "1m"
> > > > > +
> > > > > +=C2=A0 # The size of the internal cache used in the TSI index t=
o
> > > > > store previously
> > > > > +=C2=A0 # calculated series results. Cached results will be
> > > > > returned
> > > > > quickly from the cache rather
> > > > > +=C2=A0 # than needing to be recalculated when a subsequent quer=
y
> > > > > with
> > > > > a matching tag key/value
> > > > > +=C2=A0 # predicate is executed. Setting this value to 0 will
> > > > > disable
> > > > > the cache, which may
> > > > > +=C2=A0 # lead to query performance issues.
> > > > > +=C2=A0 # This value should only be increased if it is known tha=
t
> > > > > the
> > > > > set of regularly used
> > > > > +=C2=A0 # tag key/value predicates across all measurements for a
> > > > > database is larger than 100. An
> > > > > +=C2=A0 # increase in cache size may lead to an increase in heap
> > > > > usage.
> > > > > +=C2=A0 series-id-set-cache-size =3D 100
> > > > > +
> > > > > +###
> > > > > +### [coordinator]
> > > > > +###
> > > > > +### Controls the clustering service configuration.
> > > > > +###
> > > > > +
> > > > > +[coordinator]
> > > > > +=C2=A0 # The default time a write request will wait until a
> > > > > "timeout"
> > > > > error is returned to the caller.
> > > > > +=C2=A0 # write-timeout =3D "10s"
> > > > > +
> > > > > +=C2=A0 # The maximum number of concurrent queries allowed to be
> > > > > executing at one time.=C2=A0 If a query is
> > > > > +=C2=A0 # executed and exceeds this limit, an error is returned =
to
> > > > > the
> > > > > caller.=C2=A0 This limit can be disabled
> > > > > +=C2=A0 # by setting it to 0.
> > > > > +=C2=A0 # max-concurrent-queries =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum time a query will is allowed to execute
> > > > > before
> > > > > being killed by the system.=C2=A0 This limit
> > > > > +=C2=A0 # can help prevent run away queries.=C2=A0 Setting the v=
alue to
> > > > > 0
> > > > > disables the limit.
> > > > > +=C2=A0 # query-timeout =3D "0s"
> > > > > +
> > > > > +=C2=A0 # The time threshold when a query will be logged as a sl=
ow
> > > > > query.=C2=A0 This limit can be set to help
> > > > > +=C2=A0 # discover slow or resource intensive queries.=C2=A0 Set=
ting
> > > > > the
> > > > > value to 0 disables the slow query logging.
> > > > > +=C2=A0 # log-queries-after =3D "0s"
> > > > > +
> > > > > +=C2=A0 # The maximum number of points a SELECT can process.=C2=
=A0 A
> > > > > value
> > > > > of 0 will make
> > > > > +=C2=A0 # the maximum point count unlimited.=C2=A0 This will onl=
y be
> > > > > checked every second so queries will not
> > > > > +=C2=A0 # be aborted immediately when hitting the limit.
> > > > > +=C2=A0 # max-select-point =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum number of series a SELECT can run.=C2=A0 A=
 value
> > > > > of 0
> > > > > will make the maximum series
> > > > > +=C2=A0 # count unlimited.
> > > > > +=C2=A0 # max-select-series =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum number of group by time bucket a SELECT ca=
n
> > > > > create.=C2=A0 A value of zero will max the maximum
> > > > > +=C2=A0 # number of buckets unlimited.
> > > > > +=C2=A0 # max-select-buckets =3D 0
> > > > > +
> > > > > +###
> > > > > +### [retention]
> > > > > +###
> > > > > +### Controls the enforcement of retention policies for
> > > > > evicting
> > > > > old data.
> > > > > +###
> > > > > +
> > > > > +[retention]
> > > > > +=C2=A0 # Determines whether retention policy enforcement enable=
d.
> > > > > +=C2=A0 # enabled =3D true
> > > > > +
> > > > > +=C2=A0 # The interval of time when retention policy enforcement
> > > > > checks run.
> > > > > +=C2=A0 # check-interval =3D "30m"
> > > > > +
> > > > > +###
> > > > > +### [shard-precreation]
> > > > > +###
> > > > > +### Controls the precreation of shards, so they are
> > > > > available
> > > > > before data arrives.
> > > > > +### Only shards that, after creation, will have both a
> > > > > start-
> > > > > and end-time in the
> > > > > +### future, will ever be created. Shards are never
> > > > > precreated
> > > > > that would be wholly
> > > > > +### or partially in the past.
> > > > > +
> > > > > +[shard-precreation]
> > > > > +=C2=A0 # Determines whether shard pre-creation service is
> > > > > enabled.
> > > > > +=C2=A0 # enabled =3D true
> > > > > +
> > > > > +=C2=A0 # The interval of time when the check to pre-create new
> > > > > shards
> > > > > runs.
> > > > > +=C2=A0 # check-interval =3D "10m"
> > > > > +
> > > > > +=C2=A0 # The default period ahead of the endtime of a shard gro=
up
> > > > > that its successor
> > > > > +=C2=A0 # group is created.
> > > > > +=C2=A0 # advance-period =3D "30m"
> > > > > +
> > > > > +###
> > > > > +### Controls the system self-monitoring, statistics and
> > > > > diagnostics.
> > > > > +###
> > > > > +### The internal database for monitoring data is created
> > > > > automatically if
> > > > > +### if it does not already exist. The target retention
> > > > > within
> > > > > this database
> > > > > +### is called 'monitor' and is also created with a retention
> > > > > period of 7 days
> > > > > +### and a replication factor of 1, if it does not exist. In
> > > > > all
> > > > > cases the
> > > > > +### this retention policy is configured as the default for
> > > > > the
> > > > > database.
> > > > > +
> > > > > +[monitor]
> > > > > +=C2=A0 # Whether to record statistics internally.
> > > > > +=C2=A0 # store-enabled =3D true
> > > > > +
> > > > > +=C2=A0 # The destination database for recorded statistics
> > > > > +=C2=A0 # store-database =3D "_internal"
> > > > > +
> > > > > +=C2=A0 # The interval at which to record statistics
> > > > > +=C2=A0 # store-interval =3D "10s"
> > > > > +
> > > > > +###
> > > > > +### [http]
> > > > > +###
> > > > > +### Controls how the HTTP endpoints are configured. These
> > > > > are
> > > > > the primary
> > > > > +### mechanism for getting data into and out of InfluxDB.
> > > > > +###
> > > > > +
> > > > > +[http]
> > > > > +=C2=A0 # Determines whether HTTP endpoint is enabled.
> > > > > +=C2=A0 # enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Determines whether the Flux query endpoint is enabled.
> > > > > +=C2=A0 # flux-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # Determines whether the Flux query logging is enabled.
> > > > > +=C2=A0 # flux-log-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # The bind address used by the HTTP service.
> > > > > +=C2=A0 # bind-address =3D ":8086"
> > > > > +
> > > > > +=C2=A0 # Determines whether user authentication is enabled over
> > > > > HTTP/HTTPS.
> > > > > +=C2=A0 # auth-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # The default realm sent back when issuing a basic auth
> > > > > challenge.
> > > > > +=C2=A0 # realm =3D "InfluxDB"
> > > > > +
> > > > > +=C2=A0 # Determines whether HTTP request logging is enabled.
> > > > > +=C2=A0 # log-enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Determines whether the HTTP write request logs should =
be
> > > > > suppressed when the log is enabled.
> > > > > +=C2=A0 # suppress-write-log =3D false
> > > > > +
> > > > > +=C2=A0 # When HTTP request logging is enabled, this option
> > > > > specifies
> > > > > the path where
> > > > > +=C2=A0 # log entries should be written. If unspecified, the
> > > > > default
> > > > > is to write to stderr, which
> > > > > +=C2=A0 # intermingles HTTP logs with internal InfluxDB logging.
> > > > > +=C2=A0 #
> > > > > +=C2=A0 # If influxd is unable to access the specified path, it
> > > > > will
> > > > > log an error and fall back to writing
> > > > > +=C2=A0 # the request log to stderr.
> > > > > +=C2=A0 # access-log-path =3D ""
> > > > > +
> > > > > +=C2=A0 # Filters which requests should be logged. Each filter i=
s
> > > > > of
> > > > > the pattern NNN, NNX, or NXX where N is
> > > > > +=C2=A0 # a number and X is a wildcard for any number. To filter
> > > > > all
> > > > > 5xx responses, use the string 5xx.
> > > > > +=C2=A0 # If multiple filters are used, then only one has to
> > > > > match.
> > > > > The default is to have no filters which
> > > > > +=C2=A0 # will cause every request to be printed.
> > > > > +=C2=A0 # access-log-status-filters =3D []
> > > > > +
> > > > > +=C2=A0 # Determines whether detailed write logging is enabled.
> > > > > +=C2=A0 # write-tracing =3D false
> > > > > +
> > > > > +=C2=A0 # Determines whether the pprof endpoint is enabled.=C2=
=A0 This
> > > > > endpoint is used for
> > > > > +=C2=A0 # troubleshooting and monitoring.
> > > > > +=C2=A0 # pprof-enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Enables authentication on pprof endpoints. Users will
> > > > > need
> > > > > admin permissions
> > > > > +=C2=A0 # to access the pprof endpoints when this setting is
> > > > > enabled.
> > > > > This setting has
> > > > > +=C2=A0 # no effect if either auth-enabled or pprof-enabled are
> > > > > set to
> > > > > false.
> > > > > +=C2=A0 # pprof-auth-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # Enables a pprof endpoint that binds to localhost:6060
> > > > > immediately on startup.
> > > > > +=C2=A0 # This is only needed to debug startup issues.
> > > > > +=C2=A0 # debug-pprof-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # Enables authentication on the /ping, /metrics, and
> > > > > deprecated /status
> > > > > +=C2=A0 # endpoints. This setting has no effect if auth-enabled =
is
> > > > > set
> > > > > to false.
> > > > > +=C2=A0 # ping-auth-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # Determines whether HTTPS is enabled.
> > > > > +=C2=A0 # https-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # The SSL certificate to use when HTTPS is enabled.
> > > > > +=C2=A0 # https-certificate =3D "/etc/ssl/influxdb.pem"
> > > > > +
> > > > > +=C2=A0 # Use a separate private key location.
> > > > > +=C2=A0 # https-private-key =3D ""
> > > > > +
> > > > > +=C2=A0 # The JWT auth shared secret to validate requests using
> > > > > JSON
> > > > > web tokens.
> > > > > +=C2=A0 # shared-secret =3D ""
> > > > > +
> > > > > +=C2=A0 # The default chunk size for result sets that should be
> > > > > chunked.
> > > > > +=C2=A0 # max-row-limit =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum number of HTTP connections that may be ope=
n
> > > > > at
> > > > > once.=C2=A0 New connections that
> > > > > +=C2=A0 # would exceed this limit are dropped.=C2=A0 Setting thi=
s value
> > > > > to
> > > > > 0 disables the limit.
> > > > > +=C2=A0 # max-connection-limit =3D 0
> > > > > +
> > > > > +=C2=A0 # Enable http service over unix domain socket
> > > > > +=C2=A0 # unix-socket-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # The path of the unix domain socket.
> > > > > +=C2=A0 # bind-socket =3D "/var/run/influxdb.sock"
> > > > > +
> > > > > +=C2=A0 # The maximum size of a client request body, in bytes.
> > > > > Setting
> > > > > this value to 0 disables the limit.
> > > > > +=C2=A0 # max-body-size =3D 25000000
> > > > > +
> > > > > +=C2=A0 # The maximum number of writes processed concurrently.
> > > > > +=C2=A0 # Setting this to 0 disables the limit.
> > > > > +=C2=A0 # max-concurrent-write-limit =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum number of writes queued for processing.
> > > > > +=C2=A0 # Setting this to 0 disables the limit.
> > > > > +=C2=A0 # max-enqueued-write-limit =3D 0
> > > > > +
> > > > > +=C2=A0 # The maximum duration for a write to wait in the queue =
to
> > > > > be
> > > > > processed.
> > > > > +=C2=A0 # Setting this to 0 or setting max-concurrent-write-limi=
t
> > > > > to 0
> > > > > disables the limit.
> > > > > +=C2=A0 # enqueued-write-timeout =3D 0
> > > > > +
> > > > > +###
> > > > > +### [logging]
> > > > > +###
> > > > > +### Controls how the logger emits logs to the output.
> > > > > +###
> > > > > +
> > > > > +[logging]
> > > > > +=C2=A0 # Determines which log encoder to use for logs. Availabl=
e
> > > > > options
> > > > > +=C2=A0 # are auto, logfmt, and json. auto will use a more a mor=
e
> > > > > user-friendly
> > > > > +=C2=A0 # output format if the output terminal is a TTY, but the
> > > > > format is not as
> > > > > +=C2=A0 # easily machine-readable. When the output is a non-TTY,
> > > > > auto
> > > > > will use
> > > > > +=C2=A0 # logfmt.
> > > > > +=C2=A0 # format =3D "auto"
> > > > > +
> > > > > +=C2=A0 # Determines which level of logs will be emitted. The
> > > > > available levels
> > > > > +=C2=A0 # are error, warn, info, and debug. Logs that are equal =
to
> > > > > or
> > > > > above the
> > > > > +=C2=A0 # specified level will be emitted.
> > > > > +=C2=A0 # level =3D "info"
> > > > > +
> > > > > +=C2=A0 # Suppresses the logo output that is printed when the
> > > > > program
> > > > > is started.
> > > > > +=C2=A0 # The logo is always suppressed if STDOUT is not a TTY.
> > > > > +=C2=A0 # suppress-logo =3D false
> > > > > +
> > > > > +###
> > > > > +### [subscriber]
> > > > > +###
> > > > > +### Controls the subscriptions, which can be used to fork a
> > > > > copy
> > > > > of all data
> > > > > +### received by the InfluxDB host.
> > > > > +###
> > > > > +
> > > > > +[subscriber]
> > > > > +=C2=A0 # Determines whether the subscriber service is enabled.
> > > > > +=C2=A0 # enabled =3D true
> > > > > +
> > > > > +=C2=A0 # The default timeout for HTTP writes to subscribers.
> > > > > +=C2=A0 # http-timeout =3D "30s"
> > > > > +
> > > > > +=C2=A0 # Allows insecure HTTPS connections to subscribers.=C2=
=A0 This
> > > > > is
> > > > > useful when testing with self-
> > > > > +=C2=A0 # signed certificates.
> > > > > +=C2=A0 # insecure-skip-verify =3D false
> > > > > +
> > > > > +=C2=A0 # The path to the PEM encoded CA certs file. If the empt=
y
> > > > > string, the default system certs will be used
> > > > > +=C2=A0 # ca-certs =3D ""
> > > > > +
> > > > > +=C2=A0 # The number of writer goroutines processing the write
> > > > > channel.
> > > > > +=C2=A0 # write-concurrency =3D 40
> > > > > +
> > > > > +=C2=A0 # The number of in-flight writes buffered in the write
> > > > > channel.
> > > > > +=C2=A0 # write-buffer-size =3D 1000
> > > > > +
> > > > > +
> > > > > +###
> > > > > +### [[graphite]]
> > > > > +###
> > > > > +### Controls one or many listeners for Graphite data.
> > > > > +###
> > > > > +
> > > > > +[[graphite]]
> > > > > +=C2=A0 # Determines whether the graphite endpoint is enabled.
> > > > > +=C2=A0 # enabled =3D false
> > > > > +=C2=A0 # database =3D "graphite"
> > > > > +=C2=A0 # retention-policy =3D ""
> > > > > +=C2=A0 # bind-address =3D ":2003"
> > > > > +=C2=A0 # protocol =3D "tcp"
> > > > > +=C2=A0 # consistency-level =3D "one"
> > > > > +
> > > > > +=C2=A0 # These next lines control how batching works. You shoul=
d
> > > > > have
> > > > > this enabled
> > > > > +=C2=A0 # otherwise you could get dropped metrics or poor
> > > > > performance.
> > > > > Batching
> > > > > +=C2=A0 # will buffer points in memory if you have many coming i=
n.
> > > > > +
> > > > > +=C2=A0 # Flush if this many points get buffered
> > > > > +=C2=A0 # batch-size =3D 5000
> > > > > +
> > > > > +=C2=A0 # number of batches that may be pending in memory
> > > > > +=C2=A0 # batch-pending =3D 10
> > > > > +
> > > > > +=C2=A0 # Flush at least this often even if we haven't hit buffe=
r
> > > > > limit
> > > > > +=C2=A0 # batch-timeout =3D "1s"
> > > > > +
> > > > > +=C2=A0 # UDP Read buffer size, 0 means OS default. UDP listener
> > > > > will
> > > > > fail if set above OS max.
> > > > > +=C2=A0 # udp-read-buffer =3D 0
> > > > > +
> > > > > +=C2=A0 ### This string joins multiple matching 'measurement'
> > > > > values
> > > > > providing more control over the final measurement name.
> > > > > +=C2=A0 # separator =3D "."
> > > > > +
> > > > > +=C2=A0 ### Default tags that will be added to all metrics.=C2=
=A0 These
> > > > > can
> > > > > be overridden at the template level
> > > > > +=C2=A0 ### or by tags extracted from metric
> > > > > +=C2=A0 # tags =3D ["region=3Dus-east", "zone=3D1c"]
> > > > > +
> > > > > +=C2=A0 ### Each template line requires a template pattern.=C2=
=A0 It
> > > > > can
> > > > > have an optional
> > > > > +=C2=A0 ### filter before the template and separated by spaces.=
=C2=A0
> > > > > It
> > > > > can also have optional extra
> > > > > +=C2=A0 ### tags following the template.=C2=A0 Multiple tags sho=
uld be
> > > > > separated by commas and no spaces
> > > > > +=C2=A0 ### similar to the line protocol format.=C2=A0 There can=
 be
> > > > > only
> > > > > one default template.
> > > > > +=C2=A0 # templates =3D [
> > > > > +=C2=A0 #=C2=A0=C2=A0 "*.app env.service.resource.measurement",
> > > > > +=C2=A0 #=C2=A0=C2=A0 # Default template
> > > > > +=C2=A0 #=C2=A0=C2=A0 "server.*",
> > > > > +=C2=A0 # ]
> > > > > +
> > > > > +###
> > > > > +### [collectd]
> > > > > +###
> > > > > +### Controls one or many listeners for collectd data.
> > > > > +###
> > > > > +
> > > > > +[[collectd]]
> > > > > +=C2=A0 # enabled =3D false
> > > > > +=C2=A0 # bind-address =3D ":25826"
> > > > > +=C2=A0 # database =3D "collectd"
> > > > > +=C2=A0 # retention-policy =3D ""
> > > > > +=C2=A0 #
> > > > > +=C2=A0 # The collectd service supports either scanning a
> > > > > directory
> > > > > for multiple types
> > > > > +=C2=A0 # db files, or specifying a single db file.
> > > > > +=C2=A0 # typesdb =3D "/usr/local/share/collectd"
> > > > > +=C2=A0 #
> > > > > +=C2=A0 # security-level =3D "none"
> > > > > +=C2=A0 # auth-file =3D "/etc/collectd/auth_file"
> > > > > +
> > > > > +=C2=A0 # These next lines control how batching works. You shoul=
d
> > > > > have
> > > > > this enabled
> > > > > +=C2=A0 # otherwise you could get dropped metrics or poor
> > > > > performance.
> > > > > Batching
> > > > > +=C2=A0 # will buffer points in memory if you have many coming i=
n.
> > > > > +
> > > > > +=C2=A0 # Flush if this many points get buffered
> > > > > +=C2=A0 # batch-size =3D 5000
> > > > > +
> > > > > +=C2=A0 # Number of batches that may be pending in memory
> > > > > +=C2=A0 # batch-pending =3D 10
> > > > > +
> > > > > +=C2=A0 # Flush at least this often even if we haven't hit buffe=
r
> > > > > limit
> > > > > +=C2=A0 # batch-timeout =3D "10s"
> > > > > +
> > > > > +=C2=A0 # UDP Read buffer size, 0 means OS default. UDP listener
> > > > > will
> > > > > fail if set above OS max.
> > > > > +=C2=A0 # read-buffer =3D 0
> > > > > +
> > > > > +=C2=A0 # Multi-value plugins can be handled two ways.
> > > > > +=C2=A0 # "split" will parse and store the multi-value plugin da=
ta
> > > > > into separate measurements
> > > > > +=C2=A0 # "join" will parse and store the multi-value plugin as =
a
> > > > > single multi-value measurement.
> > > > > +=C2=A0 # "split" is the default behavior for backward
> > > > > compatibility
> > > > > with previous versions of influxdb.
> > > > > +=C2=A0 # parse-multivalue-plugin =3D "split"
> > > > > +###
> > > > > +### [opentsdb]
> > > > > +###
> > > > > +### Controls one or many listeners for OpenTSDB data.
> > > > > +###
> > > > > +
> > > > > +[[opentsdb]]
> > > > > +=C2=A0 # enabled =3D false
> > > > > +=C2=A0 # bind-address =3D ":4242"
> > > > > +=C2=A0 # database =3D "opentsdb"
> > > > > +=C2=A0 # retention-policy =3D ""
> > > > > +=C2=A0 # consistency-level =3D "one"
> > > > > +=C2=A0 # tls-enabled =3D false
> > > > > +=C2=A0 # certificate=3D "/etc/ssl/influxdb.pem"
> > > > > +
> > > > > +=C2=A0 # Log an error for every malformed point.
> > > > > +=C2=A0 # log-point-errors =3D true
> > > > > +
> > > > > +=C2=A0 # These next lines control how batching works. You shoul=
d
> > > > > have
> > > > > this enabled
> > > > > +=C2=A0 # otherwise you could get dropped metrics or poor
> > > > > performance.
> > > > > Only points
> > > > > +=C2=A0 # metrics received over the telnet protocol undergo
> > > > > batching.
> > > > > +
> > > > > +=C2=A0 # Flush if this many points get buffered
> > > > > +=C2=A0 # batch-size =3D 1000
> > > > > +
> > > > > +=C2=A0 # Number of batches that may be pending in memory
> > > > > +=C2=A0 # batch-pending =3D 5
> > > > > +
> > > > > +=C2=A0 # Flush at least this often even if we haven't hit buffe=
r
> > > > > limit
> > > > > +=C2=A0 # batch-timeout =3D "1s"
> > > > > +
> > > > > +###
> > > > > +### [[udp]]
> > > > > +###
> > > > > +### Controls the listeners for InfluxDB line protocol data
> > > > > via
> > > > > UDP.
> > > > > +###
> > > > > +
> > > > > +[[udp]]
> > > > > +=C2=A0 # enabled =3D false
> > > > > +=C2=A0 # bind-address =3D ":8089"
> > > > > +=C2=A0 # database =3D "udp"
> > > > > +=C2=A0 # retention-policy =3D ""
> > > > > +
> > > > > +=C2=A0 # InfluxDB precision for timestamps on received points (=
""
> > > > > or
> > > > > "n", "u", "ms", "s", "m", "h")
> > > > > +=C2=A0 # precision =3D ""
> > > > > +
> > > > > +=C2=A0 # These next lines control how batching works. You shoul=
d
> > > > > have
> > > > > this enabled
> > > > > +=C2=A0 # otherwise you could get dropped metrics or poor
> > > > > performance.
> > > > > Batching
> > > > > +=C2=A0 # will buffer points in memory if you have many coming i=
n.
> > > > > +
> > > > > +=C2=A0 # Flush if this many points get buffered
> > > > > +=C2=A0 # batch-size =3D 5000
> > > > > +
> > > > > +=C2=A0 # Number of batches that may be pending in memory
> > > > > +=C2=A0 # batch-pending =3D 10
> > > > > +
> > > > > +=C2=A0 # Will flush at least this often even if we haven't hit
> > > > > buffer
> > > > > limit
> > > > > +=C2=A0 # batch-timeout =3D "1s"
> > > > > +
> > > > > +=C2=A0 # UDP Read buffer size, 0 means OS default. UDP listener
> > > > > will
> > > > > fail if set above OS max.
> > > > > +=C2=A0 # read-buffer =3D 0
> > > > > +
> > > > > +###
> > > > > +### [continuous_queries]
> > > > > +###
> > > > > +### Controls how continuous queries are run within InfluxDB.
> > > > > +###
> > > > > +
> > > > > +[continuous_queries]
> > > > > +=C2=A0 # Determines whether the continuous query service is
> > > > > enabled.
> > > > > +=C2=A0 # enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Controls whether queries are logged when executed by t=
he
> > > > > CQ
> > > > > service.
> > > > > +=C2=A0 # log-enabled =3D true
> > > > > +
> > > > > +=C2=A0 # Controls whether queries are logged to the self-
> > > > > monitoring
> > > > > data store.
> > > > > +=C2=A0 # query-stats-enabled =3D false
> > > > > +
> > > > > +=C2=A0 # interval for how often continuous queries will be
> > > > > checked if
> > > > > they need to run
> > > > > +=C2=A0 # run-interval =3D "1s"
> > > > > +
> > > > > +###
> > > > > +### [tls]
> > > > > +###
> > > > > +### Global configuration settings for TLS in InfluxDB.
> > > > > +###
> > > > > +
> > > > > +[tls]
> > > > > +=C2=A0 # Determines the available set of cipher suites. See
> > > > > https://golang.org/pkg/crypto/tls/#pkg-constants
> > > > > +=C2=A0 # for a list of available ciphers, which depends on the
> > > > > version of Go (use the query
> > > > > +=C2=A0 # SHOW DIAGNOSTICS to see the version of Go used to buil=
d
> > > > > InfluxDB). If not specified, uses
> > > > > +=C2=A0 # the default settings from Go's crypto/tls package.
> > > > > +=C2=A0 # ciphers =3D [
> > > > > +=C2=A0 #=C2=A0=C2=A0 "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305",
> > > > > +=C2=A0 #=C2=A0=C2=A0 "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305",
> > > > > +=C2=A0 # ]
> > > > > +
> > > > > +=C2=A0 # Minimum version of the tls protocol that will be
> > > > > negotiated.
> > > > > If not specified, uses the
> > > > > +=C2=A0 # default settings from Go's crypto/tls package.
> > > > > +=C2=A0 # min-version =3D "tls1.2"
> > > > > +
> > > > > +=C2=A0 # Maximum version of the tls protocol that will be
> > > > > negotiated.
> > > > > If not specified, uses the
> > > > > +=C2=A0 # default settings from Go's crypto/tls package.
> > > > > +=C2=A0 # max-version =3D "tls1.3"
> > > > > diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
> > > > > b/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
> > > > > new file mode 100644
> > > > > index 000000000..4f2bb78b2
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.7.10.bb
> > > > > @@ -0,0 +1,63 @@
> > > > > +DESCRIPTION =3D "InfluxDB is a time series database designed
> > > > > to
> > > > > handle high write and query loads."
> > > > > +HOMEPAGE =3D "
> > > > > https://www.influxdata.com/products/influxdb-overview/"
> > > > > +
> > > > > +LICENSE =3D "MIT"
> > > > > +LIC_FILES_CHKSUM =3D "
> > > > > file://src/${GO_IMPORT}/LICENSE;md5=3Dba8146ad9cc2a1282099832651=
36e06a
> > > > > "
> > > > > +
> > > > > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > > > > +
> > > > > +RDEPENDS_${PN} =3D "bash"
> > > > > +RDEPENDS_${PN}-dev =3D "bash"
> > > > > +
> > > > > +GO_IMPORT =3D "github.com/influxdata/influxdb"
> > > > > +
> > > > > +GO_INSTALL =3D "\
> > > > > +=C2=A0=C2=A0=C2=A0 ${GO_IMPORT}/cmd/influx \
> > > > > +=C2=A0=C2=A0=C2=A0 ${GO_IMPORT}/cmd/influxd \
> > > > > +"
> > > > > +
> > > > > +SRC_URI =3D "\
> > > > > +
> > > > > git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.7;destsuffix=3D${=
BPN
> > > > > }-
> > > > > ${PV}/src/${GO_IMPORT} \
> > > > > +=C2=A0=C2=A0=C2=A0 file://influxdb=C2=A0\
> > > > > +=C2=A0=C2=A0=C2=A0 file://influxdb.conf=C2=A0\
> > > > > +"
> > > > > +
> > > > > +SRCREV =3D "c958f436b2e538a88a7815aad721c7774a0b8f63"
> > > > > +
> > > > > +inherit go-mod systemd update-rc.d useradd
> > > > > +
> > > > > +USERADD_PACKAGES =3D "${PN}"
> > > > > +USERADD_PARAM_${PN} =3D "--system -d /var/lib/influxdb -m -s
> > > > > /bin/nologin influxdb"
> > > > > +
> > > > > +do_install_prepend() {
> > > > > +=C2=A0=C2=A0=C2=A0 rm ${B}/src/${GO_IMPORT}/build.py
> > > > > +=C2=A0=C2=A0=C2=A0 rm ${B}/src/${GO_IMPORT}/build.sh
> > > > > +=C2=A0=C2=A0=C2=A0 rm ${B}/src/${GO_IMPORT}/Dockerfile*
> > > > > +}
> > > > > +
> > > > > +do_install_append() {
> > > > > +=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/influxdb
> > > > > +=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}/influxdb.conf
> > > > > ${D}${sysconfdir}/influxdb
> > > > > +=C2=A0=C2=A0=C2=A0 chown -R root.influxdb ${D}${sysconfdir}/inf=
luxdb
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/init.d
> > > > > +=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/influxdb
> > > > > ${D}${sysconfdir}/init.d/influxdb
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.filter('DISTRO_FEATURES', =
'sysvinit',
> > > > > d)}"
> > > > > ] ; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sys=
confdir}/logrotate.d
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644
> > > > > ${S}/src/${GO_IMPORT}/scripts/logrotate
> > > > > ${D}${sysconfdir}/logrotate.d/influxdb
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if [ "${@bb.utils.filter('DISTRO_FEATURES', =
'systemd',
> > > > > d)}"
> > > > > ] ; then
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sys=
temd_unitdir}/system
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644
> > > > > ${S}/src/${GO_IMPORT}/scripts/influxdb.service
> > > > > ${D}${systemd_system_unitdir}/influxdb.service
> > > > > +=C2=A0=C2=A0=C2=A0 fi
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 # TODO chown
> > > > > +}
> > > > > +
> > > > > +INITSCRIPT_PACKAGES =3D "${PN}"
> > > > > +INITSCRIPT_NAME =3D "influxdb"
> > > > > +INITSCRIPT_PARAMS =3D "defaults"
> > > > > +
> > > > > +SYSTEMD_SERVICE_${PN} =3D "influxdb.service"
> > > > > --
> > > > > 2.29.2
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > >=20
> > >=20
> > >=20
> >=20
> > --
> > Thomas Perrot, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com
> >=20
>=20
>=20
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-XyOgl4kMkq5DqajaSlyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAl/+pEMACgkQn8ALBXH+
Cu2v0gv9GRhZDQyRqY8RMvR7+D1W3k77ExYNWeZ4YnhJjAO6QT2acU5FOuKwStyk
Eapqj/C9iBvwe9lLnLbflt+m05xBCHDYlCHOaorqz0Uub31DFHQAt64AsibiJRhZ
am17ERocasqHSv//s63rifyN9MSpzdQSWONFRxjvj3K3IJ5g5H2HL6qbP6kjyvev
nKEY0BjD8rs9/1tqckN9H/ylIRpxtYUMK3vqU2hSGqLpcHe+qLyVBnI0k+ttoyyu
jXRw+eoxek/9u6L2UEPSOdPZctiJ46LsCI+Z6klXEaya1wuYEAELcLvCM3ZLr2gl
I3FPOwq3Z3m+GjH6om07wBj9P9ZVPK4NIUIJ5Sywdbghii5xNriw4ra2a2RZFZlX
/8NHuFoJlgfTw1VuiBWCQB8d8S5SL2p6kV1T6AaeNYplMkdZPegiek5uN5YfRlZ3
gAsudXEwOXtKCFmiXR0tGDToj6W0UmurKjg61TxSSm0J0V85v5kwLGugE8F4T2no
E5VGgu1O
=QOO+
-----END PGP SIGNATURE-----

--=-XyOgl4kMkq5DqajaSlyg--
