Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1KazRg-0004A6-Jz
	for openembedded-devel@openembedded.org; Wed, 03 Sep 2008 22:59:20 +0200
Received: from [172.20.1.5] (vpn006020.vpn.utwente.nl [130.89.6.20])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m83KunSn018908; Wed, 3 Sep 2008 22:56:50 +0200
Message-Id: <9EE659E5-DBBA-48B8-99B9-0E2F1C6BC522@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: "Edward Cherlin" <echerlin@gmail.com>
In-Reply-To: <e574f6eb0809031314q723bb96elad9393751b39c204@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v926)
Date: Wed, 3 Sep 2008 22:56:47 +0200
References: <1219364965.7212.319.camel@dfarning.desktop.org>
	<6051830F-D75C-4B5F-8509-1C06F23450FF@student.utwente.nl>
	<e574f6eb0809031314q723bb96elad9393751b39c204@mail.gmail.com>
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.926)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	beagleboard <beagleboard@googlegroups.com>,
	Jason Kridner <jdk@ti.com>, Sugar List <sugar@laptop.org>
Subject: Re: [sugar] Sugar on the BeagleBoard using the OpenEmbedded toolkit.
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
X-List-Received-Date: Wed, 03 Sep 2008 20:59:20 -0000
X-Groupsio-MsgNum: 5830
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-19--497444722"
Content-Transfer-Encoding: 7bit

--Apple-Mail-19--497444722
Content-Type: text/plain; charset=UTF-8; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable


Op 3 sep 2008, om 22:14 heeft Edward Cherlin het volgende geschreven:

> On Mon, Sep 1, 2008 at 3:57 AM, Koen Kooi =20
> <k.kooi@student.utwente.nl> wrote:
>>
>> Op 22 aug 2008, om 02:29 heeft David Farning het volgende geschreven:
>>
>>> Welcome to the Sugar on the BeagleBoard project.  It seems that we =20=

>>> have
>>> all of the pieces in place to do a port.
>
> Very good. Thank you.

<snip>

> I assume that OE is intended to be all Free Software

OE is 'merely' a buildsystem (something like gentoos portage or GNOMEs =20=

jhbuild) and its metadata is MIT licensed.

> , and I see
> scattered references to GPL 2 in the Wiki, but I don't see a clear
> statement on licensing on the main page or in the FAQ. Can somebody
> write one?

I'm unsure what is needed beyond the COPYING.MIT in topdir of the =20
repository. The licensing of your buildsystem should have no bearing =20
on the resulting distribution.

> Also, one or more architecture pages showing the toolchain,
> relationships with other Free Software projects, and the structure of
> the resulting builds?

As a buildsystem OE has relationships with the interpreter used =20
(bitbake, hosted at berlios) and it's users (angstrom, nslu2-linux, =20
openmoko, etc).

I suspect you are confusing OE with a distribution (which angstrom =20
is), it is not a distro, it's a distro builder :) If you aren't =20
confusing it, please elaborate on what you want to know so we can send =20=

the doc team to fix it.

regards,

Koen


>>> First, some background.
>>>
>>> The initial port will be getting Sugar[1] to run on the =20
>>> Beagleboard[2]
>>> using the Open Embedded[3] toolkit.
>>
>> The basics (sugar, sugar-base, sugar-toolkit, sugar-presence-=20
>> services and
>> sugar-artwork) are now running on the beagleboard:
>>
>> http://www.angstrom-distribution.org/sugar-running-=C3=A5ngstr=C3=B6m
>>
>> To build it using OE: 'bitbake sugar'
>> To install it in angstrom*: 'opkg install sugar'
>>
>> The Glucose pack is missing sugar-datastore (needs a lot of python =20=

>> modules
>> that aren't in OE yet), etoys (haven't looked at that yet) and =20
>> journal
>> (haven't looked at that either).
>> The Fructose pack is completely missing in OE.
>>
>> The remaining tasks for people wanting to work on this are:
>>
>> 1) add OE recipes for needed python-modules
>> 2) add OE recipes for remaining Glucose items
>> 3) add OE recipes for Fructose items
>> 4) build it
>> 5) install resulting packages and run them, see them crash due to =20
>> missing
>> python modules, goto 1
>> 6) make screenshots :)
>>
>> regards,
>>
>> Koen
>>
>> * only has armv7a packages at the moment
>> _______________________________________________
>> Sugar mailing list
>> Sugar@lists.laptop.org
>> http://lists.laptop.org/listinfo/sugar
>>
>>
>
>
>
> --=20
> Silent Thunder [ =E9=BB=98=E9=9B=B7 / =E0=A4=B6=E0=A4=AC=E0=A5=8D=E0=A4=A6=
=E0=A4=97=E0=A4=B0=E0=A5=8D=E0=A4=9C / =D8=B4=D8=A8=D8=AF=DA=AF=D8=B1 =D8=AC=
 ] =20
> is my name,
> And Children are my nation.
> The Six Worlds are my dwelling place,
> And Truth my destination.


--Apple-Mail-19--497444722
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFIvvoRMkyGM64RGpERAm5kAJ9DEsX0WNFZuFmBehALB/F9dYXvfgCgj4i7
wYu6gd7vFywcpVOx2UDyMFs=
=qe7f
-----END PGP SIGNATURE-----

--Apple-Mail-19--497444722--
