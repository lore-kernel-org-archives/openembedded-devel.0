Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web09.3568.1616580312077674133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 03:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=a+ftp33K;
 spf=pass (domain: blade-group.com, ip: 209.85.222.47, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f47.google.com with SMTP id x8so7657687ual.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zYiqm6No/XjARyQuU6bnCqouQZjsa+3UWPu7qFmRl0w=;
        b=a+ftp33KKO9D6tPzxchxDtX4U6kZ5T9ubu28h6nzv7KVf8xRZrIZ4IcQ4zcxvb/hOC
         UHGIa4j4019PfGhyjvB2Okn9PpJftpQOZrz/PujY1toDoTIz0h3X5xuqI7yftDkWpIrb
         IzZGrms8eEYu6y971zBNX8XBg3TDI1WfMtd07YQWX5DfIH4mhDlnx+EUrnVphRVWcQdl
         QS/BbcigNrymUjOC9fzxWtFyzVJ3zN64dosqF5a+5E/v6Zm7Ew4bJI5cboNKxCXtT1z7
         AJclcpdjqv62cFBQ2eQXUYnOCWrl6Ir2plbjxma/hehk6eUq7XLi/5EuNiUhaMd+KSSP
         oAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zYiqm6No/XjARyQuU6bnCqouQZjsa+3UWPu7qFmRl0w=;
        b=n7BC/uy3H+QMX2t9Is6bf4GIWFHXakTkT+c1qP7EvLXSR+3RZ1DCO5OfD/ytfH/Wbx
         kA/hNm4VsiYNI52iyxcr9Z7xlS/ODWIHZFG8jOPd9BVbMGZA400o8Sk1agbMm9nOiXcr
         az8K4Aeu3CGugSvVh035k/l3off2Xf+RnOuaVoR2bFevzRJwspBRlmGKJxshD+d9YRzh
         rru95oCqAcvGOlM3+7e8JRYv/VQDsRQletniE1mVyufM/QWY4ufWqzqqI3GHP+Ad5J7c
         5yLk8oKmQ53sE3GVrwrwQkTMtWIldDPtEExPAAp8xF0k+uwz64kdWUisol0miRrSi2wY
         VEJA==
X-Gm-Message-State: AOAM532r4cR6pD0E6gEzT3DI//hefsadd5kXsigHDETwQg089bS2t/as
	NSl5qmnhfIkWd5T67UF3MV/mYi1NiZ2nQsdVZFNG5g==
X-Google-Smtp-Source: ABdhPJwhIYkXaBIxKLOdNvhX/H0uBwfDpecih21R/FrTk+o0bU5NqmV5Smt7wM7TJyXjN0Y6uyP54RHIm2cHxXgpTtQ=
X-Received: by 2002:ab0:596f:: with SMTP id o44mr1054571uad.8.1616580311142;
 Wed, 24 Mar 2021 03:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210323171107.812146-1-yann@blade-group.com> <PH0PR11MB4902C7290C76EC692025A1D9D7639@PH0PR11MB4902.namprd11.prod.outlook.com>
 <166F3B07FD094D41.651@lists.openembedded.org>
In-Reply-To: <166F3B07FD094D41.651@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 24 Mar 2021 11:04:59 +0100
Message-ID: <CA+4=imZiq+BuF_78xn1-ApWBpGd5K7c3Oq10h_DMEf9wi+qdDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 24 mars 2021 =C3=A0 09:48, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>
> Hi Oleksiy,
>
> Le mer. 24 mars 2021 =C3=A0 09:23, Oleksiy Obitotskyi -X (oobitots -
> GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> a =C3=A9crit :
> >
> > Could you please look into https://autobuilder.yoctoproject.org/typhoon=
/#/builders/88/builds/1071/steps/12/logs/stdio
> >
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-worker/meta=
-oe/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.b=
b DEPENDS on or otherwise requires it)
> > ffmpeg was skipped: because it has a restricted license 'commercial'. W=
hich is not whitelisted in LICENSE_FLAGS_WHITELIST
> > NOTE: Multiple providers are available for runtime ssh (dropbear, opens=
sh)
> > Consider defining a PREFERRED_RPROVIDER entry to match ssh
> > ERROR: Nothing RPROVIDES 'mpv' (but /home/pokybuild/yocto-worker/meta-o=
e/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb =
RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'mpv'
> > NOTE: Runtime target 'mpv' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['mpv']
> > ERROR: Nothing RPROVIDES 'mpv-dev' (but /home/pokybuild/yocto-worker/me=
ta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0=
.bb RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'mpv-dev'
> > NOTE: Runtime target 'mpv-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['mpv-dev']
>
> The autobuilder tries to build mpv, but it seems it does not attempt
> to build ffmpeg.  I infer from this that it is
> deciding what builds to attempt based on the lack of LICENSE_FLAGS,
> right ?  Then wouldn't it be possible
> to catch this situation and consider the build failure as "expected"
> because its cause is simply
> "cannot test because of a LICENSE_FLAGS in a dependency" ?

Thinking twice about that: wouldn't it just make sense to run the
autobuilder with
LICENSE_FLAGS_WHITELIST=3D"commercial", and gain coverage of ffmpeg and
its dependencies ?
