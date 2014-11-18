Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFE47214E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 18:32:22 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k14so10438168wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 10:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=IobtqJasM6LlBQm6LG5Ll3Z1PHPW3SLvjMFbunX59RY=;
	b=fJJ3SYEqAMkgWsBhvj98dEP5fNmVOmO+Y4dxHHcEnZ4qDe+Sy2X30DtjMiPaLZbI98
	IMlNrKIkjeN/mI0LDhhFhunmwqHyNZo0OcIAfE+MCnMJglQvoOsxz6cdcsHRfiGeoKzW
	4QOrcVV8Pn6qeOucz/9LqqdEs6FRBwAIvfAqUk/M3t89CUqwblRPRY37eb0QW85EJpki
	92S3TCaD7c6qvgPsiH/6IYCxXwIy7BEU8nGtKJaNMuxjv6Xjx2lQKsTUrOw5X7iMWf5B
	gkfiYgeWp208a6qdwKkM2pqPSyXDEoAOXCWKL7yIfqYbxT0swHICQ1enlw3FZY/M74Vl
	4c7A==
X-Gm-Message-State: ALoCoQnVgakpaBlQxO2VxXKG3lf0S/ZBiL88AJpmi2cl2+Kyf+wHGDg71Zdrv7janPGlFmjNTpkf
X-Received: by 10.194.93.168 with SMTP id cv8mr22745721wjb.114.1416335542255; 
	Tue, 18 Nov 2014 10:32:22 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id t9sm56840945wjf.41.2014.11.18.10.32.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Nov 2014 10:32:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6715207.EkvTqHTqRG@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 18 Nov 2014 19:32:19 +0100
Message-Id: <FB5465D5-3846-479F-A194-52F1FB16192E@dominion.thruhere.net>
References: <cover.1415758217.git.hongxu.jia@windriver.com>
	<5464990A.5030400@windriver.com> <m4ff6f$nlo$1@ger.gmane.org>
	<6715207.EkvTqHTqRG@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 18 Nov 2014 18:32:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 18 nov. 2014, om 16:27 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:
>=20
> Hi Koen,
>=20
> On Tuesday 18 November 2014 13:48:15 Koen Kooi wrote:
>> Hongxu Jia schreef op 13-11-14 12:42:
>>> On 11/13/2014 07:02 PM, Koen Kooi wrote: Hongxu Jia schreef op =
12-11-14
>>>=20
>>> 03:13:
>>>>>> The previous libbonobo package contains perl scripts, while
>>>>>> installing libbonobo, package management detected perl required,
>>>>>> but it actually not needed as lib. So add libbonobo-bin package =
to
>>>>>> contain these scripts. It refers debian:
>>>>>> https://packages.debian.org/sid/libbonobo2-bin
>>>>>>=20
>>>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> ---
>>>>>> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file
>>>>>> changed, 2 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
>>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index
>>>>>> 8b6007e..e0f6168 100644 ---
>>>>>> a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
>>>>>> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 +5,11 @@
>>>>>> LIC_FILES_CHKSUM =3D
>>>>>> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \ SECTION =
=3D
>>>>>> "x11/gnome/libs" DEPENDS =3D "glib-2.0 orbit2 intltool-native =
libxml2
>>>>>> dbus dbus-glib"
>>>>>>=20
>>>>>> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc lib_package
>>>>>>=20
>>>>>> ORBIT_IDL_SRC =3D "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
>>>>>>=20
>>>>>> +RDEPENDS_${PN}-bin =3D "${PN} perl" FILES_${PN} +=3D
>>>>>> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
>>>>>> FILES_${PN}-dbg +=3D "${libdir}/bonobo/monikers/.debug \
>>>>>> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
>>>=20
>>> This breaks the upgrade path
>>>=20
>>>> I am sorry I do not understand what you mean, do you mean running
>>>> 'smart upgrade' failed?
>>=20
>> You are moving files between packages, which makes 'opkg update ; =
opkg
>> upgrade' fail with conflicts unless you carefully craft =
RREPLACES/RCONFLICTS
>> or enforce ordering in upgrade order (which isn't currently =
possible).
>=20
> So what would you suggest - never make any packaging changes?

No. I suggest thinking about what you're doing and minimizing the =
damage. So far the patches I've seen are misguided (recipe=3D=3Dpackage =
assumption) or plain weird. And in all cases break upgrade paths. Since =
arguing the use case seems to fall on deaf ears I can only argue the =
technical problems with them.

> It's not as if=20
> this is the first time we've done this kind of thing...

And people still sound surprised when I say upgrade paths are broken =
between releases. You yourself told me I should speak up when seeing =
such patches and so I did.=

