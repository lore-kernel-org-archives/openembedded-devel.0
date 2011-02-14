Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PoyDe-0005Uy-73
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 14:11:58 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id p1EDAnE6002636
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 14:10:49 +0100
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p1EDAmJf027062
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 14:10:49 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.227]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Mon, 14 Feb 2011 14:10:48 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Feb 2011 14:10:47 +0100
Thread-Topic: [oe] libpcre not compiling
Thread-Index: Acu+VVkM/+aBUgC7RzqwU8O5aZlNzQAa20cQA1yCDBAABUVqAA==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E011A8B5B49@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
	<AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED682ECBB@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: libpcre not compiling
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
X-List-Received-Date: Mon, 14 Feb 2011 13:11:58 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Searching in the list's archives, I found that a very similar problem has a=
lready been fixed 10 moths ago by Richard Purdie (was for abiword):

http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/019536.htm=
l

In that mail, Richard said:
  > this commit should fix it (reproduced and tested locally):
  >
  > http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=3Drpurdie/w=
ork-in-progress&id=3Dbb53e48f79dab0877c8b8ce487a051d29cae31e3

Unfortunately, the link is bad and neither can I found a commit with this i=
d in git.

Richard, do you remember your fix?

With kind regards,
  Fabrice

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Aeschbacher, Fabrice
> Gesendet: Montag, 14. Februar 2011 11:43
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] libpcre not compiling
>=20
> Hi,
>=20
> I already reported that libpcre (7.6-r8) does not compile in=20
> released version 2010.12 :
>=20
> | /bin/grep: /usr/lib/libstdc++.la: No such file or directory
> |=20
> /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin
> /sed: can't read /usr/lib/libstdc++.la: No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link:=20
> `/usr/lib/libstdc++.la' is not a valid libtool archive
>=20
> Now I just figured out that neither does gnutls-2.10.2-r10.1 :
>=20
> |=20
> /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin
> /sed: can't read /usr/lib/libstdc++.la: No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link:=20
> `/usr/lib/libstdc++.la' is not a valid libtool archive
>=20
> This seems to be pretty much the same issue.
> Any idea?
>=20
> With kind regards,
> Fabrice Aeschbacher
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


