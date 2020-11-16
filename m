Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.32564.1605520021653300934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 01:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id A71A0200003;
	Mon, 16 Nov 2020 09:46:58 +0000 (UTC)
Date: Mon, 16 Nov 2020 10:46:56 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-mono] Build error on the latest version of mono.
Message-ID: <20201116104656.0a62f04a@kmaincent-XPS-13-7390>
In-Reply-To: <9b5256a1-9ba1-3a16-46e2-27c5204e0db0@gmail.com>
References: <20201113144333.64d57b47@kmaincent-XPS-13-7390>
	<9b5256a1-9ba1-3a16-46e2-27c5204e0db0@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Fri, 13 Nov 2020 09:50:59 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> On 11/13/20 5:43 AM, Kory Maincent wrote:
> > Hello,
> >=20
> > Got this error when trying to build mono:
> > | ./include/private/gc_atomic_ops.h:105:11: fatal error: atomic_ops.h: =
No
> > such file or directory
> > |   105 | # include "atomic_ops.h"
> >=20
> > I am on Dunfell version of OE.
> > The last commit bring this error:
> > 89f6d12 (HEAD -> dunfell, origin/dunfell) mono: add support for
> > mono-6.10.0.104
> >=20
> > I have never dive into mono building, could someone give me a hint to s=
olve
> > that issue.
> >  =20
>=20
> can you try adding atomic-ops to DEPENDS and see if it helps

Thanks, it builds with this dependencies.
I will sent a patch to add it.

Regards,


--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
