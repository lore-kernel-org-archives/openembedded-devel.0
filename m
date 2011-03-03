Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pv2p0-0000Ct-DX
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 08:19:39 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 0EE0049127F;
	Thu,  3 Mar 2011 08:18:12 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Mar 2011 08:18:12 +0100
Message-ID: <4D6F40A9.2060606@dresearch.de>
Date: Thu, 03 Mar 2011 08:18:01 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.14) Gecko/20110221 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
	<AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
	<4D6E0CF4.4040005@dresearch.de>
	<AANLkTi=UYfsdZQvvQzLMBkZ21wFpPQK-p7pdbSy1F-_H@mail.gmail.com>
In-Reply-To: <AANLkTi=UYfsdZQvvQzLMBkZ21wFpPQK-p7pdbSy1F-_H@mail.gmail.com>
X-OriginalArrivalTime: 03 Mar 2011 07:18:12.0211 (UTC)
	FILETIME=[27C88430:01CBD973]
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Thu, 03 Mar 2011 07:19:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 02.03.2011 21:45, schrieb Khem Raj:
> On Wed, Mar 2, 2011 at 1:25 AM, Steffen Sledz <sledz@dresearch.de> wrot=
e:
>> failed here).
>>>
>>> for svn recipe you can bump rev up
>>
>> I tried to bump to some newer revs (19399/5.6, 19787/5.6.1, 20047/HEAD=
) but ended up in some undefined referrence errors (nl_handle_destroy and=
 nl_handle_alloc) in all cases. :(
>>
>> So this needs some more attention.
>=20
> --disable-nls in EXTRA_OECONF does that help ?

Nope.

>> Jamie, you're listed as net-snmp maintainer. Can you look into this pl=
ease.
>>
>>> and for others you can backport the
>>> fix and you can backport it as it is ideally that patch should
>>> have changed configure.ac and regenerated configure but they patched
>>> configure instead. but its ok to patch configure here since
>>> we do not regenerate configure for net-snmp recipe.
>>
>> As mentioned before i failed trying this. The patch does not apply wit=
hout modifications. :(
>=20
> hmmm I cant promise but if I have time I can look into it

Would be really great.

Steffen

PS: And i'm willing to lern, so i'm looking forward excitedly to your sol=
ution. ;-)

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



