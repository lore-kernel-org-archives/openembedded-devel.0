Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9001C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:39:37 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.17898.1753285174965439754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jul 2025 08:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XbzVo1Z7;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7170344c100so571137b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753285174; x=1753889974; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDK/oml3gwHxgYRJ225nexSvEWAGuvMErp2kzj0ARSM=;
        b=XbzVo1Z7WJRsChyvuDJO20qNUnGnA8g0ItsunT/z0R7d1QlekBb7hvWXWBRGpMKtNG
         cA7JryD55/aRLM2zE6XGQZzplpdo7d6h2Y10xsbw7+3hoo0BcbxR2HmMLQzOGq8UkpH+
         iSqxXDTUhOrZADfnBmZg7GBUei86gl9ilQsGKfJBcoP4HeOQrTCgKErwHgkhiln+Szqd
         k3di2AsfGKiaDCFv9mhnucxk6YiNsm2kNm71MS1j2G7v10FzBjKYCbLgk3BODLrqnYXV
         qaI1yqZjk1zPtXp1gpgvQEzWEh9wLgS0ixvYf/BUUpuTIw1bahue7vP88dScQNxVq8if
         jEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285174; x=1753889974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDK/oml3gwHxgYRJ225nexSvEWAGuvMErp2kzj0ARSM=;
        b=GAFwUH3FOFFGAqPbA9MjwTXUz2JwSYACpEUrTqSdjj2xnkYfoolP8b7Ahbbn+LiI/t
         P5c2po5OLDvqi+K/x7J7S1tDk00pxZs7bd1hWXH0YqbXbtUfkKWWmUfTg7fq6VsLh5ZR
         w/pH/6HGnhiQEM0kzQSijxuwJiXetGY7GEm8ZDZYhDb7A1B9bv1jykFPQWzupXE0jtTn
         B0SAAyQSYwx5lJtOP8IarnIMgxqCOxJZY4EP//V913JvX6pwdNFXvV/B/SAeMjjo2cDn
         4GBSoPsujhIVfKz03oR9gyZpBdRxWg30NR6UppKxXy17ayqt/FE73/u8eTNMx3PEJsJi
         1cBA==
X-Forwarded-Encrypted: i=1; AJvYcCUsgacp6XN/Cr8JXdI13D5byQocnskZ5qS98cxan9RxiRzFOcNeo4x99oBWYsvOH+wYWVta1Xd5kyy1mIbb2MMGZZ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCtIwdF27q7xqLFYfSzBeU/nGT/S47Sk+af838VSUcNA77KaQJ
	JYb+cItl/+pEsji7OIgmsxiugXB5XD5UgQvnbcgm9Y84OF2nyVPoWvhXxUgxLniNDaGqzPdbvig
	86HVqrZ5PdblJx8wdg8p6Bh+pSVf+9waORFxV
X-Gm-Gg: ASbGncsoO0ROcAIDOlZbsAnRAnAJOR7fbNhqAQ0K9ZKa7KrdAw8uWfFavzXtOfZj1dV
	/iDXdC+RP/aeROf5mVs/Kzg+JnEmw39+SWd/i3ZxkLD3x02woDuMTfHNxp+I5k0wuQReTakanHZ
	5b5I9YRQ4XDtkAQUBFG4DRuZSFxgoECAfTx6bT96maptULqPcx4ePQpF5GY/2bqQVmHPiOUOrBF
	RwNoXLAXpxbrxBfmA==
X-Google-Smtp-Source: AGHT+IGZVX3ceuIMh7y+VrNumXuX2Fe7M+0xiWl2qW1bi+1vtUMiXy+kDqDBnZDF5IKQk+K2M1Y02YJHHoHFlzbrCY0=
X-Received: by 2002:a05:690c:6606:b0:712:c14a:a36a with SMTP id
 00721157ae682-719b422a7edmr45711587b3.20.1753285173815; Wed, 23 Jul 2025
 08:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250723070852.381343-1-gijs.peskens@munisense.com> <2349189b-2269-4eed-bc43-48e071584504@peskens.net>
In-Reply-To: <2349189b-2269-4eed-bc43-48e071584504@peskens.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2025 08:39:06 -0700
X-Gm-Features: Ac12FXyr8KyB172jjCFI52RD9iowCn47m29CIKBt_hKrun7HjUqkkm3UiRrAtrE
Message-ID: <CAMKF1sqi3Rk0t-LpoRArT=JmELNCBfHPg_C30TWaibNDZ6Xw3Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: fix removal of --with-zlib-dir
 configure option
To: gijs@peskens.net
Cc: Gijs Peskens <gijs.peskens@munisense.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 15:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118717

On Wed, Jul 23, 2025 at 4:08=E2=80=AFAM Gijs Peskens via
lists.openembedded.org <gijs=3Dpeskens.net@lists.openembedded.org>
wrote:
>
> Since I seem to have forgotten (first time mailing a patch, sorry) to
> add a explanation:
>
> PHP has removed the --with-zlib-dir configure option since that is now
> taken over by pkg-config, this breaks building PHP on Walnascar when zip
> is enabled via PACKAGECONFIG.
> So remove it.

Please enhance the commit message with this info and send a v2

>
> On 23-07-2025 09:08, Gijs Peskens wrote:
> > From: Gijs Peskens <gijs@peskens.net>
> >
> > ---
> >   meta-oe/recipes-devtools/php/php_8.4.10.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recip=
es-devtools/php/php_8.4.10.bb
> > index 4d598949a..4ed5d1e4f 100644
> > --- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
> > +++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
> > @@ -110,7 +110,7 @@ PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAG=
ING_LIBDIR}/.. \
> >                             ,--without-sqlite3 --without-pdo-sqlite \
> >                             ,sqlite3"
> >   PACKAGECONFIG[valgrind] =3D "--with-valgrind=3D${STAGING_DIR_TARGET}/=
usr,--with-valgrind=3Dno,valgrind"
> > -PACKAGECONFIG[zip] =3D "--with-zip --with-zlib-dir=3D${STAGING_EXECPRE=
FIXDIR},,libzip"
> > +PACKAGECONFIG[zip] =3D "--with-zip,,libzip"
> >
> >   export HOSTCC =3D "${BUILD_CC}"
> >   export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118716): https://lists.openembedded.org/g/openembedde=
d-devel/message/118716
> Mute This Topic: https://lists.openembedded.org/mt/114301638/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

