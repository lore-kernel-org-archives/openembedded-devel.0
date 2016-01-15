Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id F2A6C731C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:53:03 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b14so16160174wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=I0O2X0U4NpuWQxdsTLuBvjiyqMKSbK27FGM5DCB57MU=;
	b=bMaa/wwcopxbPYh9zVmfo3qCjYdLsNI1L/2t2qpqmgk8hogyDhUJBWAzPBLWW7VAww
	XS9BLgkVrY1Blo8pp/Vh5hPR3CslahjBy0pJD81SVEtXNutVL6IZ2yRNypqpBkQN3DvI
	jfoJNuzInEJUzGCJra85fB1z/lEUkfkbgg08meTdE9lppdsfDTGirTiiFpv+RnU3w4Wm
	SrY1tQGrPJYgH0IRloX6wfBP/hmzgfVVykNNKN2SE1NSW7sXctTovxfRU9hoMhuoUAB9
	uYcM1nShgJXDjbwXCXYZ+5hlgUs1zAMNDqN6Ff/fbutWZBIHFQd4xyUeL/NjJ8z9IGMJ
	Mu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=I0O2X0U4NpuWQxdsTLuBvjiyqMKSbK27FGM5DCB57MU=;
	b=E+jdyNnmRVl4f7vFlMhMZtkXPiQ6qSaP4gFpv/gH0vDR5z6b4U39YC/m405g9ysgzs
	sBGQ9HF4x2XoknlJLeByORR7+K9d16HJ0DArq4JT5o8/m5qcm3sqV6FZMoHfoXIb3ULh
	zXOu9KkQDxYF/x1/pp/eIOu2V5X8hkYpi5GMHbfeVNhdPnBkhUaAIszzT9QjHIQAJdiW
	nV3qqa6NYgQa1FcCTRaATUaPxcKBsM9QHrpcujQC4ncYJa3YJZgjJCwwaKXJl7gP4eRM
	xYc5Fm1oOkel2Nps3HacRqOjvuMcpmpl4SHJs9q2YQpaAiDPN3A3+H7LwGnrs2UfDZp/
	5+aA==
X-Gm-Message-State: AG10YOQl59hO4nwGlQ0t3GPiFDa6za1u5b24vjrvqSYVAkKbcm35k8lnjD6KqMv6Dt8Xgg==
X-Received: by 10.28.224.212 with SMTP id x203mr2389240wmg.29.1452851583668;
	Fri, 15 Jan 2016 01:53:03 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	df10sm9805712wjb.44.2016.01.15.01.53.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 01:53:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C78C5EC@ALA-MBA.corp.ad.wrs.com>
Date: Fri, 15 Jan 2016 10:53:01 +0100
Message-Id: <4E1A971A-782B-414E-A4FA-B4A58A3A0120@gmail.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
	<9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C78A13B@ALA-MBA.corp.ad.wrs.com>
	<E0EC0FF8-2613-41F1-AC02-A0EE125D362B@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C78C5EC@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-java][PATCH 0/2]	openjdk-8-native:	fix	do_install	and PROVIDES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jan 2016 09:53:05 -0000
X-Groupsio-MsgNum: 59556
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FFAA468A-BCB5-4EE9-ACDB-FF8B3F237267";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_FFAA468A-BCB5-4EE9-ACDB-FF8B3F237267
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 12.01.2016 um 03:50 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>> Sent: Monday, January 11, 2016 6:02 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>=20
>>=20
>>> Am 09.01.2016 um 15:22 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>=20
>>>=20
>>>=20
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>> Sent: Friday, January 08, 2016 5:46 PM
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>=20
>>>>=20
>>>>> Am 07.01.2016 um 04:00 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>> -----Original Message-----
>>>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-
>> devel-
>>>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>>>> Sent: Wednesday, January 06, 2016 9:57 PM
>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>>>=20
>>>>>>=20
>>>>>>> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>>>>>>>=20
>>>>>>>=20
>>>>>>>=20
>>>>>>>> -----Original Message-----
>>>>>>>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-
>>>> devel-
>>>>>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>>>>>>>> Sent: Tuesday, January 05, 2016 3:21 AM
>>>>>>>> To: openembedded-devel@lists.openembedded.org
>>>>>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix =
do_install and PROVIDES
>>>>>>>>=20
>>>>>>>> It's insane re-introducing a virtual/javac-native without =
understanding
>>>>>>>> the issues coming with that.
>>>>>>>=20
>>>>>>> Please carefully review the patches before saying insane, I =
don't think it was
>>>>>>> correct to remove virtual/javac-native since there are several =
providers.
>>>>>>=20
>>>>>> What does virtual/javac-native mean? Correctly, there can be =
several providers.
>>>>>>=20
>>>>>> How many of them can you have in one sysroot/build? One.
>>>>>>=20
>>>>>> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes =
PROVIDE virtual/javac-native,
>>>>>> what happens?
>>>>>=20
>>>>> So seem like you don't really understand how it should be used.
>>>>>=20
>>>>> Yes, only one we can have when there are multiple providers, =
that's why we should
>>>>> use PREFERRED_PROVIDER to determines which one it is, and use the =
virtual/foo
>>>>> instead of specific provider's name in DEPENDS/RDEPENDS of the =
recipe that requires it,
>>>>> so we can ensure only one will be built and avoid conflicts.
>>>>=20
>>>> And there starts your misunderstanding:
>>>=20
>>> Ok, if so, sorry that my English is not good enough to understand =
your words correctly.
>>=20
>> Take a number ;)
>>=20
>>>> You can't even install multiple providers, even when picking one.
>>>=20
>>> Picking one is to avoid installing multiple providers, why do we =
need to install
>>> multiple providers? Seems likely I'm starting to misunderstand =
again?
>>=20
>> This isn't optional!
>=20
> Ok, I see why  we don't have the same understanding.
>=20
> We have different definition of providers:
> You mean every packages that have java/javac binary installed as =
providers regardless of the different installed locations.
> Mine is based on the definition of PROVIDES, only those intall =
java/javac in the same location and explicitly define
> in PROVIDES variable:
>=20
> For example:
> Cacao-native and jamvm-native both install java in /usr/bin and define =
virtual/java-native in PROVIDES,
> So they are providers of virtual/java-native;
> icedtea7-native installs java in /usr/lib/jvm/icedtea7-native/bin/, =
it's not provider of virtual/java-native here.

