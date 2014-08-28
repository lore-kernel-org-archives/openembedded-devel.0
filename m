Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id B0A976FC68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:46:51 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so7713997wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mLQeU9du5maD8VE3kNAjvP+ecMXMpbMzSUlhasQd1WA=;
	b=IDfJD42RhvZCnfFmRZohwHexmBHt+AaUKwxVSe90MgDY3ilNwdSkcIF6wP03pwQkNp
	VTa2sx28amvRxkSm8wp3NueTpgMpHsPupK6XH+lthCKsavERIj9tPjqhwzA6S9oYgvfh
	v8jU3zgkbMayyjlii5TUpXOsQU2CkKNG8yEMwBX27GTe95oUFVhW/7aFOR7zR+/7pu64
	y5jVyLjX72tFWxydxZvN5nf4aT8vUvZrIknmjP2YzAjpN3d0XCdBXVWGs8DpAnMv7Nfm
	BjAkn/Idn0WUpmfVtcJaobdZm8ev+cz4GLInZbp9tKV7k8gO0kVdgOBs3uIcNsA430EP
	gsnA==
X-Received: by 10.180.83.198 with SMTP id s6mr7020791wiy.83.1409240812046;
	Thu, 28 Aug 2014 08:46:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fy1sm16047908wic.6.2014.08.28.08.46.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 08:46:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 17:47:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828154701.GH16066@jama>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
	<1409227581-20888-5-git-send-email-pab@pabigot.com>
	<CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
	<53FF2932.7080505@pabigot.com> <20140828143228.GF16066@jama>
	<53FF498A.8080406@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53FF498A.8080406@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 15:46:53 -0000
X-Groupsio-MsgNum: 51903
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline

--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 10:23:54AM -0500, Peter A. Bigot wrote:
> On 08/28/2014 09:32 AM, Martin Jansa wrote:
> > On Thu, Aug 28, 2014 at 08:05:54AM -0500, Peter A. Bigot wrote:
> >> On 08/28/2014 07:53 AM, Burton, Ross wrote:
> >>> On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
> >>>> +PACKAGECONFIG ??=3D ""
> >>>> +PACKAGECONFIG[kpps] =3D ",,pps-tools"
> >>> That's not actually deterministic - if pps-tools is installed but the
> >>> packageconfig option is disabled then gpsd will still enable the
> >>> support.
> >> Yeah, I'm aware of that.  It's also not something that can be
> >> controlled, since gpsd's author doesn't believe in configuration optio=
ns
> >> to enable features: every capability is enabled or disabled by
> >> inspecting the environment at compile-time.
> >>
> >> Although ntp does support some explicit enable/disable flags, it too
> >> fails to provide a way to say "Pay no attention to that PPS header, it
> >> isn't really there."
> > Then we need to patch their configure.
> >
> >> For this situation I don't think there's a big issue.  The PACKAGECONF=
IG
> >> setting ensures that the header will be available if the feature is
> >> desired.  If it happens to be present but PPS support isn't explicitly
> >> requested, there's no failure in either build or runtime: it's still
> >> gated by runtime checks for PPS sources and the option being enabled in
> >> the Linux kernel.  (There are no runtime libraries that need to be
> >> installed to use KPPS.)
> >>
> >> Is this going to be a problem with the patch being accepted?
> > Yes
> >
> > people can be used to have KPPS support enabled by "accident" e.g.
> > because they are building ntp with KPPS support and pps-tools is almost
> > always built before gpsd..and then once it's built in different order a=
nd end-user will be
> > surprised by lost KPPS support from gpsd.
>=20
> The number of people who will use KPPS is incredibly small, and nobody's=
=20
> going to use it unintentionally as it requires on-target configuration. =
=20
> Those who need it, though, have no recourse other than to build ntpd or=
=20
> gpsd outside of OE if patches like these aren't present.
>=20
> I understand the reasoning and agree in theory that absolute determinism=
=20
> would be ideal, but believe hacking the ntp and gpsd configuration=20
> infrastructure to explicitly disable use of a detected PPS header would=
=20
> present a bigger risk and long-term cost to stability and=20
> maintainability in OE than the possibility you've identified.  So that=20
> solution isn't something I'm going to take on.
>=20
> An alternative is to add kpps to the default PACKAGECONFIG, so the=20
> required header is normally available.  The cost of the feature's=20
> presence in the packages is nearly zero (a slight increase in daemon=20
> code size, and an extra check when the process starts.)  Would that be=20
> acceptable?

More acceptable than the undeterministic behavior - you should even add
it to DEPENDS.

> If we can't come to an agreement, then the only patch that's really=20
> important is the first one which restores the ability to diagnose=20
> misconfigured NTP systems.  Please let me know whether I should mark the=
=20
> others as withdrawn in patchwork.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/TvUACgkQN1Ujt2V2gByrmwCgkQPD5JFVEKbYhwjGAAcRBdKo
CEkAniMaqH9Z2X1t73r32ILuHZL1k6dA
=kh8P
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
