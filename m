Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E61CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:33:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.11153.1760434382808277662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hD7Hz60L;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57a960fe78fso5787545e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760434381; x=1761039181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfnAogDY8DF2ipNZ1foWrfFhQgdXbPDSBep7Q9t6rbM=;
        b=hD7Hz60LJIO/THmErpvDV1W+mT0QcnlUQSCK8EcQodGD+7LAJ+da/485HH2Owgmnjv
         s/HgTyrzWvauPOF4ZrcsSP8WNWyPfpRkAn97E62tmb9aDpalK6vF9YuPw/+e9fnzFwpf
         sJrYFTB90mr3mvD81kBQAsuImkFc0Go1iOJpvFIYN70CDgsGJEuW/ukPrbX0TxEyxgNL
         ZYHOLmpnt3Mo2sYYfoX4Rz/E4TW2R+6aj91BT5s1Aj5mahmEKaJbclfuyPwJp4CoMapo
         dmuQH5DebFP66hWU1DwIcMbyl5692qd5Fh+aukq33LEqb5UrG5KBIzq3L2m2OOVFk2Sr
         ArRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434381; x=1761039181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfnAogDY8DF2ipNZ1foWrfFhQgdXbPDSBep7Q9t6rbM=;
        b=xHOVpkVYv3TpAjfPBdSR77Ih61rURCxFRWRx/IIgO3LHeTeAx/xxTth/F8Nn/nTiQF
         zd8r9qZzKpIILfuwoM5MwxV9ZTzzL1yXmi/5c2DFMo9gifrmhDaINPa/JHhI3y3Qe/ZR
         Z+WhMBOzKyaZItZbbQf748mPMq6n9lJWjrm7N9+TA1rrfqb1AWBZyGcbh4d1RUbyQhzs
         DFB5UGGmIbgK6boS2FLBaFmPjw2Awg44N7TjQ2VVGWouu3dgbeje0Co9ZHclAdh30nxS
         8y+VmjPC+7iVsl6zV/kKSKGYd8VlSe0Gg6koLJNfG8V685I+e4RzrcjfAsiitF1Itr7F
         vdHA==
X-Gm-Message-State: AOJu0Yy8oY7r5+bmnHP02MBrM7Qlsudz8sDuOA4+y2aPS6lJAMOWN2X9
	Ro3TcJqTHxeOWC6bFPmrk0zCzAW7yMjkshnPkKzPvZpzogIDy2HlTpZAmE3zDuy5CSLOdsZ/4bp
	g0WC3tKi1cOyHgJywsXdqKHD7FwPk0C4=
X-Gm-Gg: ASbGncs+MbusA+PrrSiCXBX6ip/ss8M8EfABPAkp7zlwdu5Z2C/bxQiUVIfPf5dJm4D
	sg6l9iaoghFmYcDiFWYW5R8Hq4ZOT9sLS/Mt7SRhgDJ+tnn6wY9RogBywmRRCRd9ca+AEmfDgI1
	rv0elvuLjGjhOC0nsKansuagkUEn5zdlFc68PQZ+5/6Sg+j8GxB2RIz7O/Is1uZvidGsyrksQ7u
	XraX9lnBWxr00xWU7n7SbfzgD102PS/DGM=
X-Google-Smtp-Source: AGHT+IG2S0hIhQb9VMPm8RcPk0P19xZatqEQS9Ijuhpvl5QMKCj5qydhRD1wiZSnjiL/LeaCnbbFfxpxAV3YM7rJaDk=
X-Received: by 2002:a05:6512:3b8f:b0:562:d04d:fa07 with SMTP id
 2adb3069b0e04-5906dd51e03mr7799475e87.32.1760434380669; Tue, 14 Oct 2025
 02:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251014091927.493-1-wangmy@fujitsu.com> <20251014091927.493-40-wangmy@fujitsu.com>
In-Reply-To: <20251014091927.493-40-wangmy@fujitsu.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 14 Oct 2025 10:32:49 +0100
X-Gm-Features: AS18NWCxy6mF16cIf0VXn_PDnMKQIIyDp4UfEmVLDQWnfL-X3YTG1cWxBFOTlCU
Message-ID: <CAO5Uq5T+nfCGFeO+G4-QdJbbkONf6Y6vvrc6UpwfTYAxusbDog@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 40/44] python3-zeroconf: upgrade
 0.147.2 -> 1.0.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120602

On Tue, Oct 14, 2025 at 10:21=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

I believe this major version bump was unintentional:

https://pypi.org/project/zeroconf/#history

"This release was YANKED as the major version bump was not intended."

>  .../{python3-zeroconf_0.147.2.bb =3D> python3-zeroconf_1.0.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-zeroconf_0.147.2.bb =
=3D> python3-zeroconf_1.0.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2=
.bb b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.=
bb
> rename to meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> index 31d671ceca..9d23e8a8fb 100644
> --- a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-zeroconf_1.0.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/jstasiak/python-zeroconf=
"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9fe712b1bc27c5c4e9ecd7f31d208=
900"
>
> -SRC_URI[sha256sum] =3D "2f91e2544433acfa928c8dbaea7af8bf0644e06904610799=
d6b762fd599d81bd"
> +SRC_URI[sha256sum] =3D "3834ccf45c1e12cae78707ce691b20969e78aead28ae939b=
158b7d08c4195ac9"
>
>  inherit pypi python_poetry_core cython
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120597): https://lists.openembedded.org/g/openembedde=
d-devel/message/120597
> Mute This Topic: https://lists.openembedded.org/mt/115749717/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

