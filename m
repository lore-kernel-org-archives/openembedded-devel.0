Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pz1tP-0004RI-0O
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 08:08:39 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 82428491282;
	Mon, 14 Mar 2011 08:06:58 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 08:06:58 +0100
Message-ID: <4D7DBE92.5010906@dresearch.de>
Date: Mon, 14 Mar 2011 08:06:58 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>	<ild6ma$ton$1@dough.gmane.org>
	<4D7A4566.6070607@dresearch.de>
	<20110312000524.GE5603@sakrah.homelinux.org>
In-Reply-To: <20110312000524.GE5603@sakrah.homelinux.org>
X-OriginalArrivalTime: 14 Mar 2011 07:06:58.0668 (UTC)
	FILETIME=[68DD42C0:01CBE216]
Subject: Re: [PATCH] net-snmp: disable libnl use
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
X-List-Received-Date: Mon, 14 Mar 2011 07:08:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 12.03.2011 01:05, schrieb Khem Raj:
> On (11/03/11 16:53), Steffen Sledz wrote:
>> On 03/11/2011 02:05 PM, Koen Kooi wrote:
>>> On 11-03-11 12:04, Steffen Sledz wrote:
>>>> Fixes compile error
>>>
>>>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_destr=
oy'
>>>> | ./.libs/libnetsnmpmibs.so: undefined reference to `nl_handle_alloc=
'
>>>
>>>> which occurred sometimes depending on build order (not in clean pack=
age
>>>> only builds).
>>>
>>> What features do we loose when disabling netlink support? I'd rather =
get
>>> the libnl recipe fixed (e.g. static lib only) instead of hacking the
>>> dependants.
>>
>> I'm not sure.
>>
>> But there is no dependency to libnl. If *libnl was not built before ne=
t-snmp* the autotools/configure does not find it. So in that case libnl w=
asn't used anyway.
>>
>> Just in case *it was built before* net-snmp tries to use it and hits t=
he mentioned error.
>=20
> So assuming that successful builds before did not link in libnl this
> seems ok to me.

Can i take that as an ACK?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



