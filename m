Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 35EC075894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 21:04:18 +0000 (UTC)
Received: by iofz202 with SMTP id z202so92613625iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=g7+dnHa/IYJuGa34mwfCJ0LY652c1pdTnygAwBpuRuI=;
	b=hvOtn4CExSERF6fMVp9Vr+vFYq3NUpALwho+F9hvkQ5Fu5jwwkj3d8w2i1CKr9yK83
	7EmGXzsNrWjV9TjL82B3A3bLgLT6xHSwt06yC1msmBkLJ8jLmeI6oNUAG7zp/5jEGUcH
	saWKymstCKNGM0uDt9HkscYMv8fgQikBxbM9iCELVwpIBoCEZU4fA5VSsBmS2UAfvUVb
	PsPFV8EE9Ax9kM5POmucCRSMzpxMfuHuCREyeR2dD28tTU/yS57ZXvxbd/5pS4JSd3S3
	mIzyDCaxy1p/vipfdZ4uWIt7V4WxEkLEq/3LICNdvGiageQF13oScOLF5SHrFBn78+GI
	2DGQ==
X-Received: by 10.107.3.77 with SMTP id 74mr11620196iod.49.1446239059270; Fri,
	30 Oct 2015 14:04:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 14:03:49 -0700 (PDT)
In-Reply-To: <1446207225-15386-9-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
	<1446207225-15386-9-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 14:03:49 -0700
Message-ID: <CAMKF1spm+B+DKf1G6oD_Qo_fAQecTo2k=jH+vF3USjzBYicNKw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 08/13] bootstrap.bbclass: initial add
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
X-List-Received-Date: Fri, 30 Oct 2015 21:04:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 5:13 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> bootstrap is another magic script which is intended run before autotools.=
 The
> class created runs this script at the right time and ensures that sources=
 of
> gnulib are not cloned during configure.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/classes/bootstrap.bbclass | 20 ++++++++++++++++++++

lets call is autotools-bootstrap otherwise looks ok

>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/classes/bootstrap.bbclass
>
> diff --git a/meta-oe/classes/bootstrap.bbclass b/meta-oe/classes/bootstra=
p.bbclass
> new file mode 100644
> index 0000000..2acd6d8
> --- /dev/null
> +++ b/meta-oe/classes/bootstrap.bbclass
> @@ -0,0 +1,20 @@
> +# Inherit this class if you want to build with bootstrap/autotools
> +inherit autotools
> +
> +DEPENDS +=3D "gnulib"
> +
> +do_configure_prepend() {
> +    currdir=3D`pwd`
> +    cd ${S}
> +
> +    # avoid bootstrap cloning gnulib on every configure
> +    cat >.gitmodules <<EOF
> +[submodule "gnulib"]
> +       path =3D gnulib
> +       url =3D git://git.sv.gnu.org/gnulib
> +EOF
> +    cp -rf ${STAGING_DATADIR}/gnulib ${S}
> +
> +    ./bootstrap
> +    cd $currdir
> +}
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

