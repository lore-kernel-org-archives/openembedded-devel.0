Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id A794A6CE72
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 15:57:06 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so4129874ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iE0TYqlDa9zyrmk8+dWwEeuKCvG/DjPxd/PQ3x0PH44=;
	b=mz8t5YoqosFumPSkP5GXHQFPIxmm4Pj3zVbeoq86bbI6looYpFhj/i4gHCuIPJcj/8
	BUAO35CCV9VRVcalPadMTwmHPbSOzItyAev5DBfZSM0hv3ap39IcSGvTSeaZVb9YEdfs
	y8SFZk3cjiLOGR+7XUNq2baIL0LoczbMTy2K48R2TIHYHnP5EaRxAQhH0QMGz9vECldV
	RFSQ8k5zyFfQhB5iYW/uYKRNoAwb4SN+7m0wVhQPZ0qA7GiI4vyFpwfHwkE3OGpvWBeh
	6WZFzJ0yJgOtTzD3cTzzlI4WM2XOvsWk5KpBIqxl9Se3sdqtcyEXk1dwjUAVv6l04RmY
	VcQA==
X-Received: by 10.14.101.6 with SMTP id a6mr3376482eeg.81.1381247828103;
	Tue, 08 Oct 2013 08:57:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v8sm77477235eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 08:57:07 -0700 (PDT)
Date: Tue, 8 Oct 2013 17:57:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131008155717.GE2872@jama>
References: <1381245496-23623-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1381245496-23623-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH] qt5.inc: extend FILES_${PN}-examples-*
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
X-List-Received-Date: Tue, 08 Oct 2013 15:57:07 -0000
X-Groupsio-MsgNum: 46559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline

--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 05:18:16PM +0200, Eric B=E9nard wrote:
> this fix :
> ERROR: QA Issue: non debug package contains .debug directory: qtquick1-ex=
amples path
> /work/armv7a-vfp-neon-oe-linux-gnueabi/qtquick1/5.1.1-r0/packages-split/q=
tquick1-examples/
> usr/share/qt5/examples/declarative/cppextensions/plugins/org/qtproject/Ti=
meExample/.debug/libqmlqtimeexampleplugin.so

Added in jansa/test and dora-next, thanks!

>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qt5.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index f1fd951..268ddd7 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -115,6 +115,8 @@ FILES_${PN}-examples-dev =3D " \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*${SOLIBSDEV} \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*${SOLIBSDEV} \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*${SOLIBSDEV} \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/*${SOLIBSDEV} \
>  "
>  FILES_${PN}-examples-dbg =3D " \
>      ${OE_QMAKE_PATH_EXAMPLES}/.debug \
> @@ -123,6 +125,8 @@ FILES_${PN}-examples-dbg =3D " \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/.debug \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/.debug \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/.debug \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/.debug \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/.debug \
>  "
>  FILES_${PN}-examples-staticdev =3D " \
>      ${OE_QMAKE_PATH_EXAMPLES}/*.a \
> @@ -131,6 +135,8 @@ FILES_${PN}-examples-staticdev =3D " \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*.a \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*.a \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*.a \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*.a \
> +    ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/*.a \
>  "
> =20
>  PATH_prepend =3D "${STAGING_DIR_NATIVE}${OE_QMAKE_PATH_QT_BINS}:"
> --=20
> 1.8.4.rc3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJUK10ACgkQN1Ujt2V2gBxvHACcC/HpAEF7XXR2ZzuzgwlB6QYF
+aAAn1zmY/t4t1fkdrvQW8lqou6GQJbk
=Slgo
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--
