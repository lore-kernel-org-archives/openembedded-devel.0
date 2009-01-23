Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LQPJG-0006Zb-Bp for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 17:55:10 +0100
Received: from usy90mx04.tycoelectronics.net ([163.241.175.14]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Fri, 23 Jan 2009 11:47:46 -0500
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	usy90mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 23 Jan 2009 11:47:46 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Fri, 23 Jan 2009 11:47:46 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.336.0; Fri, 23 Jan 2009 11:47:45 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Fri, 23 Jan 2009 11:47:45 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jan 2009 11:47:43 -0500
Thread-Topic: Package fetch error
Thread-Index: Acl9ek/+RWZVxOblQ1SbhMX4zuUoeQ==
Message-ID: <CF7FB0793253794F9F45991443E5FE2004DFC46711@us194mx002.tycoelectronics.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jan 2009 16:47:46.0290 (UTC)
	FILETIME=[51756520:01C97D7A]
Subject: Package fetch error
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
X-List-Received-Date: Fri, 23 Jan 2009 16:55:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to resolve a problem with bitbake package fetch.  I have a prox=
y server and the proxydirect server works for bitbake up to the libXCursor-=
1.1.9.tar.bz2 fetch then it times out after resolving the www.angstrom-dist=
ribution.org to the IP address 85.214.40.226:

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "a84937cc8fbbe013c2671b890db69d3fb7a3fc7d"
TARGET_ARCH       =3D "arm"                                    =20
TARGET_OS         =3D "linux-gnueabi"                          =20
MACHINE           =3D "at91sam9261ek"                          =20
DISTRO            =3D "angstrom"                               =20
DISTRO_VERSION    =3D "2009.X-test-20090123"                   =20
TARGET_FPU        =3D "soft"                                   =20
...
...

Retrying.
--2009-01-23 11:32:07--  (try: 5)  http://www.angstrom-distribution.org/uns=
table/sources/libXcursor-1.1.9.tar.bz2
--2009-01-23 11:32:07--  (try: 5)  http://www.angstrom-distribution.org/uns=
table/sources/jasper-1.900.1.zip
Connecting to www.angstrom-distribution.org|85.214.40.226|:80... Connecting=
 to www.angstrom-distribution.org|85.214.40.226|:80... failed: Connection t=
imed out.
failed: Connection timed out.
Giving up.

Giving up.

From another terminal:


[us075929@rum downloads]$ wget http://85.214.40.226/unstable/sources/libXcu=
rsor-1.1.9.tar.bz2
--2009-01-23 11:28:21--  http://85.214.40.226/unstable/sources/libXcursor-1=
.1.9.tar.bz2
Resolving proxydirect.tycoelectronics.com... 163.241.128.137
Connecting to proxydirect.tycoelectronics.com|163.241.128.137|:80... connec=
ted.
Proxy request sent, awaiting response... 404 Not Found
2009-01-23 11:28:22 ERROR 404: Not Found.

[us075929@rum downloads]$ ping 85.214.40.226
PING 85.214.40.226 (85.214.40.226) 56(84) bytes of data.
64 bytes from 85.214.40.226: icmp_seq=3D1 ttl=3D47 time=3D105 ms
64 bytes from 85.214.40.226: icmp_seq=3D2 ttl=3D47 time=3D105 ms
64 bytes from 85.214.40.226: icmp_seq=3D3 ttl=3D47 time=3D105 ms
^C
--- 85.214.40.226 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2880ms
rtt min/avg/max/mdev =3D 105.428/105.605/105.955/0.362 ms

Using the url it works:
[us075929@rum downloads]$ wget http://www.angstrom-distribution.org/unstabl=
e/sources/libXcursor-1.1.9.tar.bz2
--2009-01-23 11:30:12--  http://www.angstrom-distribution.org/unstable/sour=
ces/libXcursor-1.1.9.tar.bz2
Resolving proxydirect.tycoelectronics.com... 163.241.128.137
Connecting to proxydirect.tycoelectronics.com|163.241.128.137|:80... connec=
ted.
Proxy request sent, awaiting response... 200 OK
Length: 234749 (229K) [application/x-bzip2]
Saving to: `libXcursor-1.1.9.tar.bz2'

100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 234,749     50.9K/s   in 4.5s

2009-01-23 11:30:17 (50.9 KB/s) - `libXcursor-1.1.9.tar.bz2' saved [234749/=
234749]


The other question is why does it try to download at all since I did the do=
wnload from the command line and the checksum matches the checksum in the c=
hecksums file.


--John
 =


