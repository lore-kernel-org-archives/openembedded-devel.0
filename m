Received: from [198.175.154.225] (helo=us194mx04.tycoelectronics.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john.charlton@tycoelectronics.com>)
	id 1LRXnE-0001x6-Gv
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 21:10:48 +0100
Received: from us194mx11.tycoelectronics.net ([163.241.185.106]) by
	us194mx04.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.2499); 
	Mon, 26 Jan 2009 15:03:17 -0500
Received: from us194mx07.tycoelectronics.net ([163.241.185.38]) by
	us194mx11.tycoelectronics.net with Microsoft SMTPSVC(6.0.3790.1830); 
	Mon, 26 Jan 2009 15:03:17 -0500
Received: from us194mx002.tycoelectronics.net (163.241.202.108) by
	us194mx07.tycoelectronics.net (163.241.185.38) with Microsoft SMTP
	Server (TLS) id 8.1.336.0; Mon, 26 Jan 2009 15:03:16 -0500
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx002.tycoelectronics.net ([163.241.202.108]) with mapi;
	Mon, 26 Jan 2009 15:03:16 -0500
From: "Charlton, John" <john.charlton@tycoelectronics.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Date: Mon, 26 Jan 2009 15:03:14 -0500
Thread-Topic: [oe] Package fetch error
Thread-Index: Acl9sw7FULIGdx+OQvSPRCFtqh5xdQCCU/swAAoWnFA=
Message-ID: <CF7FB0793253794F9F45991443E5FE2004E3A8C128@us194mx002.tycoelectronics.net>
References: <CF7FB0793253794F9F45991443E5FE2004DFC46711@us194mx002.tycoelectronics.net>
	<loom.20090123T230426-652@post.gmane.org>
	<CF7FB0793253794F9F45991443E5FE2004E3A8BEA5@us194mx002.tycoelectronics.net>
In-Reply-To: <CF7FB0793253794F9F45991443E5FE2004E3A8BEA5@us194mx002.tycoelectronics.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jan 2009 20:03:17.0085 (UTC)
	FILETIME=[20CBE8D0:01C97FF1]
Subject: Re: Package fetch error
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
X-List-Received-Date: Mon, 26 Jan 2009 20:10:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I relealized after sending the last message that when I copied the destinat=
ion path into the wget -P option, I mistakenly put the source path for jasp=
er_1.900.1.bb which resulted in clobbering the jasper_1.900.1.bb source and=
 causing some other build problems. Otherwise the fetch results are the sam=
e.

The fetch problem does not occur when I put both the libXcursor-1.1.9.tar.b=
z2 and libXcursor-1.1.9.tar.bz2.md5 in the downloads directory where I crea=
te the .md5.  Is bitbake supposed to compute its own .md5 file or does it n=
eed to find that on the same server as the tar archive?  I notice that the =
.md5 files are missing for the downloads that I am having problems with.

--John

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Charlton, John
Sent: Monday, January 26, 2009 9:00 AM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] Package fetch error

Jeremy,

Thank you for the tips.  If I download and create the md5 checksum files fo=
r the two problem files http://www.angstrom-distribution.org/unstable/sourc=
es/jasper-1.900.1.zip
And
http://www.angstrom-distribution.org/unstable/sources/libXcursor-1.1.9.tar.=
bz2

bitbake x11-image gets past those files but has the same problem fetching d=
ifferent files.  Here are the results from the fetch command you asked me t=
o try (if I use the named url as the second try it works whereas if I use t=
he IP number it fails):

[us075929@rum openembedded]$ /usr/bin/env wget -t 5 --passive-ftp -P /home/=
us075929/projects/oe/openembedded/packages/jpeg/jasper_1.900.1.bb http://85=
.214.40.226/unstable/sources/jasper-1.900.1.zip
--2009-01-26 08:21:12--  http://85.214.40.226/unstable/sources/jasper-1.900=
.1.zip
Resolving proxydirect.tycoelectronics.com... 163.241.128.137 Connecting to =
proxydirect.tycoelectronics.com|163.241.128.137|:80... connected.
Proxy request sent, awaiting response... 404 Not Found
2009-01-26 08:21:13 ERROR 404: Not Found.

[us075929@rum openembedded]$ /usr/bin/env wget -t 5 --passive-ftp -P /home/=
us075929/projects/oe/openembedded/packages/jpeg/jasper_1.900.1.bb http://ww=
w.angstrom-distribution.org/unstable/sources/jasper-1.900.1.zip
--2009-01-26 08:22:16--  http://www.angstrom-distribution.org/unstable/sour=
ces/jasper-1.900.1.zip
Resolving proxydirect.tycoelectronics.com... 163.241.128.137 Connecting to =
proxydirect.tycoelectronics.com|163.241.128.137|:80... connected.
Proxy request sent, awaiting response... 200 OK
Length: 1415752 (1.3M) [application/zip] Saving to: `/home/us075929/project=
s/oe/openembedded/packages/jpeg/jasper_1.900.1.bb/jasper-1.900.1.zip'

100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 1,415,752   82.5K/s   in 18s

2009-01-26 08:22:35 (76.4 KB/s) - `/home/us075929/projects/oe/openembedded/=
packages/jpeg/jasper_1.900.1.bb/jasper-1.900.1.zip' saved [1415752/1415752]


I don't know where the IP number gets substituted for the url in the fetch =
command but that seems to be the problem.  It may have something to do with=
 my proxydirect configuration though I have not changed that and it has wor=
ked up until now.

--John

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Jeremy Williams
Sent: Friday, January 23, 2009 6:12 PM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] Package fetch error

Charlton, John <john.charlton <at> tycoelectronics.com> writes:

>=20
> I am trying to resolve a problem with bitbake package fetch.  I have a=20
> proxy
server and the proxydirect server
> works for bitbake up to the libXCursor-1.1.9.tar.bz2 fetch then it=20
> times out
after resolving the
> www.angstrom-distribution.org to the IP address 85.214.40.226:

There are two sites hosted at that IP:

>nslookup linux-to-go.org

Non-authoritative answer:
Name:    linux-to-go.org
Address:  85.214.40.226


>nslookup angstrom-distribution.org

Non-authoritative answer:
Name:    angstrom-distribution.org
Address:  85.214.40.226

If you to http://85.214.40.226 in your browser, the default site is linux-t=
o-go.org, which caused the failure when retrieving by IP.  This means when =
retrieving via bitbake, for some reason the host headers are not being sent=
.

The fetch command for http:// is
"/usr/bin/env wget -t 5 --passive-ftp -P {DEST_DIR} {url}"

If you issue this from the command line using the www.angstrom-distribution=
.org url does it fail?

-jeremy





_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


