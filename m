Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lu4o2-000130-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 15:06:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 9F424140972D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:03:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jmf-qxSQB2rb
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:03:29 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 84C981416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 15:03:29 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200904151633.49146.khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
Date: Wed, 15 Apr 2009 15:01:46 +0200
Message-Id: <1239800506.21612.79.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 13:06:12 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: quoted-printable

Roman I Khimov wrote:
> Hello all.
>=20
> This patch series (will follow in replies) tries to bring in AMD64/x86_=
64=20
> support into OE. This required some intrusive toolchain fixes that I wa=
nt to=20
> post here for review and feedback as I think (or rather know ;)) I migh=
t have=20
> broken something along the way.

Maybe building multilib distro in two separate build trees would be much
easier. Only very few packages (e. g. nspluginwrapper) are much harder
to be built in such environment.

I already tried this:

I used this one in my distro.conf:
layout_libdir =3D "${layout_exec_prefix}/lib64"

It was surprisingly painless. I hade to fix only few errors in
particular packages (fixes are already in oe.dev).

>Next thing is 'libexec' dir. I propose to set it to point to libdir and =
be=20
>done with that (again, Debian does exactly this). For now, I've done tha=
t=20
>just for glibc-multilib.

It's not so easy. Some packages install to libexecdir directly (which
causes ugly pollution of libdir), others use subdirectory.

Something like RECOMMENDED_LIBEXEC_PREFIX in particular packages would
fix this situation. Distros than could choose to keep things as they are
(/usr/libexec), use strictly prefixed /usr/libexec
($prefix/libexec/+$RECOMMENDED_LIBEXEC_PREFIX) use strictly prefixed
libdir, or anything else they want.

I used this one in my distro.conf:
layout_libexecdir =3D "${layout_exec_prefix}/lib"

But I would really prefer:
layout_libexecdir =3D "${layout_exec_prefix}/lib/${RECOMMENDED_LIBEXEC_PR=
EFIX}"

--=20
Best Regards / S pozdravem,

Stanislav Brabec
software developer
---------------------------------------------------------------------
SUSE LINUX, s. r. o.                          e-mail: sbrabec@suse.cz
Lihovarsk=E1 1060/12           tel: +420 284 028 966, +49 911 740538747
190 00 Praha 9                                  fax: +420 284 028 951
Czech Republic                                    http://www.suse.cz/



