Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qh8t3-0003nE-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 01:30:37 +0200
Received: (qmail 15884 invoked by uid 501); 13 Jul 2011 16:26:33 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13316. avast: v3.2.0/110712-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.030067 secs); 13 Jul 2011 23:26:33 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 13 Jul 2011 16:26:33 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 14 Jul 2011 11:26:31 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04AD2583@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Errors on fetching files
Thread-Index: AcxBtExly/vNi83sSXGI/YQ7IQnTLA==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Errors on fetching files
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
X-List-Received-Date: Wed, 13 Jul 2011 23:30:38 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Guys,

I am getting the following fetch errors when trying to compile ..
I am behind a http proxy so have made sure the wget, svn,cvs,ftp,git etc
work ... and they do on the command line, however I am still getting
these errors.

A dump of the current error is below ..

If I "wget" the file it is complaining about and install it in the
~/sources directory and add an md5checksum file as well, it gets past
this error next time I run .... Until the next time.
So the question is if wget works from the command line why does it not
work from bitbake .... Unless it uses another method to get the file,
but I see nothing in the .bb file to indicate what
program is used ..

Any and all help appreciated.

Thanks,
Bernie


------------------------------------------------------------------------
--------------------------------------
METADATA_REVISION =3D "b59743b"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "mx31ads"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.07"
TARGET_FPU        =3D "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 114 of 606 (ID: 571,=20
virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3_
3.6.23.1.bb,=20
do_fetch)
--2011-07-14 11:17:29--  http://www.sqlite.org/sqlite-3.6.23.1.tar.gz
NOTE: package sqlite3-native-3.6.23.1-r4.0: task do_fetch: Started
 Resolving www.sqlite.org... 67.18.92.124
 Connecting to www.sqlite.org|67.18.92.124|:80... failed: Connection
refused.
 --2011-07-14 11:17:30--
http://mirrors.openembedded.org/sqlite-3.6.23.1.tar.gz
 Resolving mirrors.openembedded.org... 82.197.159.157
 Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed:
Connection refused.
 --2011-07-14 11:17:30--
http://sources.openembedded.org/sqlite-3.6.23.1.tar.gz
 Resolving sources.openembedded.org... 140.211.169.165
 Connecting to sources.openembedded.org|140.211.169.165|:80... failed:
Connection refused.
 --2011-07-14 11:17:30-- =20
http://www.angstrom-distribution.org/unstable/sources/sqlite-3.6.23.1.ta
r.gz
 Resolving www.angstrom-distribution.org... 188.40.83.200
 Connecting to www.angstrom-distribution.org|188.40.83.200|:80...
failed: Connection=20
refused.
NOTE: package sqlite3-native-3.6.23.1-r4.0: task Fetch failed: Unable to
fetch URL=20
http://www.sqlite.org/sqlite-3.6.23.1.tar.gz from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL=20
http://www.sqlite.org/sqlite-3.6.23.1.tar.gz from any source.' failed
ERROR: Task 571=20
(virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3
_3.6.23.1.bb,=20
do_fetch) failed with exit code '1'
ERROR:
'virtual:native:/home/bmentink/devel/openembedded/recipes/sqlite/sqlite3
_3.6.23.1.bb'=20
failed
------------------------------------------------------------------------
-------------------------------------------
Bernard Mentink=20
Caterpillar Trimble Control Technologies=20
P.O. Box 8729, Riccarton=20
11 Birmingham Drive, Christchurch=20
New Zealand=20
Phone +64-3-9635335=20
Fax +64-3-9635417=20
Email bmentink@trimble.co.nz




