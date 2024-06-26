Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B69DC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 18:45:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.35586.1719427539880012666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 11:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O10KcGMT;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec1620a956so84700351fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719427538; x=1720032338; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmAI4deoQVsOQ+M/DPM81+Hx3UMvUCUb4i5baVGtn+c=;
        b=O10KcGMTBsLb5N7vKZbqQehvPyeLtwDcC35PsAVNDUPhFDrzfot2aAxNL6N/hssSNz
         a77ZvRX8VvH1mS840SAKwhWjzQeF+dQltp26M9cwqsoc8zVImcHsbhFMuiGWUplVC2Gt
         8pyZgkhSI/wXa/e6B/bgmZUa+yqWQ/H0EJAVHnO27wWDpgi0wD00It3MgXOnLp+h6L90
         n97dGdG7gakKDlIjZpwjRYCr6z/szChSPpX0RuN8cyj0vOZL1gWi4ENBm2G+B2GD6629
         j3MUL942+aNjEfBjI0Gp/lISsroN7CwS/bjoMPxgImt7CV+ofXwTaN6CWA/FH8bpVgY9
         8pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719427538; x=1720032338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmAI4deoQVsOQ+M/DPM81+Hx3UMvUCUb4i5baVGtn+c=;
        b=s46j7PuoDyT/ddN32IDZuWT/DL+G23+rtzVgeoaxY7aAf6+58FkGZ6vzDnQsLiJif6
         5wQPezau/3J83koOBikVSZecH4Lp0H+yb2YotkvmpMBrJkezzxRkNY9rbuLFyf3/a++O
         fK7uEEyIklV+JPSCKouTSnTLlguDYpu6H7OShj95zOzpLyeUo9M95XSjUmS19wdSA1oE
         FGnNVmAK31O2bVYUEt/e14mvC4lhZPl2f/o9MwfNZ2UAuLqnOJ9md/4C1f3GUxMOyW0w
         O/NnNMh/tzoLCe9gTjcbLWAsCV7nyEpA+fmR0B7wm1gtNf/TWT2uYl6SOznBkxtxK4+W
         Pkvg==
X-Gm-Message-State: AOJu0YzBFGFKNJ1HPNFHK3rgPE+6IUJs+EPZsQE0qZkGSU2b/aPcZxQe
	sWRqM4ifX4/5nQ90/T5WP7oqeAqr4L7LwNVDpfxlJUYtZu7D2mvNkeJFwF9e5wWfgmlXqXZfWd2
	F2Jo3EJfelyS52bhMlpwUVleY8G8=
X-Google-Smtp-Source: AGHT+IGkQhi7NVUDcsoSAp5INp9L99gdPBp7kQSSqEGsnzVYyeaoNuC0npM48r5DRfYQQsPRwwt1XgRi/DjzXRt8dx4=
X-Received: by 2002:a2e:9b13:0:b0:2eb:eb8b:738 with SMTP id
 38308e7fff4ca-2ec5b3460b3mr65635591fa.29.1719427537725; Wed, 26 Jun 2024
 11:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <x6gyiofwakvibrczp5awde7lihbxomhqslfn2izreb5wyxvbqi@hy5fd7bywmm5>
In-Reply-To: <x6gyiofwakvibrczp5awde7lihbxomhqslfn2izreb5wyxvbqi@hy5fd7bywmm5>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jun 2024 20:45:25 +0200
Message-ID: <CANNYZj_0MS_UWHZpLx4zFC5R4JTuKcweSL2bTZTScWiukY4VAg@mail.gmail.com>
Subject: Re: [oe] Should DISTRO_FEATURE ptest include ptest-runner
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 18:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111113

On Wed, 26 Jun 2024 at 19:22, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> I've asked myself, if it wouldn't be helpful and convenient, if the ptest
> DISTRO_FEATURE would lead to the inclusion of the ptest-runner and ptest
> packages in the image?
>
> Should poky.conf include something like:
>
> EXTRA_IMAGE_FEATURES +=3D "${@bb.utils.contains("DISTRO_FEATURES", "ptest=
", " ptest-pkgs", "", d)}"
> IMAGE_INSTALL +=3D "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " pt=
est-runner", "", d)}

Not in 'the image', this would add them to *all* images, which is not
how ptests distro feature is used. You have ptest in DISTRO_FEATURES
to build and package ptests, but adding them into images is done in
specific ptest image recipes.

Generally distro features should not affect what is installed into
images, they're only for build configuration of components (yes there
are a couple exceptions in poky, which should not have been allowed).

Alex

