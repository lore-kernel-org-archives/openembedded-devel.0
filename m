Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0F3602D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 12:11:29 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g17so23946477wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TObNo2R/bQT6tmZce9TcBEACKFnXgJ64YfHY2wXReJM=;
	b=RefvT6Ltscut9WchQr8hfGH4nmqFFZGEpyeiUVWyO/YKksyD7TujdRdhzKdtaLjakk
	4L4EIpKTCQQLt5q1tmPHIyNwoZUxCIg2xB2nuI9SHYaWTmVjeG3NJ+gtcrVkQG2my96x
	+NIxiw1xpHcsHRbGylwH/tfg0Hx61u8hYeCOx2Msx78BRBwKudko3jdPo4kKpRl1w+D8
	FGqz1LJqJG9j/hvI8xM3MCF4AFK+fJobxr7MSvdfM7ZhQ3e/26+IzYqCr0sJXeas5MpW
	FKIbv9RxTr2Q8NQuJYLVHdSw2CNbRS08z1UzI7W3YgdgEk9ENGI8Yqdj7Nonm9fZMYWn
	2fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TObNo2R/bQT6tmZce9TcBEACKFnXgJ64YfHY2wXReJM=;
	b=VsiIJTvWx/EbZzenUPzXSQhWeT6Kr1ufXbnm3LEi4w0SsfqG9ZT+7jM/nmjNPDzzXU
	xxhrTebpZDNRWfXYmkze5Z6I/SKWXj4EjDUMV/uzHhrWAbeWhBPBAVWm1TmUTotIwAZw
	TeENmr9mS+sTYdxOr9sZtvWmh/cM9JFu5iFjzzcB5ZFYoQPH2EYpFbQZ1dVp1+x18Bl0
	cfKWq8LYUe0Fc5pfE/BhJ6o9dLbYOnQujIQjR7dl9JtPOSc0AxYYbpikUNC0FjRqHI2q
	TqAGBlgRFTN4/h3GZvFypNrJ72X2izrDXJZtlryPHspljZdybDMkL6GsB3JR6DDqR9l7
	4hww==
X-Gm-Message-State: AOPr4FV++Dg5y2JYTokE+yDj8DUQNixBJAEgB2J1rFGn42T0P1DxJn9pKZksZmSsGdc63w==
X-Received: by 10.194.82.41 with SMTP id f9mr2914424wjy.169.1462882289687;
	Tue, 10 May 2016 05:11:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	us3sm2179038wjc.41.2016.05.10.05.11.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 05:11:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 May 2016 14:11:50 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160510121150.GA2558@jama>
References: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
	<20160502161809.GD17714@mentor.com>
	<CAFSKS=P_CqdgrO_rcTpGQPNn7Vo1t9MAUmg2-D8RdANiFY9gGQ@mail.gmail.com>
	<20252BD2-C54A-402B-A8F1-A7D9C163BFF1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20252BD2-C54A-402B-A8F1-A7D9C163BFF1@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 12:11:30 -0000
X-Groupsio-MsgNum: 61449
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2016 at 03:00:49PM -0700, Khem Raj wrote:
> Please work with Tom to get it cached at sources.openembedded.org

It's already there added automatically from my world builds.

> > On May 9, 2016, at 12:19 PM, George McCollister <george.mccollister@gma=
il.com> wrote:
> >=20
> > 4.2.8p7 appears to have been removed from:
> > https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/
> >=20
> > Not sure if this is temporary...
> >=20
> > Regards,
> > George McCollister
> >=20
> > On Mon, May 2, 2016 at 11:18 AM, Joe MacDonald <Joe_MacDonald@mentor.co=
m> wrote:
> >> [[meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security=
 fixes via update to 4.2.8p7] On 16.05.02 (Mon 08:59) Armin Kuster wrote:
> >>=20
> >>> From: Armin Kuster <akuster@mvista.com>
> >>>=20
> >>> CVE-2016-1551
> >>> CVE-2016-2516
> >>> CVE-2016-2517
> >>> CVE-2016-2518
> >>> CVE-2016-2519
> >>> CVE-2016-1547
> >>> CVE-2015-7704
> >>> CVE-2015-8138
> >>> CVE-2016-1550
> >>>=20
> >>> for more info see:
> >>> http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_=
2_8p7_Security
> >>>=20
> >>> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >>=20
> >> Acked-by: Joe MacDonald <joe_macdonald@mentor.com>
> >>=20
> >>> ---
> >>> .../recipes-support/ntp/{ntp_4.2.8p6.bb =3D> ntp_4.2.8p7.bb}         =
   | 4 ++--
> >>> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>> rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb =3D> ntp_4=
=2E2.8p7.bb} (97%)
> >>>=20
> >>> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/met=
a-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> >>> similarity index 97%
> >>> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> >>> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> >>> index a7b998a..ff4ba64 100644
> >>> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> >>> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
> >>> @@ -23,8 +23,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spo=
ol/ntp4/ntp-4.2/ntp-${PV}.tar.g
> >>>            file://ntpd.list \
> >>> "
> >>>=20
> >>> -SRC_URI[md5sum] =3D "60049f51e9c8305afe30eb22b711c5c6"
> >>> -SRC_URI[sha256sum] =3D "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc1=
5c026e485a0dda4ba048"
> >>> +SRC_URI[md5sum] =3D "46dfba933c3e4bc924d8e55068797578"
> >>> +SRC_URI[sha256sum] =3D "81d20c06a0b01abe3b84fac092185bf014252d38fe5e=
7b2758f604680a0220dc"
> >>>=20
> >>> inherit autotools update-rc.d useradd systemd pkgconfig
> >>>=20
> >> --
> >> -Joe MacDonald.
> >> :wq
> >>=20
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcxz8gACgkQN1Ujt2V2gBxFmwCfRYbloqTINqlrtSieKkKedYLX
S4QAn2782bXO3P7UC4RnLNtfh86A5MjS
=p9fV
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
