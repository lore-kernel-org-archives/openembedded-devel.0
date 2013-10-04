Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BA5BA61963
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 20:23:29 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2015124eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1y9ojq2euj7gvjmb8Q9AsUIeT8QvShWKG+Big3CEXvE=;
	b=ii9LHW3JsZQuZfK0s4WJJ1+f1iJyPjXJ/WfFfFj2rSvRH+Ohmhp/tj8GOIqV6bbad/
	3lJPPVSuzQpeQISWwDqBvrmDoimYDPPvCXe8sGYu4C/bcxDN01iTgdKbFhFQ3IXe3xBr
	nF89Q7tmmX5dBnMrzBwjYoenom6HwNVK83YHS9dXJqnhyHvj1ZFUjpqaa2W6ruzDf1Qw
	UHlRqmay6o4zK8tktABv2SNjdJHia0B1WiletGn3MzckNDusSSosPvNszmcgnj+NaFU3
	O74Fio7dH7kOJC3C0anPpxlSMLogxscVbWpevXudW76f5ClV1FNUq9u3LyEeMjJ1Njm9
	cHMw==
X-Received: by 10.14.174.131 with SMTP id x3mr5788549eel.61.1380918211047;
	Fri, 04 Oct 2013 13:23:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm31734256eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 13:23:30 -0700 (PDT)
Date: Fri, 4 Oct 2013 22:23:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131004202337.GM6240@jama>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
	<1379760101-13380-8-git-send-email-schnitzeltony@googlemail.com>
	<20131004141815.GH6240@jama>
	<CALbNGRTS88LJ3usk6DWuJppXUX-y0KJ5fEQmRUUoYyVMyt0HEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTS88LJ3usk6DWuJppXUX-y0KJ5fEQmRUUoYyVMyt0HEw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-xfce 07/10] xfce4-settings: add PACKAGECONFIG for sound-settings
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
X-List-Received-Date: Fri, 04 Oct 2013 20:23:31 -0000
X-Groupsio-MsgNum: 46453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yklP1rR72f9kjNtc"
Content-Disposition: inline

--yklP1rR72f9kjNtc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 10:02:25PM +0200, Andreas M=FCller wrote:
> On Fri, Oct 4, 2013 at 4:18 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Sat, Sep 21, 2013 at 12:41:38PM +0200, Andreas M=FCller wrote:
> >> defaults based upon DISTRO_FEATURES for alsa and pulseaudio
> >>
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 8 +++++=
++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> index 4b75dd7..227858a 100644
> >> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> >> @@ -23,9 +23,13 @@ PV =3D "4.10.0+git${SRCPV}"
> Aargh - it is definitely a 4.11+git - I have seen this warning long
> time ago but did not take enough attention...
> >
> > Sorry that I haven't reported it on the commit which caused it :).
>=20
> I will send a patch ontop of this series next week.
>=20
> Nadreas

OK, I'll merge this series this week (2nd build already running).

Could you check xfce4 specific issues in
http://lists.openembedded.org/pipermail/openembedded-core/2013-October/0849=
05.html
?

That would be very appreciated.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yklP1rR72f9kjNtc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJPI8kACgkQN1Ujt2V2gBwycwCghX8aCOA/+YB701JQL1b9N7Fx
MqsAn2vJmwZn1tZ4rToQ36li/NYvRoxk
=/Dia
-----END PGP SIGNATURE-----

--yklP1rR72f9kjNtc--
