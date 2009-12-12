Received: from wam.ukma.de ([188.40.105.250])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mattheis@ukma.de>) id 1NJa3V-0003Zs-Js
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 23:03:16 +0100
Received: from wam.ukma.de (localhost [127.0.0.1])
	by wam.ukma.de (Postfix) with ESMTP id 1615749E4E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 22:56:17 +0100 (CET)
Received: from ws.ukma.de (ws.ukma.local [172.16.20.10])
	by wam.ukma.de (Postfix) with ESMTP id F2E4E49B9E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 22:56:16 +0100 (CET)
Received: from ws.ukma.de ([172.16.20.10]) by ws ([172.16.20.10]) with mapi;
	Sat, 12 Dec 2009 22:56:48 +0100
From: Konrad Mattheis <mattheis@ukma.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 12 Dec 2009 22:55:34 +0100
Thread-Topic: recipe for libgdiplus
Thread-Index: Acp7ddTWg2hxfaPHRU6Y7J85lAJqhg==
Message-ID: <F32E8C2599F37641BB4E3F3AC4A3C412016E0369E56F@ws>
Accept-Language: de-DE, de-LU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: BOU= ANlu BEkz Bz07 CDWm Csth Ct+w DO42 EQaM EX/4 Ed6V
	Ijq0 Iqr5 JlLc KOov LSt6; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {D9047D33-A0E8-46CD-AD72-F3C9EC50CDA9};
	bQBhAHQAdABoAGUAaQBzAEAAdQBrAG0AYQAuAGQAZQA=; Sat,
	12 Dec 2009 21:55:34
	GMT;cgBlAGMAaQBwAGUAIABmAG8AcgAgAGwAaQBiAGcAZABpAHAAbAB1AHMA
x-cr-puzzleid: {D9047D33-A0E8-46CD-AD72-F3C9EC50CDA9}
acceptlanguage: de-DE, de-LU
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 188.40.105.250
X-SA-Exim-Mail-From: mattheis@ukma.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: recipe for libgdiplus
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
X-List-Received-Date: Sat, 12 Dec 2009 22:03:16 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

try to build a recipe for libgdiplus. This is a library which you need
if you want to get Winforms with mono working.

A lot of stuff is already working but it always stops because it=20
don't find the "glib.h"

In this headerfiles basic types of the glib are described.
see:
http://library.gnome.org/devel/glib/unstable/glib-Basic-Types.html

I already wrote in my recipe:

DEPENDS =3D "... glib-2.0 ..." but I don't solve the problem.

Any ideas??

bye
Konrad


