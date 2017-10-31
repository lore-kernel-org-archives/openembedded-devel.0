Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1013E60766
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 13:21:26 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9WTv-0002El-QQ from Joe_MacDonald@mentor.com ;
	Tue, 31 Oct 2017 06:21:27 -0700
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 06:21:27 -0700
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)	id
	3E364592652; Tue, 31 Oct 2017 09:21:26 -0400 (EDT)
Date: Tue, 31 Oct 2017 09:21:26 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20171031132125.bjisys7yjaqrc6cp@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-4-git-send-email-joe_macdonald@mentor.com>
	<f585dafe-fe4f-fefb-dd23-c1f99b653754@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f585dafe-fe4f-fefb-dd23-c1f99b653754@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 3/6] freediameter: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 13:21:27 -0000
X-Groupsio-MsgNum: 69408
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lqr57fxumg42hdfh"
Content-Disposition: inline

--lqr57fxumg42hdfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 3/6] freediameter: add new recipe] On 17.=
10.30 (Mon 17:47) akuster808 wrote:

>=20
>=20
> On 10/30/2017 11:11 AM, Joe MacDonald wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > freeDiameter is an open source Diameter protocol
> > implementation. It provides an extensible platform
> > for deploying a Diameter network for your Authentication,
> > Authorization and Accounting needs.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> If you want this in meta-networking, please send a patch to remove it
> from meta-security.

I never even thought of looking for it in meta-security.  Since I've
always encountered it in the CGL space it just never occurred, and since
the patch was still apparently active in patchwork, I just assumed it'd
been lost.

Do you (or anyone else using the layers) have a preference for what we
do with the recipe?  Unfortunately at a glance they look at least a bit
different from each other, so if I'm going to include it in
meta-networking I'll want to review what's in meta-security first to
determine what changes are appropriate to the meta-networking version.

-J.

>=20
> - armin
> > ---
> >  ...murhash-algorithm-with-Robert-Jenkin-s-ha.patch | 223 +++++++++++++=
++++++++
> >  .../freediameter/files/freediameter.init           |  72 +++++++
> >  .../freediameter/files/freediameter.service        |  11 +
> >  .../freediameter/files/install_test.patch          |  22 ++
> >  .../freediameter/files/pass-ptest-env.patch        |  72 +++++++
> >  .../recipes-protocols/freediameter/files/run-ptest |  11 +
> >  .../freediameter/freediameter.inc                  |  98 +++++++++
> >  .../freediameter/freediameter_1.2.1.bb             |   7 +
> >  8 files changed, 516 insertions(+)
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/file=
s/Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch
> >  create mode 100755 meta-networking/recipes-protocols/freediameter/file=
s/freediameter.init
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/file=
s/freediameter.service
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/file=
s/install_test.patch
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/file=
s/pass-ptest-env.patch
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/file=
s/run-ptest
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/free=
diameter.inc
> >  create mode 100644 meta-networking/recipes-protocols/freediameter/free=
diameter_1.2.1.bb
> >
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/Repla=
ce-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch b/meta-networking/rec=
ipes-protocols/freediameter/files/Replace-murmurhash-algorithm-with-Robert-=
Jenkin-s-ha.patch
> > new file mode 100644
> > index 0000000..71a5a1a
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/Replace-murm=
urhash-algorithm-with-Robert-Jenkin-s-ha.patch
> > @@ -0,0 +1,223 @@
> > +Replace murmurhash algorithm with Robert Jenkin's hash algorithm
> > +
> > +Upstream-Status: Pending
> > +
> > +From test result, murmurhash algorithm does not work in big endian
> > +processor, so replace it with Robert Jenkin's hash which has worked
> > +in linux kernel for many years and has more adaptability.
> > +
> > +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> > +---
> > + libfdproto/ostr.c |  192 +++++++++++++++++++++-----------------------=
---------
> > + 1 file changed, 74 insertions(+), 118 deletions(-)
> > +
> > +diff --git a/libfdproto/ostr.c b/libfdproto/ostr.c
> > +index 8f29b48..ce1f4dd 100644
> > +--- a/libfdproto/ostr.c
> > ++++ b/libfdproto/ostr.c
> > +@@ -430,128 +430,84 @@ after_proto:
> > +=20
> > +=20
> > + /********************************************************************=
************************************/
> > +-/* Hash function -- credits to Austin Appleby, thank you ^^ */
> > +-/* See http://murmurhash.googlepages.com for more information on this=
 function */
