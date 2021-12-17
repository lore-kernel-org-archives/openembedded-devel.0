Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65E2C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 01:57:10 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.1154.1639706229301430371
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 17:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 882F020181;
	Fri, 17 Dec 2021 09:57:03 +0800 (AWST)
Message-ID: 
 <52d6b46ca28b6048f274499846e45daccb8d4ec1.camel@codeconstruct.com.au>
Subject: Re: [oe] [meta-networking][PATCH 2/2] mctp: install dbus service
 configuration
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Dec 2021 09:57:03 +0800
In-Reply-To: 
 <CAMKF1srWwXbEGLwptNaFWChuFiKfeXNbPwqeKh8uk2DP5FoCkw@mail.gmail.com>
References: <20211216083115.417282-1-jk@codeconstruct.com.au>
	 <20211216083115.417282-2-jk@codeconstruct.com.au>
	 <CAMKF1srWwXbEGLwptNaFWChuFiKfeXNbPwqeKh8uk2DP5FoCkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 01:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94414

Hi Khem,

> > +FILES:${PN} +=3D " \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DIS=
TRO_FEATURES', 'systemd', \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> > +"
> > +
>=20
> this should go below do_install and other functions.

OK, can do! I'll send a v2 shortly.

> You can run ./contrib/oe-stylize.py also to get some help on
> formatting

Hm, that seems to make a bit of a mess of the recipe - it moves a bunch
of variable declarations to within the do_install:append() block.

I'm no expert on the full syntax, but something like this might fix it:

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index e1ba1b321..eac096a80 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -211,7 +211,7 @@ OE_vars =3D [
 ]
=20
 varRegexp =3D r'^([a-zA-Z_0-9${}-]*)([ \t]*)([+.:]?=3D[+.]?)([ \t]*)([^\=
t]+)'
-routineRegexp =3D r'^([a-zA-Z0-9_ ${}-]+?)\('
+routineRegexp =3D r'^([a-zA-Z0-9_ ${}:-]+?)\('
=20
 # Variables seen in the processed .bb
 seen_vars =3D {}


- I can send that as a proper patch if that's the correct approach.

Cheers,


Jeremy

