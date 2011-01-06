Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Paj8X-0004rL-My
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 07:16:08 +0100
Received: by yie16 with SMTP id 16so4285747yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 22:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=qAzOnfezM9y1gz60ORfXrLOXG7KMDImeiZ2eR6jV/qQ=;
	b=E0yrDZlz0M1VqMO6vP9FBHAIxCUe0Nd9Pl3rXI8+43ULbmFd3O/au6aSxSzyJAy1KE
	IlJ9RRKc8PoyQKZoP99gM/PVPAej3ycNiCv5Gq5Fj1MZvryL1pASjK6R27XFiWICn3oe
	GLmo48/3fZYXDr5SRrG7vlzAwFhJMHOtyoXgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TQzYyZ+DFtyPUDjuyhPM4EHjtq7bTo6DvcfyvghprfTswE8RspV4VdOvu8O8WZq0Jo
	lxu2oRVZhOvWSQOTEKdfu+rjRHjecCXrBD5J7RMP1AW4irrs8V0MVAr4QI8IsDPasE5i
	PKLsFc3q+WcynLMJGc9+xsoq4H75wiWiVp4zs=
Received: by 10.90.72.2 with SMTP id u2mr1584126aga.4.1294294520545; Wed, 05
	Jan 2011 22:15:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 22:15:00 -0800 (PST)
In-Reply-To: <1294288661406628500@rkmorris.us>
References: <1294253374472299500@rkmorris.us>
	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>
	<1294268823607761500@rkmorris.us> <1294288661406628500@rkmorris.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 22:15:00 -0800
Message-ID: <AANLkTikAUk3sDOQ+iZxAHqaVhfBeT460bd8YQtVmT-Vo@mail.gmail.com>
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
X-List-Received-Date: Thu, 06 Jan 2011 06:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 8:37 PM, Russell Morris <openembedded@rkmorris.us> w=
rote:
> Hi,
>
> OK, a few more updates ...
> - I built using the angstrom-2008.1 distro, but I have the same issue. I =
also ran the helloworld application on the target as well, getting the erro=
r message "Illegal instruction" (the same as qemu, which I guess is good).


If you can reproduce the issue on target then I would suggest that run
the helloworld under gdb or gdbserver on target and see where its
happening.

> - I found the .config file that you are referring to, and made this chang=
e. I built and ran the debug kernel, but no more information is provided (o=
ther than "Illegal instruction").
> - as a side note, I have to edit sumversion.c to fix a "known" issue (htt=
p://linux.derkeiler.com/Mailing-Lists/Kernel/2007-05/msg08279.html). You ma=
y want to update this in the master branch.
>
> Any other ideas?
>
> Thanks,
> ... Russell
>
>
>
>
> On Wed, Jan 5, 2011 05:07 =C2=A0PM, Russell Morris <openembedded@rkmorris=
.us> wrote:
>> Hi,
>>
>>
>>
>> A few answers / thoughts, below (marked with RMo).
>>
>>
>>
>> Thanks for all the help and suggestions!
>>
>>
>>
>> ... Russell
>>
>>
>> On Wed, Jan 5, 2011 02:23 =C2=A0PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> >
>> On Wed, Jan 5, 2011 at 10:49 AM, Russell Morris
>> > <openembedded@rkmorris.us> wrote:
>> > > Hi,
>> > >
>> > >
>> > >
>> > > Let me try to answer a few questions in one email ... :-). First of =
all, I tried the patch - unfortunately no joy. It does the same thing as ea=
rlier builds - let me try to explain, which will hopefully also answer the =
questions below.
>> > >
>> > >
>> > >
>> > > I applied the patch, and rebuilt from scratch with the minimal distr=
o (deleted the TMPDIR completely before building). I built the helloworld-i=
mage, to get a statically linked executable, and also because it's a pretty=
 small (=3Dfaster) build.
