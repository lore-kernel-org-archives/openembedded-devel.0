Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaZtv-00017J-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 21:24:08 +0100
Received: by yxd5 with SMTP id 5so6486392yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 12:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pDP2OaWAGKxpUBxfACpeP4LGoxsVobSQWoy+ya7TS4c=;
	b=aeeuQDqI3plo7bDeRGFfRBDRdI6ojLik+ZbnhPnZdCLkdABpqOhbduUIFZxd71ohSp
	DXJCGxEi/uuqNEAt7Sx2Mi4gKT+mVWzxoAt3RWg+j83K+O7dRNatuVcGBiZ9bleb0XUp
	ROURccsaMlYGz1IERwsDA2Fk1aMgYDZD+cZ9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wMe5puxYLCnZ37zscE4HkRi1rv1XcWTz/f9w8DEQ5mpUGh3oP63/boUsTpNjLO6Q1Q
	U7tmjhvo1fCYDTilj7/tOxTLxyXMuTcf7n29uoQxMddlSDj/GsbEf8a2BQA78Ry8MS63
	nE6/QrSUzbppgXzJnRpgM+KoWWMx1VMnz7ZtM=
Received: by 10.90.80.18 with SMTP id d18mr1148850agb.31.1294259021565; Wed,
	05 Jan 2011 12:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 12:23:20 -0800 (PST)
In-Reply-To: <1294253374472299500@rkmorris.us>
References: <1294253374472299500@rkmorris.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 12:23:20 -0800
Message-ID: <AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 20:24:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 10:49 AM, Russell Morris
<openembedded@rkmorris.us> wrote:
> Hi,
>
>
>
> Let me try to answer a few questions in one email ... :-). First of all, =
I tried the patch - unfortunately no joy. It does the same thing as earlier=
 builds - let me try to explain, which will hopefully also answer the quest=
ions below.
>
>
>
> I applied the patch, and rebuilt from scratch with the minimal distro (de=
leted the TMPDIR completely before building). I built the helloworld-image,=
 to get a statically linked executable, and also because it's a pretty smal=
l (=3Dfaster) build.

OK thats bad. Now can you recompile the kernel with user debugging
enabled ? and reboot then it will dump lot more info on console on
error you need to turn on CONFIG_DEBUG_USER in .config

>
>
>
> I then looked at the helloworld executable, and a few interesting notes,
>
> - if I readelf -h helloworld, it reports "Version5 EABI" ... so I assume =
arm5te still?

thats EABI version it has nothing to do with ARM architecture versions

>
> - if I try to run helloworld using qemu-arm, it runs fine ... with no cpu=
 selected (but I did some checking, and the default cpu for qemu-arm is the=
 arm5te). If I try to run with a -cpu arm920t option I get the error messag=
e "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
>

OK good so it seems there is still some intructions generated which
are not supported in armv4t

> - I was not able to run this on the target right now, as I'm not near it =
... but when I did before I either got a core dump (illegal instruction), o=
r it said basically that the file was not found (depending on the executabl=
e I tried to run).

Yes it wont change I think.

>
>
>
> One more interesting fact - if I go inside TMPDIR, and then inside work/a=
rmv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-branch/testsu=
ite/gcc.target/arm, there is some sort of test file, with a filename of pr4=
2235.c. Oddly enough the first line in this file says ... /* { dg-options "=
-mthumb -O2 -march=3Darmv5te" } =C2=A0*/


thats just a gcc dejaGNU regression testcase it does not mean anything
for compiling the root file system
>
>
> Hopefully this all makes sense. I think this says that the executable is =
still targeting an armv5te ... but I could be wrong! Unfortunately it would=
n't be the first time I was off base, and certaintly it won't be the last .=
.. :-(.
>
>
>
> Thanks for all your help!

as koen suggested try it with angstrom-2008 and see if that helps too.

>
>
>
> ... Russell
>
>
>
>
>
>
> On Wed, Jan 5, 2011 11:45 =C2=A0AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>>
> On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
>> >> Just to confirm - have you run these on an armv4t target? Only asking=
 because my build completes fine, but the executables don't seem to run on =
the target.
>> >
>> > What exactly happens when you try to run those executables? =C2=A0Have=
 you
>> > inspected them to see if they look like the right kind of thing, and/o=
r
>> > compared them to working ones?
>> >
>> > p.
>> >
>> >
>>
>>
>> yes as Phil asked you should try to localize the offending code in the
>> faulty binary. So try to enable
>> kernel debugging messages so it tells you where its faulting.
>> Secondly if you can take a working system
>> and see if the new binary faults in same way ? if not then link the
>> binary statically and run it again on working
>> system and see if it faults again. If it does then you can debug it
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
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


