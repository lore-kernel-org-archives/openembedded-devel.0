Return-Path: <jc@vtkloud.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9126158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:44:22 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cz12so6634834veb.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:in-reply-to
	:references:from:to:cc:subject:content-type;
	bh=20wSHpstqX5QynDrnbcDHKfG7VPdR6FXcOAXPTn94z4=;
	b=m8UZRoe09pDMOxNuw3551nOl7l+l1fYe5CRysThaCvrkWCYkZBr7EDenCSc379c34T
	/gAzOYflvBt/2nV0L9bGbZZ5lfAcu3ZvTfHCz2Y8AAGvP//vAFx1ANLHInqeLBpwAQMB
	jOlwT6/uJw073/wBn2/nnxJUbCEulrN8iHs/+FBFn1RKkQdT/+aDgE82a9aN/QMoyxFM
	FOc0Hkydc0g/G+9JxlrsumzMXtTBMpn0k0+BFPJx3e26qkS6Ju1kn6vYsN/I4mGlKkni
	2RV+h04xm6CYcmRvvk9GolfcajV1pgswPnh4F1u3QrvA3tZtWPvXS9wkROmvL1ztyBHD
	yFeA==
X-Gm-Message-State: ALoCoQlTTSlUo6miS5DVh8ef8oXMw7XwyN9VbhgplPc12og6380CcO3nWpdDQ2WyObaEbxRmRi4E
X-Received: by 10.52.108.230 with SMTP id hn6mr896129vdb.28.1379594663455;
	Thu, 19 Sep 2013 05:44:23 -0700 (PDT)
Received: from [127.0.0.1] (ec2-54-235-159-142.compute-1.amazonaws.com.
	[54.235.159.142])
	by mx.google.com with ESMTPSA id eu2sm6343474vdc.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:44:22 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.5.0; +http://www.nodemailer.com/)
Date: Thu, 19 Sep 2013 05:44:22 -0700 (PDT)
Message-Id: <1379594661647.2d381edb@Nodemailer>
In-Reply-To: <20130919120514.GL7313@jama>
References: <20130919120514.GL7313@jama>
X-Orchestra-Oid: E9B070B0-5528-481E-AFDF-9ACA8DFAA21F
X-Orchestra-Sig: c9c4eedc11577160ed197313cc27e22a914244bc
X-Orchestra-Thrid: TDF50CD80-D5BE-4DE9-9446-44DAF41E57D4_1446447564710776253
X-Orchestra-Thrid-Sig: 6ed1629f8ed5cd2e80924bd25012c68ec1d6e5bc
X-Orchestra-Account: 0a51a74848d282c4e5769552fa7b13f47ae493d0
From: "JC" <jc@vtkloud.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 19 Sep 2013 12:44:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Martin



On jeu., sept. 19, 2013 at 2:03 PM, Martin Jansa <martin.jansa@gmail.com=
=3D"mailto:martin.jansa@gmail.com">> wrote:
On Tue, Sep 17, 2013 at 01:47:16PM -0400, JC wrote:
> This is basically a 99% import of Peter Tworek's recipe from tworaz666@g=
mail.com found in https://github.com/tworaz/oe-tworaz/blob/master/meta-jlim=
e/recipes-support/libao/libao_1.1.0.bb
>=20
> Signed-off-by: JC <jc@vtkloud.com>

Please use full name in commits.



=E2=80=8B

There's a genuine email address isn't it enough :)? It's harder than Faceb=
ook here ;)

Anyway, I'll update it but I'd like to see more reviews before to avoid do=
ing a new patch just for that







Jay






> ---
>  .../recipes-multimedia/libao/libao_1.1.0.bb        | 23 +++++++++++++++=
+++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libao/libao_1.1.0=
.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/m=
eta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> new file mode 100644
> index 0000000..08950b5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> @@ -0,0 +1,23 @@
> +SECTION =3D "multimedia"
> +SUMMARY =3D "Libao is a cross-platform audio library that allows progra=
ms to output audio using a simple API on a wide variety of platforms"
> +HOMEPAGE =3D "https://www.xiph.org/ao/"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079ba=
e19f"
> +
> +SRC_URI=3D"http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "2b2508c29bc97e4dc218fa162cf883c8"
> +SRC_URI[sha256sum] =3D "29de5bb9b1726ba890455ef7e562d877df87811febb0d99=
ee69164b88c171bd4"
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
> +    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern=3D'${BPN=
}-plugin-%s', description=3D'AO %s plugin')
> +    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern=3D'$=
{BPN}-plugin-%s-dbg', description=3D'AO %s plugin debug data')
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
<signature.asc>
From martin.jansa@gmail.com  Thu Sep 19 12:53:13 2013
Return-Path: <martin.jansa@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83=
.48])
	by mail.openembedded.org (Postfix) with ESMTP id D429A6C908
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:53:12 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so4151889eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:53:14 -0700 (PDT)
DKIM-Signature: v
