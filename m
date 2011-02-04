Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PlKUR-0003iD-8j
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 13:10:15 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id ADD8E491278;
	Fri,  4 Feb 2011 13:09:19 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 4 Feb 2011 13:09:19 +0100
Message-ID: <4D4BEC6F.7040205@dresearch.de>
Date: Fri, 04 Feb 2011 13:09:19 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Holger Freyther <holger+oe@freyther.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
	<4D4A9739.6040909@freyther.de> <4D4A9A94.6030108@dresearch.de>
	<4D4A9C30.8010803@freyther.de> <4D4AA84C.1050001@dresearch.de>
	<4D4AA95C.5000103@freyther.de>
In-Reply-To: <4D4AA95C.5000103@freyther.de>
X-OriginalArrivalTime: 04 Feb 2011 12:09:19.0722 (UTC)
	FILETIME=[5A13ECA0:01CBC464]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Fri, 04 Feb 2011 12:10:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 03.02.2011 14:10, schrieb Holger Freyther:
> On 02/03/2011 02:06 PM, Steffen Sledz wrote:
>=20
>>> I am not sure why you want to use gprof but anyway...
>>>
>>> a) do not use gprof on glibc...
>>
>> I'm not interested in using gprof on glibc. I'm interested in profilin=
g some other libs/apps only.
>>
>> But the suggested method to prepare just some packages for profiling d=
oes not work jet (see other subthread).
>=20
> 1.) use oprofile... install the -dbg packages on the device... install
> oprofile itself... start sampling with opcontrol --start -p library -c =
7 or
> such.. then stop... use opreport -l to look...

This looks good enough for us. Thanx for the hint.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



