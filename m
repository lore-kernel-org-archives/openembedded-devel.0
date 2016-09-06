Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B0AA67765E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 21:39:31 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1bhO5b-0006Sl-SF from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2016 14:39:31 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) with mapi id
	14.03.0224.002; Tue, 6 Sep 2016 14:39:31 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] xpext: Allow the main package to be empty.
Thread-Index: AQHSCG5paeT9itulIECs94uIMt013KBtaZYAgAAJMgA=
Date: Tue, 6 Sep 2016 21:39:30 +0000
Message-ID: <0600B56D-FD90-4397-9F8B-52F6FD26FA62@mentor.com>
References: <20160906184155.23608-1-drew_moseley@mentor.com>
	<20160906210636.GC2645@jama>
In-Reply-To: <20160906210636.GC2645@jama>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] xpext: Allow the main package to be empty.
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
X-List-Received-Date: Tue, 06 Sep 2016 21:39:34 -0000
X-Groupsio-MsgNum: 62989
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C2ACCFEF-1F49-4B84-84DA-79F3BF9DD2F8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C2ACCFEF-1F49-4B84-84DA-79F3BF9DD2F8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 6, 2016, at 5:06 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Tue, Sep 06, 2016 at 02:41:55PM -0400, Drew Moseley wrote:
>> If xpext is included in a build (ie via dependency on mpv) then
>> builds of core-image-sato-sdk will fail with errors such as below.
>>=20
>> Allowing the package to be empty fixes this.
>>=20
>>     warning: Can't install mpv-dev-0.15.0-r0@i586: Can't install =
xpext-dev-1.0+5-r0@i586: no package provides xpext =3D 1.0+5-r0
>=20
> Isn't it better to disable this dependency from xpext-dev than to
> install completely useless empty image into the image?

Probably so.  Thanks for the suggestion.  Looks like:

	=
http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dd523cc183903fd0=
bc2e53af6af99a88ea1652e0d =
<http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dd523cc183903fd=
0bc2e53af6af99a88ea1652e0d>

is probably a similar solution.  I=E2=80=99ll submit an update.

Drew


--Apple-Mail=_C2ACCFEF-1F49-4B84-84DA-79F3BF9DD2F8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iD8DBQFXzzeT++E4Rrql4XYRAmnvAKCrj9cbtt+dH/NZrwVoBSTzTG4AUgCfdrJh
j2FY0QVlQPfX6hDr5Pvl45Y=
=qceK
-----END PGP SIGNATURE-----

--Apple-Mail=_C2ACCFEF-1F49-4B84-84DA-79F3BF9DD2F8--
