Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E71C772D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 17:04:34 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 128so36603356wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QYmD/0B5DghbPjMnHnubbS8xm39SwJGcJHZva7sq9Ws=;
	b=sXl/hn3wvdR4gG+M10brZILsgz/4c8M5ZXqyx4Dpkh2t9z7mHAyZLL4EHU1CXmfkAg
	az93lB4064ATGsf4c0SHXHmmbMhecjkPrVrxLUHanKdpAUOpYaWh2TkaHGY2/q18H4nZ
	GWao6Ifa9Nist3UIzm61+4YGCi5OFlv8JVt3h1C0OZM3pVjOeBkQ3c9X5jX3ubREI9AP
	IPLssX7rAJd7fBG3yMNAuqDsLwo3KgtthRHgmJsL0wq9SRqGQJgUOQ245Y4QAkue5KsW
	24uPCbwtsnGETzA/vaViN9LY2Fi+cQbbBupdT9zm9oLEb7WXHEHK3GPrFp//6E337aHd
	OiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=QYmD/0B5DghbPjMnHnubbS8xm39SwJGcJHZva7sq9Ws=;
	b=aqWKUqFg/4eeZmSK3IAd+V/T4pnm2d3qr7+/o42YqPbQ+mLoOYhdpPY6ivw21jz17M
	t2nIP7O2twRJ3cJfrIm+zTkCeVPyTAihVXKWCkif/pDowJOnW9J0C5JlUjCHdGJIwNRc
	c9o2yf/mqlFZo8RD0sb+ubfUqJAMk5ctK6BulqfPbFzPKKhfePW0g86UUQ1RRvhS0LHM
	ByOFyBK3sNOUulJ3ciG8nnpide8LF94XC2JE2vuPUrdSRDmmTJyNoUJKNk7AHmbqWU+I
	/ZZcoieg6hqmtzT/joQYXg3TzC6BnMpzY0cbYrAkP4nZW6I6bRtY2X+8xrcChFXzjU/U
	JY2A==
X-Gm-Message-State: AG10YORYzvPgeutHs/Dl0NxcKlHlrPDFLTtnFqBG+pGxkZUKD0tBbZgBIFrtXN0CEiUWHw==
X-Received: by 10.28.212.9 with SMTP id l9mr33495893wmg.75.1454605474207;
	Thu, 04 Feb 2016 09:04:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e77sm27129379wma.18.2016.02.04.09.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Feb 2016 09:04:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Feb 2016 18:07:51 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160204170751.GB2573@jama>
References: <1454598513-29263-1-git-send-email-mark.asselstine@windriver.com>
	<20160204160759.GA2573@jama>
	<CAPuovE+N45VRb-3hOM9gJYAmKkx_6Yp3ayMNcHeV_v+X77VUCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPuovE+N45VRb-3hOM9gJYAmKkx_6Yp3ayMNcHeV_v+X77VUCQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] ntp: remove empty libexecdir to prevent potential QA issues
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
X-List-Received-Date: Thu, 04 Feb 2016 17:04:35 -0000
X-Groupsio-MsgNum: 59843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 11:51:56AM -0500, Mark Asselstine wrote:
> On Thu, Feb 4, 2016 at 11:07 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 04, 2016 at 10:08:33AM -0500, Mark Asselstine wrote:
> >> Depending on the configuration used to build ntp it is possible to
> >> have an empty libexecdir. This can cause QA issues. Add a test at the
> >> end of install() to remove libexecdir if it is empty, thus avoiding
> >> the possibility of QA issues, regardless of configuration.
> >>
> >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >> ---
> >>  meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta=
-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> >> index f9f900e..cb09e77 100644
> >> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> >> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> >> @@ -94,6 +94,9 @@ do_install_append() {
> >>
> >>      install -d ${D}${systemd_unitdir}/ntp-units.d
> >>      install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-u=
nits.d/60-ntpd.list
> >> +
> >> +    # Remove an empty libexecdir.
> >> +    [ ! "$(ls -A ${D}${libexecdir})" ] && rm -r ${D}${libexecdir}
> >
> > Isn't this the same as:
> >
> > rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
> >
> > ?
>=20
> It appears to be. rmdir is not a command I use often so I didn't look
> to see if it was suitable for the job. Want me to resend with rmdir or
> you care to make the swap prior to merging?

Joe is maintainer of meta-networking, but I would prefer you to send v2.

> Mark
>=20
>=20
> >
> >>  }
> >>
> >>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlazhWYACgkQN1Ujt2V2gBxHmACgkMg1vIHz1DSPxXHkK2pTA/Vz
jtgAmwX+6n4MEyMcmJ49FQpVq8bgmMzV
=8+Gu
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
