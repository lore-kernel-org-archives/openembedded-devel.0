Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3883BC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:01:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.369.1646672509831556253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=o3+Jx8T/;
 spf=pass (domain: burtonini.com, ip: 209.85.128.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f43.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so9675183wms.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ul37WbSkMWiSiUp8KV6Df8d6lp4P/mQ5OLssEfj3Wbg=;
        b=o3+Jx8T/en+Dn0qqipM0UCgeTQUXmInGJMAz6GL/1cKrq4DRaACkZSzOS9kY6Wmn9W
         8x08wpMJdLnQ272Sllsqeq9T9topP3zJCHjBXrFWfHE5bSd6qyP8VR9JtetRzL2Z7Fab
         CQWMNRfWC5W2e2B1Loi1Dvjupv50I8aoAH0Y6K/0ZjG0R3gOutvfxJRisyxqKfgg4w6K
         QxK1V88Qt9Qay3HlQocO80YqrBIDC6K3pmuZAwPVViJ4k5jtHran/oJtitf9a5d++igP
         I40ifkPAWO/ieYqFOw1Hf2OQphQhlj27udem2mQzxWRH/odCx6BmNLKSnbHdqZeGxiu6
         1x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ul37WbSkMWiSiUp8KV6Df8d6lp4P/mQ5OLssEfj3Wbg=;
        b=nZTHy0ssUxe/SWmjQL0n8uaNt4vNzYeITCmcjekrHBLeoNhk5uUC79WZ4iozk1VY5V
         vov4NHAPzzRiI59NlKhEN8t4p0rYPIMD5KL/JGz18u0tBcEihR4IiGgw1IVCY5jKKnit
         BjUJ1oItzM+uws4CRgdLWnrN+n5++1vOzNqCvM6wa7wPKhOW81P8pI0wC4rUMKocNEKb
         eeVGQvcKyAa1N+oWA4VL8vRwuRfZHiOmSH4zQxJbVgWVUJvph0I4FC4ulXTqiMkJb5mm
         HnW2K55U1dWkvRtP40okoSuGE/qYwgM4MD0+fKfs47yO3R6VPjS5tkAdT8TUjz0qBJQk
         IsHg==
X-Gm-Message-State: AOAM533dvTigyTSOqFo1/aCXmD1qnd/0GjoxokaufIS6op6MzCoQJFk4
	EDoTvrbqVzEY7GFGHCVBNp2u5eYIjds/H14Mtl+nEw==
X-Google-Smtp-Source: 
 ABdhPJxJZE0kCs/1YpVQTl12D7+k7B4l5X7mt/16l3f4mJ11RIRP2piSV1S3kffTn+S05O+ipVPUSwnyBGhawDMBNBY=
X-Received: by 2002:a05:600c:1c88:b0:389:bede:34d0 with SMTP id
 k8-20020a05600c1c8800b00389bede34d0mr493945wms.62.1646672508316; Mon, 07 Mar
 2022 09:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20220307121112.1844760-1-ross.burton@arm.com>
 <CAMKF1sqsGCB+Mnq9qniig-NKSm+qM8d=S0xhHgKg1WGXx87GNw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqsGCB+Mnq9qniig-NKSm+qM8d=S0xhHgKg1WGXx87GNw@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Mar 2022 17:01:37 +0000
Message-ID: 
 <CAAnfSTu=hasyR3pdApsTvb=oYy2V7Y4THpLoqU9ambqRTXtKdw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-blivetgui: use setuptools_legacy
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 17:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95870

Done and sent a v3 containing all of the patches in one series.

Ross

On Mon, 7 Mar 2022 at 16:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you rebase this on master-next ?
>
> On Mon, Mar 7, 2022 at 4:11 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > The setup.py installs to arbitrary target paths, so can't use the new
> > bdist_wheel installation method.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > index 995fb49622..7c3af1a8be 100644
> > --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protoc
> >  inherit features_check
> >  REQUIRED_DISTRO_FEATURES = "x11 systemd"
> >
> > -inherit setuptools3 python3native
> > +inherit setuptools3_legacy python3native
> >
> >  RDEPENDS:${PN} = "python3-pygobject python3 \
> >                    python3-blivet gtk+3  \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95847): https://lists.openembedded.org/g/openembedded-devel/message/95847
> > Mute This Topic: https://lists.openembedded.org/mt/89610237/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

