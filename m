Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LDh9y-00051P-Bg for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 16:21:02 +0100
Received: from usy90mx04.tycoelectronics.net ([163.241.175.14]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Fri, 19 Dec 2008 10:16:12 -0500
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	usy90mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 19 Dec 2008 10:16:10 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 19 Dec 2008 10:16:10 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.291.1; Fri, 19 Dec 2008 10:16:10 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Fri, 19 Dec 2008 10:16:10 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: Xenomai help <xenomai-help@gna.org>
Date: Fri, 19 Dec 2008 10:16:09 -0500
Thread-Topic: Xenomai OpenEmbedded cross compile test applications
Thread-Index: AclhOmQvD5XBQcrvSACvy7D0lM9zsQAnhxdQ
Message-ID: <CF7FB0793253794F9F45991443E5FE2003C951B97F@us194mx002.tycoelectronics.net>
References: <8b216e9e0812180831n6ebf4ff1gcb990864ba112eab@mail.gmail.com>
	<494A7ED0.8090008@xenomai.org>
	<8b216e9e0812180943v1ecc3fcasb45732cd9a58cde2@mail.gmail.com>
	<494A8F3E.9090906@xenomai.org>
In-Reply-To: <494A8F3E.9090906@xenomai.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Dec 2008 15:16:10.0264 (UTC)
	FILETIME=[B91D2180:01C961EC]
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Xenomai OpenEmbedded cross compile test applications
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
X-List-Received-Date: Fri, 19 Dec 2008 15:21:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Using the cross compile environment for OpenEmbedded i686 angstrom of xenom=
ai-2.4.4 described below I built the xenomai test application trivial-perio=
dic in xenomai-2.4.4/examples/native.  I copied the executable to the targe=
t system.  Since there is no /etc/ld.so.conf.d directory in the OE root fil=
e system, I made one and put the xenomai library path in the xenomai.conf f=
ile.  The xenomai.conf file just has the one directory: /usr/local/lib whic=
h does not even exist in the target file system.  I modified xenomai.conf t=
o: /usr/xenomai/lib where the xenomai library files are actually located.  =
I also copied xenomai.conf to /etc and set LD_LIBRARY_PATH=3D/usr/xenomai/l=
ib.

When I execute the trivail-periodic application on the target (NANO-7240) t=
he console hangs and nothing happens.  I also ran trivial-periodic on a non=
 cross compiled laptop build of xenomai and it runs as expected displaying =
the times on the console output. I login to the target using ssh and it is =
alive.  The trivial-periodic process shows up in the ps list as:
 3077 root            Z   [trivial-periodi]
So it is a zombie.  I can kill it with kill -9 3077 and that releases the c=
onsole.
Any help on this issue is welcome.

Also, how do I run the xenomai/src/testsuite applications in a target (non =
build) environment?

Background:
I have applied the xenomai 2.4.4 patch to kernel 2.6.25.11.  I built the ke=
rnel and installed it on a ext2 flash partition and it boots on the target =
system. The /proc/xenomai directory shows up so xenomai seems to be running=
.  I built the xenomai user mode with the following commands:

Set the following:
export XENOMAI_ROOT=3D/home/us075929/projects/oe/xenomai-2.4.4
export XENOMAI_BUILD=3D/home/us075929/projects/oe/build-xenomai-2.4.4

cd $XENOMAI_BUILD
$XENOMAI_ROOT/configure --disable-x86-tsc --host=3Di686-angstrom-linux

I am not sure what tsc refers to.  The only two parameters in my kernal con=
figuration that come up are 'time stamp counter' and 'touch screen device s=
upport' both of which are disabled.  Since TSC is enabled by default and st=
rong binding I disabled it in the xenomai configuration.

The xenomai configure goes smoothly.  I then install xenomai user support t=
o a staging directory as follows:

export DESTDIR=3D/home/us075929/projects/oe/staging-linux-2.6.25.11

cd $XENOMAI_BUILD
make install

The $DESTDIR/dev and $DESDIR/usr/xenomai are installed as expected.  I copy=
 those directories to the target root file system, boot the target and run =
the trivial-periodic application as described above.

--John


