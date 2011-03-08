Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PwwU8-00070D-PY
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 13:58:00 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 2DB9D491282;
	Tue,  8 Mar 2011 13:56:17 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 8 Mar 2011 13:56:17 +0100
Message-ID: <4D76276F.1030804@dresearch.de>
Date: Tue, 08 Mar 2011 13:56:15 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299515323-2246-1-git-send-email-sledz@dresearch.de>	<1299516187-27151-1-git-send-email-sledz@dresearch.de>	<1299517044.2132.203.camel@phil-desktop>	<4D751D09.6000808@mentor.com>	<4D7617B5.1060509@dresearch.de>
	<il56eo$vfc$1@dough.gmane.org>
In-Reply-To: <il56eo$vfc$1@dough.gmane.org>
X-OriginalArrivalTime: 08 Mar 2011 12:56:17.0332 (UTC)
	FILETIME=[36B91740:01CBDD90]
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH v2] gupnp_0.13.4/gupnp-av_0.5.9: disable	introspection
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
X-List-Received-Date: Tue, 08 Mar 2011 12:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 08.03.2011 13:12, schrieb Koen Kooi:
> On 08-03-11 12:49, Steffen Sledz wrote:
>> Am 07.03.2011 18:59, schrieb Tom Rini:
>>> On 03/07/2011 09:57 AM, Phil Blundell wrote:
>>>> On Mon, 2011-03-07 at 17:43 +0100, Steffen Sledz wrote:
>>>>> --- a/recipes/upnp/gupnp_0.13.4.bb
>>>>> +++ b/recipes/upnp/gupnp_0.13.4.bb
>>>>> @@ -2,13 +2,14 @@ LICENSE =3D "LGPL"
>>>>>   DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native l=
ibgee"
>>>>>
>>>>>   require gupnp.inc
>>>>> +PR =3D "1"
>>>
>>> "r1"
>>>
>>>>>
>>>>>   SRC_URI[md5sum] =3D "0d562f5f02534c70c3743b2c514db8ba"
>>>>>   SRC_URI[sha256sum] =3D "7974953f38a41236c875c3df509abc43e8218b592=
5fdc18212a73b1ae0d0e7e8"
>>>>>
>>>>>   inherit autotools pkgconfig
>>>>>
>>>>> -EXTRA_OECONF =3D "--disable-gtk-doc"
>>>>> +EXTRA_OECONF =3D "--disable-gtk-doc --enable-introspection=3Dno"
>>>>
>>>> I can't help thinking that there must be a better place to put this,
>>>> maybe even autotools.bbclass.  We basically want those options for a=
ll
>>>> packages that will take them, right?
>>>
>>> Usually this is just in "gnome" stuff and gnome or gnomebase does han=
dle this.  But indeed, perhaps this is something that should be more wide=
ly passed in to avoid semi-random breakage.
>=20
>> Can i get some acks for my patch at least as an interim solution? Curr=
ently the build is broken! This really is a blocker. :(
>=20
> NAK, fix the PRs first

Yes of course. ;-)

v3 follows.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