> > +-
> > +-/* the strings are NOT always aligned properly (ex: received in RADIU=
S message), so we use the aligned MurmurHash2 function as needed */
> > +-#define _HASH_MIX(h,k,m) { k *=3D m; k ^=3D k >> r; k *=3D m; h *=3D =
m; h ^=3D k; }
> > +-uint32_t fd_os_hash ( uint8_t * string, size_t len )
> > ++/*
> > ++ * Robert Jenkin's hash function.
> > ++ * http://burtleburtle.net/bob/hash/evahash.html
> > ++ * This is in the public domain.
> > ++ */
> > ++#define mix(a, b, c)						\
> > ++	do {							\
> > ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 13);	\
> > ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 8);	\
> > ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 13);	\
> > ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 12);	\
> > ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 16);	\
> > ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 5);	\
> > ++		a =3D a - b;  a =3D a - c;  a =3D a ^ (c >> 3);	\
> > ++		b =3D b - c;  b =3D b - a;  b =3D b ^ (a << 10);	\
> > ++		c =3D c - a;  c =3D c - b;  c =3D c ^ (b >> 15);	\
> > ++	} while (0)
> > ++
> > ++unsigned hash_rjenkins(const char *str, unsigned length)
> > + {
> > +-	uint32_t hash =3D len;
> > +-	uint8_t * data =3D string;
> > +-=09
> > +-	const unsigned int m =3D 0x5bd1e995;
> > +-	const int r =3D 24;
> > +-	int align =3D (long)string & 3;
> > +-=09
> > +-	if (!align || (len < 4)) {
> > +-		/* In case data is aligned, MurmurHash2 function */
> > +-		while(len >=3D 4)
> > +-		{
> > +-			/* Mix 4 bytes at a time into the hash */
> > +-			uint32_t k =3D *(uint32_t *)data;	/* We don't care about the byte =
order */
> > +-
> > +-			_HASH_MIX(hash, k, m);
> > +-
> > +-			data +=3D 4;
> > +-			len -=3D 4;
> > +-		}
> > +-
> > +-		/* Handle the last few bytes of the input */
> > +-		switch(len) {
> > +-			case 3: hash ^=3D data[2] << 16;
> > +-			case 2: hash ^=3D data[1] << 8;
> > +-			case 1: hash ^=3D data[0];
> > +-	        		hash *=3D m;
> > +-		}
> > +-	=09
> > +-	} else {
> > +-		/* Unaligned data, use alignment-safe slower version */
> > +-	=09
> > +-		/* Pre-load the temp registers */
> > +-		uint32_t t =3D 0, d =3D 0;
> > +-		switch(align)
> > +-		{
> > +-			case 1: t |=3D data[2] << 16;
> > +-			case 2: t |=3D data[1] << 8;
> > +-			case 3: t |=3D data[0];
> > +-		}
> > +-		t <<=3D (8 * align);
> > +-
> > +-		data +=3D 4-align;
> > +-		len -=3D 4-align;
> > +-	=09
> > +-		/* From this point, "data" can be read by chunks of 4 bytes */
> > +-	=09
> > +-		int sl =3D 8 * (4-align);
> > +-		int sr =3D 8 * align;
> > +-
> > +-		/* Mix */
> > +-		while(len >=3D 4)
> > +-		{
> > +-			uint32_t k;
> > +-		=09
> > +-			d =3D *(unsigned int *)data;
> > +-			k =3D (t >> sr) | (d << sl);
> > +-
> > +-			_HASH_MIX(hash, k, m);
> > +-
> > +-			t =3D d;
> > +-
> > +-			data +=3D 4;
> > +-			len -=3D 4;
> > +-		}
> > +-
> > +-		/* Handle leftover data in temp registers */
> > +-		d =3D 0;
> > +-		if(len >=3D align)
> > +-		{
> > +-			uint32_t k;
> > +-		=09
> > +-			switch(align)
> > +-			{
> > +-			case 3: d |=3D data[2] << 16;
> > +-			case 2: d |=3D data[1] << 8;
> > +-			case 1: d |=3D data[0];
> > +-			}
> > +-
> > +-			k =3D (t >> sr) | (d << sl);
> > +-			_HASH_MIX(hash, k, m);
> > +-
> > +-			data +=3D align;
> > +-			len -=3D align;
> > +-
> > +-			/* Handle tail bytes */
> > +-
> > +-			switch(len)
> > +-			{
> > +-			case 3: hash ^=3D data[2] << 16;
> > +-			case 2: hash ^=3D data[1] << 8;
> > +-			case 1: hash ^=3D data[0];
> > +-					hash *=3D m;
> > +-			};
> > +-		}
> > +-		else
> > +-		{
> > +-			switch(len)
> > +-			{
> > +-			case 3: d |=3D data[2] << 16;
> > +-			case 2: d |=3D data[1] << 8;
> > +-			case 1: d |=3D data[0];
> > +-			case 0: hash ^=3D (t >> sr) | (d << sl);
> > +-					hash *=3D m;
> > +-			}
> > +-		}
> > +-
> > ++	const unsigned char *k =3D (const unsigned char *)str;
> > ++	uint32_t a, b, c;  /* the internal state */
> > ++	uint32_t len;      /* how many key bytes still need mixing */
> > ++
> > ++	/* Set up the internal state */
> > ++	len =3D length;
> > ++	a =3D 0x9e3779b9;      /* the golden ratio; an arbitrary value */
> > ++	b =3D a;
> > ++	c =3D 0;               /* variable initialization of internal state =
*/
> > ++
> > ++	/* handle most of the key */
> > ++	while (len >=3D 12) {
> > ++		a =3D a + (k[0] + ((uint32_t)k[1] << 8) + ((uint32_t)k[2] << 16) +
> > ++			 ((uint32_t)k[3] << 24));
> > ++		b =3D b + (k[4] + ((uint32_t)k[5] << 8) + ((uint32_t)k[6] << 16) +
> > ++			 ((uint32_t)k[7] << 24));
> > ++		c =3D c + (k[8] + ((uint32_t)k[9] << 8) + ((uint32_t)k[10] << 16) +
> > ++			 ((uint32_t)k[11] << 24));
> > ++		mix(a, b, c);
> > ++		k =3D k + 12;
> > ++		len =3D len - 12;
> > ++	}
> > +=20
> > ++	/* handle the last 11 bytes */
> > ++	c =3D c + length;
> > ++	switch (len) {            /* all the case statements fall through */
> > ++	case 11:
> > ++		c =3D c + ((uint32_t)k[10] << 24);
> > ++	case 10:
> > ++		c =3D c + ((uint32_t)k[9] << 16);
> > ++	case 9:
> > ++		c =3D c + ((uint32_t)k[8] << 8);
> > ++		/* the first byte of c is reserved for the length */
> > ++	case 8:
> > ++		b =3D b + ((uint32_t)k[7] << 24);
> > ++	case 7:
> > ++		b =3D b + ((uint32_t)k[6] << 16);
> > ++	case 6:
> > ++		b =3D b + ((uint32_t)k[5] << 8);
> > ++	case 5:
> > ++		b =3D b + k[4];
> > ++	case 4:
> > ++		a =3D a + ((uint32_t)k[3] << 24);
> > ++	case 3:
> > ++		a =3D a + ((uint32_t)k[2] << 16);
> > ++	case 2:
> > ++		a =3D a + ((uint32_t)k[1] << 8);
> > ++	case 1:
> > ++		a =3D a + k[0];
> > ++		/* case 0: nothing left to add */
> > + 	}
> > ++	mix(a, b, c);
> > +=20
> > +-	/* Do a few final mixes of the hash to ensure the last few
> > +-	   bytes are well-incorporated. */
> > +-	hash ^=3D hash >> 13;
> > +-	hash *=3D m;
> > +-	hash ^=3D hash >> 15;
> > ++	return c;
> > ++}
> > +=20
> > +-	return hash;
> > ++uint32_t fd_os_hash ( uint8_t * string, size_t len )
> > ++{
> > ++	return hash_rjenkins(string, len);=20
> > + }=20
> > +=20
> > +--=20
> > +1.7.10.4
> > +
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/freed=
iameter.init b/meta-networking/recipes-protocols/freediameter/files/freedia=
meter.init
> > new file mode 100755
> > index 0000000..e63a42a
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/freediameter=
=2Einit
> > @@ -0,0 +1,72 @@
> > +#!/bin/sh
> > +#
> > +### BEGIN INIT INFO
> > +# Provides:          freediameter
> > +# Default-Start:     2 3 4 5
> > +# Default-Stop:      0 1 6
> > +# Required-Start:    $remote_fs $syslog
> > +# Required-Stop:     $remote_fs $syslog
> > +# Short-Description: Start freeDiameter daemon at boot time
> > +# Description:       Start the freeDiameter daemon at boot time.
> > +#       freeDiameter is an extensible implementation of the Diameter p=
rotocol,
> > +#       designed for Authentication, Authorization and Accounting. Dia=
meter is
> > +#       an evolution of the RADIUS protocol.
> > +### END INIT INFO#
> > +DAEMON=3D/usr/bin/freeDiameterd
> > +CONF=3D/etc/freeDiameter/freeDiameter.conf
> > +NAME=3Dfreediameter
> > +DESC=3D"freeDiameter daemon"
> > +
> > +. /etc/init.d/functions
> > +start() {
> > +	[ -x $DAEMON ] || exit 5
> > +	echo -n $"Starting $DAEMON: "
> > +	start-stop-daemon -S -b -x ${DAEMON} && success || failure
> > +	retval=3D$?
> > +	echo ""
> > +	return $retval
> > +}
> > +
> > +stop() {
> > +	echo -n $"Stopping $prog: "
> > +	start-stop-daemon -K -x $DAEMON
> > +	retval=3D$?
> > +	echo ""
> > +	return $retval
> > +}
> > +
> > +restart() {
> > +	stop
> > +	sleep 3
> > +	start
> > +}
> > +
> > +rh_status() {
> > +	status $DAEMON
> > +}
> > +
> > +rh_status_q() {
> > +	rh_status > /dev/null 2>&1
> > +}
> > +
> > +case "$1" in
> > +  start)
> > +	rh_status_q && exit 0
> > +	start
> > +	;;
> > +  stop)
> > +	rh_status_q || exit 0
> > +	stop
> > +	;;
> > +  restart)
> > +	restart
> > +	;;
> > +  status)
> > +	rh_status
> > +	;;
> > +  *)
> > +	echo $"Usage: $prog {start|stop|status|restart}"
> > +	exit 2
> > +esac
> > +
> > +exit $?
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/freed=
iameter.service b/meta-networking/recipes-protocols/freediameter/files/free=
diameter.service
> > new file mode 100644
> > index 0000000..514481b
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/freediameter=
=2Eservice
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=3Dfreediameter daemon
> > +After=3Dnetwork.target
> > +
> > +[Service]
> > +Type=3Dsimple
> > +PIDFile=3D/var/run/freediameter.pid
> > +ExecStart=3D@BINDIR@/freeDiameterd
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/insta=
ll_test.patch b/meta-networking/recipes-protocols/freediameter/files/instal=
l_test.patch
> > new file mode 100644
> > index 0000000..151037d
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/install_test=
=2Epatch
> > @@ -0,0 +1,22 @@
> > +CMakeLists: add an option to install tests
> > +
> > +Upstream-Status: Inappropriate [OE ptest specific]
> > +
> > +Original author: Yao Zhao <yao.zhao@windriver.com>
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +
> > +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> > +index da8da1b..de04059 100644
> > +--- a/tests/CMakeLists.txt
> > ++++ b/tests/CMakeLists.txt
> > +@@ -113,4 +113,9 @@ ENDFOREACH( TEST )
> > + ####
> > + ## INSTALL section ##
> > +=20
> > +-# we do not install the tests
> > ++# install the tests
> > ++SET(INSTALL_TEST_SUFFIX       /opt/${FD_PROJECT_NAME}-tests   CACHE P=
ATH "Directory where the test binary is installed.")
> > ++
> > ++INSTALL(TARGETS ${TEST_LIST}
> > ++        RUNTIME DESTINATION ${INSTALL_TEST_SUFFIX}
> > ++        COMPONENT freeDiameter-common)
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/pass-=
ptest-env.patch b/meta-networking/recipes-protocols/freediameter/files/pass=
-ptest-env.patch
> > new file mode 100644
> > index 0000000..ea857af
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/pass-ptest-e=
nv.patch
> > @@ -0,0 +1,72 @@
> > +freediameter ptest cases testmesg_stress.c and testloadext.c need load
> > +extensions both build time and runtime. Then they search extensions wi=
th
> > +build directory that causes runtime failures.
> > +
> > +Pass an environment variable to define runtime extension path.
> > +
> > +Upstream-Status: Inappropriate [OE ptest specific]
> > +
> > +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +
> > +diff -Nur freeDiameter-1.2.0.orig/tests/testloadext.c freeDiameter-1.2=
=2E0/tests/testloadext.c
> > +--- freeDiameter-1.2.0.orig/tests/testloadext.c	2014-02-19 17:33:24.78=
5405032 +0800
> > ++++ freeDiameter-1.2.0/tests/testloadext.c	2014-02-19 20:08:03.8714039=
24 +0800
> > +@@ -49,7 +49,7 @@
> > + {
> > + 	DIR *dir;
> > + 	struct dirent *dp;
> > +-	char fullname[512];
> > ++	char fullname[1024];
> > + 	int pathlen;
> > +=20
> > + 	/* First, initialize the daemon modules */
> > +@@ -57,11 +57,16 @@
> > + 	CHECK( 0, fd_queues_init()  );
> > + 	CHECK( 0, fd_msg_init()  );
> > + 	CHECK( 0, fd_rtdisp_init()  );
> > +-=09
> > ++
> > ++	char *ext_dir =3D getenv("EXTENSIONS_DIR");
> > ++	if (ext_dir)
> > ++		pathlen =3D snprintf(fullname, sizeof(fullname), "%s", ext_dir);
> > ++	else
> > ++		pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/extens=
ions/");
> > ++
> > + 	/* Find all extensions which have been compiled along the test */
> > +-	TRACE_DEBUG(INFO, "Loading from: '%s'", BUILD_DIR "/extensions");
> > +-	CHECK( 0, (dir =3D opendir (BUILD_DIR "/extensions")) =3D=3D NULL ? =
1 : 0 );
> > +-	pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensi=
ons/");
> > ++	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> > ++	CHECK( 0, (dir =3D opendir (fullname)) =3D=3D NULL ? 1 : 0 );
> > + =09
> > + 	while ((dp =3D readdir (dir)) !=3D NULL) {
> > + 		char * dot =3D strrchr(dp->d_name, '.');
> > +diff -Nur freeDiameter-1.2.0.orig/tests/testmesg_stress.c freeDiameter=
-1.2.0/tests/testmesg_stress.c
> > +--- freeDiameter-1.2.0.orig/tests/testmesg_stress.c	2014-02-19 17:33:2=
4.785405032 +0800
> > ++++ freeDiameter-1.2.0/tests/testmesg_stress.c	2014-02-19 20:08:03.928=
403924 +0800
> > +@@ -67,15 +67,20 @@
> > + {
> > + 	DIR *dir;
> > + 	struct dirent *dp;
> > +-	char fullname[512];
> > ++	char fullname[1024];
> > + 	int pathlen;
> > + 	struct fd_list all_extensions =3D FD_LIST_INITIALIZER(all_extensions=
);
> > + 	struct fd_list ext_with_depends =3D FD_LIST_INITIALIZER(ext_with_dep=
ends);
> > +=20
> > ++	char *ext_dir =3D getenv("EXTENSIONS_DIR");
> > ++	if (ext_dir)
> > ++		pathlen =3D snprintf(fullname, sizeof(fullname), "%s", ext_dir);
> > ++	else
> > ++		pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/extens=
ions/");
> > ++
> > + 	/* Find all extensions which have been compiled along the test */
> > +-	LOG_D("Loading %s*.fdx from: '%s'", BUILD_DIR "/extensions", prefix =
?: "");
> > +-	CHECK( 0, (dir =3D opendir (BUILD_DIR "/extensions")) =3D=3D NULL ? =
1 : 0 );
> > +-	pathlen =3D snprintf(fullname, sizeof(fullname), BUILD_DIR "/extensi=
ons/");
> > ++	TRACE_DEBUG(INFO, "Loading from: '%s'", fullname);
> > ++	CHECK( 0, (dir =3D opendir (fullname)) =3D=3D NULL ? 1 : 0 );
> > + =09
> > + 	while ((dp =3D readdir (dir)) !=3D NULL) {
> > + 		char * dot =3D strrchr(dp->d_name, '.');
> > diff --git a/meta-networking/recipes-protocols/freediameter/files/run-p=
test b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> > new file mode 100644
> > index 0000000..d0ca8d9
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +
> > +if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
> > +        echo "Couldn't load kernel module sctp."
> > +        echo "Test cases testsctp and testcnx will fail."
> > +        echo
> > +fi
> > +
> > +export EXTENSIONS_DIR=3D$EXTENSIONS_DIR
> > +cmake  -E cmake_echo_color --cyan "Running tests..."
> > +ctest --force-new-ctest-process
> > diff --git a/meta-networking/recipes-protocols/freediameter/freediamete=
r.inc b/meta-networking/recipes-protocols/freediameter/freediameter.inc
> > new file mode 100644
> > index 0000000..6880d26
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/freediameter.inc
> > @@ -0,0 +1,98 @@
> > +SUMMARY =3D "An open source implementation of the diameter protocol"
> > +DESCRIPTION =3D "\
> > +freeDiameter is an open source Diameter protocol implementation. It \
> > +provides an extensible platform for deploying a Diameter network for \
> > +your Authentication, Authorization and Accounting needs."
> > +
> > +HOMEPAGE =3D "http://www.freediameter.net"
> > +
> > +DEPENDS =3D "flex bison cmake-native libgcrypt gnutls libidn lksctp-to=
ols"
> > +
> > +pkgname =3D "freeDiameter"
> > +
> > +SRC_URI =3D "http://www.freediameter.net/hg/${pkgname}/archive/${PV}.t=
ar.gz;downloadfilename=3D${pkgname}-${PV}.tar.gz \
> > +           file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha=
=2Epatch \
> > +           file://freediameter.service \
> > +           file://freediameter.init \
> > +           \
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
> > +           'file://install_test.patch \
> > +            file://run-ptest \
> > +            file://pass-ptest-env.patch', '', d)} \
> > +           "
> > +
> > +S =3D "${WORKDIR}/${pkgname}-${PV}"
> > +
> > +PTEST_PATH =3D "${libdir}/${pkgname}/ptest"
> > +
> > +inherit cmake update-rc.d ptest systemd
> > +
> > +EXTRA_OECMAKE =3D " \
> > +    -DDEFAULT_CONF_PATH:PATH=3D${sysconfdir}/${pkgname} \
> > +    -DBUILD_DBG_MONITOR:BOOL=3DON  \
> > +    -DBUILD_TEST_APP:BOOL=3DON \
> > +    -DBUILD_TESTING:BOOL=3DON \
> > +    -DBUILD_APP_RADGW:BOOL=3DON \
> > +    -DBUILD_APP_REDIRECT:BOOL=3DON \
> > +    -DBUILD_TEST_ACCT:BOOL=3DON \
> > +    -DBUILD_TEST_NETEMUL:BOOL=3DON \
> > +    -DBUILD_TEST_RT_ANY:BOOL=3DON \
> > +    -DINSTALL_LIBRARY_SUFFIX:PATH=3D${baselib} \
> > +    -DINSTALL_EXTENSIONS_SUFFIX:PATH=3D${baselib}/${pkgname} \
> > +    -DINSTALL_TEST_SUFFIX:PATH=3D${PTEST_PATH}-tests \
> > +    -DCMAKE_SKIP_RPATH:BOOL=3DON \
> > +"
> > +# INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
> > +# specify it on cmd line will fix the SET bug in CMakeList.txt
> > +
> > +# -DBUILD_APP_ACCT:BOOL=3DON This needs POSTGRESQL support
> > +
> > +# -DBUILD_APP_DIAMEAP:BOOL=3DON  -DBUILD_APP_SIP:BOOL=3DON -DBUILD_TES=
T_SIP:BOOL=3DON
> > +# These need MySQL support
> > +
> > +# -DBUILD_DBG_INTERACTIVE:BOOL=3DON This needs SWIG support
> > +
> > +# -DALL_EXTENSIONS=3DON will enable all
> > +
> > +do_install_append() {
> > +    # install the sample configuration file
> > +    install -d -m 0755 ${D}${sysconfdir}/${pkgname}
> > +    for i in ${S}/doc/*.conf.sample; do
> > +        install -m 0644 $i ${D}${sysconfdir}/${pkgname}/
> > +    done
> > +    mv ${D}${sysconfdir}/${pkgname}/freediameter.conf.sample \
> > +      ${D}${sysconfdir}/${pkgname}/freeDiameter.conf.sample
> > +
> > +    # install daemon init related files
> > +    install -d -m 0755 ${D}${sysconfdir}/default
> > +    install -d -m 0755 ${D}${sysconfdir}/init.d
> > +    install -m 0644 ${S}/contrib/debian/freediameter-daemon.default \
> > +      ${D}${sysconfdir}/default/${BPN}
> > +    install -m 0755 ${WORKDIR}/freediameter.init ${D}${sysconfdir}/ini=
t.d/${BPN}
> > +
> > +    # install for systemd
> > +    install -d ${D}${systemd_system_unitdir}
> > +    install -m 0644 ${WORKDIR}/freediameter.service ${D}${systemd_syst=
em_unitdir}
> > +    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/*=
=2Eservice
> > +}
> > +
> > +do_install_ptest() {
> > +    sed -i "s#\(EXTENSIONS_DIR=3D\).*\$#\1${libdir}/${pkgname}/#" ${D}=
${PTEST_PATH}/run-ptest
> > +    mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
> > +    rmdir ${D}${PTEST_PATH}-tests
> > +    install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
> > +}
> > +
> > +FILES_${PN}-dbg +=3D "${libdir}/${pkgname}/.debug/*"
> > +
> > +# include the extensions in main package
> > +FILES_${PN} +=3D "${libdir}/${pkgname}/*"
> > +
> > +RDEPENDS_${PN} =3D "glib-2.0 gnutls libidn"
> > +RDEPENDS_${PN}-ptest =3D "cmake"
> > +
> > +INITSCRIPT_NAME =3D "${BPN}"
> > +INITSCRIPT_PARAMS =3D "start 30 . stop 70 0 1 2 3 4 5 6 ."
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "freediameter.service"
> > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > diff --git a/meta-networking/recipes-protocols/freediameter/freediamete=
r_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.=
2.1.bb
> > new file mode 100644
> > index 0000000..3fb929a
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1=
=2Ebb
> > @@ -0,0 +1,7 @@
> > +include freediameter.inc
> > +
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D892b2ed6ae815488a08416ff7ee=
74a35"
> > +
> > +SRC_URI[md5sum] =3D "61b1062aa144b5f12eed514611e6d697"
> > +SRC_URI[sha256sum] =3D "bd7f105542e9903e776aa006c6931c1f5d3d477cb59af3=
3a9162422efa477097"
>=20

--=20
-Joe MacDonald.
:wq

--lqr57fxumg42hdfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAln4eNUACgkQSfx99yw5
9pbavgf9HVjpyjV6TS0D/nZdlN2CQD3fLnrR864umgEhjAUCQCgH2bMI/4fHDAhE
mri6mGCpPHKZmB7juaQYdhQOPtj6RoS3RfghYIsFqepnWFxBbos40Oy+8sKYPsa1
NaxitI2xSQFG1ejSmiTjdIkZ0bxadpk46Ye2HctrVDFbGuI1yMN9cbwf2RFQpZBp
2jHmll2E43SIQBGpcM62B+r3r8uAT8lyVH8opoQ4u98Ak2n/hLlQA1GewVZuY9me
3xx/u6kfYe5bdl4TaK3KZZrf5ikDbH43FYK+TIzsg0tgQDzV6nZEBTwahMvcb2Hu
v/noX0dxeYtOmMGhpG8S0CyvnY+Okw==
=/l8d
-----END PGP SIGNATURE-----

--lqr57fxumg42hdfh--
