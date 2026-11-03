Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4283.1793738731909348242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nQ6MhBGF;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-490d838b425so37449fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793738731; cv=none;
        d=google.com; s=arc-20260327;
        b=Hsql+7LHEw6wwFEr53ayVq3XXa6Avm8S0uBEjcd6OseRKLPWzEvKC2BMS/SlU50QPN
         P7YLhh0ejQQqyClqOU0bVqTXqUhtRd3kcxVT4PKEO98ydIGUwWh2zh5XNoTTTMr7e51U
         dEVL9eXbnGaVTeR1inlwPbBpfzwUU/VIXiJlrPbN9VD1tGnxXibGrCEUeJdY+iCuQ3jx
         Ok6AWvajkqANI/vesRllBC8HTSWD1Z1OSPHf8v6qF5VRZf1zrVuweNtmHnCZsmpAECnm
         gzO6jM0VtgeJi7TTVj9w3ZpUDyE2lGyT70+uzsnhKjeUf5Af3r6WyL9UxnryFnTZlcyl
         7hNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dv/phreLot47KbTk/5Im0bDcWw5SAqZ2ApAioH1oKS0=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=lCYiMikln7ln1dK8QviQMm2h6l+E0YH4wyf6F3/OXvOjDA1dMxaq/D/NPrQQMs3oo0
         tx6VpScZcr9RciW2nVhZ53Ioq1lPebH9EuonY0j6U7HPyhcJG1/ZmE+qBsFXf4dfQEaT
         jMTIJ80gnYBKojcfRHRCwnirTUouWyw2YIUb6pxlO3VQVTakTzPRwtKk1qNc5fzJJa8X
         PWQLHWzKdAAk49YdJ6gDDzEN6UvEBIVbZFEVnzKek+KpkB9MclCpz6qOiMOo9CXoDRMj
         lKPpT/1PMT+PLi7004vwOessBxVIHWjcwGmSwDX0Gc32sMpAqE7MX4sQ7S7kBMZS9vBP
         v/PQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738731; x=1794343531; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dv/phreLot47KbTk/5Im0bDcWw5SAqZ2ApAioH1oKS0=;
        b=nQ6MhBGFSmzEFFyb4dOM8vhurnTGf8BqF0C8ONdWQOLINDEgzSCZHy8PzRo0rBCmsL
         h3hl3l4hcSulDmrkjvjKDvBKE5jGq4YPElIoBMriWo9fuRVOxZGxSIxWBFjuFCic8O5I
         qQuBHacaQeedK1H7BxYTqbu5zB2m5ZLpCcuquXrYSnIEZhD7M8MQqK/2ChKyK/WyMJVi
         zl9sBjl6lbzC0IZHNgnpCDWRpvKTezmVJHKuf9FkB/WJhhwlgmZJIkaPtS8z0PPYGQR1
         ec1JIjEj3c3Goxh3xHpX9Xog5C4qWstAjMxiW3isfjdzG2wb5n9lVpGJfino8jnpQLRi
         VEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738731; x=1794343531;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dv/phreLot47KbTk/5Im0bDcWw5SAqZ2ApAioH1oKS0=;
        b=0NWfApJxv8n+qfMdT+o7vRznvbM608EGivYd/nobm80dCYLI4D01M/KMH3k/5fV8d0
         96vcaasR1VCJCJIQA01Qr5MHjg4e1tmkSo5fr9Afz/+i/liofzRuwjuCxXXmCFkyHs8C
         MqD74Tr6b9+CLwWDdf0A+cDwzZ7240lxWL2io1G0GlOMkN37zqTPyeYehsLuMmBUX2nu
         bG10zAMIt1mHnm30eSAgp1iD0bjchRNEcIHmbxbLl3Jw8cdhdz6s37dIuOYab6KWrB7H
         cq1fr0IoHt7mMBgi8pkMoYywEnCV9/JPXpFgG9AfSRCqt7tTq7IypeHOoLB8RlrV8WE8
         gbyQ==
X-Gm-Message-State: APuU4Z9JW2+4ZOYKO1wTOOOpmyUTtl949RyhnFytM04q4VduJ1cPJuE7
	xx0sjc/OsVGhVBVnLPRsOidz4KXohQhp9M9nsPweYkBmsLUDtZd3NIBueLUKWMtov15e6LukNfX
	l9JViwpAU9EirGEzeHpNsGwF9rhfgpYVtyQ==
X-Gm-Gg: AYBFou0T8e/z4uUTE8l5R+/SoUwj11SySv9CNxN45prYpsFDBRatI8RXe9WtmQW+6TC
	d8y/PnFBRzUSRHoEkyD5fLzvq7mPtxhXE8/p3uPwm/Z63xEuhSEhy0xwZ5FwMCGYfWo6N6qUEwX
	tUcJMO77SOKdTh/fW50AUEsNFbYXCKIEK0QvtvIyjXl6a/JH1OSLrJ/+2tqhzfEp7KNwnB4/kvy
	UEI4GNAaBdfUeAv1f+/BWvVHfM7pzEDZvKZvUL5qBrwHed51SVxwWjHhlZLMEvT5DsMHizQ5Akl
	R7QaC+2jdWnttefxjBOP6UaWAtqVMSPgTICDai2oz5MyBWmzTvSO7eiCBnepROp4/FKx/FkkUGZ
	/6Yi/nBT4MyMF1opwUtP3HIY6/b6Ql3mZ8NV/fIcR/7PGASNLh+VKmdiEHrDJuE7JP2QJETIXTs
	MLMil/
X-Received: by 2002:a05:6871:3285:b0:48f:e107:317b with SMTP id
 586e51a60fabf-4a9077d5bbfmr9076526fac.46.1793738730893; Tue, 03 Nov 2026
 12:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 4 Nov 2026 09:45:19 +1300
X-Gm-Features: AclHuK_Afe5BWXkmFCwl_N9kqhCKzxyqpL6prUuqXllIGPXmE6TnhbSKTMzkJOY
Message-ID: <CADySD0HzLGc5d+YZF_+JMXxJB9bcLE3ztJsyCf8daPzVNE4a5Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][master-v1][PATCH 1/5] uriparser: upgrade 1.0.2 -> 1.0.3
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131824

Apologies, please ignore this series.

On Wed, Nov 4, 2026 at 9:43=E2=80=AFAM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../uriparser/{uriparser_1.0.2.bb =3D> uriparser_1.0.3.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb =3D> uripar=
ser_1.0.3.bb} (91%)
>
> diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-=
oe/recipes-support/uriparser/uriparser_1.0.3.bb
> similarity index 91%
> rename from meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
> rename to meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
> index 161073103d..1ef8b15553 100644
> --- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
> +++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://src/COPYING;md5=3Dfcc5a531=
46c2401f4b4f6a3bdf3f0168 \
>
>  SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${=
BP}.tar.gz \
>             file://run-ptest"
> -SRC_URI[sha256sum] =3D "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee=
448c532f53b07f1e"
> +SRC_URI[sha256sum] =3D "b5014a630e61e085787f760c83675a35ef8e719972b05e8f=
61ff2f48692b15dc"
>
>  inherit cmake github-releases ptest
>
