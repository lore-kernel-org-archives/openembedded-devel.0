Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 775B76FD8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 11:40:25 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so707962wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JbZw0VgJn4NyS1fNZNsyafA6sKBw7dl2WYqnk6Y1/t8=;
	b=SJcY80ZGgz9Z7WwBdiNefGXl5WwILCsEBlq6Xr2bSZ1AGtKus4YYINeuWKq17j8Mlq
	ddxrFAS5CeBiZs9Gm2AagTkHiv4I6vEyD9uVV6gahEMfnyO7oJXFpUNHFIXW4118MvVQ
	MHMDcdSZ0s0T0T0Q74DrHgyFoXbcx0rZEHEscbb+4vZh6qlRMAFOjnCzN2udXdtrWYM+
	A0SZ5uB69x72VllUUGO1TFcstcwbq4ggYLfZ/tFF4SIW4ykrt1pdtEz5gXxoK9r67Hsx
	3/b+EUv+fcTdCLIkdYA3ngc6XddnoPpZ38kAgtbpo0WK93izgHcsalxv6OIBrJhw42/g
	vDtQ==
X-Received: by 10.181.8.198 with SMTP id dm6mr4027511wid.30.1402659626198;
	Fri, 13 Jun 2014 04:40:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j44sm11374141eeg.30.2014.06.13.04.40.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jun 2014 04:40:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Jun 2014 13:40:47 +0200
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140613114047.GI2428@jama>
References: <20140610112604.GF2433@jama>
	<1402424282-324-1-git-send-email-ashcharles@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1402424282-324-1-git-send-email-ashcharles@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v3] eject: copy po subdirectory for out-of-tree build
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
X-List-Received-Date: Fri, 13 Jun 2014 11:40:34 -0000
X-Groupsio-MsgNum: 50323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Content-Disposition: inline

--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2014 at 11:18:02AM -0700, Ash Charles wrote:
> The po subdirectory found on the VPATH for an out-of-tree build so we
> copy it over. See [1] for discussion.
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/0=
96052.html
>=20
> v3: only create and populate po/ if it doesn't already exist

^ this doesn't match with patch and it still fails:

ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r=
1/temp/log.do_compile.31092)
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/temp/log.do_compile.=
31092
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-=
64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/CVS' and `/home/jenkins/oe/shr-core-branc=
hes/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po/CVS'=
 are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/Makefile' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/Makefile' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/cs_CZ.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/cs_CZ.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/de_DE.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/de_DE.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/eject.pot' and `/home/jenkins/oe/shr-core=
-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/p=
o/eject.pot' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/es_ES.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/es_ES.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/fr_FR.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/fr_FR.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/ja_JP.eucJP.po' and `/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/ej=
ect/po/ja_JP.eucJP.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/pt_BR.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/pt_BR.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/tr_TR.po' and `/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/eject/po=
/tr_TR.po' are the same file
| cp: `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64=
-oe-linux/eject/2.1.5-r1/eject/po/zh_TW.UTF-8.po' and `/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5-r1/ej=
ect/po/zh_TW.UTF-8.po' are the same file
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/eject/2.1.5=
-r1/temp/log.do_compile.31092)
NOTE: recipe eject-2.1.5-r1: task do_compile: Failed
ERROR: Task 21543 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openemb=
edded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_compile) failed with=
 exit code '1'

> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/eject/eject_2.1.5.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index c47c653..a71d83f 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -16,6 +16,12 @@ S =3D "${WORKDIR}/${BPN}"
> =20
>  PR =3D "r1"
> =20
> +do_compile_prepend() {
> +    # PO subdir must be in build directory
> +    mkdir -p ${B}/po
> +    cp -r ${S}/po/* ${B}/po/
> +}
> +
>  ALTERNATIVE_${PN} =3D "volname eject"
>  ALTERNATIVE_LINK_NAME[volname] =3D "${bindir}/volname"
>  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> --=20
> 1.8.3.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOa4z8ACgkQN1Ujt2V2gBxQBgCfa5stuwovgYvN8f2aUv3kmFrH
198An2IXIraZaiBsCriDQEA1fV/b6p3I
=xohj
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
