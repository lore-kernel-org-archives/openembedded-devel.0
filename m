Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C4C8760F52
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 07:34:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f198so649165qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 23:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OJ+5d4Zg2h2UwE+CwU0oYbbVMSMxeX+xLPUSdm4WZcs=;
	b=gOt66sO6LNk7RwdICl8Sdrn5AabkGG4ARBXaOd6UCSxxJdrbeuN3HX1CckzYQOIpTh
	recZrYyoeOiR6ihx+yfwjBKMTwHjdYVJuXP+yatBlSl31Vb5OqCkdLUPJiA/HyDU+DpE
	0bTxSyJdu2inejCtQNVzE5REmR1lEPEb9N2mtf+6kD/JbbX4uH6cNeYaYCiJkGamY4Ik
	t2tB00jeHipyfdtAXy9leK0gHA80Q+7P1vrY06iBdmE+Tu4Iz9MEtpmgGKcnne3ZUGyw
	ALykHRQU4ioIkxzhmlll7c0XScNWpQ+NfkndoA+6mXccPS9rKfrDuthriZa8IkvOuSqO
	4wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OJ+5d4Zg2h2UwE+CwU0oYbbVMSMxeX+xLPUSdm4WZcs=;
	b=UotbxRCm6/X/5jqLojzaC0LA8xF/WJx51QAPhEezPcQ43DZl751W21k+ywM0zRC0Dk
	BahZngVPn2o9RE7koK0fnajDygwMKmbclJvfYWC4VhlPNPcPvp/muxGPkOI8bID+WQpZ
	CfxrLKSmHj5PGEkq2tf9XwRhrGp+vOeXy5NsRbL5h/yc4q1+5BxVTj/5TaQ31t7UQqjR
	YRmOuboNJlrLUnXonkbtvHrfFHGCFDI4iAUaPqWI0HN9EdzmzFUIHY4+sP2UW8ZqDbZ3
	NeGr81gvNGchaqL/cF2I8846hE7g1HdE/3zDnNTEFxwosLc5UTB3nn75NE8sEv/JiYFC
	2yPg==
X-Gm-Message-State: ANhLgQ3QPL3EgxzpzCvwJ5eipXFBi0sEYJjpGnz+MwqxE0d6mfYR8jwi
	ZXk6eMxOv24hl9Fi/VLFkt030o+gc1UFbwNtkuw=
X-Google-Smtp-Source: ADFU+vvHEg6LEvYWzpJgEaNz1ccB9rQds8zlOwzYmbv1cTYuQlLAd18WFeXNbX1GkJNpeQL5axXBR6Tk9+bMzd3797I=
X-Received: by 2002:a37:e317:: with SMTP id y23mr1635580qki.431.1583307258251; 
	Tue, 03 Mar 2020 23:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20200215005402.18661-1-scott.branden@broadcom.com>
	<CAMKF1srJLkYmt=uH7QWDW_-TpeS0FcrVjU3f1Ec_+1_rc4vtwA@mail.gmail.com>
In-Reply-To: <CAMKF1srJLkYmt=uH7QWDW_-TpeS0FcrVjU3f1Ec_+1_rc4vtwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 23:33:52 -0800
Message-ID: <CAMKF1sr92Rmpv_ix7zLSLsm_XrZD2CjdaPNn+Pcbp4A2kLS0wg@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] x265: add x265 recipe
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
X-List-Received-Date: Wed, 04 Mar 2020 07:34:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 3, 2020 at 10:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Scott
>
> I am getting a textrel issue reported on musl builds see
> https://errors.yoctoproject.org/Errors/Details/393681/
>
> this recipe is already applied but would be good to root cause this issue
> and find appropriate fix
>
> https://errors.yoctoproject.org/Errors/Details/393681/

disabling asm helps on 32bit x86

EXTRA_OECMAKE_append_i686 = " -DENABLE_ASSEMBLY=OFF"

can you test this fix and see if this will be ok ?

>
> On Fri, Feb 14, 2020 at 4:54 PM Scott Branden via Openembedded-devel
> <openembedded-devel@lists.openembedded.org> wrote:
> >
> > Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
> >
> > Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> > ---
> >  .../recipes-multimedia/x265/x265_3.2.1.bb     | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> >
> > diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> > new file mode 100644
> > index 0000000000..21ae596e05
> > --- /dev/null
> > +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY = "H.265/HEVC video encoder"
> > +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> > +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> > +
> > +LICENSE = "GPLv2"
> > +LICENSE_FLAGS = "commercial"
> > +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> > +
> > +DEPENDS = "nasm-native gnutls zlib libpcre"
> > +
> > +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
> > +
> > +S = "${WORKDIR}/x265_${PV}/source"
> > +
> > +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
> > +SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> > +
> > +inherit lib_package pkgconfig cmake
> > +
> > +AS[unexport] = "1"
> > +
> > +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

