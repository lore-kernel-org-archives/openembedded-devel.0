Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OGagC-0004Eu-GA
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 18:39:05 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id E5B2AF76E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 12:34:59 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 24 May 2010 12:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=tIIjyHM5qhOJOLqdj6ziMIVCvEY=;
	b=DPV63d3WbFMWoeqw9+8IXVaBuwoxOe3DpIxnfUQZ+jwHIOLqDPz2MW6h/yuoLati4M+BZKXDbA5iQKsa7jwWBEn46TLKAer0Kh8h6hJFiSJkGNlNY701KkvNnIa2QHvoW7dLswZwWGek/RueEM2/wkr427UAyrwx+e1fzL+W1Vk=
X-Sasl-enc: ytqHOfrigL9wJ2xZP37z/5EuZT/C5V07NJ5WhOaqdgkn 1274718899
Received: from [192.168.1.34] (hnvr-4d078a6d.pool.mediaWays.net [77.7.138.109])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 35FA54E2481
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 12:34:59 -0400 (EDT)
Date: Mon, 24 May 2010 18:36:25 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1005241813190.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
	<ht14oq$ok6$1@dough.gmane.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Mon, 24 May 2010 16:39:05 -0000
X-Groupsio-MsgNum: 19517
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-845806298-1274718987=:5274"

--8323328-845806298-1274718987=:5274
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, 21 May 2010, Khem Raj wrote:

> On Fri, May 21, 2010 at 6:40 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>> On Fri, 21 May 2010, Vitus Jensen wrote:
>>> On Fri, 21 May 2010, Vitus Jensen wrote:
>>>> =C2=A0On Wed, 19 May 2010, Koen Kooi wrote:
>>>>> =C2=A0 On 19-05-10 17:46, Vitus Jensen wrote:
>>>>>> =C2=A0 On Wed, 19 May 2010, Vitus Jensen wrote:
>>>>>>> =C2=A0 On Wed, 19 May 2010, Gary Thomas wrote:
>>>>>>>> =C2=A0 =C2=A0On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>>>
>>> ...
>>>>
>>>>>> =C2=A0 So currently .dev should be unbuildable for ppc users? =C2=A0=
Without
>>>>>> =C2=A0 selecting a non-default compiler that is.
>>>>>> =C2=A0 I thought I pinned powerpc at 4.1.1, but it turns out that =
it was
>>>>>> only
>>>>> =C2=A0 for ppc405:
>>>>>> =C2=A0 ANGSTROM_GCC_VERSION_ppc405 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D=
 "4.1.1"
>>>>>> =C2=A0 Feel free to send patches to add that for other ppc platfor=
ms.
>>>>
>>>> =C2=A0I'd loved to but it should be a usable version for ppc603e. =C2=
=A0We have
>>>> used
>>>> =C2=A0ELDK gcc 3.3.3 in the past so that version would be a known go=
od one.
>>>>
>>>> =C2=A0[stable/2009]
>>>> =C2=A04.2.4 =C2=A0wrong result
>>>> =C2=A04.1.1 =C2=A0wrong result (see first posting)
>>>> =C2=A03.3.3 =C2=A0doesn't compile, obstack macro problem
>>>> =C2=A03.3.4 =C2=A0doesn't compile, signal.h stack_t problem
>>>>
>>>> =C2=A0[org.openembedded.dev]
>>>> =C2=A04.3.3 =C2=A0doesn't compile
>>>> =C2=A04.1.1 =C2=A0doesn't compile
>>>> =C2=A04.2.4 =C2=A0doesn't compile, libstdc++ problem
>>>>
>>>> =C2=A0All compilations in the .dev branch used MACHINE=3Dn1200, in s=
table I used
>>>> =C2=A0our bluepro. =C2=A0Always a clean build of meta-toolchain. =C2=
=A0I know that there
>>>> =C2=A0are currently problems in .dev so I will wait/monitor the list=
 and try
>>>>  to=C2=A0get 3.3.3 and something newer than 4.3.3. to compile.
>>>
>>> Faster than thought: 4.4.4 compiles for n1200 (ppc603e) on .dev and
>>> produces correct output. =C2=A0(double)(long long)10 equals 10.0.
>>
>> Only at -O2 and -O3, at those levels the internal function __floatdidf=
 isn't
>> called (previously it was only -O3).
>
> I dont think thats the case. It always generates the call to __floatdid=
f

Well, it generates the call to __floatdidf from inside cast() but that=20
function is never called from main but replaced with the precomputed=20
result.  See attached assembler output, there is no call to _Z4castx.


