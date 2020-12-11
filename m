Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.1434.1607655716826973620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Dec 2020 19:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=niWfzfWM;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b64so3201873qkc.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Dec 2020 19:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t5L5/jJSxg47Gcu7o/HGwehehBI4lqvPigCDTjRgzwI=;
        b=niWfzfWMXHYlKHE68jqcBRQA1WTAbTvz/zCJw+0qKoUegWu457dTmL71fS/VhnGO6c
         hctehUptqrz8u+Pjfi8zHY+oAzpb+qb8DQCH+rdI+SKikz09Wi2g07ZVNHH1ssFjWSg4
         bVJMb9d2gojEVFWq9jR/vwnX11p8jZRs1/3lEvLcGrk7ceqZpmyip9YUSajSMs2jraK2
         kgRp+5Lk/DRnc4GHrjXApv+yuu2Rz3bYB8x7LGSYsCwv65tQqOpK2YUhu7h466yAPNLp
         QmPuQG/PVN+ukWN9z6dbRIIfVL7xGSJNNbx8S4fA3kVKvv1vxNwvWPKARqVZSeAFcWGZ
         pPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t5L5/jJSxg47Gcu7o/HGwehehBI4lqvPigCDTjRgzwI=;
        b=PV93k7yBSH1B0bADn9xcwU3sVem3Mx0qsOnm4wFxgG5EMbF5y11YgyGhsnUv8IT1oD
         C6RrKDAg1MmLLcfWnZZea+QwM+8zhSp3CYD+3JXtQcf01MVP7oI6O7kYVwFHjH1cjgLi
         tsVdG+UW+KBFqMRpOmNTYNv7JTrbA1K0GHAghqtUm/ypZFHfY/rzv8Xz7IWTx6hJ5+qv
         Xp/pW2b9tdwYfwxy+u5OFlWfb2xf9pCX8qJNRY/6yj0/KiOk/Romx3VDGmXFo2vSPw56
         tBGkVjz5ooaoXNItqqMknkEBpR+Ela2T5T6N5cNvtY8ceVFbiTF2TO2NVlj6bHlyakp7
         sFZg==
X-Gm-Message-State: AOAM530gojUAnEfH7YbTT42sbOY8NKRt727FPCGZuM43vvfnXK+9Adv0
	GxI/FNFDGgRSPJAz7cghuII=
X-Google-Smtp-Source: ABdhPJxOTyw8ZS8SBeFWfQK3E/tLli/GXZZTdv9kMc4g3tJLjicnXPAl59NEehvtftaaNpg6qXfJxg==
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr13496622qki.421.1607655715967;
        Thu, 10 Dec 2020 19:01:55 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id b6sm5618033qkc.128.2020.12.10.19.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:01:55 -0800 (PST)
Date: Thu, 10 Dec 2020 22:01:52 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
Message-ID: <20201211030152.GA28190@localhost>
References: <20201204040829.38707-1-twoerner@gmail.com>
 <20201204040829.38707-2-twoerner@gmail.com>
 <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
 <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com>
 <CAHUNapQMNV5Ei_2MKYyaWKyD6xQ6_U_sZbwRdaGCwBcWWnc-tw@mail.gmail.com>
 <CAMKF1spwyen8hwQ7iwJ36kS=WGRZUy6sOS0EDvUX29GCH2uTPA@mail.gmail.com>
 <164F89DE82BCA6CD.23621@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <164F89DE82BCA6CD.23621@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2020-12-10 @ 09:52:56 PM, Trevor Woerner via lists.openembedded.org wrote:
> On Thu 2020-12-10 @ 12:34:17 PM, Khem Raj wrote:
> > On Thu, Dec 10, 2020 at 11:39 AM Trevor Woerner <twoerner@gmail.com> wrote:
> > >
> > > On Tue, Dec 8, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> while I have applied v3, please send a v4 addressing this change.
> > >
> > >
> > > I had wanted to try going in a different direction, one that didn't need the DISTRO_FEATURE thing.
> > 
> > all I wanted was to fix PV as a followup
> 
> Ah sorry, an update to 2/3. Okay, coming shortly.
> 
> Can we drop 3/3? I'd like to give it another go without the "dispmanx"
> DISTRO_FEATURES.

Oops, too late. Okay, I'll submit a new patch.
