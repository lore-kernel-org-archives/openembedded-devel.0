Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id CB22C6A973
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jul 2013 16:20:02 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2425142eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2013 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z9TAiycFySjq+lAkA+tJkhnB1KlesjytgPKOzEuYif8=;
	b=x7u2MQhaJg4rI6ophAFpUx/9vYgLBDRJv4Cqffv0lQpqXGuF7umFDdfjEx7zjCReXG
	/c0Y7fKLQ01Vx9sABLIBgJMlOx3zwOOFY0HHNpdb9PK6/ZoOM46HF74RRPaY0pKwlDOZ
	BL+ZOsWaM6dU44CnuNp+iAyBhWuaSHEAm01I0hFGbRBfEd9fF0u4+FNNHK6fOC4hq5aF
	jzXM01NyLUpAy/4hMFkSWWRGkRSKNxq31vcQDPyUMDicmQ7iOOi3yBbpFiHBQRVEzoVB
	xiZEm8B2o+f/VzjDIuMCdI1SvqoeYPg93gutQ2brewBm6grMY5C098Pp6Cxnj96huqdF
	+M1w==
X-Received: by 10.14.182.132 with SMTP id o4mr20808844eem.94.1373214003010;
	Sun, 07 Jul 2013 09:20:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm34185998eeo.14.2013.07.07.09.20.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 07 Jul 2013 09:20:02 -0700 (PDT)
Date: Sun, 7 Jul 2013 18:20:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130707162010.GH3288@jama>
References: <1373112225-2084-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373112225-2084-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] samba: remove /var/run from package
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
X-List-Received-Date: Sun, 07 Jul 2013 16:20:03 -0000
X-Groupsio-MsgNum: 45327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline

--cW+P/jduATWpL925
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 10:03:45PM +1000, Jonathan Liu wrote:
> The /var/run and /var/run/lock directories are already created by
> base-files.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/=
recipes-connectivity/samba/samba_3.6.8.bb
> index a27a28c..6bd6644 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -57,3 +57,8 @@ do_configure() {
>  do_compile () {
>      base_do_compile
>  }
> +
> +do_install_append() {
> +    rm -rf "${D}${localstatedir}/run"

Seems like lock removal is missing here.

samba-3.6.8: samba: Files/directories were installed but not shipped
  /run
  /run/lock

Thanks a lot for this patchset, now with libdir and infodir QA checks
we'll see a lot more QA issues in world builds, so it's great to have
this /run gone.


> +    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
> +}
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHZlToACgkQN1Ujt2V2gBx/OQCfW84kvlTDvMyBwBn0KzSU4WzJ
iBwAoI3mm5uok3YXh7rdKw+aAQ7EEmaC
=PlUC
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--
