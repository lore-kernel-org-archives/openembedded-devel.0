Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2092C6CA20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:03:34 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so4129345ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wQHi9X4dqOu9Ci8MtDV2O5j3FePfEXOFoUrJEg6w5os=;
	b=ZRP/GEK9VqWqGD4bqyUHL8y55cijQrPeoUVOpGteKSoU2IixH3MpqxSc/AMbORzp4v
	JnOOCna6ieHmKbvZkxMh9ujLM/eYH2BrzrK2PWE6/Ua/ne3w4cL2OugOEhQXtDxzz5VZ
	PG2irp/TflhoJQRihC8OaSeVm2pCgVA8MqGoGmgVtI7IPBu+9heVU+JZ5FOYgCfem40q
	gfsgQHnq0vXkBFPdx9BfEvR6B5C9FnTGqYO2qsZVFhzK2Wkee0yfrcAy3VP/XHA+6KAB
	kMNA4WxqTB5ibGkTxxiVbAMrI2AgsojGbrDpChuCucfO0D8/JxwEZX0afwSaB36qDDQx
	zxqw==
X-Received: by 10.14.109.66 with SMTP id r42mr1784365eeg.43.1379592216645;
	Thu, 19 Sep 2013 05:03:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm2110656eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:03:35 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:05:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919120514.GL7313@jama>
References: <1379440036-7538-1-git-send-email-jc@vtkloud.com>
MIME-Version: 1.0
In-Reply-To: <1379440036-7538-1-git-send-email-jc@vtkloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] libao: add version 1.1.0
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
X-List-Received-Date: Thu, 19 Sep 2013 12:03:35 -0000
X-Groupsio-MsgNum: 46244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rVkomL2febZOZtGQ"
Content-Disposition: inline

--rVkomL2febZOZtGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 01:47:16PM -0400, JC wrote:
> This is basically a 99% import of Peter Tworek's recipe from tworaz666@gm=
ail.com found in https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime=
/recipes-support/libao/libao_1.1.0.bb
>=20
> Signed-off-by: JC <jc@vtkloud.com>

Please use full name in commits.

> ---
>  .../recipes-multimedia/libao/libao_1.1.0.bb        | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.=
bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/me=
ta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> new file mode 100644
> index 0000000..08950b5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> @@ -0,0 +1,23 @@
> +SECTION =3D "multimedia"
> +SUMMARY =3D "Libao is a cross-platform audio library that allows program=
s to output audio using a simple API on a wide variety of platforms"
> +HOMEPAGE =3D "https://www.xiph.org/ao/"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI=3D"http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "2b2508c29bc97e4dc218fa162cf883c8"
> +SRC_URI[sha256sum] =3D "29de5bb9b1726ba890455ef7e562d877df87811febb0d99e=
e69164b88c171bd4"
> +
> +inherit autotools
> +
> +do_install_append () {
> +    find "${D}" -name '*.la' -exec rm -f {} +
> +}
> +
> +python populate_packages_prepend () {
> +    rootdir =3D bb.data.expand('${libdir}/ao/plugins-4', d)
> +    rootdir_dbg =3D bb.data.expand('${libdir}/ao/plugins-4/.debug', d)
> +    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern=3D'${BPN}=
-plugin-%s', description=3D'AO %s plugin')
> +    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern=3D'${=
BPN}-plugin-%s-dbg', description=3D'AO %s plugin debug data')
> +}
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rVkomL2febZOZtGQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66HoACgkQN1Ujt2V2gByV2QCfQ7zXG/KThWsRjcwfVSvXAipO
eLoAniGR2qnxvB0aqZZKwSkTj4wwpUq3
=p33Z
-----END PGP SIGNATURE-----

--rVkomL2febZOZtGQ--
