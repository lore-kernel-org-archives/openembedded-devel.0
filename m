Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RvAkp-0002yP-WB
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 17:52:24 +0100
Received: by wgbdr13 with SMTP id dr13so692373wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:44:20 -0800 (PST)
Received: by 10.180.94.68 with SMTP id da4mr41771881wib.22.1328719460444;
	Wed, 08 Feb 2012 08:44:20 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm1002135wib.4.2012.02.08.08.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 08:44:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqKXWKNWASct1gc-ehswVeczt-LswTKC_gaBikSSjyZ_A@mail.gmail.com>
Date: Wed, 8 Feb 2012 17:44:10 +0100
Message-Id: <03CA1E51-4269-4411-B81C-2A50368C2B1F@dominion.thruhere.net>
References: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrAap_fWH_YRTn26ujwt-DwfO7enzprODPJk7iH=Z+AfA@mail.gmail.com>
	<E9FE936C-E077-4187-ACE4-5BCA6806A89C@dominion.thruhere.net>
	<CAP9ODKqKXWKNWASct1gc-ehswVeczt-LswTKC_gaBikSSjyZ_A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 16:52:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 17:34 heeft Otavio Salvador het volgende geschreven:

> On Wed, Feb 8, 2012 at 14:31, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ...=20
> > +                ${libdir}/binfmt.d \
> > +                ${libdir}/modules-load.d \
> > +                ${libdir}/sysctl.d \
>=20
> It's not unrelated, FILES_${PN} changed from +=3D to =3D, so we need =
to mop up the stray files.
>=20
> Those are new files being added, not ones handled by standard =
FILES_${PN} matching so +=3D to =3D doesn't justify this.

Those 3 are indeed not in ${PN}, but does that really need a seperate =
patch?=


