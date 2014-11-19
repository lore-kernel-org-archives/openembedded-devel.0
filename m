Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 468076AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:11:02 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so1959665wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=5HacsDeFkMjjVTeH/ohd7jWPbyrhxE0mD8ZWRRRcZ2I=;
	b=IRdOiIkfHvlG8jXLDP97nRcNCGPW/pAivi3ujQWzfsHgOhZv94LlKb8apVt/G4JuPY
	fVG0MVctkllLrRufRAsA624mnlHIwlbk566qu2Hkjex+sC7iePRUlJYOF23/UCZ0949y
	KtCagLmBRy4iTlv94rPz5VIFossQLdLfmqeZLxtpMpcqI3jcA5NRHUEniwJ/eflYjWYH
	0vbhH23kpAuOCObTsMAYBp8ULFyUFqIXoLwbpeig1Tj0Y1sv1XBW8qbBTHutb8BWC0p3
	y7Myo8nOV3zZb8srnx1ilyIYuTkSqbyDlW0xRfM3XlOLha4WCtm5b5j0qBGxqSIcpVgn
	buXw==
X-Gm-Message-State: ALoCoQmmHFnpWd9be4CoLt5oNb7+g3R/eSS4c+2PUMEfcD/Ik/A0X0mrWgxZCxsQ/jm0n71TYrUo
X-Received: by 10.181.13.106 with SMTP id ex10mr13750861wid.36.1416406261879; 
	Wed, 19 Nov 2014 06:11:01 -0800 (PST)
Received: from ?IPv6:2001:610:612::c083:4a54:da64:257e?
	([2001:610:612:0:c083:4a54:da64:257e])
	by mx.google.com with ESMTPSA id fl1sm2373283wib.15.2014.11.19.06.11.00
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Nov 2014 06:11:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2258239.3cidt6ik12@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 19 Nov 2014 15:10:59 +0100
Message-Id: <FCB4B70E-1248-4F85-BB13-E82B48E35B90@dominion.thruhere.net>
References: <cover.1415758217.git.hongxu.jia@windriver.com>
	<6684481.TtqaFjxDdy@peggleto-mobl5.ger.corp.intel.com>
	<2A9C95B6-1A62-40EC-B9F0-A9F72F6043E4@dominion.thruhere.net>
	<2258239.3cidt6ik12@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 14:11:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 19 nov. 2014, om 12:17 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:
>=20
> On Wednesday 19 November 2014 08:53:11 Koen Kooi wrote:
>>> Op 19 nov. 2014, om 01:36 heeft Paul Eggleton
>>> <paul.eggleton@linux.intel.com> het volgende geschreven:>=20
>>> On Tuesday 18 November 2014 19:32:19 Koen Kooi wrote:
>>>>> Op 18 nov. 2014, om 16:27 heeft Paul Eggleton
>>>>> <paul.eggleton@linux.intel.com> het volgende geschreven:
>>>>>=20
>>>>> Hi Koen,
>>>>>=20
>>>>> On Tuesday 18 November 2014 13:48:15 Koen Kooi wrote:
>>>>>> Hongxu Jia schreef op 13-11-14 12:42:
>>>>>>> On 11/13/2014 07:02 PM, Koen Kooi wrote: Hongxu Jia schreef op
>>>>>>> 12-11-14
>>>>>>>=20
>>>>>>> 03:13:
>>>>>>>>>> The previous libbonobo package contains perl scripts, while
>>>>>>>>>> installing libbonobo, package management detected perl =
required,
>>>>>>>>>> but it actually not needed as lib. So add libbonobo-bin =
package to
>>>>>>>>>> contain these scripts. It refers debian:
>>>>>>>>>> https://packages.debian.org/sid/libbonobo2-bin
>>>>>>>>>>=20
>>>>>>>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> ---
>>>>>>>>>> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file
>>>>>>>>>> changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>>>=20
>>>>>>>>>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>>>>>>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index
>>>>>>>>>> 8b6007e..e0f6168 100644 ---
>>>>>>>>>> a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
>>>>>>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 =
+5,11 @@
>>>>>>>>>> LIC_FILES_CHKSUM =3D
>>>>>>>>>> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \ =
SECTION =3D
>>>>>>>>>> "x11/gnome/libs" DEPENDS =3D "glib-2.0 orbit2 intltool-native =
libxml2
>>>>>>>>>> dbus dbus-glib"
>>>>>>>>>>=20
>>>>>>>>>> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc =
lib_package
>>>>>>>>>>=20
>>>>>>>>>> ORBIT_IDL_SRC =3D "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
>>>>>>>>>>=20
>>>>>>>>>> +RDEPENDS_${PN}-bin =3D "${PN} perl" FILES_${PN} +=3D
>>>>>>>>>> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
>>>>>>>>>> FILES_${PN}-dbg +=3D "${libdir}/bonobo/monikers/.debug \
>>>>>>>>>> ${libdir}/bonobo-2.0/samples/.debug =
${libdir}/orbit-2.0/.debug"
>>>>>>>=20
>>>>>>> This breaks the upgrade path
>>>>>>>=20
>>>>>>>> I am sorry I do not understand what you mean, do you mean =
running
>>>>>>>> 'smart upgrade' failed?
>>>>>>=20
>>>>>> You are moving files between packages, which makes 'opkg update ; =
opkg
>>>>>> upgrade' fail with conflicts unless you carefully craft
>>>>>> RREPLACES/RCONFLICTS or enforce ordering in upgrade order (which =
isn't
>>>>>> currently possible).>
>>>>>=20
>>>>> So what would you suggest - never make any packaging changes?
>>>>=20
>>>> No. I suggest thinking about what you're doing and minimizing the =
damage.
>>>> So far the patches I've seen are misguided (recipe=3D=3Dpackage =
assumption)
>>>> or plain weird. And in all cases break upgrade paths. Since arguing =
the
>>>> use case seems to fall on deaf ears I can only argue the technical
>>>> problems with them.
>>>=20
>>> What do you mean by "arguing the use case" ?
>>=20
>> Making recipe name and package name match, see the avahi patch for =
OE-core
>=20
> Ah, except not only did those patches not get merged, the submitter =
even asked=20
> for the patches to be dropped after the discussion. That hardly counts =
as=20
> "falling on deaf ears".

