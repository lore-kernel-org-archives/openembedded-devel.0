Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BBAC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 08:01:45 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.8202.1751011296235881015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 01:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gv7Dwwme;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-708d90aa8f9so19740727b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751011295; x=1751616095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RndcICTOww1aHz3Sm7XuOfXP0PDD8Kq5OjQ3ty6h/ng=;
        b=gv7Dwwmey2qi82MF85rhd/LvP5WTZdpoGEb+hCidoP1qZlXAeE0lyt4xzPbILiH2vV
         NjC3rPMCy0IIupV7Pnvz4WEnlbvOdXmvFmrZ+hwOyqQdW3nKyQ4Qbfo9M0tSYpxkk/QR
         e3i6rs9c1MpJNxVThxDt9GY0hExNGn8Gj17FL+vr2GCHACSKJLN5mO6ac9BRtDpgN4Rt
         2Gf7yIhXMqIkT+VrRsSyKoze99Jl01jWsskerwU//OBOR0B2PGgcbwPQTWQRJSzr/Jcp
         jyzdSNrNn0lN4uCreU2PWkEFgXCF53bAD/nHD1/ohLHS3B1haOGBGeWGyzOlRhmR31dX
         AkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011295; x=1751616095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RndcICTOww1aHz3Sm7XuOfXP0PDD8Kq5OjQ3ty6h/ng=;
        b=nnVfBM3u6wOYT8Czte3NUAWeLzMSt0KYtVOWzNa6kMgx3PPyiUFgiyTtNA8EXszH+U
         o0T9QVBNaMeoxugfVLCAjWn/x2Yc/uoACAgDtKcQuiswz/IVp/0J/STuMis1o9M+s/29
         2Siy00HFq/vgQ9JQFxsVMFUAhPMPNzIWhnW0G5IYLmQjc6gJVF0hPhnPvTThvLhbQ2u4
         du1tb8niNDe2uaC8aiotRuAEhGTneshLrd3faSB7cEH+BpmDqxM87UYsQIXhaRlJXpU/
         uKdPs4fJcKBs6TDeK11oMi0YuJrZp5hf6ahsu8Y7F+uR6yt5bWgawLOy/fEYX1HamCSd
         DH5A==
X-Forwarded-Encrypted: i=1; AJvYcCUV2kyoVtg4fyUw/KfBESNmstd9fL8mS9Tk/BptV8BWuGyeefMHEVr+fYHsK/Vxw+nsrkO09qrKS3ppDGH9azgL8nY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqDF3xvHSnauMWyCzDppH9FxsDH7RnmdCrOevu1wuCOA8KZUJD
	EGqjAnz5yODgWBmjsH2KHPoU89oaRP/zcac6qz1C14qHRNZqvHMjiSUvnV4XvMTFcTj5twlbS3j
	EoUAlHasLHMA1pNApuueCRawI7H4TD4q2LRM+
X-Gm-Gg: ASbGncu8vfhdO6bF9Zp+eLR4gKJYqq6HNxPGZ0pvPINC2rvJhmyoUkWnNMuILVR7fJF
	Z2VlGA25pMHjlExLeJfs1AY9LuWN8LeaqhWyQcBOhgfluFideapZGlsLw8yyzrGA2NE6123BWen
	I8jKuRkZgAg99VUCJlFFzEiyEeI1o0V78+G8JU1qgszbLndeOc8C1a
X-Google-Smtp-Source: AGHT+IEufnkZSZCsbLDrh8V8hO8zVnSIcCHWhL/cW4SsACWaZ2Pg3/oG+oyZM/mbZpzfoB7mPx0l8QNavjrKI4Rqcmc=
X-Received: by 2002:a05:690c:7401:b0:712:e22d:a235 with SMTP id
 00721157ae682-715171af91amr35670887b3.17.1751011295167; Fri, 27 Jun 2025
 01:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com> <20250627-signing-set-ca-v3-1-030812797c6a@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v3-1-030812797c6a@leica-geosystems.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Jun 2025 01:01:09 -0700
