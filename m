Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02597C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:09:00 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.38129.1741788437118441618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Gt8wwl+B;
 spf=pass (domain: 9elements.com, ip: 209.85.216.52, mailfrom: naresh.solanki@9elements.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13689379a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741788436; x=1742393236; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH3wp93Ri05thIPW6RJDRPjNZtEwM1LH6l3DniegfWA=;
        b=Gt8wwl+BJkmPS1V5kpjG0F/w/anHbiIa6dyZGMdw4ecwGhRS8xMbZ5f9HfYC1MWCd8
         7KLiUWiIyacTgwxoNRtw3cthZddgZaBa/Ljx+2okbY9bJY/l03Nb7S7OJTHB4Z73mab7
         XRX0iVNcraUMHoyFrI28dJ/jkr33u4uaUcA35vAEZTu+aMJy+ciObrZ7fINs3IFyfveW
         HojbLnWYDFHFp9HrJsSyxJ5yLauCGTRkpwHDb84TuCqq00nRLc/TaRFb/Ipe1nqvVZru
         uIBpWG8nSZcTWQehjJMQasAE24OCXNuYlPQQ8xPUgSR+BoxgN1esy/nypUeboksLI7BW
         dFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741788436; x=1742393236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH3wp93Ri05thIPW6RJDRPjNZtEwM1LH6l3DniegfWA=;
        b=FieGHQl84bKPupAJ0auX31uMOkvJ8AGjD4FCbmFxjpJDfHqbmoM8cwU2tHTxrhz9c9
         AkPOsUEY7+2fwL+AyrzzMs4nPL20exnKASdRqGdcu+lhP2kcfEcZw+SABxjpJP6UuNSY
         NOPRwpSsySJTniWXDgzljE2WCW7vm+oCXuqLZnkXmQzeebY2oZqvcF/d9Cr5BPBOKmAX
         kkWI1q3Awxrs2maH9VTZaKbOKpiCLMIeYLgFk5G0aqfwl55LKZDNFw/UKZkE12hu58BF
         zfXkkOSeepR14f+voo26v+ChZacPa0wQDzHFmc5RNR89iHOPr6i1skvc5atOfztMJYP5
         lt7A==
X-Gm-Message-State: AOJu0YySzSvECS98kQ4PAMb4vSxklEVqb12TcRWLFgx3BBpbTK5T7ZPY
	9lVJmYUKKxliHT2OWjbyXFcUiwa4tPOW9OMVC4CnuwmE0o/lSbkGloy3K5QLkE5bmRbDa2dtT03
	yPkppCEhX8DwjrDj+ooT4TeQcKwaEzDNsIA9Uhw==
X-Gm-Gg: ASbGncsMASqfBd/YVIQEECQJGILiC5EAdavVpfR7ajlRK8XbBTrpbWWw5+ZTSPiMG9C
	n8ppugqCZ5D6M7hJ4UUKiUyQe2OmGKmkvxFgoQQ9ufYNrunAMiqZEDKHZMvyCZXIcDzcBtoVv3O
	8Dc+PUCPLy2B0ryO+VfywjTDYUIg==
X-Google-Smtp-Source: AGHT+IHvsbHGW07mRzank2wkSniIRevs65V3VVz0HyVfxMy8xVMhSSK6Sbh0HLmTu5lUXvhQGvZKTLI0sTvU1IgXHfQ=
X-Received: by 2002:a17:90b:3b50:b0:2ff:7c2d:6ff3 with SMTP id
 98e67ed59e1d1-2ff7cf4f88amr32677988a91.35.1741788435176; Wed, 12 Mar 2025
 07:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com> <CAOMZO5DaZbRXuv4vgWk9evNcV4iW6gXy2Vjv7oWsnMo_R9ku4Q@mail.gmail.com>
In-Reply-To: <CAOMZO5DaZbRXuv4vgWk9evNcV4iW6gXy2Vjv7oWsnMo_R9ku4Q@mail.gmail.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Mar 2025 19:37:03 +0530
X-Gm-Features: AQ5f1JoWqkrBy2LymfmpbHG_gHAHW6gefRY0T0On-nuBPMD3fer0bQ_5dHG3ls0
Message-ID: <CABqG17gS-kiB73tTC+u-TER2+ABLYPDVM5YyjiqpEzLTb0LbJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 14:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115925

Hi,

On Wed, 12 Mar 2025 at 19:32, Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Mar 12, 2025 at 10:52=E2=80=AFAM Naresh Solanki via
> lists.openembedded.org
> <naresh.solanki=3D9elements.com@lists.openembedded.org> wrote:
> >
> > From: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
>
> This From line is incorrect.
>
> It should be:
>
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
Correct. Not sure why the tool picked it that way. Will check.
Thanks
Naresh

