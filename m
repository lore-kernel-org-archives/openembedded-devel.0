Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A84C88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:54:24 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13982.1789437259319942580
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r+iDLI3R;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2a99so1914234fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789437258; cv=none;
        d=google.com; s=arc-20260327;
        b=pb/+lWXP0lMRsoaxWr8aVmHg4M+zAOlSmXuOZKqOKmiXbHpjKImtO219MNMRYSaU2v
         3pICs7xiUerGOkjBXDSkpiCzv3zaTux1Obw7nsg+XpLHuAcdXUVTKPNWQOuXa0dAHGe/
         a0gfFelbQ0PK6MuaZFAlvbFJSGuzOYsMz2eIiE4y75bipkYryd19u5lzHj5uSsslMces
         +rTtXZb/GU8ys7ss+ylDh/jDOETPOw9XgpmVPPgFgtaDZRMT1zB6vXeui8nzWod7ZVOo
         dxK2yo11E+8Aw/rMpoqlsUMt1sq3gjI6dm3CXQRVc+ry4wtfmDeEt0ezy9WY7K6m7jWM
         uE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N7qTJGjfgnWFS+GWaMuOw9Dnq6lADmDRY8jCksHhDr8=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=cBEbNYm4aYMDvms5wT/YOYtZerYpiycM9cXehxggXOaZPXYuKY3uAc9suxLSwLJLpb
         /HCnzKgIUYvfqwER5rXPHqJR50rKaMMtXuWXtRdJDUKdmB6PlX6Sy44NKWZ8trnmfkfx
         6gLnO86z6T6tVG7JJTEBI24syTZFqTeysXzFHSy2MfeNJBWADQu8cpgItQ8p2jSzCx4w
         x8u+G4Fpt1KbcmHsCradtTIRaH6xd0rvwnpuWX5LpsffOJ1bE8ZpqT4g5oZFalUwBpgq
         iKz8C3yoRLdxpNXJbJjCRQs0fQeazfTJ3iSUoLViN2oDxsLmkzzG1T9zznMH8S2/E6Wu
         mCEg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437258; x=1790042058; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7qTJGjfgnWFS+GWaMuOw9Dnq6lADmDRY8jCksHhDr8=;
        b=r+iDLI3RdeK7jrN2bLVnNQd1zAntbL5vBdXoLD3mRXBfE1W0JvNmk45Q+1NllrdrYl
         OzYOsGdCsNyUasdExtk393kQeYn4KLf2iLj6yQj2w4356aWEji3f1AiVhdS83/Ig+O03
         xRXnm4RzSsYcF2Aqs/EYr/MKRxdAQmB99uqFjMTrFCGcFrDaSfScS4IriznjxLj3isK5
         NTpCTpJ4E0bd+NfXF6yul7sr/pQRSCBAFtVhRN0wGnTk2ykmpLYVxjUqy+nnx+VYu3B4
         FJGJEZz1GqvrAEmx+EvM5Dz1pup36WZba1hB3caUvHc8lsyotdVlmzSlvKQgudxQQwEK
         3Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437258; x=1790042058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7qTJGjfgnWFS+GWaMuOw9Dnq6lADmDRY8jCksHhDr8=;
        b=zfqYRaro35H800vZCmfY2zDyTGmlJ96WIh6JPLdwAP1+XdzfCuT+lwH2GiggoHY05Q
         7c26FVOL+w3MQsBgpLR0mBxcGiRlqL7/vnGk/is9Ze/TrU5qdYha8hDAit6ZRBA4MSMm
         GtItHRhj6V5eWSccIbqJwmJcvZYNKXP63vaRzZcc/sjkcecjiBs8M1YA1CpIUf9oBzpS
         zTXmHH54CNmr0+VwSxiYQB/zaTS1nxBNS0xqXMYIy4EBeDzGXLppl915DhJ3wk/CIMpf
         IOyr5/WCU7QTl8pT9pO4AnrWkhhm0LLMJeIHY2AvpmPGXdPOpV1h7e7Z3YS1bOwJaMMS
         K4UQ==
