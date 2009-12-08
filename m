Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NI6hm-0001ZU-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 21:30:46 +0100
Received: by iwn32 with SMTP id 32so3955864iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 12:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C3SA5hmg7cGaj8qA1SaiJWVdLKndFwGugy5lmz/PHGw=;
	b=qhuVmrMXMtmGcJdZrvPLKKCCmv8fxDTcBrokC/et+FfKuLLaLibry2UyUb7Ej2YpkL
	R5eoM5Qsa7ApizPIKHbJzWjZ2lrbaiagMHJvhKAkpI186fidQsBuqKmTsD8YME9c/4eu
	/xNf7+XxX3qD12FbMfHUcE4AHNf3htSO6oskU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hOg/poESs+YIstAL32L95epnl1szARccxgiorRLvH/xSs11+m1uiHKH6IpEWiClAN5
	PaTV1QtZK7Yky3HRwNPQvIwRhzJTh9E9UBv0WSQ/8HoOBcaWJmVkVOh9b05ix0xupVyW
	MSm+2BCMz3QD6ozLFZlSqCOKndinp0BSaYuQA=
MIME-Version: 1.0
Received: by 10.231.61.195 with SMTP id u3mr177031ibh.12.1260304141490; Tue, 
	08 Dec 2009 12:29:01 -0800 (PST)
In-Reply-To: <818ccfc40912070349oaee021ewc43fb1767037965c@mail.gmail.com>
References: <818ccfc40912070241pa211c18ibb1a556607680c6@mail.gmail.com>
	<1260185987.779.70.camel@mill.internal.reciva.com>
	<818ccfc40912070349oaee021ewc43fb1767037965c@mail.gmail.com>
Date: Tue, 8 Dec 2009 12:29:01 -0800
Message-ID: <19c1b8a90912081229n10d8955ag302add53e10394a5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building GCC cross compiler without building any library
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
X-List-Received-Date: Tue, 08 Dec 2009 20:30:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2009 at 3:49 AM, Ahsan Khawaja <ahsan.khwaja@gmail.com> wrot=
e:
> sorry i missed typed it. i want to ask
>

in future don't top post. It breaks the logical reading on threads.

> Is it possible to build GCC cross compiler *without* support of any
> library(eglic, glibc,uclibc and newlib) for bare metal. if yes what I hav=
e
> to do in this regard.

You could do it in several ways. You can take an existing cross
compiler and use -undef  -nostdinc and -nostdinc++ during compilation
-nodefaultlibs and -nostdlib during linking.  This will make your
existing compiler the way you want

you can build a compiler using newlib during buildtime newlib is not a
hosted environment means its baremetal environment. Then you can move
the include and lib directories away from
install path to be sure that it does not find anything in default
locations by mistake.

You can supplement the above build compiler with options I mentioned
then it should be better

-Khem

>
> On Mon, Dec 7, 2009 at 4:39 PM, Phil Blundell <philb@gnu.org> wrote:
>
>> On Mon, 2009-12-07 at 15:41 +0500, Ahsan Khawaja wrote:
>> > Is it possible to build GCC cross compiler with support of any library
>> > (eglic, glibc,uclibc and newlib). What should I have to do in this
>> regard.
>>
>> I'm not quite sure what you're asking. =C2=A0Do you mean that you want t=
o
>> build a generic version of GCC which can then be used with any of the
>> four C libraries that you mention?
>>
>> If so, the answer is probably "yes" so long as you restrict yourself to
>> plain C only. =C2=A0If you want C++ or the like, the answer is almost
>> certainly no.
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


