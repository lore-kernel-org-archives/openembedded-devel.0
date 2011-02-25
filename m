Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PstPZ-00074d-4Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 09:52:29 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D2CCF491283;
	Fri, 25 Feb 2011 09:51:09 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 09:51:10 +0100
Message-ID: <4D676D7D.3050408@dresearch.de>
Date: Fri, 25 Feb 2011 09:51:09 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>	<4CA46AD8.2070205@dresearch.de>	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>	<4CA5B348.1000404@dresearch.de>	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>	<AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>	<4CA98B66.3060404@dresearch.de>	<AANLkTi=mw3h2vqEav+yz2begWJVR++V6823_QmjdNqAg@mail.gmail.com>	<4D58E883.8030606@dresearch.de>	<AANLkTimD19GdMuFTnuZpw2Od22G3LXxmC1+_uVUtEkH7@mail.gmail.com>
	<DB561678F08F554EB0D9F21B70E268A505AF9A@exchange.intern.dresearch.de>
In-Reply-To: <DB561678F08F554EB0D9F21B70E268A505AF9A@exchange.intern.dresearch.de>
X-OriginalArrivalTime: 25 Feb 2011 08:51:10.0046 (UTC)
	FILETIME=[25F417E0:01CBD4C9]
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Fri, 25 Feb 2011 08:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 14.02.2011 20:10, schrieb Sledz, Steffen:
> Am 14.02.2011 18:58, schrieb Khem Raj:
>> On Mon, Feb 14, 2011 at 12:32 AM, Steffen Sledz <sledz@dresearch.de> w=
rote:
>>> Am 04.10.2010 18:00, schrieb Khem Raj:
>>>> On Mon, Oct 4, 2010 at 1:08 AM, Thilo Fromm <t.fromm@dresearch.de> w=
rote:
>>>>> Hello Frans,
>>>>>
>>>>>>>> I tracked it down - libunwind publishes unwind.h, and gcc uses a=
n
>>>>>>>> internal
>>>>>>>> file of the same name while being built.
>>>>>>>
>>>>>>> Yes gcc has its own version of libunwind which it used unless
>>>>>>> configured with --with-system-libunwind
>>>>>>> IIUC the problem happens with target gcc not with cross-gcc. targ=
et
>>>>>>> gcc is built using cross-gcc and
>>>>>>> <sysroot>/use/include could be preferred over the location of
>>>>>>> libunwind.h which is in gcc sources
>>>>>>> If thats the case then we need to fix gcc build to not look into
>>>>>>> standard sysroot/usr/include but prefer
>>>>>>> the local unwind.h when its using internal libunwind. The problem
>>>>>>> would not show up if the libunwind versions
>>>>>>> were matching but that may not be the case always and I dont know=
 of
>>>>>>> hand how we can fix the gcc configury/build
>>>>>>> to ignore installed unwind.h
>>>>>>>
>>>>>>> You workaround would only work if build sequence was followed if =
some
>>>>>>> one just cleaned gcc and rebuild it
>>>>>>> the problem will resurface.
>>>>>>>
>>>>>> Thanks for the analysis Khem.
>>>>>> This is indeed more or less what I had expected.
>>>>>>
>>>>>> For me this patch gets a NAK as it does only masks the problvem in
>>>>>> some cases but not really solves it.
>>>>>
>>>>> You're right with this analysis; however, the patch enables Openemb=
edded to
>>>>> be built *at all*. If you care less about whether you're able to ac=
tually
>>>>> build and if you have the time to wait until someone ventures deep =
into the
>>>>> gcc build and fixes the cause, then this is the way to go.
>>>>>
>>>>> For us, however, this patch is a valid workaround. It will make Ope=
nembedded
>>>>> work for us until the original issue is fixed.
>>>>
>>>> I think we should try to fix it in right way.
>>>
>>> Ping!
>>
>> I think this patch does not fix the problem but hides it. It will not
>> be worth to get it upstream
>=20
> That's right.
>=20
> I read your comment from october 1st that you try to fix this "in the r=
ight way" by fixing "the gcc build to not look into standard sysroot/usr/=
include but prefer the local unwind.h when its using internal libunwind".

Ping!

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



