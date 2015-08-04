Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8137391A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 05:03:28 +0000 (UTC)
Received: by ykeo23 with SMTP id o23so31911800yke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2015 22:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:references:content-type:in-reply-to:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=RBTH40vWR7BytY0DziQAuWA9Xo5l+u23iFz5WACIFIo=;
	b=vlKMZGOE+FqTyvw3dtWv1W3SiirG0aXJpt7+VA/28pbnyKrq2uoKkAYt2cuOUi/kX+
	MYexXH2Wvf+Xi+DFtzJlm/KNF1c/xr6JVte6N4ZNGZJRTXPcdQdHi1XKeaCNyyAzmtao
	R88NeZDGlKTmPtQycDD38iEMCv3tL+qrTPYqxbH0fABMOAgaf6oC81JHbaRWFH4BCsjA
	Ml/e9ExceBZFnzCxNRH09bDeT6+lJ5gHNxtid0+ryKGgB5ZHdOOVziRXcfRpvle71mJJ
	VuSo+nXWUPW3cA/vZi0EFfGDw5RdPgf7hXzsULuoItfXK7f7S20BUIiaH1fOuFYkCg3H
	zsHw==
X-Received: by 10.170.219.4 with SMTP id l4mr1723637ykf.15.1438664608339;
	Mon, 03 Aug 2015 22:03:28 -0700 (PDT)
Received: from [192.168.1.115] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by smtp.gmail.com with ESMTPSA id
	i124sm13507570ywc.23.2015.08.03.22.03.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Aug 2015 22:03:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <1438655705-55042-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: iPad Mail (12H143)
In-Reply-To: <1438655705-55042-1-git-send-email-leimaohui@cn.fujitsu.com>
Message-Id: <F0390E8A-CAD0-40EB-8F9E-3CB5361F5F21@gmail.com>
Date: Mon, 3 Aug 2015 22:03:26 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-python][PATCH] python-requests: upgrade 2.5.1 -> 2.7.0
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
X-List-Received-Date: Tue, 04 Aug 2015 05:03:30 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Aug 3, 2015, at 7:35 PM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
> .../python/{python-requests_2.5.1.bb =3D> python-requests_2.7.0.bb}   | 6 +=
++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta-python/recipes-devtools/python/{python-requests_2.5.1.bb =3D> p=
ython-requests_2.7.0.bb} (58%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb b=
/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> rename to meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> index b719dca..cd0f99e 100644
> --- a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
> @@ -2,15 +2,15 @@ DESCRIPTION =3D "Python HTTP for Humans."
> HOMEPAGE =3D "http://python-requests.org"
> SECTION =3D "devel/python"
> LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7869e52c8275537186de35e3cd5f9=
ec"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D58c7e163c9f8ee037246da101c6afd=
1e"
>=20
What caused the license checksum change? Would be nice to add a comment abou=
t the change.

> PR =3D "r0"
> SRCNAME =3D "requests"
>=20
> SRC_URI =3D "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME=
}-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "c270eb5551a02e8ab7a4cbb83e22af2e"
> -SRC_URI[sha256sum] =3D "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e=
9e74a628279de66"
> +SRC_URI[md5sum] =3D "29b173fd5fa572ec0764d1fd7b527260"
> +SRC_URI[sha256sum] =3D "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7e=
d5511517b4bb93d"
>=20
> S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>=20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