X-Gm-Message-State: AFuF++n6dXNKyb4YsQDh6LH0ud+SEaEIMNUQBBI9K7HYkUgLP6T9BLmt
	BgqyDIhrGlMGdi9fT7poOnK8MDWBZuJrqXoH6m1hKoBVFQMjTCJodKIZDgp+yQVCriHq7GekMGz
	jCHC0vVB7ebUhjqTD0n4fzLpikzbCPGE=
X-Gm-Gg: AYBFou2dwrerOiG3U5KnCdc9Tm02YxBAK/esQj50Fbnst4qdib2aK18hGNspweQ+UPV
	zOejvHhm1oJ7tAexGZ6bTBToN6whXWLYGr+EIlc0+hzc6R95XPQ7aYaIttx8cM5IN2Mu17Y5YzB
	bzk77z9ak4h/3lofxFcZxS+3mCjeCIr2p/sEr61pRcXHQIDvtHgpiyXq1O9Yas1aRaAqLb+wrEx
	R2imBYZwNAi2tKDSYHgi6+Ns6Ot3t+Sc/Ge4scaO31ArM4nlLzdD6HyAcwZYT4EAbgpyyz3baUe
	YOmH5zhfExT6s0aBo4ku5+SNA9E4hGoaUKgkOP1EPRhZtdg7VzGiLuVvexVToCzgz3aPJyTa
X-Received: by 2002:a05:6820:806:b0:6b1:a812:987b with SMTP id
 006d021491bc7-6c540674253mr4966442eaf.14.1789437258404; Mon, 14 Sep 2026
 18:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
 <20260907102318.2459883-5-ankur.tyagi85@gmail.com> <CA+s=J=zsKdTwRRPvzsBHT3eNUz8tGpr8yfcuNY1qNMP=bKTM7w@mail.gmail.com>
In-Reply-To: <CA+s=J=zsKdTwRRPvzsBHT3eNUz8tGpr8yfcuNY1qNMP=bKTM7w@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Sep 2026 13:54:07 +1200
X-Gm-Features: AcwNN1VlG_VAcc5jndWmm9_6a4LS4x_niscI-8y_UdHuTiBCQnejC_6epkuIleM
Message-ID: <CADySD0FMba+69bh1Wz3WzSffkRdVtQmfzCMLZbuFGQo4zdc1FA@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 5/33] libssh: ignore CVE-2025-59842
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130031

On Tue, Sep 15, 2026 at 1:29=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Mon, Sep 7, 2026 at 6:24=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > The vulnerability exists in GSSAPI key exchange introduced in v0.12.0[1=
]
> > Also confirmed by libssh security advisory[2]
> >
> > Details:
> > https://nvd.nist.gov/vuln/detail/cve-2026-59842
> >
> > [1]https://gitlab.com/libssh/libssh-mirror/-/commit/88c2ea6752fab7b3da9=
cc4c51eaf632361a44080
> > [2]https://www.libssh.org/security/advisories/CVE-2026-59842.txt
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/=
recipes-support/libssh/libssh_0.11.5.bb
> > index 752bded528..5cc270477e 100644
> > --- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
> > +++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
> > @@ -58,3 +58,4 @@ CVE_STATUS[CVE-2026-59847] =3D "fixed-version: fixed =
in v0.11.5"
> >  CVE_STATUS[CVE-2026-59848] =3D "fixed-version: fixed in v0.11.5"
> >  CVE_STATUS[CVE-2026-59849] =3D "fixed-version: fixed in v0.11.5"
> >  CVE_STATUS[CVE-2026-59850] =3D "fixed-version: fixed in v0.11.5"
> > +CVE_STATUS[CVE-2025-59842] =3D "cpe-incorrect: the current version (0.=
11.5) is not affected"
>
> Should this be CVE-2026-59842?

yep, I'll send v2

>
> Thanks,
>
> Anuj

