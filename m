Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HOvSm-0004wT-ES
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 13:41:48 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l27Cfiox003095 for <openembedded-devel@openembedded.org>;
	Wed, 7 Mar 2007 13:41:44 +0100
Message-ID: <45EEB305.5050202@dominion.kabel.utwente.nl>
Date: Wed, 07 Mar 2007 13:41:41 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HOvGE-0004Zn-Tg@linuxtogo.org>	<45EEB07E.5@dominion.kabel.utwente.nl>
	<200703071336.18336.repvik@kynisk.com>
In-Reply-To: <200703071336.18336.repvik@kynisk.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l27Cfiox003095
Subject: Re: [oe-commits] org.oe.dev turbostation: Add a kernel-feed for the turbostation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2007 12:41:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

=C3=98yvind Repvik schreef:
> On Wednesday 07 March 2007 13:30, Koen Kooi wrote:
>> nail commit schreef:
>>> turbostation: Add a kernel-feed for the turbostation
>>>
>>>
>>> ---
>>> conf/machine/turbostation.conf	6f726b010d35f1dca1dfb881904353cbda8d1e=
85
>>> +++
>>> conf/machine/turbostation.conf	d117d9cf3f641f7635130a1cff259c3c26fe96=
e7
>>>
>>> +FEED_URIS +=3D
>>> "turbostation##http://ipkg.kynisk.com/opents/cross/1.0-dev/"
>> Don't do that, feeds are a distro thing, not a machine thing. So that
>> should go into conf/distro/$yourdistro.conf
>>
>=20
> Yeah, but since I won't touch the distro in question, I'll just clone i=
t and=20
> make it my own.=20

Can't just do "echo 'require conf/distro/openprotium.conf' >
conf/distro/openturbostation.conf" instead of copying it?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF7rMFMkyGM64RGpERApqdAKCfc0O2pFO9W4HF2GAATscPTdqixwCeP1Aq
w7ocCRR5GTZucSF7+15AxJc=3D
=3DM1Wm
-----END PGP SIGNATURE-----


