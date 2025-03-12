Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFB8C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:47:58 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.5845.1741812475584002978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eCaZHLrz;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f417de5e25so123133b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741812475; x=1742417275; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uls78fT2w1c9OZh1JhtC2ns3+R4QSXJZ97sbwxlhQQg=;
        b=eCaZHLrz6OPWnKM+uAiLWLO+G+XFpxftymcldSHTpY7rQ6p272HG+7oZOja0iDhvE6
         uqhrFgAiIotWj3yLCm+IJ1DmSd9HzX2La5OPfgIqUkP+zDa5P7j1l6xazi71eVZ1ZKjy
         73WpVZ/DfWd0vBDK8hwt451HGHIABtAhZhnLRh4QGvwxHEsRo8QRORWmSQrfM1dNjpkj
         CI+VLSiwOSL2220FQj+pQUaqVC2YAp4tBNZm7E7VXIKovqDcMbwfPVMSgjN1R8DsDwIK
         qjOogjLruC6oSHFui55SzNpYBx2vHRr49MKbc5TDiIxtD5JnVfSwjJRq+pJSrb/XzAY/
         nM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741812475; x=1742417275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uls78fT2w1c9OZh1JhtC2ns3+R4QSXJZ97sbwxlhQQg=;
        b=PGWWjg5hyd78gen3aoplh+5u03OOwnXRMHmx7tjSBJcx79wNELTKpmnRR3+Kt+vDlW
         c49jmbXqC1KVBzEO3aphI1d87MSg1leQGWLjPB8XVYKS03IvtIqu1F5IFSFx+MtIcEVO
         fOz7XO4MYjx1769zVes2tvHD9aOLEUdQwUpMQVjFnAVoVJxRZmmlY0nmIJQnam9zEv7m
         +u8GZ5XJM28U649vsr/KVBhDimcv8R9AetZtWRZb/Wj2234d46hXaRCO5v1wJcLRk8We
         CnBfO6Ku9ozILf2FuQ+AUCLRekSKWnWbuTom8PK6/qw1QMRd5fS3XNMGTHqC07Ah7G/Z
         9xIQ==
X-Gm-Message-State: AOJu0Yz5dxEUsWTkTNcvAofrW9jGalmGDRwuuaOt6bQp1e01ogp7aBYH
	4GbfWNv/RzNGpkJEm9LI2bAcoxLQwBvMD7QkU5c4NLdMPHH7dIjWjplR94V24w6hsoQ7cLuDclj
	wpq1YmLshDKb/96JyBDPDpfWXCME=
X-Gm-Gg: ASbGncv+/Fw89YvyuRYOHG0T2Va8pPiyGFUHmNHqb+6xYRjkiQVXk+MmHyIAtoggo+K
	p97jYybRrUiCPARpVD6x43uTtzmGRQIIEKnyHW1KzNGCowIqfg40Xq0HZahZEhj3ZZhag8LRYDd
	yzHbvY4s//jgLhDCmBYLKGOGYgd+efN7EIOQs9ykpA+ttImZ17RBii3BA=
X-Google-Smtp-Source: AGHT+IE4jjUeMSKhY/RSSJe82B/XcIF7ahhEw+HClBJ/92Z2L2DfMv1JwkuGPI6bR2P2v6JojMviPNTZeclrYhiFx4Y=
X-Received: by 2002:a05:6808:3c46:b0:3f9:17f9:3096 with SMTP id
 5614622812f47-3f917f9389fmr7088903b6e.5.1741812474792; Wed, 12 Mar 2025
 13:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <NNse.1741811441373566415.sSfB@lists.openembedded.org>
In-Reply-To: <NNse.1741811441373566415.sSfB@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 13:47:28 -0700
X-Gm-Features: AQ5f1JpdC9zS2jkhEYdy6w28zlMb_jnhoZeao6YCvOt7Cqig7cEZSWxp3TA8k8w
Message-ID: <CAMKF1sr0i2LzE9XbwgWNE8EcpZQ9ca4wD+aTDRVf=6o_Ks7n8w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fitimage.bbclass: Add missing punctuation
To: john.ripple@keysight.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 20:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115943

Thanks for your submission John, but
patch is corrupted somehow

Applying: fitimage.bbclass: Add missing punctuation
error: corrupt patch at line 10


On Wed, Mar 12, 2025 at 1:30=E2=80=AFPM John Ripple via lists.openembedded.=
org
<john.ripple=3Dkeysight.com@lists.openembedded.org> wrote:
>
> The functions related to signing the fitimage had missing quotations and
> newlines. Without this punctuation, the signing class would fail to
> generate a signed fitimage.
> To test this change just create a fitImage using this class and set
> FITIMAGE_SIGN to 1. The resulting fitImage its file should have one
> property per line with quotes around the property values.
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
>  meta-oe/classes/fitimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
> index fef8974187..03c01a1ed3 100644
> --- a/meta-oe/classes/fitimage.bbclass
> +++ b/meta-oe/classes/fitimage.bbclass
> @@ -276,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_im=
ages_list):
>      fd.write('\t\t\tsignature-1 {\n')
>      fd.write(f'\t\t\t\talgo =3D "{hash_algo},{encrypt_algo}";\n')
>      if conf_sign_keyname:
> -        fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sign_keyname}";\n')
> +        fd.write(f'\t\t\t\tkey-name-hint =3D "{conf_sign_keyname}";\n')
>      fd.write(f'\t\t\t\tsign-images =3D {sign_images};\n')
>      fd.write(f'\t\t\t\tsigner-name =3D "{signer_name}";\n')
>      fd.write(f'\t\t\t\tsigner-version =3D "{signer_version}";\n')
> @@ -341,9 +341,9 @@ def fitimage_emit_section_config_fdto(d, fd, dtb, com=
patible):
>
>      fd.write(f'\t\t{dtb} {{\n')
>      fd.write(f'\t\t\tdescription =3D "Device Tree Overlay";\n')
> -    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";')
> +    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";\n')
>      if compatible:
> -       fd.write(f'\t\t\tcompatible =3D "{compatible}";')
> +       fd.write(f'\t\t\tcompatible =3D "{compatible}";\n')
>
>      if sign =3D=3D "1":
>          sign_images =3D ["fdt"]
> @@ -493,7 +493,7 @@ do_configure[postfuncs] +=3D "write_manifest"
>  do_fitimage () {
>      if [ "${FITIMAGE_SIGN}" =3D "1" ]; then
>          uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \
> -            -k ${FITIMAGE_SIGN_KEYDIR} -r \
> +            -k "${FITIMAGE_SIGN_KEYDIR}" -r \
>              -f "${B}/manifest.its" \
>              "${B}/fitImage"
>      else
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115942): https://lists.openembedded.org/g/openembedde=
d-devel/message/115942
> Mute This Topic: https://lists.openembedded.org/mt/111667776/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