> At -O1 and below it is called and
>> still produces incorrect results :-( Oh well, I give up for now.
>>
>
> All I have to test is qemu running OE/ppc603e. So i tried this test on=20
> qemu/uclibc and it seems to work for me at O1/O2/O3 using gcc 4.4.4 and=
=20
> minimal-uclibc distro. I would also try with eglibc but I need to build=
=20
> it.

Hmm, I'm using angstrom with glibc.  And I'm testing on the real device=20
and saw that -mhard-float is implied by mcpu=3D603e.  Using the FPU would=
=20
certainly explain differences between qemu and the real thing.  But=20
__floatdidf is hard to understand, all macro.  Is it really using the FPU=
?

Vitus

PS, to crosscheck: is there a HOWTO for qemu and oe/ppc?  And qemu_0.12.4=
=20
doesn't build here.

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers

--8323328-845806298-1274718987=:5274
Content-Type: TEXT/x-asm; name=cast.g++O2.s
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.2.00.1005241836230.5274@asterix.crazy-teaparty.dyndns.org>
Content-Description: g++ 4.4.4 -O2 output
Content-Disposition: attachment; filename=cast.g++O2.s

CS5maWxlCSJjYXN0LmNwcCINCgkuZ251X2F0dHJpYnV0ZSA0LCAxDQoJLmdudV9hdHRyaWJ1dGUg
OCwgMQ0KCS5nbnVfYXR0cmlidXRlIDEyLCAyDQoJLmdsb2JsIF9fZmxvYXRkaWRmDQoJLnNlY3Rp
b24JIi50ZXh0Ig0KCS5hbGlnbiAyDQoJLmdsb2JsIF9aNGNhc3R4DQoJLnR5cGUJX1o0Y2FzdHgs
IEBmdW5jdGlvbg0KX1o0Y2FzdHg6DQouTEZCMTI6DQoJbWZsciAwDQouTENGSTA6DQoJc3R3dSAx
LC0xNigxKQ0KLkxDRkkxOg0KCXN0dyAwLDIwKDEpDQouTENGSTI6DQoJYmwgX19mbG9hdGRpZGYN
Cglsd3ogMCwyMCgxKQ0KCWFkZGkgMSwxLDE2DQoJbXRsciAwDQoJYmxyDQouTEZFMTI6DQoJLnNp
emUJX1o0Y2FzdHgsIC4tX1o0Y2FzdHgNCgkuYWxpZ24gMg0KCS5nbG9ibCBtYWluDQoJLnR5cGUJ
bWFpbiwgQGZ1bmN0aW9uDQptYWluOg0KLkxGQjEzOg0KCW1mbHIgMA0KLkxDRkkzOg0KCWxpcyA5
LC5MQzJAaGENCglzdHd1IDEsLTE2KDEpDQouTENGSTQ6DQoJbGlzIDMsLkxDMEBoYQ0KCWxmcyAx
LC5MQzJAbCg5KQ0KCWxhIDMsLkxDMEBsKDMpDQoJbGkgNSwwDQoJbGkgNiwxMA0KCXN0dyAwLDIw
KDEpDQouTENGSTU6DQoJY3JlcXYgNiw2LDYNCglibCBwcmludGYNCglsd3ogMCwyMCgxKQ0KCWxp
IDMsMA0KCWFkZGkgMSwxLDE2DQoJbXRsciAwDQoJYmxyDQouTEZFMTM6DQoJLnNpemUJbWFpbiwg
Li1tYWluDQoJLnNlY3Rpb24JLnJvZGF0YS5jc3Q0LCJhTSIsQHByb2diaXRzLDQNCgkuYWxpZ24g
Mg0KLkxDMjoNCgkuNGJ5dGUJMTA5MjYxNjE5Mg0KCS5zZWN0aW9uCS5yb2RhdGEuc3RyMS40LCJh
TVMiLEBwcm9nYml0cywxDQoJLmFsaWduIDINCi5MQzA6DQoJLnN0cmluZwkiJWxsZCA9PSAlZlxu
Ig0KCS5zZWN0aW9uCS5laF9mcmFtZSwiYSIsQHByb2diaXRzDQouTGZyYW1lMToNCgkuNGJ5dGUJ
LkxFQ0lFMS0uTFNDSUUxDQouTFNDSUUxOg0KCS40Ynl0ZQkweDANCgkuYnl0ZQkweDENCgkuZ2xv
YmwgX19neHhfcGVyc29uYWxpdHlfdjANCgkuc3RyaW5nCSJ6UCINCgkudWxlYjEyOCAweDENCgku
c2xlYjEyOCAtNA0KCS5ieXRlCTB4NDENCgkudWxlYjEyOCAweDUNCgkuYnl0ZQkweDANCgkuNGJ5
dGUJX19neHhfcGVyc29uYWxpdHlfdjANCgkuYnl0ZQkweGMNCgkudWxlYjEyOCAweDENCgkudWxl
YjEyOCAweDANCgkuYWxpZ24gMg0KLkxFQ0lFMToNCi5MU0ZERTM6DQoJLjRieXRlCS5MRUZERTMt
LkxBU0ZERTMNCi5MQVNGREUzOg0KCS40Ynl0ZQkuTEFTRkRFMy0uTGZyYW1lMQ0KCS40Ynl0ZQku
TEZCMTMNCgkuNGJ5dGUJLkxGRTEzLS5MRkIxMw0KCS51bGViMTI4IDB4MA0KCS5ieXRlCTB4NA0K
CS40Ynl0ZQkuTENGSTQtLkxGQjEzDQoJLmJ5dGUJMHhlDQoJLnVsZWIxMjggMHgxMA0KCS5ieXRl
CTB4NA0KCS40Ynl0ZQkuTENGSTUtLkxDRkk0DQoJLmJ5dGUJMHg1DQoJLnVsZWIxMjggMHg0MQ0K
CS51bGViMTI4IDB4ZmZmZmZmZmZmZmZmZmZmZg0KCS5hbGlnbiAyDQouTEVGREUzOg0KCS5pZGVu
dAkiR0NDOiAoR05VKSA0LjQuNCINCgkuc2VjdGlvbgkubm90ZS5HTlUtc3RhY2ssIiIsQHByb2di
aXRzDQo=

--8323328-845806298-1274718987=:5274--
