Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Phlfb-0001Dw-0k
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:23:03 +0100
Received: by wyb40 with SMTP id 40so5753424wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:22:16 -0800 (PST)
Received: by 10.227.134.21 with SMTP id h21mr6089002wbt.114.1295972536696;
	Tue, 25 Jan 2011 08:22:16 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id b30sm7248270wen.25.2011.01.25.08.22.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 08:22:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110125161839.GC24126@lit.local.igalia.com>
Date: Tue, 25 Jan 2011 17:22:15 +0100
Message-Id: <A2C2D135-842E-4C4B-B734-0B77ED582354@dominion.thruhere.net>
References: <1295970665-14658-1-git-send-email-vjaquez@igalia.com>
	<44B46FD7-B8AF-4FD7-9964-A6FDE847BE46@dominion.thruhere.net>
	<20110125161839.GC24126@lit.local.igalia.com>
To: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-scons_1.3.0: add missing dependencies
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
X-List-Received-Date: Tue, 25 Jan 2011 16:23:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jan 2011, om 17:18 heeft V=EDctor M. J=E1quez L. het volgende =
geschreven:

> On Tue, Jan 25, 2011 at 04:59:25PM +0100, Koen Kooi wrote:
>> Some small nitpicks, see below
>>=20
>> Op 25 jan 2011, om 16:51 heeft V=EDctor Manuel J=E1quez Leal het =
volgende geschreven:
>>=20
>>> In order to launch scons in a board it depends on a couple python =
packages
>>> which were not managed by the recipe.
>>>=20
>=20
> [snip]
>=20
>>=20
>> We generally put variables in the order OE uses them, so RDEPENDS =
should go
>> next to do_package/FILES/etc. Historically it was on top, but that =
stopped
>> making sense after switching to RDEPENDS_${PN}
>=20
> Done.
>=20
>>=20
>>> LICENSE =3D "GPL"
>>=20
>> Could you fix that while you're at it? It would be  nice to know if =
it's
>> GPLv2 or GPLv2+.
>=20
> Verified. It is MIT not GPL!

Good catch!

>=20
>>=20
>> Other than that, the patch looks OK to me[1].
>>=20
>> regards,
>>=20
>> Koen
>>=20
>> [1] Sconstructs still make my eyes bleed, but that's not the point
>=20
> I do not like it either at all, but v8 uses it.
>=20
> vmjl



