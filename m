Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 36C8F60118
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:36:17 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so16050145wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pxRwv+b2dPbh6MrRbDMmbOSXYFF722x6QM/FGb0l9Kc=;
	b=GaOecpKD6te6tJtBdjQyFAA0E47frv3JuECY/T7vjByLvxk4aZRVMcfARN/TPF22KP
	9blEihiuxE/ym10uR8f+D/UV3G/PWkOFkn8/Xyqhpd0GkUCM3CU6+s3dmeNtO93FEpkL
	/WQT/qNR8preF7jB5oNl76K55i1XtP5vUDoZT0s4/X8px8rB/pDz9LEhjXHO5XOt+L0z
	6ldgKDEdozLL+/qAIiGTprR+g/j8nAnUvRpfzqQd9E9joHI3Kz4mOjMwFCL3fMWcrrK5
	pPvbYV6of2/ikjSHFBsmlkg7OowaY7HyfCIHGimODOiUWvGdH9UmGRWFSB+yJgbndMYx
	Xv4g==
X-Received: by 10.194.250.39 with SMTP id yz7mr15684311wjc.92.1448019378431;
	Fri, 20 Nov 2015 03:36:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	it4sm12320611wjb.0.2015.11.20.03.36.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Nov 2015 03:36:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Nov 2015 12:36:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151120113641.GD2241@jama>
References: <1448018524-16308-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448018524-16308-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] lmsensors: allow lmsensors-isatools to be empty
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
X-List-Received-Date: Fri, 20 Nov 2015 11:36:19 -0000
X-Groupsio-MsgNum: 58762
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 07:22:04PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> isadump and isaset are only built on x86 machines,
> so allow lmsensors-isatools to be empty.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta=
-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
> index 62ea131..364eb9e 100644
> --- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
> @@ -131,3 +131,7 @@ RDEPENDS_${PN}-pwmconfig =3D "${PN}-fancontrol"
>  FILES_${PN}-isatools =3D "${sbindir}/isa*"
>  FILES_${PN}-isatools-dbg =3D "${sbindir}/.debug/isa*"
>  FILES_${PN}-isatools-doc =3D "${mandir}/man8/isa*"
> +
> +# isadump and isaset are only built on x86 machines,
> +# so allow it to be empty.
> +ALLOW_EMPTY_${PN}-isatools =3D "1"

Why should anyone on !x86 install lmsensors-isatools package?

And if (s)he does, then why should s(he) be happy with empty package?

Package manager saying that the package doesn't exist is much better
user experience than it happily installing completely useless empty
package.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZPBcgACgkQN1Ujt2V2gByvXgCfTiGzZUjm4mWZdRJMLzc/tWZl
/twAoK9eIRTn83cxV+2NbAqOk6ik+Q+j
=2oZ3
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
