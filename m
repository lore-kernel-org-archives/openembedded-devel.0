Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AC1C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:25:54 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.706.1646673953167756678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HLYFcqyB;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id d194so2887731qkg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUbG3Q502x8+iwT8xIl6h2gay413lOWFdy1ttjkMIKk=;
        b=HLYFcqyBO1DdF9yXEgALJU3ayVLqTaYbZ1yCoAb69KcNw5PqCjWAoynx1PcaX8LFKG
         KtcbBaUztvCOk5bAfuYHFX7MlMeZGLTBnouqomOE2T03d+AJxsnq1g1/b6tIrlV0led2
         V031/e5wiDsDPZ/JKUDXx3IQfxCyWDp15LTBmtg8cJqo9N/CDyrk1qEwCuYbS0PZlR8k
         oSaIcA7S6rP4cfipew6sDIbOqnfGxk2xuskCeQwvKq8ELzT/VtVS6Uj3X+SFqkS2ZtSP
         zail92cRJlelPMXLG67719uc3qVjoFzyenCspXnvG/EnCOZ0BuEVJ8wPX3L+Cuih4zuX
         8Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUbG3Q502x8+iwT8xIl6h2gay413lOWFdy1ttjkMIKk=;
        b=6q+9QNvAprU0EmcdJOnOeTanT7KtuqYmEISE7Tk5GMqR1ZBfX9q94qjCpTJ6f7Zbik
         jC8iua/c9js7TZm/T4JCktZShS7J/CRtUtpIG6nPASGE+FSZcxKMoDM4BUH5iRtflSmM
         iR9MY2WBVRD5gDsYfLwdm1yQlUU8RVnuDEUtWgUA5bDJZC19cIJJdlNMxeO/r8+CwU7q
         Sd/n7V9IOBCGZ8khteFgualuKaV487KJ0cjQozoCBvYZH9x5t2FLJ+di+YUSMjx8b+tv
         /08AsrUPtIvr9lEKBP2xEupFYT4fNtPDVPI998qOEvqSSzCX35XTMWLKuaj5oBR03D2v
         WsCQ==
X-Gm-Message-State: AOAM533m06dYzS1W4ocfuMmmZMQGawE9IToj/Ak57eGpPW016Vmpqxos
	9DYWrGr7DezY6yAhx/8uElTY3pItQocBrjfgmlmA7VhcsF8=
X-Google-Smtp-Source: 
 ABdhPJyRchm0xfQuJiiR5RGRA2UfbKBzGVx+EvzidoZiYc5hIeC0mTg7knATi2D2im+6yLYqfsKGdHm1mCZ+o7Z3EsY=
X-Received: by 2002:a05:620a:45a7:b0:67a:ec24:d3fc with SMTP id
 bp39-20020a05620a45a700b0067aec24d3fcmr7369158qkb.180.1646673952108; Mon, 07
 Mar 2022 09:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20220307121112.1844760-1-ross.burton@arm.com>
 <CAMKF1sqsGCB+Mnq9qniig-NKSm+qM8d=S0xhHgKg1WGXx87GNw@mail.gmail.com>
 <CAAnfSTu=hasyR3pdApsTvb=oYy2V7Y4THpLoqU9ambqRTXtKdw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTu=hasyR3pdApsTvb=oYy2V7Y4THpLoqU9ambqRTXtKdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2022 09:25:26 -0800
Message-ID: 
 <CAMKF1spy0hxw8oFEKx4CXM83rZ26VR-u+tH_SVX0B4-BKJ6Srw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-blivetgui: use setuptools_legacy
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 17:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95872

Awesome, thanks!

On Mon, Mar 7, 2022 at 9:01 AM Ross Burton <ross@burtonini.com> wrote:
>
> Done and sent a v3 containing all of the patches in one series.
>
> Ross
>
> On Mon, 7 Mar 2022 at 16:42, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Can you rebase this on master-next ?
> >
> > On Mon, Mar 7, 2022 at 4:11 AM Ross Burton <ross@burtonini.com> wrote:
> > >
> > > The setup.py installs to arbitrary target paths, so can't use the new
> > > bdist_wheel installation method.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > > index 995fb49622..7c3af1a8be 100644
> > > --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > > +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> > > @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protoc
> > >  inherit features_check
> > >  REQUIRED_DISTRO_FEATURES = "x11 systemd"
> > >
> > > -inherit setuptools3 python3native
> > > +inherit setuptools3_legacy python3native
> > >
> > >  RDEPENDS:${PN} = "python3-pygobject python3 \
> > >                    python3-blivet gtk+3  \
> > > --
> > > 2.25.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#95847): https://lists.openembedded.org/g/openembedded-devel/message/95847
> > > Mute This Topic: https://lists.openembedded.org/mt/89610237/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

