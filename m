Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F839C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 00:20:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.24910.1632702042046832013
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 17:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BL03Aspy;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d8so15200661qtd.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Sep 2021 17:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hzB94eQQ2F2sIHZJWGo64e8GGOG6yb06j5XBnA4K1lM=;
        b=BL03Aspynbs50Gs3iJ9QI1B3sfTIqLeEswLck2w3Bs3vq520P9yj/cxkTu9bjFDITe
         tjUf1QK1NlfmcSvuUO949p8S0YD9rhAtcsSvG+LIQW+Dl5RZ9jt+oY9P6RNaoElOnqmt
         KFKArx0SQ8NDOp08PE/13rg9SAlnKGXWufgJX1E+bC9bov7c1G/MeByXdQXUtGCPQE3W
         NfWMN1wFUFQ8OvPUJ6JbFNA5A/y0rYi5tfFDDVXCF+q9pnUDCwmRZcKZd6/pDpTCehYS
         mW3kM4+nsZxjJxiuSzRpEyQXZIlSlCXmdhCBth/WCwsRWyWWA2GepzYvTdMzVVaholjf
         oU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hzB94eQQ2F2sIHZJWGo64e8GGOG6yb06j5XBnA4K1lM=;
        b=HXxrIRBRf7vtGQmujXca57337N0Ge9+vK6ACHWfzJNkqXzNp8NzMlaFHv79FYD8W/h
         GSw0gdtPwqfeE1E93UU/Ni5AKBBn2EVT5rnFJhb4jNoEExhZjgi9xIzq9mo8ILyek7vb
         a8WKS+qi6XLTxHTs+UG0svdtkvK0dev9VyT75VV4IpgPwPs9ZvQtWb/Hk6j4TESbAJ5e
         3UrSUE1VhV7QF3NAAv9n4cK+kpMQqOsiYRXhN+PXBBljK4DvBWyoaYKNxuD3Ok4hownw
         G0PgDAcFDRNo1nvL2LJeGEMVSVbaNwJ78tBhor0EOmF+gCd7ThW4SNsybi0aGiWmBKfh
         qaDQ==
X-Gm-Message-State: AOAM53293fnBF7AKCx9sWU4Ph4cEo4FYdCluHNnOrh02VqSHfccjfItI
	ivTTeVrb7Bt0vwaVOpyjp4Pk/hc2XD50gpahX0c=
X-Google-Smtp-Source: 
 ABdhPJy/V8JBEb1Vu8hJp6TNdq+SZ09oDeCh48aeYAhDl+tL/kiJl4gu2+2pzkb9c7bw/NSYk6ruL16dFzP09Lqxecs=
X-Received: by 2002:ac8:6893:: with SMTP id
 m19mr16213332qtq.116.1632702041026;
 Sun, 26 Sep 2021 17:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210926221001.1834800-1-akuster808@gmail.com>
 <CAMKF1spy19ixoDXn4CyKXeRYydbADXDz_s2=zeqVjsueu2-dtQ@mail.gmail.com>
 <f6809fb1-6b03-d17f-a961-a702e51249f8@gmail.com>
In-Reply-To: <f6809fb1-6b03-d17f-a961-a702e51249f8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Sep 2021 17:20:13 -0700
Message-ID: 
 <CAMKF1srgSOY3drj4Bpg9XSqW_7jp4wfo76aN4eek36sfABc+LA@mail.gmail.com>
Subject: Re: [oe] [PATCH] README: update to main repo
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 00:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93134

On Sun, Sep 26, 2021 at 5:05 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 9/26/21 4:49 PM, Khem Raj wrote:
> >
> >
> > On Sun, Sep 26, 2021 at 3:10 PM Armin Kuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     The main repo is sourced from git://git.openembedded.org
> >     <http://git.openembedded.org> not github.
> >
> >
> > I think we wanted to load balance cloning IIRC that=E2=80=99s why it po=
inted
> > to GitHub repo but I guess making it consistent it still better
>
> I understand. My next thought was to inform them of github and how to
> use that for their and our benefit. The yocto project does have two
> different urls for pushing and pulling for load balancing.
>
> my .gitconfg
>
> [url "ssh://git@push.yoctoproject.org/"]
>         pushInsteadOf =3D yocto:
> [url "git://git.yoctoproject.org/"]
>         insteadOf =3D yocto
> :
> Something Micheal H sent out years ago, not sure if this is still in play=
.
>
> maybe documenting something similar for OE may work?
>
> I wonder something in the top level README may be where this can be
> explained instead of in each sub layer.

