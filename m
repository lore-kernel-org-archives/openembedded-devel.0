Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C0CB77FEB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:20:41 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w127so640430qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 22:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S8h+BMKfUvKwXUeFSeIuRdIL54evZTlfxs2Tw66jo7w=;
	b=PF/aObTDa5F72Y3mfOxIxH1O2jL8Y6lr2uwVAmUBDUCjZbQhWmO24U3+ZUq2Yu2t1Y
	/5/FH98WtEAAk2aNbHsCEwQD1ZEQcBU9d0qoVboH7itXKYF443zdlbn0zMptEdxaN3yd
	wa7caUOtrIv7GY1/n14PClC2cbcaUVmFzOk/DyDnEgg6hpHgbSFXhKUQHIKyNU1Dfv2G
	n9S+MvrSOSG3rmy/qNHdAq8p+Mtp5iaMJ57gJKJSIvQFo1VKJjM3k8anHKqn1catp7OP
	ADFfLAJp2CVWm6hJLgkTN1+L8L17jr9CVbp7Fb9IZFc75l3BjinbMrRvX7DHmCDECjMP
	O3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S8h+BMKfUvKwXUeFSeIuRdIL54evZTlfxs2Tw66jo7w=;
	b=LLYNPJQccsMl0YKPY28aalj5oPJPl4zAKNqMftB5273DP/2ymWGfsiwUe8j9LVsRql
	0bfApUwlgbdiUwiiIvS1iBryaUo3P7/fO3hVVgLhjKMJv51VPqY2VbTXLrKB9udYxCOH
	I49EomhDbp+1y0MhCDey4RJAzUNYiNT9IvWBQjKEcD6PxjiVqjXv5ERKaSmI+Ew2b+/p
	ttlnpwlHol/0wSg/Y3jiOrpt8nWicd1ni1a6FHYwFI3SKiM2wDXBm66Yi6G6eJ9k7tAC
	cOm1wKPUWi/d+JJ5rd906wWvYTkY43XnxVWPdTQP5YsgMtLMyoU6sF2+jCtQ47RWU5Ou
	9gKw==
X-Gm-Message-State: APjAAAVxlMi1RjpLabTibjSbs7Hfz8YKCqwKj3PUNLWuHeuCeouv7ema
	Y/5UeZ7y3anmg7QMYS2ytg99n+rMIeVUDPC5bTftHTYQTvI=
X-Google-Smtp-Source: APXvYqzy3krl4HiCWcHivXmncg3FwAW1Kytl/Jsy7sHGNWrzG5vIMxABgdxTDZwU6cP6GQl8IN+q13xuPu6SbAnquSM=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr853706qkg.71.1576650042004;
	Tue, 17 Dec 2019 22:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20191218024810.2874990-1-raj.khem@gmail.com>
	<20191218024810.2874990-2-raj.khem@gmail.com>
	<20191218032342.GB1997@localhost>
In-Reply-To: <20191218032342.GB1997@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Dec 2019 22:20:15 -0800
Message-ID: <CAMKF1soWkJoDVVw6cuAYvxppP0ZjurtX72KTgqS5xfDKPETsKA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] libqb: Add --enable-nosection-fallback with mips64/clang
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
X-List-Received-Date: Wed, 18 Dec 2019 06:20:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 7:23 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Dec 17, 2019 at 06:48:09PM -0800, Khem Raj wrote:
> > Same issue happens with clang/mips64 so extend the gold fix to cover for
> > this case
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-extended/libqb/libqb_1.0.5.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> > index b205186e0b..82503a168b 100644
> > --- a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> > +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
> > @@ -22,9 +22,13 @@ S = "${WORKDIR}/git"
> >  # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: error: conftest.ld: SECTIONS seen after other input files; try -T/--script
> >  # WORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/8.1.0/ld: internal error in write_sections, at ../../gold/reloc.cc:791
> >  # collect2: error: ld returned 1 exit status
> > -EXTRA_OECONF_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' --enable-nosection-fallback', '', d)}"
> > +NOSECTION_FALLBACK = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-nosection-fallback', '', d)}"
> > +NOSECTION_FALLBACK_toolchain-clang_mips64 = "--enable-nosection-fallback"
> >...
>
> Removing these fragile linker tricks is the main change in the 1.9.0

its lot more than that and I am not planning to do major upgrade
https://github.com/ClusterLabs/libqb/releases/tag/1.9.0

> (pre-)release, upgrading might be a better option than collecting more
> cases where the removed code broke.
>

Certain when upgrade to 2.0 is done this will/should be reviewed.

