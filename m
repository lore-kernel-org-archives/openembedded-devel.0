Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0BFC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:00:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.3392.1750348805279639481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 09:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgkipP7Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e64b430daso10223617b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750348804; x=1750953604; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF5s4kNiq4mwchl4pWUfZ0JAqSJPPnhtk3H4fzlIuDQ=;
        b=SgkipP7QmB4Cc/Ur87wCiyRN0pnDeG59D9EsIFQorN69qhyH1jm5B1moWRCEM8DP0i
         WTKI7xqv6whrDXRq345H04hzFSwN8831MvKG+oOL+rLwvA4BnYQfzkloyFOXUKr6TWhn
         2a3Lole+kCrZ00If2mz3Try/cYB3Wc3X3YV4PNuzDOs81f9PKzBDOaQ4W/0xK++VYfff
         I33drYK7sijQpdcLDXDhwgSZnkZFIkbXNipkbhzg4s94Rxy0uIZSZBVtTsLEo9BB0zn6
         pVe7zwi06xCrvkXKV+7vZ4uP8aClpSwR04yEuRx+f2PYOwgO/diZ8WtZLjdDQpq2dGsb
         QjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750348804; x=1750953604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aF5s4kNiq4mwchl4pWUfZ0JAqSJPPnhtk3H4fzlIuDQ=;
        b=k2XcS7JrgXzUHc54sXMYln+YB+nD0SRhpudKe4u5UHdBg0zhOGbjJG9uhunj18EC0t
         718qs+SMcPPmUe8FYByo9CD4gdt6OXaDlIwp/FP7Y2z6K7iqbWxRb1oiZ3C0MxqO5cgU
         //YJddeHWIMwlrPzzGGmo3XuVclxtESXhG5EVFZTzp9bOvj9t1w19a1VBxHao/fOn559
         5XevQbOkzGGgJW5HmMZhhC4ul8KEw9kUBJE/sz8kuhiLiWwggtSoX/uH04wLxfTlFxgP
         GsprZ6anvbUdFfCLj9b8+6FJFFyHvR5HGhes96BUbeBjrRXwtrm9TErlo2n7PqTZVaXI
         4bBg==
X-Gm-Message-State: AOJu0YyMshHYA9dhT9Ke78F/wu2HSnUWn2dq27cEog/307dGkqBtrV7U
	qVLzINF7QF9RWD3n3GLvQ5MVeR/neO31hPJfPgGp0fgYKw4fwwt83n5thCQ/ZK0t6LKO6KwEB4U
	uOS/0ohDpLKI6GtpPOKtTgjopqhV3B0rnTaM9
X-Gm-Gg: ASbGncsvR7SxANjV7DFb1bQGKN7UU4zpmY7SSzZydVMuuETxkcRlf5HxhyJj89sx90j
	Fy0KETgbqdUsvW4yDpCjB6/gTCNFnZzKtob0BDUKteGftongU7jo+vmlTX++mrATEsGa8X8Nan6
	M849VQslELGnbpPf2/m6JlGJIOFRH0ZRyBiv1Nhu9aLA==
X-Google-Smtp-Source: AGHT+IFzqw3g54I3fLrhySrW0Gr3T8knGQ+1W9w3VYKPaUbT2yJgkPGxgOpuv+mv0FMePkOu8ajK3ATfbov0u77KetQ=
X-Received: by 2002:a05:690c:7005:b0:710:ef67:f8de with SMTP id
 00721157ae682-711753bc9f7mr287550527b3.9.1750348804091; Thu, 19 Jun 2025
 09:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250619124641.2934463-1-ejo@pengutronix.de>
In-Reply-To: <20250619124641.2934463-1-ejo@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jun 2025 08:59:37 -0700
X-Gm-Features: AX0GCFuhFQ3_9uHBsOS7GfZmKglpbmpOwDo0hvTnk3DrrxkHOnoxwswdvrhyZx4
Message-ID: <CAMKF1sp_3_ytaOBEM2z=cpYyO1gdBkKb8pJkinS+GuQ=XxG+wg@mail.gmail.com>
Subject: Re: [oe] [PATCH] signing.bbclass: make PEM loading compatible with
 OpenSC 0.26.0
