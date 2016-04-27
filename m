Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80345731F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:49:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id w143so10262887wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SGbaAQfsQPjfkFtB+dL9+P0U0oeTBGqceGW72mAQVxk=;
	b=gqwMaY4mFooJhnKznctY1SBxRDT31w5dG0ok6h7Eg5065c4Wlz1IbG8x8I99XZKAVA
	Q+v1AEnlIznimvLXibDtfNu4ilBOEU2lS57ulJMK1LNrNLoPp5IDOfy4hqo+hR2Pn/Sy
	4d7mvfqV7vzpIBH0ZSAMrnsCHh4v4DoeQhqDdx+W2Gy55QP+IFI6K/bDLT8UDdiEVpzF
	4QqWUUIbuvQ7aT1LJLUlMsxyPC+iPc2F95uu8bMpPV62H7lFwxanJCSPfWvmcdylVPkO
	O3riQ+gCnPcmDzQwDucKLOE+tEEDX/wgM9l4NxyfFl/sjZKio48K6jdsnQxc8twytGda
	6yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SGbaAQfsQPjfkFtB+dL9+P0U0oeTBGqceGW72mAQVxk=;
	b=X8QfxF5SqlfG2BpAhUNcK0F6yieTm2WA93kbNJsVpNq8YbqdHuSE4TQEuCxY+hgy3B
	Cx8QUKbjHRnUiE/ZdXFIQD/34fpPrF6tZZItgssgfIUDwBkad0LTj857grXmt0zFDx55
	T3UaJG4N83FveYqiOic0E8lLo3IB0jOli2z1OEkDy4avOtoXtJtJdTef/YopG46xpPqy
	6FXvOeWImi93Vj/e3Z0bys0D0jTupocp3WFL+0NH33EaSjuA7Mx1KDExE7eRXCpOrx5e
	Tk2JOCfH0xjnPmfFhUngefHZQ7I9OTs4teAiq9hr0M8qHlNWtFGMRytb9ufjG9TvTwPv
	YJDA==
X-Gm-Message-State: AOPr4FVN/t//DkQggaiaTs9yHXFAABYQTmMfzbw3jr4FR3MF3C8B8q0EhDPKKke9JR4jeQ==
X-Received: by 10.194.235.39 with SMTP id uj7mr7358349wjc.78.1461743384409;
	Wed, 27 Apr 2016 00:49:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r8sm7045111wme.14.2016.04.27.00.49.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Apr 2016 00:49:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Apr 2016 09:50:14 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160427075014.GD2559@jama>
References: <1461660854-31802-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1461660854-31802-1-git-send-email-Qi.Chen@windriver.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-networking][PATCH] snort: fix paths in pkgconfig files
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
X-List-Received-Date: Wed, 27 Apr 2016 07:49:44 -0000
X-Groupsio-MsgNum: 61197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline

--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2016 at 04:54:14PM +0800, Chen Qi wrote:
> Fix paths in pkgconfig files and remove snort from blacklist.

There is also undeclared dependency as shown by QA warning:
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency, =
missing xz in DEPENDS or PACKAGECONFIG? [build-deps]

Please fix that before unblacklisting.

>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb =
b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
> index 7d946af..69180c8 100644
> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
> @@ -56,6 +56,8 @@ do_install_append() {
>      install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
>      mkdir -p ${D}${localstatedir}/log/snort
>      install -d ${D}/var/log/snort
> +
> +    sed -i 's/-fdebug-prefix-map[^ ]*//g; s#${STAGING_DIR_TARGET}##g' ${=
D}${libdir}/pkgconfig/*.pc
>  }
> =20
>  FILES_${PN} +=3D " \
> @@ -84,6 +86,3 @@ FILES_${PN}-dev +=3D " \
>      ${libdir}/snort_dynamicrules/*.so \
>      ${prefix}/src/snort_dynamicsrc \
>  "
> -
> -# http://errors.yoctoproject.org/Errors/Details/35137/
> -PNBLACKLIST[snort] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_outpu=
t.pc, snort.pc"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcgbzUACgkQN1Ujt2V2gByx4wCgqUwx1W5W+IQRLhmG7f+pyqjQ
5YwAnjuL8P7YCaC+gJMGeZQ8LZTT5HT8
=IohK
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--
