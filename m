Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.4556.1632260333385574332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 14:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/7v4C2r;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id me1so535247pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogUB5j3EPyBWReOyv8ON1OMG1sFdWXvf8bHoA9trZqY=;
        b=m/7v4C2rGjAJdT2xY/3RkKQo/SGm9g0PkUOiBoX6l9tVbgchx1JdIaUBbUQA3aDO0e
         30syed7GpxJ5vfgXHa7q26oxT4GZ9LJcDEqJuN/HD1OkVT1k9KfjIkSdRcJ8DQ0O7hdS
         nhOTtpwqUEo4bhS8xeLDEuv5R9ZUzHqCYTyVTtLLy97YOrY8WnZX+i1hn/wfrBC22mw/
         jJMfsqpBsWg0ukCcmYCR5a3WYlFnjF+UwcSAsQiDHAK9c8TmMHu4/PELvYsL3NYpClMq
         5elMdHjPItxht/KftalTdyZsam0D8csRT06G9UJO5Y0J9kyMRe6/FE+2EppdCYXnnFB8
         A+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogUB5j3EPyBWReOyv8ON1OMG1sFdWXvf8bHoA9trZqY=;
        b=jbwZjSqy73iWCfWcz71lI/abK5sY2pMHQwGFQM9c0Dwog8ACcUKpd2mhmRA2jEFow1
         sb9ZyTwb+Bv/EjmjNqOOL9M1YjwHhdR/THgCU6g3DKQ1EE2IqsQIVn5ArINtCHnPZxaN
         eG1l90CsekxQhtNrtrA2ytmXVvhvcQj7St1pRuS5qAlvnBt+TSoCKdIKbaMU7gRcQMtt
         yghWxA3YbxjZF2pH3UxNM8nqURqp8ILKZU46li85Qo4STGTY8nroSFmAwgbACS7nGZxi
         ptuD7Oo9vTacllAcJqPFAZRHAVLQ5Im6OkQS05APGSHjPbudbCkuBJMhbpn69FBtBzke
         8I8A==
X-Gm-Message-State: AOAM530lIdUC0+0/XYa7ENl5r8Qp5UkCSTKPFeXrQ5z/Zf5ui1Iiu+U1
	2pLuMNrSGj0mjCdryF8z1ybbZ30XN8+g7p8gWD0=
X-Google-Smtp-Source: ABdhPJzFy+W6ZGDqHG9kbLmXSTVks3yp+/JwC3pyfPfWN6HmI1pBGa62CYqkGuBPXwDoFqyNZ/Ssd/whMYH2Jr5BHtU=
X-Received: by 2002:a17:902:d2c8:b0:13a:54b2:81c9 with SMTP id
 n8-20020a170902d2c800b0013a54b281c9mr28901899plc.21.1632260332709; Tue, 21
 Sep 2021 14:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210920200607.929739-1-geoffhp@gmail.com> <YUl1tUiZI31wm/vc@ltleri2>
In-Reply-To: <YUl1tUiZI31wm/vc@ltleri2>
From: "Geoff Parker" <geoffhp@gmail.com>
Date: Tue, 21 Sep 2021 14:38:41 -0700
Message-ID: <CAHNuFG+ytV6Wtu0GokWQcufDPpqomsKH_zVtYR-0aMTmpgKJAw@mail.gmail.com>
Subject: Re: [oe] [meta=java][PATCH] layer.conf: Mark as compatible with honister
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

I compared master-next with my branch and they look equivalent, less
one libc-musl string that your branch caught that I missed.  I haven't
had a chance to do a test build with meta-next yet, but perhaps
tonight.

Best Regards,
-Geoff

On Mon, Sep 20, 2021 at 11:03 PM Richard Leitner - SKIDATA
<Richard.Leitner@skidata.com> wrote:
>
> Hi Geoff,
>
> On Mon, Sep 20, 2021 at 01:06:07PM -0700, Geoff Parker via lists.openembedded.org wrote:
> > From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Thanks for the patch, but we have the same already in master-next! I'll
> try to finish the tests and merge master-next into master today.
>
> regards;rl
>
> > Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> > ---
> >  conf/layer.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index 7ef116d..7791178 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "meta-java"
> >  BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-java = "10"
> > -LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott"
> > +LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott honister"
> >  LAYERDEPENDS_meta-java += "openembedded-layer"
> >
> >  LICENSE_PATH += "${LAYERDIR}/licenses"
> > --
> > 2.30.2
> >
>
> >
> > 
> >
