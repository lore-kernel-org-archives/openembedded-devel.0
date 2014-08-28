Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8F470F06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 16:25:19 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id q5so1191131wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p8MNruHmblAW4QetHHT43R30ERA2Z74DJ9AoEe3axhE=;
	b=RNYFMdwLII4IEu5hpRiZ7Sx7YLDETSu4LDLRUgvPEct/CYenW1jV0zd8W0kIFtgECA
	jAAIzlW1n7ghChN3McSOgSzGRnVcXiLGTb6bSC5lkyvBjfqXcd92Etm1GIvzyA7rKHh5
	up4mDfdK95sJ8vBK1BixapMxmmA0hYE0+10aOZabFRSaMz21x9JnfDPyFrFesO0zGCYY
	L0MtWDpLUZBalsLwDYuqqa67PBv7be/xYx1IJLL4QZfnJNsgNZcUxYQRIzuptH0NoDFI
	JsMafP85t7prBHw+YwmY35apceB2fxDyyEm6ypVMNVn/Ka0xRGrLf7gIFtm2Qn1eAtwZ
	s00w==
X-Received: by 10.194.58.148 with SMTP id r20mr6841332wjq.66.1409243120984;
	Thu, 28 Aug 2014 09:25:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr8sm11153030wjb.20.2014.08.28.09.25.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 09:25:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 18:25:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828162530.GI16066@jama>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
	<1409227581-20888-5-git-send-email-pab@pabigot.com>
	<CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
	<53FF2932.7080505@pabigot.com> <20140828143228.GF16066@jama>
	<53FF498A.8080406@pabigot.com> <53FF4F6B.9030203@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53FF4F6B.9030203@pabigot.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 16:25:28 -0000
X-Groupsio-MsgNum: 51906
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
Content-Disposition: inline

--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 10:48:59AM -0500, Peter A. Bigot wrote:
> On 08/28/2014 10:23 AM, Peter A. Bigot wrote:
> > On 08/28/2014 09:32 AM, Martin Jansa wrote:
> >> On Thu, Aug 28, 2014 at 08:05:54AM -0500, Peter A. Bigot wrote:
> >>> On 08/28/2014 07:53 AM, Burton, Ross wrote:
> >>>> On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
> >>>>> +PACKAGECONFIG ??=3D ""
> >>>>> +PACKAGECONFIG[kpps] =3D ",,pps-tools"
> >>>> That's not actually deterministic - if pps-tools is installed but the
> >>>> packageconfig option is disabled then gpsd will still enable the
> >>>> support.
> >>> Yeah, I'm aware of that.  It's also not something that can be
> >>> controlled, since gpsd's author doesn't believe in configuration=20
> >>> options
> >>> to enable features: every capability is enabled or disabled by
> >>> inspecting the environment at compile-time.
> >>>
> >>> Although ntp does support some explicit enable/disable flags, it too
> >>> fails to provide a way to say "Pay no attention to that PPS header, it
> >>> isn't really there."
> >> Then we need to patch their configure.
> >>
> >>> For this situation I don't think there's a big issue.  The=20
> >>> PACKAGECONFIG
> >>> setting ensures that the header will be available if the feature is
> >>> desired.  If it happens to be present but PPS support isn't explicitly
> >>> requested, there's no failure in either build or runtime: it's still
> >>> gated by runtime checks for PPS sources and the option being enabled =
in
> >>> the Linux kernel.  (There are no runtime libraries that need to be
> >>> installed to use KPPS.)
> >>>
> >>> Is this going to be a problem with the patch being accepted?
> >> Yes
> >>
> >> people can be used to have KPPS support enabled by "accident" e.g.
> >> because they are building ntp with KPPS support and pps-tools is almost
> >> always built before gpsd..and then once it's built in different order=
=20
> >> and end-user will be
> >> surprised by lost KPPS support from gpsd.
> >
> > The number of people who will use KPPS is incredibly small, and=20
> > nobody's going to use it unintentionally as it requires on-target=20
> > configuration.  Those who need it, though, have no recourse other than=
=20
> > to build ntpd or gpsd outside of OE if patches like these aren't presen=
t.
> >
> > I understand the reasoning and agree in theory that absolute=20
> > determinism would be ideal, but believe hacking the ntp and gpsd=20
> > configuration infrastructure to explicitly disable use of a detected=20
> > PPS header would present a bigger risk and long-term cost to stability=
=20
> > and maintainability in OE than the possibility you've identified.  So=
=20
> > that solution isn't something I'm going to take on.
> >
> > An alternative is to add kpps to the default PACKAGECONFIG, so the=20
> > required header is normally available.  The cost of the feature's=20
> > presence in the packages is nearly zero (a slight increase in daemon=20
> > code size, and an extra check when the process starts.) Would that be=
=20
> > acceptable?
> >
> > If we can't come to an agreement, then the only patch that's really=20
> > important is the first one which restores the ability to diagnose=20
> > misconfigured NTP systems.  Please let me know whether I should mark=20
> > the others as withdrawn in patchwork.
>=20
> If it matters, note that withdrawing the patches won't change the status=
=20
> quo: ntpd and gpsd are feature-sensitive to the presence of=20
> sys/timepps.h in the build environment, e.g. if pps-tools is added by=20
> another layer.  The only difference is that without the patches there's=
=20
> no clue in their recipes that this could happen and no way to provide=20
> determinism in the want-kpps situation.

That's why I'm building world builds with many builds (to possibly
find as many issues like this as possible).

If it's in some private layer we cannot do much about it, but we can
prevent this happening in meta-oe itself by careful review :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/V/oACgkQN1Ujt2V2gBw/bwCfV2YkreGbA5pZuve4w0wDzo7Z
FKwAnA3IejHwWzekTBzEDSPx7O3ATaM7
=TsjK
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--