>> >
>> > OK thats bad. Now can you recompile the kernel with user debugging
>> > enabled ? and reboot then it will dump lot more info on console on
>> > error you need to turn on CONFIG_DEBUG_USER in .config
>>
>> [RMo] Sorry, a dumb question here - but how do I do this? I can see .con=
fig in the temp directory - is this where you want me to modify it?
>> >
>> > >
>> > >
>> > >
>> > > I then looked at the helloworld executable, and a few interesting no=
tes,
>> > >
>> > > - if I readelf -h helloworld, it reports "Version5 EABI" ... so I as=
sume arm5te still?
>> >
>> > thats EABI version it has nothing to do with ARM architecture versions
>>
>> [RMo] OK, thanks!
>> >
>> > >
>> > > - if I try to run helloworld using qemu-arm, it runs fine ... with n=
o cpu selected (but I did some checking, and the default cpu for qemu-arm i=
s the arm5te). If I try to run with a -cpu arm920t option I get the error m=
essage "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
>> > >
>> >
>> > OK good so it seems there is still some intructions generated which
>> > are not supported in armv4t
>>
>> [RMo] That's what it seems like. To confirm - what is the best way to te=
st this ... with qemu-arm, and/or on the target? Just trying to make sure I=
 test it in a way that makes sense!
>> >
>> > > - I was not able to run this on the target right now, as I'm not nea=
r it ... but when I did before I either got a core dump (illegal instructio=
n), or it said basically that the file was not found (depending on the exec=
utable I tried to run).
>> >
>> > Yes it wont change I think.
>>
>> [RMo] Definitely agreed.
>> >
>> > >
>> > >
>> > >
>> > > One more interesting fact - if I go inside TMPDIR, and then inside w=
ork/armv4t-oe-linux-gnueabi/gcc-cross-4.5-r28.0+svnr167948/gcc-4_5-branch/t=
estsuite/gcc.target/arm, there is some sort of test file, with a filename o=
f pr42235.c. Oddly enough the first line in this file says ... /* { dg-opti=
ons "-mthumb -O2 -march=3Darmv5te" } =C2=A0*/
>> >
>> >
>> > thats just a gcc dejaGNU regression testcase it does not mean anything
>> > for compiling the root file system
>>
>> [RMo] Ok, thanks!
>> > >
>> > >
>> > > Hopefully this all makes sense. I think this says that the executabl=
e is still targeting an armv5te ... but I could be wrong! Unfortunately it =
wouldn't be the first time I was off base, and certaintly it won't be the l=
ast ... :-(.
>> > >
>> > >
>> > >
>> > > Thanks for all your help!
>> >
>> > as koen suggested try it with angstrom-2008 and see if that helps too.
>>
>> [RMo] Absolutely - started already. I thought you were looking for the m=
inimal distro, but I may have misunderstood. In any case, trying this now .=
.. :-).
>> >
>> > >
>> > >
>> > >
>> > > ... Russell
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > > On Wed, Jan 5, 2011 11:45 =C2=A0AM, Khem Raj <raj.khem@gmail.com> wr=
ote:
>> > >
>> > >
>> > >>
>> > > On Wed, Jan 5, 2011 at 7:11 AM, Phil Blundell <philb@gnu.org> wrote:
>> > >> > On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
>> > >> >> Just to confirm - have you run these on an armv4t target? Only a=
sking because my build completes fine, but the executables don't seem to ru=
n on the target.
>> > >> >
>> > >> > What exactly happens when you try to run those executables? =C2=
=A0Have you
>> > >> > inspected them to see if they look like the right kind of thing, =
and/or
>> > >> > compared them to working ones?
>> > >> >
>> > >> > p.
>> > >> >
>> > >> >
>> > >>
>> > >>
>> > >> yes as Phil asked you should try to localize the offending code in =
the
>> > >> faulty binary. So try to enable
>> > >> kernel debugging messages so it tells you where its faulting.
>> > >> Secondly if you can take a working system
>> > >> and see if the new binary faults in same way ? if not then link the
>> > >> binary statically and run it again on working
>> > >> system and see if it faults again. If it does then you can debug it
>> > >> >
>> > >> > _______________________________________________
>> > >> > Openembedded-devel mailing list
>> > >> > Openembedded-devel@lists.openembedded.org
>> > >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
>> > >> >
>> > >>
>> > >> _______________________________________________
>> > >> Openembedded-devel mailing list
>> > >> Openembedded-devel@lists.openembedded.org
>> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>> > >>
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>> > >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
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


