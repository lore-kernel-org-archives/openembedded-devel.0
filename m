Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfKMe-0006tE-Ge
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:49:25 +0100
Received: by iwn8 with SMTP id 8so184758iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 14:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=BJWelQxkL/td3ZYxxCOCGRwTheuMSMElha1W3JGgE8M=;
	b=rVhDD2NpQpbeRZYN3Ku1u2C6ycXuc+FMyGWG82mYVT1I1x09+iOmPSyb9uLQ+E9lAh
	rZpfF/9wO5hpKUZ5ASMmil0tepcSjd4h2xN81O8b8cxT3uRwCHzLp9ZWHscMuW3Cvr3j
	ZI7wCIt05JHnQoepnAvZ9FtLmtCLUMkhptU4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=t2I6K30f5cqJLFDLTNFcTIKQZE1n1OtzEnwnwybC7wiFQHz7Jw2ekQmITk98Ea3SD+
	mSF1RL9cE4XdPgTBB1kyuXBwUfl0dbUehe35Div8AsPOVWFV4a4hoNPP5ju+R9KXsycx
	LtQV1PI2Ef8SeAz0M+6UGn7xlNarMFgPwS4t4=
Received: by 10.42.228.133 with SMTP id je5mr7054371icb.407.1295390927056;
	Tue, 18 Jan 2011 14:48:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 18 Jan 2011 14:48:26 -0800 (PST)
In-Reply-To: <4D35FC8B.1090404@mentor.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 14:48:26 -0800
Message-ID: <AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 22:49:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 12:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/18/2011 01:12 PM, Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 18-01-11 17:54, Tom Rini wrote:
>>>
>>> On 01/18/2011 01:05 AM, Otavio Salvador wrote:
>>>>
>>>> On Tue, Jan 18, 2011 at 05:21, Graeme Gregory<dp@xora.org.uk> =C2=A0 w=
rote:
>>>>>
>>>>> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
>>>>>>
>>>>>> - where possible stick to one recipe per package. This reduces the
>>>>>> maintenance work and reduces the QA nightmare of lots of different
>>>>>> permutations.
>>>>>> I feel one recipe per package should be the common case for
>>>>>> applications, and preferably also for libs (although I am well aware
>>>>>> that especially in the latter case multiple versions cannot always b=
e
>>>>>> avoided).
>>>>>
>>>>> OE is not a distro so this is a non starter already, please don't bog
>>>>> down this discussion by re-opening this again. Angstrom 2008, Angstro=
m
>>>>> 2010, kaelios and slugos are all released distributions with differen=
t
>>>>> versions of apps just as a starter and they arent even near the total
>>>>> number of distros in OE.
>>>>
>>>> I disagree. I think having too many versions of a package just makes
>>>> difficult to get things done:
>>>>
>>>> =C2=A0 - it increases the amount of maintainence work;
>>>> =C2=A0 - has a bigger time to get bugs spoted;
>>>>
>>>> Users of old distros ought to use a specific repository and branch.
>>>> Master ought to be kept clean for 'next distro release'.
>>>
>>> I agree, at least going forward. =C2=A0We must make it easier for
>>> distributions to say "here is my 'stable' release" and "here is my
>>> development release".
>>>
>>> First, I'm not picking on Angstrom here, really, I swear. =C2=A0It's ju=
st a
>>> good example.
>>>
>>> But we also don't want to be unreasonable or unbending here. =C2=A0We'l=
l have
>>> to have multiple udevs (due to having different kernel versions as some
>>> HW isn't on the latest and greatest). =C2=A0And if DistroA says they re=
ally
>>> want to stick to busybox 1.17.4 for a while, we should let that happen
>>> too. =C2=A0But I don't think we want to have to carry on the recipes th=
at
>>> angstrom-2008.1 wants and angstrom-2010.x wants and angstrom-2011.x
>>> wants and angstrom-2012.x want into 2013, in master.
>>
>> And noone says you should. At some point 2010.x works well enough to
>> force 2008.1 into hiding and start 201Y.x. The current situation where
>> the "unstable" 2010.x ended up in a product is largely due to the gcc
>> people breaking the NEON intrinsics interface API in between 4.3 and 4.5=
.
>
> ick, I didn't know about that...
>
>>> For example, at some point we want to switch to libtool 2.4 only. =C2=
=A0And
>>> that would certainly be a headache for angstrom-2008.1 (but we're glad,
>>> really! for angstrom-2010.x using 2.4 and testing and fixing things). S=
o
>>> wouldn't it be a good thing to be able to say that if you want
>>> angstrom-2008.1 you do ... this ... and get the layers that give a good
>>> stable 2008.1, based on whatever policy Angstrom wants for doing update=
s?
>>
>> In the past the angstrom people created a stable branch and supported
>> that for a given release. The same can be done in the layering script,
>> where it would just lock down to certain revisions of various layers.
>
> So, I think we agree. =C2=A0Distros should be saying "if you want our sta=
ble
> release you should be over here..." and if you want our development WIP, =
you
> should be over here.
>
>> But in the end if boils down to "Does OE wants to make life hard for
>> DISTROs or easy". Frans is firmly in the "make it hard" camp, I hope
>> others have a saner point of view.
>>
>> If you're forcing 90% of your users to put e.g. udev_162.bb in their
>> layer you're doing it wrong. But you're also doing it wrong if you have
>> 20 udev recipes :)
>
> I think we also agree here. =C2=A0But what's the rule of thumb(s) we want=
 to
> have, to provide enough choice without too much headache? =C2=A0As I said
> elsewhere, .inc files should probably be used a whole lot more, to help w=
ith
> the problem of recipe bugfixing and N recipes for an app with the problem=
.
> =C2=A0We should probably also say that in addition to the "keep the last =
GPLv2+
> version around" rule of thumb we should also have a "keep the latest stab=
le
> release" around too. =C2=A0But what else? =C2=A0To use busybox as an exam=
ple, do we
> really need to keep 1.18.0 and 1.18.1 around when we have 1.18.2? =C2=A0H=
ow about
> if we make the delta between the 3 be just the SRC_URI + checksums?


Well what to keep around can not be generalized so much. It also
depends upon the nature of releases for various packages
some packages have a major release and then push out bug fix releases
like busy box case you sited but there are packages
which only do major releases which can cause compatibility hassles as
new interfaces come and old ones are removed etc.
so I think it has to be flexible and mostly left to package
maintainers discretion as they know the nature of releases most but
I like the idea of keeping one GPLv2 release around and 1 latest
release around. If a distro pinned a version then that should
be considered as well. It is bad to sweep underneath a distros
pinnings. Then they have to rebuild and they get problems
as they have to make sure that if a package bump happens then they
should be able to define an upgrade path

Sometimes newer is not always better in case of udev the size has
increased over the time and some distro's may not like
it and there can be many such scenarios.

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


