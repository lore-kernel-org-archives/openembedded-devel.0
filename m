Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFZ1j-0001N2-DK
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:41:03 +0200
Received: by iwn2 with SMTP id 2so1448056iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AuSMfEdwWktup7IGklv3eef04bT2+Ef7mVd3uh6xmG0=;
	b=s2R0RXyULoqAyaRxW+JxqHZlKoZWd0cpdO/H56Lv8GL2+9nRDiRLH77KHZsqI1arop
	J2TFU7gJWxg/PYJU3Q6zR2jTZ9JvpB2Cq/P7gmGncf5rS6dutDCQJymy5PEvSu0zbXHl
	qUsWXpc8x5zvxwFQkI/csmmEFf8nmIwUqP+IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hVP06mvTr9MYjR3MX59XJ+RkhrHpV4BKpwoL8/NNGSFztbNHdjFcy6a5Cck4RsZdNV
	9PBfREqy3Z38/t13oKEoWaXa9JL3vRgVAViNfFPFjy6snBN+hg25gdZqhaIwcKSQvA0i
	eAoCqaK808DeInz5wViHIr4N2970umzhKzvcc=
MIME-Version: 1.0
Received: by 10.231.148.130 with SMTP id p2mr2328950ibv.11.1274474221278; Fri, 
	21 May 2010 13:37:01 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Fri, 21 May 2010 13:37:01 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
	<ht14oq$ok6$1@dough.gmane.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 21 May 2010 13:37:01 -0700
Message-ID: <AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 21 May 2010 20:41:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2010 at 6:40 AM, Vitus Jensen <vjensen@gmx.de> wrote:
> On Fri, 21 May 2010, Vitus Jensen wrote:
>
>> On Fri, 21 May 2010, Vitus Jensen wrote:
>>
>>> =A0On Wed, 19 May 2010, Koen Kooi wrote:
>>> > =A0 On 19-05-10 17:46, Vitus Jensen wrote:
>>> > > =A0 On Wed, 19 May 2010, Vitus Jensen wrote:
>>> > > > =A0 On Wed, 19 May 2010, Gary Thomas wrote:
>>> > > > > =A0 =A0On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>>
>> ...
>>>
>>> > > =A0 So currently .dev should be unbuildable for ppc users? =A0Witho=
ut
>>> > > =A0 selecting a non-default compiler that is.
>>> > > =A0 I thought I pinned powerpc at 4.1.1, but it turns out that it w=
as
>>> > > only
>>> > =A0 for ppc405:
>>> > > =A0 ANGSTROM_GCC_VERSION_ppc405 =A0 =A0 =A0 =A0 ?=3D "4.1.1"
>>> > > =A0 Feel free to send patches to add that for other ppc platforms.
>>>
>>> =A0I'd loved to but it should be a usable version for ppc603e. =A0We ha=
ve
>>> used
>>> =A0ELDK gcc 3.3.3 in the past so that version would be a known good one=
.
>>>
>>> =A0[stable/2009]
>>> =A04.2.4 =A0wrong result
>>> =A04.1.1 =A0wrong result (see first posting)
>>> =A03.3.3 =A0doesn't compile, obstack macro problem
>>> =A03.3.4 =A0doesn't compile, signal.h stack_t problem
>>>
>>> =A0[org.openembedded.dev]
>>> =A04.3.3 =A0doesn't compile
>>> =A04.1.1 =A0doesn't compile
>>> =A04.2.4 =A0doesn't compile, libstdc++ problem
>>>
>>> =A0All compilations in the .dev branch used MACHINE=3Dn1200, in stable =
I used
>>> =A0our bluepro. =A0Always a clean build of meta-toolchain. =A0I know th=
at there
>>> =A0are currently problems in .dev so I will wait/monitor the list and t=
ry
>>> to
>>> =A0get 3.3.3 and something newer than 4.3.3. to compile.
>>
>> Faster than thought: 4.4.4 compiles for n1200 (ppc603e) on .dev and
>> produces correct output. =A0(double)(long long)10 equals 10.0.
>
> Only at -O2 and -O3, at those levels the internal function __floatdidf is=
n't
> called (previously it was only -O3).

I dont think thats the case. It always generates the call to __floatdidf

At -O1 and below it is called and
> still produces incorrect results :-( Oh well, I give up for now.
>

All I have to test is qemu running OE/ppc603e. So i tried this test on
qemu/uclibc and it seems to
work for me at O1/O2/O3 using gcc 4.4.4 and minimal-uclibc distro. I
would also try with eglibc
but I need to build it.

> Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


