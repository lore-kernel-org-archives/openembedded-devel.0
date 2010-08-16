Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OktpX-00023R-B2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 09:10:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id A2B674000778E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 09:09:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 9A8DD400057FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 09:09:42 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lu0a8DvVck3O
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 09:09:42 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 28EFA4000778E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 09:09:42 +0200 (CEST)
Message-ID: <4C68E471.7010206@gmx.net>
Date: Mon, 16 Aug 2010 09:10:41 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<4C68BDBF.1090008@mwester.net>
In-Reply-To: <4C68BDBF.1090008@mwester.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 07:10:10 -0000
X-Groupsio-MsgNum: 22216
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF6C6CE1656205E8CE255B261"

--------------enigF6C6CE1656205E8CE255B261
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I added this docbook stuff once. My source to understand how it is to be
built was linuxfromscratch.org. So one should have a look at this
again I think.

Chaning the version of the DTD should be fine. If it is incompatible you
would get loads of errors. :-)

Regards
Robert

Am 16.08.2010 06:25, schrieb Mike Westerhof:
> Frans Meulenbroeks wrote:
> ...
>  =20
>> Anyway, if there are issues because of this action, or if you feel
>> removal of a recipe was not in accordance with the TSC guidelines, let=

>> me know and I'll repair.
>>    =20
> Well, here's the first one, docbook-sgml-dtd-3.1-native, full log below=
:
>
> . ./setup-env; exec bitbake -k "slugos-packages"
> NOTE: Handling BitBake files: / (7840/7840) [100 %]
> NOTE: Parsing finished. 7266 cached, 496 parsed, 78 skipped, 1 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for u-boot (u-boot, u-boot-omap3=
pandora);
> NOTE: consider defining PREFERRED_PROVIDER_u-boot
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime enti=
ty 'virtual/arm-linux-gnueabi-gcc-2.95' but it wasn't found in any PACKAG=
E or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-gcc-2.95' is unbuildabl=
e, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueab=
i-gcc-2.95']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime enti=
ty 'virtual/arm-linux-gnueabi-depmod-' but it wasn't found in any PACKAGE=
 or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-' is unbuildable=
, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueab=
i-depmod-']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime enti=
ty 'virtual/arm-linux-gnueabi-depmod-1.0' but it wasn't found in any PACK=
AGE or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-1.0' is unbuilda=
ble, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueab=
i-depmod-1.0']
> NOTE: Runtime target 'iputils-arping' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-arping', 'docboo=
k-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'task-proper-tools' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['task-proper-tools', 'ipu=
tils-arping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils-ping6' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-ping6', 'docbook=
-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils-ping' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-ping', 'docbook-=
utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils', 'docbook-utils=
-native', 'docbook-sgml-dtd-3.1-native']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime enti=
ty 'docbook-sgml-dtd-3.1-native' but it wasn't found in any PACKAGE or RP=
ROVIDES variables
> NOTE: Runtime target 'docbook-sgml-dtd-3.1-native' is unbuildable, remo=
ving...
> Missing or unbuildable dependency chain was: ['docbook-sgml-dtd-3.1-nat=
ive']
> NOTE: Preparing runqueue
> ERROR: All buildable tasks have been run but the build is incomplete (-=
-continue mode). Errors for the tasks that failed will have been printed =
above.
>
>
> -Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20



--------------enigF6C6CE1656205E8CE255B261
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkxo5HEACgkQG9cfwmwwEtrEiwCgjeolz+wEV8DYx29w7+pAjtJA
UVEAn3Cv+hdTrDpK4TprODMFWLg7anPT
=6ucd
-----END PGP SIGNATURE-----

--------------enigF6C6CE1656205E8CE255B261--
