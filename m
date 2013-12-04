Return-Path: <joe@deserted.net>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9EC6C737
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:57:06 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2485058eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 05:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=NJ2X9jAH8O0kJG2iST1nQntrOCSSPtFdenzqKy4ssTE=;
	b=LjN6IenLybA/7figPCmbA2EKhTqMNcPeZZL5Xk5tJAwduCzWpywmFvscLSvdOm0xkY
	z1aPgO2YBEI+K/fVgl9CZb7Mx2Y39aRCHTzOrjVIjoUwnazg7JVA/54bFo1o5KWxttq0
	/qxTfQEEDy+gUzzu4Vhs7lX5QtD3zJA+GBeXHSF5NuNZsw21LcSG41PmOooeQykBawsk
	UpxBrtbEhlHLxu5APDeXoaEIJ02dQQLXrYYdCaiN63+WUrJDQ3hBDKD6XRXwNuktbNYK
	JGfLKlQOlumyE7QXxhYJL9fWRq65+B3QEHtNK77b7g22Aqm8VY/h8wiRTqznY2TaumDI
	HLPQ==
X-Gm-Message-State: ALoCoQmUgOj1qpSwgmmOS8Bvk/cnWjYPe2x5Q5hojy6XcafZNvXBEWqFgCJLdlASYdL2iGX6c/Yd
X-Received: by 10.14.207.194 with SMTP id n42mr7711175eeo.76.1386165425440;
	Wed, 04 Dec 2013 05:57:05 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id p45sm4668009eeg.1.2013.12.04.05.57.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 05:57:04 -0800 (PST)
Date: Wed, 4 Dec 2013 08:56:59 -0500
From: Joe MacDonald <joe@deserted.net>
To: Rongqing Li <rongqing.li@windriver.com>,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20131204135658.GB5677@deserted.net>
References: <1385959473-23420-1-git-send-email-rongqing.li@windriver.com>
	<529C50F2.7050601@windriver.com>
MIME-Version: 1.0
In-Reply-To: <529C50F2.7050601@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking v2] proftpd: use /bin/false as the login shell and add home-dir
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
X-List-Received-Date: Wed, 04 Dec 2013 13:57:08 -0000
X-Groupsio-MsgNum: 47373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH meta-networking v2] proftpd: use /bin/false as the login s=
hell and add home-dir] On 13.12.02 (Mon 17:20) Rongqing Li wrote:

> Drop it, test shows it does not work since /bin/false is not valid
> shell, even if set RequireValidShell to off

Hmm, so, there's something else at play here, given:

------------------------------------------------------------------------
commit b613318e14a0038b4fc6d5a7378b1affb64fd471
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Nov 13 05:24:24 2013 +0800

    quagga: use /bin/false as the login shell

    Use /bin/false as the login shell, just like what Ubuntu does,
    otherwise there might be secure issue.

    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    Signed-off-by: Joe MacDonald <joe@deserted.net>

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-net=
working/recipes-protocols/quagga/quagga.inc
index 2106c9b..677b1c5 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -148,7 +148,7 @@ INITSCRIPT_PARAMS_${PN}-watchquagga     =3D "defaults 9=
0 10"
 # Add quagga's user and group
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM_${PN} =3D "--system quagga ; --system quaggavty"
-USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/run/quagga/ -M -=
g quagga quagga"
+USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/run/quagga/ -M -=
g quagga --shell /bin/false quagga"
=20
 pkg_postinst_${PN} () {
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
------------------------------------------------------------------------

Is it that proftpd actually needs to spawn a shell somewhere or that
/bin/false simply isn't listed as a valid shell?  (If the latter,
something should've shown up with the quagga commit, shouldn't it?)

Can you guys sync and get back to me on this?

Thanks,
-J.

>=20
> On 12/02/2013 12:44 PM, rongqing.li@windriver.com wrote:
> >From: Roy Li <rongqing.li@windriver.com>
> >
> >Use /bin/false as the login shell, just like what Ubuntu does,
> >otherwise there might be secure issue; add /var/lib/ftp as user
> >ftp home-dir.
> >
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >---
> >  meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b=
/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> >index 6537b77..0006a2a 100644
> >--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> >+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> >@@ -62,6 +62,7 @@ INITSCRIPT_PARAM =3D "defaults 85 15"
> >
> >  USERADD_PACKAGES =3D "${PN}"
> >  GROUPADD_PARAM_${PN} =3D "--system ${FTPGROUP}"
> >-USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} ${FTPUSER}"
> >+USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} --home-dir /var/lib/${=
FTPUSER} --no-create-home \
> >+                       --shell /bin/false ${FTPUSER}"
> >
> >  FILES_${PN} +=3D "/home/${FTPUSER}"
> >
>=20
--=20
-Joe MacDonald.
:wq

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKfNKoACgkQwFvcllog0Xy9TQCgquVi6GYLso3rkxn4ZGIEVVUS
IloAnia7cXZsdH2JXpFfqrJTTnVh7ytY
=Hw0o
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
