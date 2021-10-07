Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4722C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:06:55 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13280.1633619214845130288
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OIPe4FMN;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 145so5567616pfz.11
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLrcz7L6e5OWsda+mlnov7I55eJH2JPqPmGEffbb6Qo=;
        b=OIPe4FMNQTZeasU4kybUjytdGK3SbR89haGI+YBn84qcEk/D0/G3lpnSVPjocXevFb
         HE5jl49oIlELbzzkHirNPp3B2bV0WS12etNNPXdRCrLUcrS2jtVpm7XMYPXJeR2x9+Ay
         n6aeZgLFw/EvSvx4kVhNcUYHTy+ZzYbT6KGV0MTZ1Zfuq2TKpgS3mh/6/PrBxjq4u6Ef
         g2/YLInMGSIk8HvgWZy2FUTVh5NduYaHnaCiKLDMgl6e/qcIgyPwWQHEk87mjZvrmFho
         URvwBaGuef4zuNMyl5Uo2zMPIKo8BWZA1bfgev72skhDG8/TY4iXSTSaxzx2KdjAXHsO
         eVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLrcz7L6e5OWsda+mlnov7I55eJH2JPqPmGEffbb6Qo=;
        b=SIh1+XFyZAXdA2MU4azhibujkTOCAYFAoJU3kdxSyuTuDupdrxCTcd0aNca0l04zZ/
         PVKr+rjxIzFsigchzey/+TKnVxIykA2IdNWGDrun6XDAEk/jRohMlR1T64M7VmV9KZKD
         0KhiYQvkVy1RBLMFzcNcZPNQfYGmcm8gBcopNr/96EHG5aRFIYKH9/nkN3ImuxG5Zzke
         3fVt6COf+0z08j2arTg4yYl1su5zDa6nGuOhnyLS65YfRijETdG8/cEt+Z47ueegCUPM
         mfTI2sWGVndwpmY0FBuBhdentjn2MWUWxFFl6cgbg/H1eMiAmIlmZYEgUC8OinuBbDEM
         gKcg==
X-Gm-Message-State: AOAM530F5jqiLWuOBn8vGURmrgf70XlA+q4B5LKZ7rWHv2LyT69ZD0wr
	pxk3KfGVFqxhQRuIC4kLRyFFuAHS5aWok6Jmmdw=
X-Google-Smtp-Source: 
 ABdhPJycxMnPSA4TohGc6g2ANXMbrgo6OY4xgvPBmYBxzgV/AUrXr5RGISF9VqJek0NqeVKDtnKfpc3oeZ8h1ecxbmI=
X-Received: by 2002:aa7:8887:0:b0:43c:83fe:2c56 with SMTP id
 z7-20020aa78887000000b0043c83fe2c56mr4842035pfe.82.1633619214415; Thu, 07 Oct
 2021 08:06:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1sqWQXyp+n6vR3cn9HjPgF+ubzYgi0=EoVNF+H3f5QUJoQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqWQXyp+n6vR3cn9HjPgF+ubzYgi0=EoVNF+H3f5QUJoQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Oct 2021 17:06:42 +0200
Message-ID: 
 <CA+chaQdd4LEN+wbmGZwkj9FYotJ7urCGQnr3LTYSm7UBKMd-iw@mail.gmail.com>
Subject: Re: [oe] Honister branch created for meta-openembedded
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f93b4005cdc49c45"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Oct 2021 15:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93203

--000000000000f93b4005cdc49c45
Content-Type: text/plain; charset="UTF-8"

Can we please merge master into honister branch?

The gattlib fix is needed there as well to fix:
ERROR: gattlib-0.2+gitAUTOINC+5c7ee43bd7-r0 do_package_qa: QA Issue:
gattlib rdepends on glib-2.0-dev [dev-deps]

IMHO it would be better to keep honister and master branch identical until
there is first change in meta-oe which shouldn't be included in honister.

Doing separate builds for master and honister now, when they both depend on
identical oe-core (except the branch name) also isn't needed and only
causes extra maintenance overhead.

Now it already isn't the case due to the README update only in honister
branch, so they cannot be identical as they are in e.g. oe-core and other
layers (unless you want to force-push to remove README update until the
branches really need to be separate).

Regards,

On Fri, Oct 1, 2021 at 7:35 AM Khem Raj <raj.khem@gmail.com> wrote:

> Hello All,
>
> honister branch for the upcoming 3.4 release has been created for
> meta-openembedded layers
> Armin has graciously offered to continue as stable maintainer for this
> release as well.
>
> Please test it in your honister based distro setup and report any
> issues you might encounter
> master branch continues to accept changes as usual
>
> Thanks you
> -Khem
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93184):
> https://lists.openembedded.org/g/openembedded-devel/message/93184
> Mute This Topic: https://lists.openembedded.org/mt/85992208/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f93b4005cdc49c45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we please merge master into honister branch?<div><br><=
/div><div>The gattlib fix is needed there as well to fix:</div><div>ERROR: =
gattlib-0.2+gitAUTOINC+5c7ee43bd7-r0 do_package_qa: QA Issue: gattlib rdepe=
nds on glib-2.0-dev [dev-deps]<br></div><div><br></div><div>IMHO it would b=
e better to keep honister and master branch identical until there is first =
change in meta-oe which shouldn&#39;t be included in honister.</div><div><b=
r></div><div>Doing separate builds for master and honister now, when they b=
oth depend on identical oe-core (except the branch name) also isn&#39;t nee=
ded and only causes extra maintenance overhead.</div><div><br></div><div>No=
w it already isn&#39;t the case due to the README update only in honister b=
ranch, so they cannot be identical as they are in e.g. oe-core and other la=
yers (unless you want to force-push to remove README update until the branc=
hes really need to be separate).</div><div><br></div><div>Regards,</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Oct 1, 2021 at 7:35 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello All,<br>
<br>
honister branch for the upcoming 3.4 release has been created for<br>
meta-openembedded layers<br>
Armin has graciously offered to continue as stable maintainer for this<br>
release as well.<br>
<br>
Please test it in your honister based distro setup and report any<br>
issues you might encounter<br>
master branch continues to accept changes as usual<br>
<br>
Thanks you<br>
-Khem<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93184): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93184" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93184</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85992208/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85992208/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f93b4005cdc49c45--

