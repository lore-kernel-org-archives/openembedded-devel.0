Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9E84E65DEA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:46:10 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so2944351eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dU9RpnvyxeKcuUIGMMeT1PPtG6d9aPtZsJSX8Hujt3M=;
	b=OP43Nri3op4Apqn3PLNJvmgWjG0ObputcoNDlGSIUdbWJdbz3itxs2cRZV/VzQ6Mqf
	YYNhBlUFI6A/F2RbNqYwm5xogfgIjZIBtU45z3Ri5paFVdzUiw4enlNzC6ziI/XnsMbV
	orqGGEddtu6CouR290aJMLzYX38x1frcn+/mxNxk38IFC19JDVGnA5cH8jy28Fk3T5Xk
	9Zk1+hjqCaaihUTy2vIPaO486czBlg6W+4NhO6ZqXFzA8dRGygW2zLsrGuk8QUHcZMSP
	1ASVyvzd/kt81oh4S53LfpYs6q49b7RYP4kojLX22rRjOEXLNCPwj1N1FvywR61MgGuN
	Fpiw==
X-Received: by 10.15.10.3 with SMTP id f3mr38057841eet.1.1397994371254;
	Sun, 20 Apr 2014 04:46:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm93942975eew.19.2014.04.20.04.46.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:46:10 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:46:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114615.GB2486@jama>
References: <1396906203-25158-1-git-send-email-adam.yh.lee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396906203-25158-1-git-send-email-adam.yh.lee@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-xfce][PATCH] xfce4-session: Take the precedence over mini-x-session
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
X-List-Received-Date: Sun, 20 Apr 2014 11:46:16 -0000
X-Groupsio-MsgNum: 49335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bS87dHSPlkoPpvQ6"
Content-Disposition: inline

--bS87dHSPlkoPpvQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 02:30:03PM -0700, Adam YH Lee wrote:
> If x11-base is included in the image, XFCE4 session does not correctly
> start because mini-x-session has higher priority at 50.

Merged, thanks!

> ---
>  .../xfce4-session/xfce4-session_4.10.1.bb          |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> index f7aec5e..74289fb 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
> @@ -15,6 +15,7 @@ SRC_URI +=3D " \
> =20
>  ALTERNATIVE_${PN} =3D "x-session-manager"
>  ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
> +ALTERNATIVE_PRIORITY_${PN} =3D "100"
> =20
>  # protect from frightening message that xfce might not work correctly
>  pkg_postinst_${PN} () {
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bS87dHSPlkoPpvQ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs4cACgkQN1Ujt2V2gBzGXgCfWvEDNBZoOKioycnnWAvDv+rz
QU4Anin3KgrwBJSCPmYO881Ih7+dyTro
=+k1k
-----END PGP SIGNATURE-----

--bS87dHSPlkoPpvQ6--
