Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.14287.1599660098739643026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 07:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=v8Dp1lJb;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id o16so2459572qkj.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AAC540baHIduTSrDJpQ3EfljhKXW/nEifMS3akawQBs=;
        b=v8Dp1lJbhr8rgpV0y1+DZIk97VaA0ZyO3/Q1/YoVqHPdMscgHB+eMiNZTahmGWbJLb
         JzGD+SHEodJ675q/jeTk808TwzeKVyKR/Zq7el9enUUvl8BShb5a3torANs2I6BzY17q
         aOS9KIYqTJ5e9yQvTjTjV2XXJtNeQVGFqUj2Huf/JpPn/pIEKPXqH+G3zefOQoarX4pk
         68RuzQhJ2vuBZcYeG4j3w2GsemSlKxX3HVfFRjWQoXU7rm744wUyam8MMR3FEBW4oZoh
         G/qFD/DE2GP2sqyTg2GkQD3PXwpJRvXVCTetL+bL2eWM1igjB0a1vKq5gnzGW4EdeD4D
         0BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AAC540baHIduTSrDJpQ3EfljhKXW/nEifMS3akawQBs=;
        b=T6RnwRYuqgxy4qOo1+6UExpbWEGCN+HSfhQOoyBehzw00WaVNTB0OkWD3eT4IpK+4K
         MUoOptXnJC1A/33KPevq/NiFJvvvXJrbY3Dc038EqRzFyWtBA1OH4kXnr+y0nKdUOlCv
         qkXgy5Mabw5ZLfEXGFn5KCGT8bFzqpiSlHNg26TyGvhjmPysZYkGrI/o+0/61axW4GhK
         K0FdycImqJoKAxbc4C2kVx+rWdgYxMysY2pL4bg6GununCsT0OTOhcWG/p1xl+xyHRF7
         H5WsZDpaJgfbBMF/hD9k698devpvjhng0uPM9HXYvOoNuOwfZmE5fO8DvTmxmYXoEmqu
         Q/cQ==
X-Gm-Message-State: AOAM530PFKWtTbPcGGCivWa+Ifo3LDWJ0Pe6dghPPPk+TkUD5BPpaAUv
	jAAmvzwt04XB77e1y7aJLVr4Ksiq353dPw5r
X-Google-Smtp-Source: ABdhPJyqM1M2dyNgjop5Fst511urKz2b2SQ8mY7Yws2pMl2yVNKZzpnugFD4QtfQMKiIDgY/cCMXZQ==
X-Received: by 2002:a37:b8c2:: with SMTP id i185mr3281535qkf.87.1599660096005;
        Wed, 09 Sep 2020 07:01:36 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id x59sm3081649qte.14.2020.09.09.07.01.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 07:01:35 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f175.google.com with SMTP id v123so2462202qkd.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 07:01:35 -0700 (PDT)
X-Received: by 2002:a37:27d7:: with SMTP id n206mr3336997qkn.197.1599660094637;
 Wed, 09 Sep 2020 07:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200909122322.12899-1-fabio.berton@ossystems.com.br> <20200909122322.12899-2-fabio.berton@ossystems.com.br>
In-Reply-To: <20200909122322.12899-2-fabio.berton@ossystems.com.br>
Date: Wed, 9 Sep 2020 11:01:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpns0XsQv=Y7M=7kiMDUzkh-ybBbhy4JU1-4M482Jsk4A@mail.gmail.com>
Message-ID: <CAP9ODKpns0XsQv=Y7M=7kiMDUzkh-ybBbhy4JU1-4M482Jsk4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libqmi: Update 1.26.0 -> 1.26.4
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Fabio,

Em qua., 9 de set. de 2020 =C3=A0s 09:23, Fabio Berton
<fabio.berton@ossystems.com.br> escreveu:
>
> Switch to autotools-brokensep to use the same directory for build and sou=
rce avoiding error:
>
>   configure: error: source directory already configured; run "make distcl=
ean" there first
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

The brokensep change can be undone as the 1.26.4 tarball has fixed the
issue I reported. So the distroclean likely is not needed anymore as
well.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