X-Gm-Features: Ac12FXzWMAUj0l_NGkP7X_KlsEOLvna7iRZ6t4-nBjyHrIRyJZmmOkOPEi3e7Ro
Message-ID: <CAMKF1sonO=SsLeNj71XaO-khTanMeDFnczN5i5C+uufauHT9+Q@mail.gmail.com>
Subject: Re: [PATCH meta-oe v3 1/6] signing.bbclass: refactor signing_import_cert_from_*
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: jlu@pengutronix.de, bsp-development.geo@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 08:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118139

Please rebase this on top of latest master or master-next and resend,
it does not apply cleanly.

On Thu, Jun 26, 2025 at 10:40=E2=80=AFPM Johannes Schneider
<johannes.schneider@leica-geosystems.com> wrote:
>
> Refactor the two methods to import certificates from PEM/DER to be
> usable independently from keymaterial that is linked to a role.
>
> By having the import_cert_from methods create a storage location (aka
> role) in the softhsm dynamically.  This way certificates can - but
> don't have to - be linked to a key, or can stand on their own if chain
> of certificates from a PKI has to be managed.
>
> Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
>  meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++++++++----=
------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclas=
s
> index 8af7bbf8e0..c768371151 100644
> --- meta-oe/classes/signing.bbclass
> +++ meta-oe/classes/signing.bbclass
> @@ -123,15 +123,26 @@ signing_import_define_role() {
>      echo "_SIGNING_PKCS11_MODULE_${role}_=3D\"softhsm\"" >> $_SIGNING_EN=
V_FILE_
>  }
>
> -# signing_import_cert_from_der <role> <der>
> +# signing_import_cert_from_der <cert_name> <der>
>  #
> -# Import a certificate from DER file to a role. To be used
> -# with SoftHSM.
> +# Import a certificate from DER file to a cert_name.
> +# Where the <cert_name> can either be a previously setup
> +# signing_import_define_role linking the certificate to a signing key,
> +# or a new identifier when dealing with a standalone certificate.
> +#
> +# To be used with SoftHSM.
>  signing_import_cert_from_der() {
> -    local role=3D"${1}"
> +    local cert_name=3D"${1}"
>      local der=3D"${2}"
>
> -    signing_pkcs11_tool --type cert --write-object "${der}" --label "${r=
ole}"
> +    # check wether the cert_name/role needs to be defined first,
> +    # or do so otherwise
> +    local uri=3D$(siging_get_uri $cert_name)
> +    if [ -z "$uri" ]; then
> +        signing_import_define_role "$cert_name"
> +    fi
> +
> +    signing_pkcs11_tool --type cert --write-object "${der}" --label "${c=
ert_name}"
>  }
>
>  # signing_import_cert_chain_from_pem <role> <pem>
> @@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
>          done
>  }
>
> -# signing_import_cert_from_pem <role> <pem>
> +# signing_import_cert_from_pem <cert_name> <pem>
>  #
> -# Import a certificate from PEM file to a role. To be used
> -# with SoftHSM.
> +# Import a certificate from PEM file to a cert_name.
> +# Where the <cert_name> can either be a previously setup
> +# signing_import_define_role linking the certificate to a signing key,
> +# or a new identifier when dealing with a standalone certificate.
> +#
> +# To be used with SoftHSM.
>  signing_import_cert_from_pem() {
> -    local role=3D"${1}"
> +    local cert_name=3D"${1}"
>      local pem=3D"${2}"
>
> +    # check wether the cert_name/role needs to be defined first,
> +    # or do so otherwise
> +    local uri=3D$(siging_get_uri $cert_name)
> +    if [ -z "$uri" ]; then
> +        signing_import_define_role "$cert_name"
> +    fi
> +
>      openssl x509 \
>          -in "${pem}" -inform pem -outform der |
> -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${role}"
> +    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${cert_name}"
>  }
>
>  # signing_import_pubkey_from_der <role> <der>
>
> --
> 2.43.0
>

