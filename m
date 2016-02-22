Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E03D277085
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:29:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c200so177091927wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y3wFn6ZEGSce3tkC7BU1vLCQfoSgf0wJv9ClFXViC6A=;
	b=pXSrJPa+YMeL1MRCCOu+5D/EA1dtNuMRMS1zfetXVTW67cL0qvRGBjNfb4/bW98EJR
	8npAhusBGo6U3xubMKiX76tnQ5idEqBuNo0B0lOT2Gj8q9/QidnN3W1ub6yq/GdVOsn4
	WIEww3TPrWYR0lM/D+pPa0N2HeMQwIffcnO/s6O+L109be+rXvY5lkJyIrnt6u0SNuZG
	xG7XvSeVmRLru6tkWYbKs1R66LmrE5Tk2IkDk+hMO6n8mFJNos2Za9WE/ewrX/aTDM7x
	8EbLzb++/BUCjfsOIQapQ2CngyTlJSLixBgXcsp0cKlV6yHt2LDWhL5EO74h1o4bnzt0
	+qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y3wFn6ZEGSce3tkC7BU1vLCQfoSgf0wJv9ClFXViC6A=;
	b=Wccz36JlBSInT1Xj2S82EwsR9FSG7XUHXroRt/d9oQ7QSnSLyfmHwNEOs97XSLcafs
	oCbB/AfLmlljQzmMyKMNDcolY9jK844NDfMVtyU/zZ+/N7nNKZn8dHnc+ktZPKMlWSwv
	xz5RH3SFkHvAmtzRS1n3LOdx+kDkunS1M0fg+s1kHPFexBExbEAFm9DLbXYN3IaamdhI
	2lWzp19100ao0JTdLQ2zvNAJcMIrX9ZJL+W4nhq2q999jiQU+zrkUzUxo7wPfa8MtDlm
	PvRz/VMPNO1p6RVouAUgNBBvhI2TuiEgvOoU4P7hWP7gez4MvyUM8QFDorI3KKF7MeRS
	imbw==
X-Gm-Message-State: AG10YOR7DqECrLdvnPPOUuWBdV53ldN9HZn7sFUhMk72mLfQMBA+PbEISy1vCg/M5jWCMA==
X-Received: by 10.28.5.203 with SMTP id 194mr13894403wmf.101.1456154989147;
	Mon, 22 Feb 2016 07:29:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jo6sm25179564wjb.48.2016.02.22.07.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 07:29:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 16:30:40 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160222153040.GB6329@jama>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
	<1456146625-10100-5-git-send-email-Martin.Jansa@gmail.com>
	<1456152145.28376.196.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1456152145.28376.196.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking 5/5] dovecot: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 15:29:51 -0000
X-Groupsio-MsgNum: 60114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 02:42:25PM +0000, Richard Purdie wrote:
> On Mon, 2016-02-22 at 14:10 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-networking/recipes
> > -support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes
> > -support/dovecot/dovecot_2.2.21.bb
> > index 7fb8b44..f297dff 100644
> > --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
> > +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
> > @@ -63,3 +63,5 @@ FILES_${PN}-staticdev +=3D "${libdir}/dovecot/*/*.a"
> >  FILES_${PN}-dev +=3D "${libdir}/dovecot/*.so"
> >  FILES_${PN}-dbg +=3D "${libdir}/dovecot/*/.debug"
> > =20
> > +# http://errors.yoctoproject.org/Errors/Details/35133/
> > +PNBLACKLIST[dovecot] ?=3D "BROKEN: QA Issue: -dev package contains non
> > -symlink .so""
>=20
> Typo "" above causes a parsing failure with master-next.

I've already fixed it, thanks (and similar in gtkmathview).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLKZ8ACgkQN1Ujt2V2gBxR0wCcCQLq1rf/WRIbZrSSuoShs3YS
RLsAn3EiQKoHOdRGmYwypcF6zg4kbKtl
=bLbK
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
