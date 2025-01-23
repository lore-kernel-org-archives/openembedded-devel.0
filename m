Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4938AC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 07:53:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.6483.1737618782317514713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 23:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+ngxIK5;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so5774481fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737618780; x=1738223580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvXK5bfMXD0/z1V4bUW06xHYk4HTVFhH0nyvM7PpdUc=;
        b=Q+ngxIK5XV/5XPis0cF9b4I9lrx7UUXJbDdUPI0QSEWsJiSTVwAixqNbw9gM0Zv18j
         h/Dww0Hh+va1b8zlMQ8x8RTRoBmIgw37sD3yOsLv9e+ZE7hj0K4eIMJ+FyKwJGeaWVMT
         6h0Xoh0jEoc8G7iQs2sbUqLCpfyJLLvcHUKVgoipLF//YUQkk41V6uZ+fiv3EPDqFSWf
         Xpm6WGbyrYOnBYhZFiBnkuCCm3OcGytHyNSUhlQYqbEBZwctPfmyX5gfevoTaa9K+vpn
         jl07pK5eEi21uSXFAau6LIXeQiR6GFK/8NNsdnNgFj+YIQBC3XTPAfYONlAWtsm5AM+i
         NMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737618780; x=1738223580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvXK5bfMXD0/z1V4bUW06xHYk4HTVFhH0nyvM7PpdUc=;
        b=nCKXeRTOM6+FH4vQwlWeYz2/WuPhh2dGP6mw31TO3hrTSTTjYoHoS6MqE1XDRyDaHU
         SooZ79xk0PeF6APTDZcPMf35m6DB1QTCjomHFw5YDS36mo6bs6ZfGf6IfCag3rE4SVDU
         QAKU2or3huTVgws/pvh7up+J5g4fmRicAPLH4VDWQwhfoGJX4tOCv2HGdd3nNvIyNZ6h
         ALlW4wFgGDUiFnQXqqlSzVqYx+Mg+8rg043UhfYx1PUUpFsOAotxGhyFIGS8IniCywzL
         6Te6xG/Ua7WHDGoVYyCVjT31KuBtkL5ldjPooGsqkM+9DiGd3F/9RK37/tof7npDDKFG
         Ie+A==
X-Forwarded-Encrypted: i=1; AJvYcCWYVc7LGqgalvFCZm3aoPycsryCGs+yEPa45BJTLUs0/RkyQlaBG0ZaUBw9lYABIK8x6bA86l9ph+ZuZhMmQZ5Elz8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZ+/gQNa7ZD6JR90Cfo7CxLVnyEcpfdOJbfT1Owq0Il2gEzfNm
	S9Elv9d0wRKUYggZmQilygIEjdI3FkqeUvt60uuuez7DCMCm785U6C2qQe64uZdhP9wRqMVjdFO
	oBEmcYA7Gvzr+PhDEXepFSauJSPQ=
X-Gm-Gg: ASbGncvE3LpgPTH+aC25PHH8BA3P3RXN8ZML7/jHFvHofcc0UZe2krK4O6HOUVlZi+b
	+L+oioPyvaleb/pxPK4rpHIlT/7wo0iWC2iC6iSO06RQ1kLiMdrK6Gv1HuVBjodJV
X-Google-Smtp-Source: AGHT+IFYUGgL/Jy5P5emXXto1T9d0pprZDbobt1oO+ToHrILQ3TLEAikvjY8G6PIGudo4zJ5XrxxV+TEDKNdgIwdqis=
X-Received: by 2002:a2e:a4c6:0:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-3072cb39782mr85813991fa.32.1737618779961; Wed, 22 Jan 2025
 23:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20250123013553.5176-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250123013553.5176-1-jiaying.song.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Jan 2025 08:52:46 +0100
X-Gm-Features: AWEUYZk38qxCXyFwRAu6DkgvPmTdLPx6hC7xFT59ZHUySoynzOzE_SzKEx8Aw5A
Message-ID: <CA+chaQcrJCTv_wDmCBkNoMZ75Qu-c63FDOecFBy=QkpxFfZ_=A@mail.gmail.com>
Subject: Re: [scarthgap] [PATCH v3] boost: fix do_fetch error
To: jiaying.song.cn@windriver.com
Cc: steve@sakoman.com, openembedded-devel@lists.openembedded.org, 
	Changqing.Li@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 07:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115027

Wrong ML, this belongs to oe-core ML.

On Thu, Jan 23, 2025 at 2:35=E2=80=AFAM <jiaying.song.cn@windriver.com> wro=
te:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Change the SRC_URI to the correct value due to the following error:
> WARNING: boost-native-1.84.0-r0 do_fetch: Checksum failure encountered wi=
th download of https://boostorg.jfrog.io/artifactory/main/release/1.84.0/so=
urce/boost_1_84_0.tar.bz2 - will attempt other sources if available
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-support/boost/boost-1.84.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-s=
upport/boost/boost-1.84.0.inc
> index 5bbea2ba5b..be1ad20f47 100644
> --- a/meta/recipes-support/boost/boost-1.84.0.inc
> +++ b/meta/recipes-support/boost/boost-1.84.0.inc
> @@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
>  BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
> -SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/so=
urce/${BOOST_P}.tar.bz2"
> +SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
>  SRC_URI[sha256sum] =3D "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14=
c3e7949c24109454"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> --
> 2.25.1
>

