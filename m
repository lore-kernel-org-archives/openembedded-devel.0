Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D53C7EE39
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 18:07:35 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.2923.1751134053676594139
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jun 2025 11:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nj31a5HM;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e85e06a7f63so646363276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751134052; x=1751738852; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2+/fRXDnWBs5ZHmZFNMr9/IWRB2NP7R2g9JwLs2e+g=;
        b=nj31a5HMKvLMyLQOa2mPyre1K05rglfEU88LWMu6Rc3jrSOtm141PG0adjRybCkYpe
         EVvJQowV8kwbDy+2f72SRgrx17qLCHM5g2dSm9XQmuDcV3Yk8Up4j7xgEhkcw3D+BwJA
         81839ol4x3xGKBBt4Rtaiv2qCv3KFtVJF5seTb3us/ugr3qTpfDRoV4LSULxwHq7ojQR
         MwU2dpQJgKl+nZd+AlYKMuEyTnv6v5Z7KKy/gvFUMvj3AiwDHsZFFge9rDD7nl7jMypS
         af/e5MPJMmMPOXLLNC2/ymTefHNlvZgXVel6ESLfwI4ufA5pk5OYh/KH4Rpz3onjM4Bs
         tnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134052; x=1751738852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2+/fRXDnWBs5ZHmZFNMr9/IWRB2NP7R2g9JwLs2e+g=;
        b=iSRjSaTU5NMRbGM1ShFYyw9iUYYA1YZ02obbHsd4nUzchLSwB+qhe1cSAzhYKrIXXp
         1sk4hHwb9Ie0/sNrpvlVmUb3iuFSy8kGNCUDrdcwI4jbIAmEzGjd6czKQqdvz37oSb1G
         hnVQNGvUkC+UmwQaAxmpV0nXgoeGFHweohZw0IHpuAtRAM9SoxHaUD+n1amyUntRcmGz
         pkOLL2ah364oA0wcIHp58u0XByODu91c1qQXuVVNc7avPkrys7w0o2w3flOm5OI7Y7Bj
         Sl1W6ZuuO8MtJqrfUObtKbHWNK2p1vdXzHlKKrdtBXbCV9QkGEZol1insu7mG5IHCPyk
         7zXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXimV04tsOu0+6Cs0XiHhIPpP3ydoDDjRpNjRhEhk/X0+nzQGmpVyoOnSMYjKgmbXUamvOZRNKEz85onkGT/HvNc+c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuklmgSS9lCtb3JXBWAjRBV1UPFBxd0db2P7FjEnSaXLpXb/nE
	I8jVVwbqNZbj6GkewfUgMyCzGuddzuOLWphngst+XYwArisobVw5zHwXGRMINxSxkzvn2r71CcH
	msaQxk9/v+nzfiIGluwrsp6RhIqPQZ0s=
X-Gm-Gg: ASbGnctBFVy+QcFNIaUzjIP+n/7gwvHNd2bK/AFrkndIudfapnl7yr0OvDRoMCbXRtB
	r47tlevB/G/jFRP2c+KmW1kqoNe8Fwvyd7fA63Vk67XAcJu+v3oHS8jM61teDRZ1uidmxLsT9i8
	m4zQLIBBk6AeAX90PzPYanu0/iz/fJ5qAAzfNP0aDl/bqfimXL/qcWpE9rDg==
X-Google-Smtp-Source: AGHT+IE6kjadREozSeSQK8SJIyAg3ebKFOOcXX7zGCOgamEbzkyS7WDjSKXrpyAUhSHoYt2w9BV59TuHEeMX9NCCiAs=
X-Received: by 2002:a05:690c:6c0b:b0:70e:15e7:59e2 with SMTP id
 00721157ae682-7151718550amr114756517b3.24.1751134052478; Sat, 28 Jun 2025
 11:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jun 2025 11:07:05 -0700
X-Gm-Features: Ac12FXyWwcDRJsPG5ei9Pax_dcr-tKrYgRy2xGFc2eXm6vpitoaMYmN4sjCukKE
Message-ID: <CAMKF1soMmTO5wFSVFSQ2xgYM7QhkZztLu3DpMYb5k3YVFFEn-Q@mail.gmail.com>
Subject: Re: [PATCH meta-oe v4 0/6] signing.bbclass: add certificate chain handling
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: jlu@pengutronix.de, bsp-development.geo@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 18:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118163

I have to use -p0 to apply the patches, default is -p1, it would be
good to adjust your patch generation to use -p1 in future.

On Fri, Jun 27, 2025 at 5:18=E2=80=AFAM Johannes Schneider
<johannes.schneider@leica-geosystems.com> wrote:
>
> Adding support for handling a complex PKI setup to the signing.bbclass
>
> Since a (soft)HSM can only store a single certificate in one slot, the
> relation between a leaf certificate, and it's signing intermediary (or
> root) certificate has to be stored outside of the HSM, in the form of
> some additional metadata.  This additional data is stored in an
> environment variable, which is setup and manipulated by a set of
> helper functions: signing_{get,set,has}_ca.
>
> This patch-stack also does some cleanup of now superfluous code parts.
>
> ---
> V4:
> - rebase onto meta-openembedded/master
>
> v3: added use-case to commit message of "signing.bbclass: add signing_get=
_intermediate_certs"
>
> v3:
> - reword commit message and comments following review suggestions
> - forsee local.conf overrides for the CA
>
> ---
>
> To: jlu@pengutronix.de
> Cc: bsp-development.geo@leica-geosystems.com
> Cc: openembedded-devel@lists.openembedded.org
> Cc: raj.khem@gmail.com
>
> ---
> Johannes Schneider (6):
>       signing.bbclass: refactor signing_import_cert_from_*
>       signing.bbclass: add set|get|has_ca functions
>       signing.bbclass: add get_root_cert
>       signing.bbclass: add signing_get_intermediate_certs
>       signing.bbclass: add signing_extract_cert helpers
>       signing.bbclass: remove signing_import_cert_chain_from_pem
>
>  meta-oe/classes/signing.bbclass | 172 ++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 137 insertions(+), 35 deletions(-)
> ---
> base-commit: 5b4e26adb80784be59e5b82c098ec050c93c1ca4
> change-id: 20250618-signing-set-ca-f398259222f5
>
> Best regards,
> --
> Johannes Schneider <johannes.schneider@leica-geosystems.com>
>

