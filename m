Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PsbIu-0001rQ-EX
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 14:32:25 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A205C7.dip0.t-ipconnect.de [87.162.5.199]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1ODUw4r001574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 24 Feb 2011 14:30:58 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 243B72A23F;
	Thu, 24 Feb 2011 14:30:59 +0100 (CET)
Message-ID: <4D665D92.7000100@dresearch.de>
Date: Thu, 24 Feb 2011 14:30:58 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D5A5871.7000005@dresearch.de> <4D5A89CD.803@opendreambox.org>
	<4D5A92BC.1010906@dresearch.de> <4D5E422B.3040703@dresearch.de>
	<AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
In-Reply-To: <AANLkTi=+vnLLOeP2umN3kdK3YzZBgLAwQgAvEKSjqd5f@mail.gmail.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1ODUw4r001574
Cc: koen@openembedded.org, openembedded-devel@lists.openembedded.org
Subject: Re: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Thu, 24 Feb 2011 13:32:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/18/2011 04:30 PM, Khem Raj wrote:
> On Fri, Feb 18, 2011 at 1:55 AM, Steffen Sledz <sledz@dresearch.de> wro=
te:
>> Am 15.02.2011 15:50, schrieb Steffen Sledz:
>>> Am 15.02.2011 15:12, schrieb Andreas Oberritter:
>>>> On 02/15/2011 11:41 AM, Steffen Sledz wrote:
>>>>> "Kernel headers are backwards compatible, but not forwards compatib=
le.  This
>>>>> means that a program built against a C library using older kernel h=
eaders
>>>>> should run on a newer kernel (although it may not have access to ne=
w
>>>>> features), but a program built against newer kernel headers may not=
 work on an
>>>>> older kernel."[2]
>>>>
>>>> Isn't this what the variable OLDEST_KERNEL is good for, when compili=
ng
>>>> glibc?
>>>
>>> If i'm right this goes to the --enable-kernel=3DVERSION configure opt=
ion of glibc just to optimize the library.
>>>
>>> "the configure option --enable-kernel=3DX.Y.Z allows to strip out com=
patibility for kernel versions before X.Y.Z."
>>>
>>> Imho it is not legitimately to follow that glibc has compatibility co=
de for all kernels greater or equal X.Y.Z.
>>>
>>> Another question is the handling in other libc implementations.
>>>
>>> And finally there are a lot of programs using userland kernel headers=
 directly.
>>
>> Ping!
>>
>> If i interpret responses from Tom and Phil right they agree with me (o=
r at least do not disagree). ;-)
>>
>> But i miss reactions from the distro maintainers (especially =C3=85ngs=
tr=C3=B6m).
>>
>=20
> I think we should make sure that linux version chosen for a build is
> equal or newer than linux-libc-headers for that build. Another option
> is that linux-libc-headers are driven out
> of selected virtual/kernel too but this may be a bit clunky since it
> would mean that
> every machine will have them different and we share sysroots e.g. two
> armv5te may use
> same sysroot

I like to force the discussion/work/decision on this problem because we'r=
e one of the mourners (we're forced to use 2.6.24 kernel by out hardware =
vendor :( ).

I also see the multi-machine problem (the shared sysroot at build time an=
d the feed problem too).

So what options do we (our =C3=85ngstr=C3=B6m) have?

(1) Do not support kernel older than 2.6.31 (which is the current LINUX_L=
IBC_HEADERS_VERSION).

(2) Set LINUX_LIBC_HEADERS_VERSION to 2.6.16 (which is the current OLDEST=
_KERNEL).

(3) Support machine specific distro incarnations (incl. special feeds).

May be some more. Option (1) would be really bad for us. I believe (2) wo=
uld be bad for a lot of users because of a potential loss of functionalit=
y.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


