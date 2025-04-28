Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC94C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:16:22 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.60481.1745874973911698344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JeEg0DME;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-606440d92eeso2792106eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745874973; x=1746479773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGseGvkow+v1qz06fcG/jaAAghMmBRnBiFWzvZEF3lQ=;
        b=JeEg0DMEVVdSkwRB534U9fnTLTH/gsQXk94GT7HPWFGHqAwiO3S3rXcZtn1lFtnR1c
         KKFGCpmFD1XrfBp3h+n9PeGO6PxN8jbUDnijx990aQaiyHz31MyghXwHZ+nfet5Dz26E
         wsaeveKIWsqFL7FXO+xdjn7nqy4S+ctOeSUI/ZIxk/8hYU7rqiNSFhWAPlnVjDwVgfe1
         jR0E3HkQRbRoCvg7M8/A/Oq2Kjt/B2C9YrMBQX2uJ6T/FImU9hdC9X9+EhCAG4dd3hxF
         0Hnt7NdfELyc54TRHjbjU5vbMKpYgAc+fn1sp1uEJRvZF4joFoqA6vgreKvvwWr9sjDC
         nlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874973; x=1746479773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGseGvkow+v1qz06fcG/jaAAghMmBRnBiFWzvZEF3lQ=;
        b=wFmpwLVE9J/p97B8qMSgspydIuPX3Y2v4dqPK74yncG+t0VuBtvp8JXllUBAbD6rP1
         bEev/spOnDV1BzY+6pUyXP5rBWsf/vzPkvhry6aebVz+3rcGh1btrX6vdQF9WodeX82+
         Qn8sJzpFG11tDhL6uwSXwBm/ZeVdNd528UAJ7yYrfhAqjHzwZGfiniItF+NJpWx/2/pK
         jnthxVkwW4WshpVCHmQsbaiPuMdUh42/36jxkia1mZgt51UA7b6LZfZnXBCg8jhWvbGG
         D0mbuFka/Jf095wd8/mTL9ANorQihk0dlN9zjgP4FBoGAgZox2cUx+kThjuB45SXdqIB
         LGuA==
X-Gm-Message-State: AOJu0YzVisw078t8fEGio+9msJzWsjoHRMJhs08oy0NFZhVXpbnfQ4vf
	YtTf0Y9I1LUjehHpTt3fQUSuQzLcPmqtY7B4FwQhVyK5KxBKJzpUzm8FDmJFaNEjqiqZnspG/zq
	JAjdU0NGPGkzm4BDovId+d7wapy0=
X-Gm-Gg: ASbGncuFvdokDefZ7Tnvnr0Kt9V2AyUnFFan7xIM7ymCMZ1kOItxIawj1GCvsYYY8oZ
	GJVJwdvpx0l8s0lncoYYSt8co1O+TWXseE5t0hhXNc9+/FM5IlbGhKrAl63yDf1VSUp13bHD7vO
	IdH5LFJjxH9sC0UT0ZCiq9
X-Google-Smtp-Source: AGHT+IFuwJVkv+HOhNxRPOW1TEShYebSIMMq60Z+YzLwjq4Wirh9EUv7ACYZaw81i0LPTnf8oaSmRfJt6iQ3vPTNcho=
X-Received: by 2002:a4a:ee0c:0:b0:600:1dca:de9b with SMTP id
 006d021491bc7-60683e6d4d5mr760594eaf.4.1745874973042; Mon, 28 Apr 2025
 14:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250428173922.43331-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250428173922.43331-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:15:46 -0700
X-Gm-Features: ATxdqUFF98vZ93PdtXVBD-lfVwN4fKf5z0w-hawKMp0jxpOSzrvWBS--369-ed8
Message-ID: <CAMKF1soLcrA7eGKfQ4JHBc+hvBEd5XE=7M+5x3OqhnEMB7FxAA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Clean up code
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 21:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117204

Please rebase and squash the code on master branch or master-next branch

On Mon, Apr 28, 2025 at 11:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> 1. Add "simplelog-topic.md" designation.
>
> 2. Fix warning in building.
>
> 3. "-Werror=3Dformat".
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> index 764425dbc..8acf50fe8 100644
> --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6=
275cb4c2e75c517952ac7c"
>
>  SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
>
> -PV =3D "1.0.5+git"
> -SRCREV =3D "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
> +PV =3D "1.0.6+git"
> +SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117200): https://lists.openembedded.org/g/openembedde=
d-devel/message/117200
> Mute This Topic: https://lists.openembedded.org/mt/112505202/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

