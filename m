Received: from wam.ukma.de ([188.40.105.250])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mattheis@ukma.de>) id 1Nz3Sd-0005Bj-DL
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 09:44:59 +0200
Received: from wam.ukma.de (localhost [127.0.0.1])
	by wam.ukma.de (Postfix) with ESMTP id 97FA24A2E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Apr 2010 09:30:05 +0200 (CEST)
Received: from ws.ukma.de (ws.ukma.local [172.16.20.10])
	by wam.ukma.de (Postfix) with ESMTP id 7797E4A2E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Apr 2010 09:30:05 +0200 (CEST)
Received: from ws.ukma.de ([172.16.20.10]) by ws ([172.16.20.10]) with mapi;
	Tue, 6 Apr 2010 09:37:31 +0200
From: Konrad Mattheis <mattheis@ukma.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Apr 2010 09:34:34 +0200
Thread-Topic: missing tzdata2010g.tar.gz
Thread-Index: AcrVW5qPS1OXByCiQjeIBvz+tMabvw==
Message-ID: <F32E8C2599F37641BB4E3F3AC4A3C412016EC4AC6488@ws>
Accept-Language: de-DE, de-LU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: ans= 4s0= AL2m A9zz Bd9C EbCF Ex9n FBK2 FnKo F0Mu GBG7
	GDLH IMz7 If/9 LSJX LT2o; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {F2298CB8-8AD5-4F7A-8B81-9D2DBBB9D85C};
	bQBhAHQAdABoAGUAaQBzAEAAdQBrAG0AYQAuAGQAZQA=; Tue,
	06 Apr 2010 07:34:34 GMT;
	bQBpAHMAcwBpAG4AZwAgAHQAegBkAGEAdABhADIAMAAxADAAZwAuAHQAYQByAC4AZwB6AA==
x-cr-puzzleid: {F2298CB8-8AD5-4F7A-8B81-9D2DBBB9D85C}
acceptlanguage: de-DE, de-LU
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 188.40.105.250
X-SA-Exim-Mail-From: mattheis@ukma.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: missing tzdata2010g.tar.gz
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
X-List-Received-Date: Tue, 06 Apr 2010 07:45:00 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I tried a complete rebuild of "x11-image" and it stopped because it can't d=
ownload
the file:


####Resolving elsie.nci.nih.gov... 137.187.215.78
####Connecting to elsie.nci.nih.gov|137.187.215.78|:21... connected.
####Logging in as anonymous ... Logged in!
####=3D=3D> SYST ... done.    =3D=3D> PWD ... done.
####=3D=3D> TYPE I ... done.  =3D=3D> CWD /pub ... done.
####=3D=3D> SIZE tzdata2010g.tar.gz ... done.
####=3D=3D> PASV ... done.    =3D=3D> REST 188032 ... done.   =20
####=3D=3D> RETR tzdata2010g.tar.gz ...=20
####No such file `tzdata2010g.tar.gz'.
####
####NOTE: fetch http://mirrors.openembedded.org//tzdata2010g.tar.gz
####--2010-04-06 07:30:10--  http://mirrors.openembedded.org//tzdata2010g.t=
ar.gz
####Resolving mirrors.openembedded.org... 82.197.159.157
####Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
####HTTP request sent, awaiting response... 404 Not Found
####2010-04-06 07:30:11 ERROR 404: Not Found.

I don't know if you like to update the recipe to the new file tzdata2010h.t=
ar.gz or if
you more like to add this file to your mirrors (http://mirrors.openembedded=
.org/, ...)
If you need this file for the mirror you can download it here:

http://download.lunar-linux.org/lunar/mirrors/tzdata2010g.tar.gz

bye
Konrad



