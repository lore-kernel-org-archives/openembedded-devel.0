Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFEC75695
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 12:19:22 +0000 (UTC)
Received: by wgzl5 with SMTP id l5so42396436wgz.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=HzNozUhnIHZbK8v8A3irbAWgprhwdXFx+ZopuHlENtU=;
	b=CMULv9IsWpV1u8hDJj5aSyqZtZDktwCcILBX5YSV9of0bDyGQNvrGHROLBPQN2YU7H
	7G9qXhBoRYOe0rR5dXLvvpfn+/e+3fcV3NPfLFY7DbvFp0qMJphyi2MVGopS4AL8salU
	trXyMwzeAgwpBcMRLmMmlz/J2fgCfvh7E/kEBTe3D66TXgg9oHf+udSU6ybnCGFISYrk
	Fe0ZLiVDaZOUpYbWOeFRcB6556kBgMdRGo4fZImFwmzEtAYDAPMr4JCRToZV0WyLlmQb
	MoEvBbEvBv61/Vym7W62+KEfMHkGP/E5Kd0KthMSImER/m+6qsqBD3tpT3nALLclEMSO
	BngQ==
X-Received: by 10.180.13.171 with SMTP id i11mr12546109wic.5.1434370763796;
	Mon, 15 Jun 2015 05:19:23 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm15597663wif.3.2015.06.15.05.19.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jun 2015 05:19:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Jun 2015 14:19:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150615121927.GB2398@jama>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-6-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434358336-34981-6-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 5/7] libtalloc: add new recipe
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
X-List-Received-Date: Mon, 15 Jun 2015 12:19:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 04:52:14PM +0800, Bian Naimeng wrote:
> libtalloc >=3D 2.0.8 is required by samba4

We already have
=2E/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
so you should just upgrade it.

>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../recipes-support/libtalloc/libtalloc_2.1.1.bb   | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
>=20
> diff --git a/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb b/meta-=
oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
> new file mode 100644
> index 0000000..6285a3c
> --- /dev/null
> +++ b/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "Hierarchical, reference counted memory pool system with des=
tructors"
> +HOMEPAGE =3D "http://talloc.samba.org"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-3.0+ & GPL-3.0+"
> +
> +SRC_URI =3D "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> +                    file://${COREBASE}/meta/files/common-licenses/GPL-3.=
0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> +
> +SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
> +SRC_URI[sha256sum] =3D "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb=
6a459025488b6174"
> +
> +inherit wafsamba
> +
> +S =3D "${WORKDIR}/talloc-${PV}"
> +
> +EXTRA_OECONF +=3D "--disable-rpath \
> +                 --disable-rpath-install \
> +                 --bundled-libraries=3DNONE \
> +                 --builtin-libraries=3Dreplace \
> +                 --disable-silent-rules \
> +                 --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
> +                "
> +
> +PACKAGES +=3D "pytalloc pytalloc-dbg pytalloc-dev"
> +
> +FILE_${PN} =3D "${libdir}/libtalloc.so.2 \
> +                   ${libdir}/libtalloc.so.2.1.1"
> +FILES_${PN}-dbg =3D "/usr/src/debug/ \
> +                       ${libdir}/.debug/libtalloc.so.2.1.1"
> +FILES_${PN}-dev =3D "${includedir}/ \
> +                       ${libdir}/libtalloc.so \
> +                       ${libdir}/pkgconfig/"
> +
> +FILES_pytalloc =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packages/=
* \
> +                  ${libdir}/libpytalloc-util.so.2 \
> +                  ${libdir}/libpytalloc-util.so.2.1.1 \
> +                 "
> +FILES_pytalloc-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packa=
ges/.debug \
> +                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
> +FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
> +RDEPENDS_pytalloc =3D "python"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