But what are cacao-native and jamvm-native good for? Bootstrapping, =
nothing else.
And for bootstrapping it's restricted to cacao-native, isn't it?

However - maybe just the naming of the provide is unlucky chosen, if it =
will be possible to bootstrap using jamvm-native.
Someone (not me) has to verify that! But then, the provide must be named =
virtual/bootstrap-java-native.

Beside of the naming, when ALTERNATIVES doesn't work for native, I don't =
think any native java-vm/javac should install into usr/bin,
always in a sub-directory of /usr/lib/jvm/$(JAVA_HOME) of the specific =
java-vm/javac.

>> openjdk-7-native (provided by icedtea7) requires Java5 to build =
(provided by ecj-initial, iirc).
>> openjdk-7 requires openjdk-7-native - so at least here you have 2 =
providers for java-native in your
>> sysroot/x86_64 ...
>>=20
>> openjdk-8-native requires Java7 or Java8 to build, which is provided =
by icedtea7 or a previous build of
>> openjdk-8-native (for reliability I let openjdk-8-native depend on =
icedtea7).
>> openjdk-8 requires Java7 or Java8 to build (icedtea7-native or =
openjdk-8-native), for reliability I let
>> openjdk-8 depend on openjdk-8-native.
>=20
> I surely knew this, that's why I removed the symlink and PROVIDES, =
here is the comments in my fix:
>    - Do not let openjdk-8-native provides jar, java and javac,
>      just like what we do in icedtea7-native, which can provides
>      but not to avoid circular dependencies and conflicts.

I didn't call that commit insane ;)
Only this one we're talking about :D

>> Bootstrapping Java7 means, you have 3 javac and 3 javavm's in you =
native sysroot (jikes, ecj-initial,
>> icedtea7), bootstrapping openjdk-8 adds openjdk-8-native.
>>=20
>>>> But doesn't icedtea7-native provide virtual/java-native and =
virtual/javac-native?
>>>> Doesn't openjdk-8-native provide virtual/java-native and =
virtual/javac-native?
>>>>=20
>>>> When virtual/java-native is only for bootstrapping, that it's =
misused and
>>>> must be removed. Providers are for abstraction, not for confusing.
>>>=20
>>> I think you mean that there are two java: one for bootstrapping and =
another is normal java,
>>> So maybe you need something like virtual/java-bootstrap-native and =
virtual/java-native to
>>> avoid confusing.
>>> For now, the followings can provide java:
>>> cacao-native, jamvm-native, icedtea7-native, openjdk8-native
>>>=20
>>> which ones are for bootstrapping only?
>>=20
>> Depends what you want to bootstrap ;)
>> That's why the virtual/java*-native is such annoying.
>=20
> I don't think it's annoying. It depends how you define it, just like I =
said, you can clearly define
> something like virtual/java-bootstrap-native and others to avoid =
confusing.

If there're surely several working providers for =
virtual/java-bootstrap-native, what is
recipes-core/ecj/ecj-bootstrap-native.bb in that world?

