Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id CBAD86C108
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 18:35:33 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q70so27847165qkh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E4UikfSa/brp1HoOaHiQqxdSEQtXsAKpaEXtbxt0WC8=;
	b=QsRhDt0zEw1lff5FUGSMX/RZlGczxErfNBhQ+DFkQ8IeQS/0aqngh9aBl6bv97f/fN
	BTjioVqgwFg5h+Z9d18jCrx7HT5JBasX6CalRSnjzDuF/IBdbLcM4bymFxtSbLUOns1g
	CB2O/93oCSwDE/q1CcZmJ+ClbR18UYASFsRpbUDRC7ZkDgPJUUKMU9QBPpfloPdci1sf
	bGTNn10Fekas2iSliil6VSMAmIsJJMsCDyrgV5zs9ubM45Vwn2wEw8MezSyoLagDcuTV
	PMeGqSYmX1MSemn/FlLOQsC2cc2JpbJry14Zy/of0nu8+8CTq9aOMBVosyst1LYkjE4B
	OMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E4UikfSa/brp1HoOaHiQqxdSEQtXsAKpaEXtbxt0WC8=;
	b=sZRTGcZgxRaBjJl0dxBjBRUlxlPV/FvMsghnxzSNG0BP7E7VRWyPmpsaDJJfN6xTy8
	G676Se/5OrgKgXaDxK4Gup7T2vP9QXC2fopoIchM6Tuak0LcYY+feGy0zTgcFfUEyuPC
	WRalhmYbj+7BuQxGKKn9heHapwTyUSxCL1BAQogut6mIEVluNpl9KWcQz1CeVWUHitZp
	xWT871bhgYkH+uGBUe2YZXDrlCgk37/GS5P+Hiyl5PgY+nJT35Br0ycTYz/a5TV53JP0
	AyF2zV+BUa49OPq0FdvL/rg/45hr/GAeAYhvVefJ6x5h9boQZSfyXomM0ukzL0A1U7Cp
	Qabg==
X-Gm-Message-State: AGRZ1gLNNp4taoTyRcun7MQNBOyey3j3k4JoF1CPCRnNbvKDYRhq6zZn
	+V8n+vLMwnPms5EqDkCm2MY7OdS8UGMrFPb74GY=
X-Google-Smtp-Source: AJdET5caNAK6Vn1V8eL2ffHW2Wjk6+bq1SzkImyVy69KvnXyPTyTNkKE87d8KEYdSTuyAudIlfHVtoUyY1A5jdnTC5g=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr18391965qtk.253.1542566134333;
	Sun, 18 Nov 2018 10:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20181118170442.14670-1-pbasista@gmail.com>
In-Reply-To: <20181118170442.14670-1-pbasista@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Nov 2018 10:35:08 -0800
Message-ID: <CAMKF1sqGt2w+abevmJp==apK=91LLYLijHLD9GPye6d8BUkozQ@mail.gmail.com>
To: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] Add a working tvheadend recipe
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
X-List-Received-Date: Sun, 18 Nov 2018 18:35:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 9:05 AM Peter Ba=C5=A1ista <pbasista@gmail.com> wro=
te:
>
> The original one was previously removed
> by commit ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3
> as part of a clean-up of blacklisted recipes.
>
> Signed-off-by: Peter Ba=C5=A1ista <pbasista@gmail.com>
> ---
>  .../recipes-dvb/tvheadend/tvheadend_git.bb    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.b=
b
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/met=
a-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> new file mode 100644
> index 000000000..2a76d5d34
> --- /dev/null
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "Tvheadend: TV streaming server and recorder"
> +HOMEPAGE =3D "https://tvheadend.org/"
> +
> +DEPENDS =3D "avahi cmake-native gettext-native libpcre2 libdvbcsa openss=
l zlib python-native"

perhaps inheriting cmake, gettext and pythonnative classes is
appropriate here instead of adding
them to depends

> +
> +LICENSE =3D "GPLv3+"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac8=
8ce5db"
> +
> +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git"
> +

missing SRCREV, we need a locked down SHA

> +inherit gitpkgv
> +SRCREV =3D "${AUTOREV}"
> +PV =3D "4.3+git${SRCPV}"
> +PKGV =3D "4.3+git${GITPKGV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG[uriparser] =3D "--enable-uriparser,--disable-uriparser,uri=
parser"
> +
> +do_configure() {
> +    ./configure ${PACKAGECONFIG_CONFARGS} \
> +                --prefix=3D${prefix} \
> +                --libdir=3D${libdir} \
> +                --bindir=3D${bindir} \
> +                --datadir=3D${datadir} \
> +                --arch=3D${TARGET_ARCH} \
> +                --disable-libav \
> +                --disable-ffmpeg_static \
> +                --disable-hdhomerun_static
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +FILES_${PN} +=3D "${datadir}/${BPN}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

