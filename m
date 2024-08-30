Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFA9CA0EF4
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:41:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.8354.1725007271814179939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBZ9Uhne;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53349ee42a9so2117885e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725007270; x=1725612070; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kph+8nZH5ADfkvgKp8aztx469xImdwXrZ9XOukErSY=;
        b=LBZ9UhneayP6Kp+Ks+t9wEv7frI10YwIQbEB86d+bQt18mFDPcGByv0VfXZifVt2hx
         WZQvZU4fMYSxOd3/Dv8heuIAch1iVHcYh4MhVgGoikoraQmB/vjgy/ZGInZoEY7IYhmD
         gD9Nn6dh0j1v9G9yUIvP+dbqevnq81zWrlHZ++CCRhhdw/GvAVVlrpyiCxkqqrtD3k+I
         j4e137SvkIGn1V9GUIW+dn12C3WiVUOcHfIfGkJ/XI+UG6huJ1Zj/tOik9GDviBI31Qm
         PKqJXgzr8SS3JzLcnVwyOS/0541yrt1Lnbzl0g5rNH66cuZyvcjFixvDoZ/ycjbAQZWE
         BN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007270; x=1725612070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kph+8nZH5ADfkvgKp8aztx469xImdwXrZ9XOukErSY=;
        b=lObBXdMHYET2ZdrEcr6om7O9iktNwnaQcl+1vog8i6UsmvVwEc2WIet2A4v7RJpWjH
         /9gnClLM+2CYSBDIA7xe6D5WPn5yKb06tqg55JRBQ7gvAJO8a1ie8Cu8YQ270mls7pl2
         1RQKqpJ/Xoi4FJ2a52WyQ4kfCe+eOLG6uNIujJmL8IYX/L0uIA+blqiGcoqzfzLiXy68
         ajhkzhbkw7cjUBef/H7O0myzC1VJn2iLWUJVOW8L8sN60VeaI4QSOfyjz3Gt2gF5OLhn
         g+nnchKPHGX2GC535zkaG2rBJqt5YObSXHOkJfjLe/7FOQmd0CztL4ef+fzcj7mAv8fm
         hq0g==
X-Gm-Message-State: AOJu0Yw9iyA/JG5HfmtM1CuF3qG3c1Q5CP/AKLCoToudXBNKZN5BWH8v
	4pjq7ULDWdbUq5lwjGaYLiCcu8A1XYvO6UsFLWYaLE57APdqtA9Bf/2ns7wI61tFatTOMKfitJf
	f4i7Rsr/4tPJOZdv8iG3i4QF+FeoYxXeY
X-Google-Smtp-Source: AGHT+IFtIQfKa/YbSS4+yq8UhAVJa3r9bneUO86VqGzK60m568cxJ9jG4TBMwmg86OwfOiwGE4AFJCdUR0e1ab+rIjk=
X-Received: by 2002:a05:6512:1329:b0:533:4817:7280 with SMTP id
 2adb3069b0e04-53546b5a5f5mr1034391e87.35.1725007268872; Fri, 30 Aug 2024
 01:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240830081819.2635680-1-martin.jansa@gmail.com>
In-Reply-To: <20240830081819.2635680-1-martin.jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Aug 2024 10:40:53 +0200
Message-ID: <CA+chaQe_FmAQw8s6zyGdKrgBGAf=5ejCcWGYrRMkJe7csuaF6Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] gcab: keep buildpaths QA issue as a warning
To: openembedded-devel@lists.openembedded.org
Cc: mikko.rapeli@linaro.org, akuster808@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112050

Mikko: can you please explain why meson embeds absolute paths in
glib-mkenum filename on purpose?

Or were you seeing any other buildpaths than these 2?

lib32-gcab/1.6/package $ grep -R styhead .
./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
"WORKDIR/build/../gcab-1.6/libgcab/gcab-file.h"
./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
"WORKDIR/build/../gcab-1.6/libgcab/gcab-folder.h"

glib-mkenum supports also @basename@ since 2.22 which would avoid this QA i=
ssue
  @filename@            name of current input file
  @basename@            base name of the current input file (Since: 2.22)
if we update
./libgcab/gcab-enums.c.etemplate:#include "@filename@"

Cheers,

On Fri, Aug 30, 2024 at 10:18=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> INSANE_SKIP:gcab-src doesn't work with multilib where the package is
> named ${PN}-src (e.g. lib32-gcab-src) and it's better to just lower
> buildpaths from ERROR_QA to WARN_QA instead of skipping it completely,
> because it's still an issue which should be fixed (at least to improve
> hashserv efficiency if you don't care about reproducibility itself)
>
> The backport to scarthgap from:
> https://lists.openembedded.org/g/openembedded-devel/message/111739
> should IMHO be just reverted there as buildpaths QA issues
> aren't fatal in scarthgap.
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gno=
me/gcab/gcab_1.6.bb
> index 49c64f0ba6..0d9410b4d5 100644
> --- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> +++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> @@ -24,4 +24,6 @@ PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_te=
sts=3Dtrue,-Dtests=3Dfalse -Dinst
>  BBCLASSEXTEND =3D "native"
>
>  # meson embeds absolute paths to generated files on purpose
> -INSANE_SKIP:gcab-src +=3D "buildpaths"
> +# ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in =
package gcab-src contains reference to TMPDIR [buildpaths]
> +ERROR_QA:remove =3D "buildpaths"
> +WARN_QA:append =3D " buildpaths"
> --
> 2.46.0
>

