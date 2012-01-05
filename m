Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RitDR-0007z5-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 20:43:09 +0100
Received: by lami14 with SMTP id i14so271006lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=viC5ODrN0mChIpqf5A9aGIm5XxI5xZBTG+198rdnmPE=;
	b=W0fDgPh/erEkvm77D67DwAtban5SboeinZngNeflughqunvqu9BCLvKvsNM5IAvTe4
	Uqr+hH6cxWxRLmIyuwnfQgJg5gXKVM/fa/zm6i+YQKR7NuAu8yF5FP4AfCuAu0rIDpyL
	bKWW3QnJH9Ugnim4ddn4T2ZWqx6yjTzIckHvI=
Received: by 10.112.36.8 with SMTP id m8mr662294lbj.54.1325792146368; Thu, 05
	Jan 2012 11:35:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 5 Jan 2012 11:35:15 -0800 (PST)
In-Reply-To: <4F05EC85.1090908@mvista.com>
References: <1325768156.22038.6.camel@localhost.localdomain>
	<CAMKF1spvw=d4nPRr52dxmpWGrOkow6dZ1gopRCiv2WA0bmfHow@mail.gmail.com>
	<4F05EC85.1090908@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2012 11:35:15 -0800
Message-ID: <CAMKF1sqCthR7x5EGc4JBKjj6qdSBSUBY+d2mK6bGnQ486psjEw@mail.gmail.com>
To: Philby John <pjohn@mvista.com>
Cc: koen@openembedded.org, mwester@dls.net,
	openembedded-devel@lists.openembedded.org, hrw@openembedded.org
Subject: Re: [PATCH] Fix ctorrent build failure by using --disable-maintainer-mode option
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
X-List-Received-Date: Thu, 05 Jan 2012 19:43:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 10:31 AM, Philby John <pjohn@mvista.com> wrote:
> On 01/05/2012 11:36 PM, Khem Raj wrote:
>> On Thu, Jan 5, 2012 at 4:55 AM, philby john <pjohn@mvista.com> wrote:
>>>
>>> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
>>> -PR=3D"r1"
>>> +PR=3D"r2"
>>> +
>>> +do_configure () {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0:
>>> +}
>>>
>>> =C2=A0do_install () {
>>> =C2=A0 install -d ${D}/usr/bin
>>> diff --git a/recipes/ctorrent/ctorrent.inc b/recipes/ctorrent/ctorrent.=
inc
>>> index 8005fa9..e04c5d3 100644
>>> --- a/recipes/ctorrent/ctorrent.inc
>>> +++ b/recipes/ctorrent/ctorrent.inc
>>> @@ -8,3 +8,9 @@ DEPENDS =3D "openssl"
>>> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/ctorrent/ctorrent-${PV}.tar.bz=
2"
>>>
>>> =C2=A0inherit autotools
>>> +
>>> +EXTRA_OECONF =3D "--disable-maintainer-mode"
>>> +
>>> +do_configure() {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
>>> +}
>>
>> why do you override do_configure ?
>> is it not able to reconfigure ?
>
> Yes, ctcs has nothing to configure with, its just one perl script.
> So do_configure() fails for ctcs.
>

clearly then ctorrent.inc is not that common to be used as such in all
recipes there.
you should move inheriting autotools out of ctorrent.inc
and into the needing .bb

> ~Philby
>
>


