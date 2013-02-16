Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6aQ2-0005fn-ES
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:34:40 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so1736131dam.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 21:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lfKIYYRj/OUyplp/7lDjLuumqc2DKGknIgTUKHivq5E=;
	b=NoZHBXxNY+6IrzYyHwNUTPMOPj/f0BsvwPVVQoszQngy6nDMEy5GEc2VW9ymV1t/6B
	xJlJzXakSX57UpcQEJgCDWEgsxNfpGCUsmGBFg0ZH5yrL7mvNLerSmKPPmckdssi+LQH
	gDuvPdeo9uJA3Khg/LkEe+8d9SMvE3/HXQVQ04siDS7EEMZjtsPA94Z+aIUsTyNgl4tP
	r/VRTAm8xb2RvOmkFl3sq8sS/e0t9oiNXfdustamfZcb9XlICxdwWLZ/roburMatHMmZ
	ogBJaVu0XHSSV/Ult89eC+dFGz/TNklO2lHGwE2Kfbks7v/Dx68Fe862SnWCCkJOdKDq
	upZw==
X-Received: by 10.68.6.167 with SMTP id c7mr12061128pba.24.1360991911235;
	Fri, 15 Feb 2013 21:18:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tp2sm6898852pbc.12.2013.02.15.21.18.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 21:18:30 -0800 (PST)
Date: Sat, 16 Feb 2013 06:18:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216051828.GU3300@jama>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360234263-18278-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/8] google-glog: added svn version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 05:34:50 -0000
X-Groupsio-MsgNum: 43195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iBHcHRCIarfY7C0j"
Content-Disposition: inline

--iBHcHRCIarfY7C0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 11:50:56AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/google-glog/google-glog_svn.bb | 17 ++++++++++++=
+++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/google-glog/google-glog_svn.bb
>=20
> diff --git a/meta-oe/recipes-support/google-glog/google-glog_svn.bb b/met=
a-oe/recipes-support/google-glog/google-glog_svn.bb
> new file mode 100644
> index 0000000..b70aa82
> --- /dev/null
> +++ b/meta-oe/recipes-support/google-glog/google-glog_svn.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION =3D "The glog library implements application-level logging. =
This \
> +library provides logging APIs based on C++-style streams and various hel=
per \
> +macros."
> +HOMEPAGE =3D "https://code.google.com/p/google-glog/"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc9db360e0bbd4e46672f3fd91dd6=
c4b"
> +
> +SRC_URI =3D "svn://google-glog.googlecode.com/svn/;module=3Dtrunk;protoc=
ol=3Dhttp"
> +
> +SRCREV =3D "${AUTOREV}"

Please no AUTOREVs

> +
> +PV =3D "0.3.2+svn${SRCPV}"
> +
> +S =3D "${WORKDIR}/trunk"
> +
> +inherit autotools pkgconfig
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iBHcHRCIarfY7C0j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfFqQACgkQN1Ujt2V2gBzKmwCePLMqprGnefOObWcR4UnwLsJB
QU4An0XCz7M1sRxF0+nf7p53JbKRBBlp
=pM1Q
-----END PGP SIGNATURE-----

--iBHcHRCIarfY7C0j--