Great, I can never be sure if the lack of comments from the powers that =
be mean approval or dismissal.Apart from Martin no one commented on the =
recipe=3D=3Dpackage assumptionm which usually means the patch will get =
merged.

>=20
>>>>> It's not as if this is the first time we've done this kind of =
thing...
>>>>=20
>>>> And people still sound surprised when I say upgrade paths are =
broken
>>>> between releases. You yourself told me I should speak up when =
seeing
>>>> such patches and so I did.
>>>=20
>>> I did yes, and I hadn't forgotten. However we do need to make =
packaging
>>> changes from time to time, so we need to work out how to do them =
properly
>>> -
>>> and I'll bang the same drum as I always do - if we want to ensure =
these
>>> changes are properly considered and done in the correct manner, we =
need to
>>> have those things documented. If we do not, you shouldn't be =
surprised
>>> when people miss things. This is clearly an area you are interested =
in so
>>> it's an area you could help document.
>>>=20
>>> Getting back to this specific problem, when splitting out a set of =
files
>>> into a different package as is being done by this patch, as far as I =
am
>>> aware there is no means to ensure that the new package gets =
installed on
>>> upgrade without introducing a hard dependency which would defeat the
>>> purpose of making the change. So that means you either make the =
change or
>>> you don't.
>>=20
>> Not quite, but let's assume so for this case.
>=20
> Well if that's not accurate then let's be clear - why not ... ?

"either you make the change or you don't" is creating something like a =
false dilemma. For the rest of your analysis, see below.

>=20
>>> Are any of
>>> these files that are being split out actually of interest on a =
typical
>>> system that OE would build for? If not, do we care that those files =
will
>>> disappear?
>>=20
>> If the package were the file gets moved to is not installed by =
default this
>> change will cause no problems, but for all others (e.g. people with =
-dev
>> and/or -dbg installed) it will.
>=20
> I'm not following. Won't the corresponding -dev/-dbg packages be =
updated at=20
> the same time?

In the opkg case they will get upgraded sequentially in reverse =
dependency order (or something close to it, opkg has seen a lot of fixes =
in that area). If the package where the file moved to gets upgraded =
before the package where it used to be the upgrade will fail.

In this specific case, I don't know what the perl script does, I'd be =
tempted to move it into its own package and have the -dev package =
RRECOMMEND it if it's for development. If it's not for development, just =
put it in its own package and see if RRECOMMENDS/RDEPENDS are needed. =
And make sure someone actually runtime tests the results.=