>>>>> FYI:
>>>>> =
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manu=
al.html#bb-
>>>> bitbake-preferences
>>>>> =
http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-PREFER=
RED_PROVIDER
>>>>>=20
>>>>>>=20
>>>>>> It is insane to have multiple providers for the same virtual/foo =
when at least a bunch
>>>>>=20
>>>>> Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to =
handle multiple providers,
>>>>> (another one is update-alternatives which is not supported by =
-native recipe), and work fine
>>>>> in many projects, why is it insane here?
>>>>=20
>>>> Insane is, that you cannot choose - you have to install all until =
you reach the required
>>>> Java language level.
>>>=20
>>> Again, I may misunderstand, I don't know why I have to install all =
(providers?)?
>>>=20
>>>>=20
>>>>> I tested my patches to build openjdk7, openjdk8 and most recipes =
in meta-java with and without
>>>> sstate
>>>>> on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all =
built fine (previous
>> method
>>>>> fails to build openjdk7 sometime and always fail when build with =
sstate)
>>>>=20
>>>> That has nothing to do with the providers, it has to do with the =
wrong install of same
>>>> binary to a place where another one has been installed. This has to =
do with alternatives,
>>>=20
>>> I agree that the alternatives may be a better solution than =
providers, but the problem is the
>>> update-alternative.bbclass doesn't support -native packages, please =
send patch to fix it if you
>>> think it's needed.
>>=20
>> And provides is the wrong logic.
>=20
> I don't think it's wrong, you just need a clearer definition.
>=20
>> That's why 04d5d0bf4 eliminates that to reach a reliable
>> bootstrap path.
>=20
> But this introduced conflicts(along with the incorrect do_install of =
openjdk8-native) and it always
> fail when build with sstate.

It only fails because of the wrong install of openjdk8-native - I still =
don't see the conflict.
I grepped over all mails you sent in Dec and didn't find any hint what =
conflicts by hard-coding the
bootstrap phase.

Can you please be more details here, what beside of the incorrect =
do_install of openjdk8-native
conflicts?

> Thanks,
> Jackie
>=20
>>=20
>>> Anyway, these patches have been merged and it works fine for now in =
our project, no insane error
>>> happens. Feel free to send your patch to fix the insane part you =
think,
>>=20
>> But you patch and the way you pushed it makes it impossible for me to =
share work based on that,
>> since I don't go and revert your reverts to wait for the next moment =
you don't get it and override
>> it again. As long as you stick on your idea, feel free to cherry-pick =
recipes I build on meta-java
>> or cross-compiled java from my github repositories.
>>=20
>>> but please remember to do
>>> enough tests to ensure it doesn't break others. Thanks!
>>=20
>> I tested as good as I could in my environment and asked for more than =
4 weeks people on ML to test.
>> When you work on master, expect some breaking. No hurry insane revert =
needed.
>>=20
>> Best regards
>> --
>> Jens Rehsack - rehsack@gmail.com
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_FFAA468A-BCB5-4EE9-ACDB-FF8B3F237267
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWmMF9AAoJEESZlq7c5QqdI9wP/iTKP/d+9MEN1vmy2LT734sz
iB4nesDmL0ze3mYQ+KK8I3eqKibvwWCa+lUntjeEdfGWtexHBdOhg+XRdXDFuCat
PsCzBh+z7sz4F3d+ciyXUpHLp+99V2VBTm7BUPKOA8YY3J01eylwsx83fdZmSrBO
ve90S9bWDCaIQsUJPg657S1azYR2igMAICKlB09CPNHoK0zEfiDXds1DKiF9fN7I
viBE/iCnm2UW+7BCqAOTwBzZr7K9wNs6SdeOWq1/oxm+/ZJCbbVkeIs28c4qhOIA
hTQDJ+FuAORPZvklHBAlFxiLjK3td8WRDoisEn5i+tH5UOsGbSBs93H06x72PPJl
0YUGK7PIU6OAXChNW8i4wmRoRarbqj1JrF0sM4hmLlx1nKxztndXNHhXVSFoXdjH
3u2NxHZf8x3XUqKq/W/aVCDN7h2os4rBylfPLIT8DFpk6ovqta3V8H+pt4jB9VOZ
r7n5au9+F/PjmrCdxriCLdriY5dwv5uGQ4PcqxYJR/XOp8Pc67iuhuGluv7IYUaV
JhYW05sjS/jG2jS6tjrfnYiJQU+9+muIs3+l+Lwz25Gl6FfK5BB6I6XUzm3V1NVJ
M1MFqUj36IV6EcxRR2bPQfM7TvxBfpPXTGvbKlUE6BXzcaaIodDKZcPVwJpHa6hJ
uC4+tEcZGKnehdkwq5Bm
=rA0F
-----END PGP SIGNATURE-----

--Apple-Mail=_FFAA468A-BCB5-4EE9-ACDB-FF8B3F237267--
