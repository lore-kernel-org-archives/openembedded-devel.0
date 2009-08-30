Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mhp9u-000879-Om
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 20:29:47 +0200
Received: by qw-out-1920.google.com with SMTP id 4so804948qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OIfWxdvpOWwnQUvjvTXsX/7yfyXTQiTyxek4+cxXz60=;
	b=xkR3fvwhq+isrIMYz47STXP28Ei947vli4nlmIvXFCQVAcJWSU5vMQUfpxV/7VI8JP
	9ETRIliL7nL/vr93wZKUwdzTaAKlkBw1if9fQUwjY/3tBw+z6V+BhClUzTOdICwcCoFi
	KojKg5mWuslpRLpwfBQ6d2cSPP23irz3/hNvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p42Er6z+bIkMJAxiVtbyxBVDS34ifXxsje2xxbENUll/tGvIGqvsxVNwg7WDSxi5iM
	6DQGqUxvyQOxXDNC7ER83pPLEqS9AqypNpHQW9hwb9aSUdnCTPFZ9EVRmDMDG812ba1y
	6EitkCRggA22m+6Q3uZkcYPR/1XuRqifIAhP8=
MIME-Version: 1.0
Received: by 10.229.38.206 with SMTP id c14mr1277944qce.89.1251655881747; Sun, 
	30 Aug 2009 11:11:21 -0700 (PDT)
In-Reply-To: <19c1b8a90908301108td29060ci1e63e1239ef6802d@mail.gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830092250.GA16275@gmail.com>
	<1251626062.4215.687.camel@lenovo.internal.reciva.com>
	<20090830103836.GA19944@gmail.com>
	<1251631135.22587.17.camel@kc.internal.reciva.com>
	<19c1b8a90908301108td29060ci1e63e1239ef6802d@mail.gmail.com>
Date: Sun, 30 Aug 2009 11:11:21 -0700
Message-ID: <19c1b8a90908301111o41425a00l1220f1b62e0cfb7e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 18:29:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2009 at 11:08 AM, Khem Raj<raj.khem@gmail.com> wrote:
> On Sun, Aug 30, 2009 at 4:18 AM, Phil Blundell<philb@gnu.org> wrote:
>> On Sun, 2009-08-30 at 03:38 -0700, Khem Raj wrote:
>>> On (30/08/09 10:54), Phil Blundell wrote:
>>> > On Sun, 2009-08-30 at 02:22 -0700, Khem Raj wrote:
>>> > > based upon your idea in last email. Here is something I put togethe=
r
>>> > > seems to work. It will need testing ofcourse
>>> > >
>>> > > What do you think about this one ?
>>> >
>>> > Thanks for the update. =C2=A0This looks like generally the right idea=
, except
>>> > that I still feel it is undesirable for an innocuous-looking change o=
f
>>> > MACHINE to result in far-reaching abi consequences. =C2=A0So we need =
to
>>> > figure out a way to deal with that.
>>>
>>> I think some machines are incapable of dealing with EABI requirements.
>>> thats why this dependency of machines and sometimes machines also
>>> dictate ABI like e500 pushes you to use gnuspe. So I think ABI is tied
>>> to machine in some ways.
>>
>> There are very few, if any, machines in OE that are fundamentally
>> incapable of running EABI code. =C2=A0(There is a larger set of machines
>> where running true EABI code would be awkward and/or slow, but even on
>> those you don't necessarily want to fall back all the way to OABI; a
>> better compromise would be to use a non-interworking EABI variant.) =C2=
=A0In
>> any case, I think the appropriate response if the user selects an
>> incompatible combination of machine and ABI is to issue a diagnostic,
>> not to silently select a different ABI that you think is more
>> appropriate.
>>
>>> actually it returns oabi or eabi if architecture is arm otherwise it
>>> returns empty string
>>
>> Ah, so it does. =C2=A0Maybe it would be better to simply not call the
>> function at all on non-arm architectures.
>>
>>> A lot of toolchain configuration depend upon TARGET_OS one can easily
>>> get is wrong. So IMO its better to synthesize it correctly.
>>
>> Actually, I'm now beginning to think that this approach is backwards and
>> it would be better to do things the other way around. =C2=A0That is, sti=
ck
>> with TARGET_OS as the primary configuration variable that the user sets,
>> and infer everything else (including ${LIBC}) from the value that they
>> have chosen. =C2=A0That seems like it would avoid a lot of these issues =
with
>> bits of OE second-guessing the user and it would also help to prevent a
>> further proliferation of poorly-documented configuration variables.
>
> hmm yes and these function could be turned into checking functions
> of some sort if needed. So user can get notified for what sins he has
> done by selecting a particular TARGET_OS :)
>
> where do you think it should be defined then ?
> it definitely needs to know about machine so machine conf seems
> to be correct and distros are not per arch bases so defining it in
> distros would not work the way it does now.
>
> I do not like guessing work too but somehow it should not be
> too much of a pain for a user to set it too.
>
> not many users would know so many details about machine libraries
> and ABIs and how they impact the target triplets. More than
> often they will get it wrong.
>
>
> Saying that user defines MACHINE and LIBC one wants in his DISTRO
> and computing =C2=A0TARGET_TRIPLET from this does not sound a bad idea to=
 me.
> may be we can change TARGET_OS to not indicate the last part of target tr=
iplet
> instead it is something like say 'linux' 'freebsd' or 'none' =C2=A0and th=
en
> we can concatenate them
> as we are doing to form the real target triplet.
>
> I think this would enhance the user experience of OE.

Moreover user can always override it in distro conf or local conf
after including sane-toolchain.inc
e.g. he only has a distro where he only cares about one arch and one
libc or some such

>
>>
>>> I think using arm-linux-gnu (OABI) arm-linux-gnueabi (EABI) would be
>>> more =C2=A0logical at present we use arm-linux for OABI that said using
>>> linux-gnu on other arches is also nice thing to do.
>>
>> Yes, agreed, I think it should ideally be CPU-linux-gnu in general, and
>> CPU-linux-gnuABISUFFIX for particular ABI variants.
>>
>>> Similarily for uclibc/EABI we use arm-linux-uclibcgnueabi probably usin=
g
>>> arm-linux-uclibceabi(EABI) =C2=A0and arm-linux-uclibc(OABI) would be cl=
eaner.
>>
>> I guess that depends on what the GCC/uClibc conventions are.
>> "arm-linux-gnuuclibc" looks a bit ugly but presumably the GNU folks like
>> to keep their name in there somewhere.
>
> Generally linux-gnu would mean its linux with GNU libc or eglibc
> and linux-uclibc means its linux with uclibc. We can omit gnu
>
> many places configure prods for uclibc and eabi so as long as they are th=
ere
> in the last part of target triplet it wil be ok.
>
>>
>> p.
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


