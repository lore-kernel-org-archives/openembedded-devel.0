Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvTq8-00069R-RQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 15:47:24 +0200
Received: by weyr6 with SMTP id r6so2785218wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3Mv/bba0dPkrDNBdniNg3MneiBgOHHH2VTVcW70Bh3Y=;
	b=XCYxA/m5ld2bo/WYcJBxv5ITx/aAgHwRBsFW0HMo5TaI3zRYTL1C2GsxgJcwIC95Xh
	ZxNeQeFnrM07cDVVtrpS5SEPu2qA3xw0jEFCw91Crpncjmeg4mzrvboBB3BUvwFPal/U
	Tx7VF6+x/w/wrozNsC5yfsRZ6yEVAenMBGGNQn9N5Lzlgty+89LfPDiJnwPD0bBVOQUx
	ugLFXw3WZJOvYGP00mZdKHh1JAx9SGmaYqRW9HCl5XE3EvK7klkJc3MCePQlJ5Kkyqvn
	PbSy94pbPVWpeXyOfrhNesSywWFaOP9XH1ypcRH5SNvH5axL4KEnS67Ssbf+NFey7z24
	LzMA==
Received: by 10.180.86.133 with SMTP id p5mr19360966wiz.17.1343568950299;
	Sun, 29 Jul 2012 06:35:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm10597721wib.5.2012.07.29.06.35.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 06:35:49 -0700 (PDT)
Date: Sun, 29 Jul 2012 15:35:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120729133543.GG3261@jama.jama.net>
References: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
	<1343515918-20671-2-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrX04zfu_wVg317WPgc=u38niLtjmfkBiNrzfkTgBCbeA@mail.gmail.com>
	<20120729131359.GF3261@jama.jama.net>
	<CAP9ODKoQPz2p4Qc+HtsRy_4EV-JwCgzhd=oO7RUyUbH4LjiM=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoQPz2p4Qc+HtsRy_4EV-JwCgzhd=oO7RUyUbH4LjiM=A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 2/2] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sun, 29 Jul 2012 13:47:24 -0000
X-Groupsio-MsgNum: 39916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Content-Disposition: inline

--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 29, 2012 at 10:16:06AM -0300, Otavio Salvador wrote:
> On Sun, Jul 29, 2012 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Sun, Jul 29, 2012 at 10:10:48AM -0300, Otavio Salvador wrote:
> >> On Sat, Jul 28, 2012 at 7:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > systemd-kmsg-syslogd.service is discontinued in systemd so
> >> > there is no need to stop it.
> >>
> >> I don't see a relationship in above description :-)
> >>
> >> Or we drop it completely or it needs to be stoped ;-)
> >
> > It's not installed by current systemd, so busybox-syslogd-systemd is
> > failing (to start/stop) because it's trying to stop it.
>=20
> Then the .systemd file needs to be removed, not the stop to be dropped.

what's .systemd file?

systemd-kmsg-syslogd.service *was* already removed in current systemd versi=
on
we have in meta-systemd.

busybox-syslog.service.in can still be usefull for someone and it should
work if=20
ExecStartPre=3D/bin/systemctl stop systemd-kmsg-syslogd.service
line is removed like khem did.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAVPC8ACgkQN1Ujt2V2gBzU2ACgie5uxHLJnTSB2NFkHAsq0dS0
jJwAniWZxwa57Ht67f7ZOYfzQBF3nvt1
=xCVR
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
