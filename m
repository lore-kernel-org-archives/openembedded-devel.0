Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 517216017E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:03:04 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so11059162wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4bQJsNgD82bLd6B7vwktJfy5Uka2ZJDHfvrw5a5gujk=;
	b=ZuFrkL8XuJybp2GOwCbJmmtLCtm0ZyGaOOgLClh3eTHSWYmbVUiGlU9Ki9S0UqGu29
	jJgOwcijA74XmaPT3jaLAoRKN5Uw5ihkqt5V4KDJWfvfZ4SXqAKMP80kD3IFToTP6Y7F
	N/5ElWzug8BVYjZrNR7EIq4JQs/MwFtiarlSfbPpdv0Y2mX0UeWeuhNOn5/IoBWuUvHb
	2e6sP5XHUqkvdVSMrR4No5oVk8MEfCvNvtVSth5+OFCjsATE8BpAwtb8NV7RKJ3XV9TH
	t+UmC06q6rj8aW+MQutPiljO3uImLxgLS79wLA252nX6Np1KPi+x9qdSKo/YNo6J++dD
	PH2w==
X-Received: by 10.181.13.134 with SMTP id ey6mr5190273wid.88.1436526184118;
	Fri, 10 Jul 2015 04:03:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb16sm2405176wic.5.2015.07.10.04.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jul 2015 04:03:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Jul 2015 13:03:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150710110324.GB2397@jama>
References: <1436521559-10612-1-git-send-email-xiao.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1436521559-10612-1-git-send-email-xiao.zhang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [oe-core][PATCH] libtool: remove the hostname on which libtool was build
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
X-List-Received-Date: Fri, 10 Jul 2015 11:03:07 -0000
X-Groupsio-MsgNum: 56220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2015 at 05:45:59PM +0800, Zhang Xiao wrote:
> Upstream-Status: pending

Wrong ML

>=20
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  meta/recipes-devtools/libtool/libtool_2.4.6.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipe=
s-devtools/libtool/libtool_2.4.6.bb
> index 45f1b2f..65972b0 100644
> --- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
> @@ -15,6 +15,7 @@ do_install_append () {
>              -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
>              -e 's@^\(predep_objects=3D"\).*@\1"@' \
>              -e 's@^\(postdep_objects=3D"\).*@\1"@' \
> +            -e 's/configured on host.*/configured on buildserver/' \
>              -i ${D}${bindir}/libtool
>  }
> =20
> --=20
> 1.8.5.2.233.g932f7e4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWfpnsACgkQN1Ujt2V2gBwV3gCfX/GT/5lHym3vuS6JtQ7Io2fg
8KsAn1ZwAQH1CRWafDvZ7WarHJNhJVmA
=KmNO
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