sounds good yes.

>
> - armin
>
> >
> >     Don't think oe-core.git exists.
> >
> >     Lets be constent across all sub layers.
> >
> >     Drop Revisions and Prioriiy from repo references as they are not us=
ed.
> >
> >     Signed-off-by: Armin Kuster <akuster808@gmail.com
> >     <mailto:akuster808@gmail.com>>
> >     ---
> >      meta-gnome/README      | 6 ++----
> >      meta-initramfs/README  | 3 +--
> >      meta-multimedia/README | 6 ++----
> >      meta-networking/README | 9 +++------
> >      meta-oe/README         | 1 -
> >      meta-perl/README       | 2 --
> >      meta-python/README     | 2 --
> >      meta-webserver/README  | 6 ++----
> >      meta-xfce/README       | 7 +++----
> >      9 files changed, 13 insertions(+), 29 deletions(-)
> >
> >     diff --git a/meta-gnome/README b/meta-gnome/README
> >     index 1a91050004..fbb0d72476 100644
> >     --- a/meta-gnome/README
> >     +++ b/meta-gnome/README
> >     @@ -2,13 +2,11 @@ Dependencies
> >      ------------
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/oe-core.git
> >     <http://github.com/openembedded/oe-core.git>
> >     +URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >      branch: master
> >     -revision: HEAD
> >
> >     -URI: git://github.com/openembedded/meta-oe.git
> >     <http://github.com/openembedded/meta-oe.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      branch: master
> >     -revision: HEAD
> >
> >      Send pull requests to openembedded-devel@lists.openembedded.org
> >     <mailto:openembedded-devel@lists.openembedded.org> with
> >     '[meta-gnome]' in the subject'
> >
> >     diff --git a/meta-initramfs/README b/meta-initramfs/README
> >     index a8f17ba859..119293a741 100644
> >     --- a/meta-initramfs/README
> >     +++ b/meta-initramfs/README
> >     @@ -11,9 +11,8 @@ Dependencies
> >
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/oe-core.git
> >     <http://github.com/openembedded/oe-core.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      branch: master
> >     -revision: HEAD
> >
> >
> >      Maintenance
> >     diff --git a/meta-multimedia/README b/meta-multimedia/README
> >     index 9c649ff87c..235c34331b 100644
> >     --- a/meta-multimedia/README
> >     +++ b/meta-multimedia/README
> >     @@ -1,13 +1,11 @@
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/oe-core.git
> >     <http://github.com/openembedded/oe-core.git>
> >     +URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >      branch: master
> >     -revision: HEAD
> >
> >     -URI: git://github.com/openembedded/meta-oe.git
> >     <http://github.com/openembedded/meta-oe.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      layers: meta-oe
> >      branch: master
> >     -revision: HEAD
> >
> >      Send pull requests to openembedded-devel@lists.openembedded.org
> >     <mailto:openembedded-devel@lists.openembedded.org> with
> >     '[meta-multimedia]' in the subject
> >
> >     diff --git a/meta-networking/README b/meta-networking/README
> >     index e1ba27d83b..1aea8a6613 100644
> >     --- a/meta-networking/README
> >     +++ b/meta-networking/README
> >     @@ -17,21 +17,18 @@ Dependencies
> >
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/openembedded-core.git
> >     <http://github.com/openembedded/openembedded-core.git>
> >     +URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >      branch: master
> >     -revision: HEAD
> >
> >      For some recipes, the meta-oe layer is required:
> >
> >     -URI: git://github.com/openembedded/meta-openembedded.git
> >     <http://github.com/openembedded/meta-openembedded.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      subdirectory: meta-oe
> >      branch: master
> >     -revision: HEAD
> >
> >     -URI: git://github.com/openembedded/meta-openembedded.git
> >     <http://github.com/openembedded/meta-openembedded.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      subdirectory: meta-python
> >      branch: master
> >     -revision: HEAD
> >
> >      Maintenance
> >      -----------
> >     diff --git a/meta-oe/README b/meta-oe/README
> >     index 98f671d7c2..bf17415391 100644
> >     --- a/meta-oe/README
> >     +++ b/meta-oe/README
> >     @@ -5,7 +5,6 @@ This layer depends on:
> >
> >      URI: git://github.com/openembedded/openembedded-core.git
> >     <http://github.com/openembedded/openembedded-core.git>
> >      branch: master
> >     -revision: HEAD
> >
> >      luajit recipe requires host compiler to be able to generate 32bit
> >     code when target is 32bit
> >      e.g. arm, so ensure that $CC -m32 is functional on build host, if
> >     building this recipe, needed
> >     diff --git a/meta-perl/README b/meta-perl/README
> >     index c519dff524..13014b0ff3 100644
> >     --- a/meta-perl/README
> >     +++ b/meta-perl/README
> >     @@ -53,8 +53,6 @@ This layer depends on:
> >
> >        URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >        branch: master
> >     -  revision: HEAD
> >     -  prio: default
> >
> >      Adding the meta-perl layer to your build
> >      ---------------------------------------
> >     diff --git a/meta-python/README b/meta-python/README
> >     index df6abe0e2e..194bac39c7 100644
> >     --- a/meta-python/README
> >     +++ b/meta-python/README
> >     @@ -14,12 +14,10 @@ The meta-python layer depends on:
> >             URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >             layers: meta
> >             branch: master
> >     -       revision: HEAD
> >
> >             URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >             layers: meta-oe
> >             branch: master
> >     -       revision: HEAD
> >
> >      Please follow the recommended setup procedures of your OE
> >     distribution.
> >      For Angstrom that is:
> >     diff --git a/meta-webserver/README b/meta-webserver/README
> >     index 7b60630700..d23f6cc65c 100644
> >     --- a/meta-webserver/README
> >     +++ b/meta-webserver/README
> >     @@ -11,17 +11,15 @@ Dependencies
> >
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/oe-core.git
> >     <http://github.com/openembedded/oe-core.git>
> >     +URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >      subdirectory: meta
> >      branch: master
> >     -revision: HEAD
> >
> >      For some recipes, the meta-oe layer is required:
> >
> >     -URI: git://github.com/openembedded/meta-oe.git
> >     <http://github.com/openembedded/meta-oe.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      subdirectory: meta-oe
> >      branch: master
> >     -revision: HEAD
> >
> >
> >
> >     diff --git a/meta-xfce/README b/meta-xfce/README
> >     index bbf4b2edf2..1e9acc471d 100644
> >     --- a/meta-xfce/README
> >     +++ b/meta-xfce/README
> >     @@ -1,12 +1,11 @@
> >      This layer depends on:
> >
> >     -URI: git://github.com/openembedded/oe-core.git
> >     <http://github.com/openembedded/oe-core.git>
> >     +URI: git://git.openembedded.org/openembedded-core
> >     <http://git.openembedded.org/openembedded-core>
> >      branch: master
> >     -revision: HEAD
> >
> >     -URI: git://github.com/openembedded/meta-oe.git
> >     <http://github.com/openembedded/meta-oe.git>
> >     +URI: git://git.openembedded.org/meta-openembedded
> >     <http://git.openembedded.org/meta-openembedded>
> >      branch: master
> >     -revision: HEAD
> >     +
> >      meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in
> >     this repository.
> >
> >      To avoid dependencies on meta-multimedia you need to mask recipes
> >     by adding
> >     --
> >     2.25.1
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#93131):
> >     https://lists.openembedded.org/g/openembedded-devel/message/93131
> >     <https://lists.openembedded.org/g/openembedded-devel/message/93131>
> >     Mute This Topic:
> >     https://lists.openembedded.org/mt/85888414/1997914
> >     <https://lists.openembedded.org/mt/85888414/1997914>
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-devel/unsub
> >     <https://lists.openembedded.org/g/openembedded-devel/unsub>
> >     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