To: ejo@pengutronix.de
Cc: openembedded-devel@lists.openembedded.org, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	johannes.schneider@leica-geosystems.com, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 16:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117952

Thanks for the patch, Please rebase it on master-next as it seems to
not apply cleanly here.

On Thu, Jun 19, 2025 at 5:47=E2=80=AFAM Enrico J=C3=B6rns via
lists.openembedded.org <ejo=3Dpengutronix.de@lists.openembedded.org>
wrote:
>
> With https://github.com/OpenSC/OpenSC/pull/3174 which is part of 0.26.0,
> OpenSC does not support reading (DER) data from stdin anymore.
>
> However, OpenSC/pkcs11-tool also supports reading PEM files directly.
> This we can use for simply replacing and simplifying the stdin piping in
> signing_import_cert_from_pem().
>
> Only for password-protected files we still have to use OpenSSL for
> conversion, since OpenSC/pkcs11-tool currently doesn't have a mechanism
> for providing passwords.
> For these cases, we store the converted PEM into a simple temporary
> file. This handling is sufficient, since SoftHSM import should be used
> for example keys only and SoftHSM also doesn't protect the keys in any
> way. Keys which actually need to be protected are stored in HSMs and
> accessed via their PKCS#11 URIs.
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta-oe/classes/signing.bbclass | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bb=
class
> index 8af7bbf8e0..8c7daa2391 100644
> --- a/meta-oe/classes/signing.bbclass
> +++ b/meta-oe/classes/signing.bbclass
> @@ -172,9 +172,7 @@ signing_import_cert_from_pem() {
>      local role=3D"${1}"
>      local pem=3D"${2}"
>
> -    openssl x509 \
> -        -in "${pem}" -inform pem -outform der |
> -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --lab=
el "${role}"
> +    signing_pkcs11_tool --type cert --write-object ${pem} --label "${rol=
e}"
>  }
>
>  # signing_import_pubkey_from_der <role> <der>
> @@ -198,12 +196,12 @@ signing_import_pubkey_from_pem() {
>      if [ -n "${IMPORT_PASS_FILE}" ]; then
>          openssl pkey \
>              -passin "file:${IMPORT_PASS_FILE}" \
> -            -in "${pem}" -inform pem -pubout -outform der
> +            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubk=
ey_out.pem
>      else
>          openssl pkey \
> -            -in "${pem}" -inform pem -pubout -outform der
> -    fi |
> -    signing_pkcs11_tool --type pubkey --write-object /proc/self/fd/0 --l=
abel "${role}"
> +            -in "${pem}" -inform pem -pubout -outform der -out ${B}/pubk=
ey_out.pem
> +    fi
> +    signing_pkcs11_tool --type pubkey --write-object ${B}/pubkey_out.pem=
 --label "${role}"
>  }
>
>  # signing_import_privkey_from_der <role> <der>
> @@ -226,12 +224,11 @@ signing_import_privkey_from_pem() {
>      if [ -n "${IMPORT_PASS_FILE}" ]; then
>          openssl pkey \
>              -passin "file:${IMPORT_PASS_FILE}" \
> -            -in "${pem}" -inform pem -outform der
> +            -in "${pem}" -inform pem -outform der -out ${B}/privkey_out.=
pem
> +        signing_pkcs11_tool --type privkey --write-object ${B}/privkey_o=
ut.pem --label "${role}"
>      else
> -        openssl pkey \
> -            -in "${pem}" -inform pem -outform der
> -    fi |
> -    signing_pkcs11_tool --type privkey --write-object /proc/self/fd/0 --=
label "${role}"
> +        signing_pkcs11_tool --type privkey --write-object ${pem} --label=
 "${role}"
> +    fi
>  }
>
>  # signing_import_key_from_pem <role> <pem>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117946): https://lists.openembedded.org/g/openembedde=
d-devel/message/117946
> Mute This Topic: https://lists.openembedded.org/mt/113724395/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

