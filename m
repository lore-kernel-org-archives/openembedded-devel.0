Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3345.1614116258343292449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 13:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VhqHg2Xp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id t11so36690398ejx.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TyI5fyPUKXkkIAcXmTgDM3DaYt99SdPZYi79JQtH2KU=;
        b=VhqHg2XpKZnz4KVUA7i76mH8VVkfJ4u+9+9nQsj5v5AW5eWFoNuF0sgWwf2KGEzSYv
         nodPU5uGyul9NnlZ0ksW+TwQLIIVxKxias5qkKVJ7St+vR4BrY46fgnKPo8UHl1t307W
         HCiqOq+LTYKVf6vNyEaz3qB5N7iHqhG1FLMeUXzWuIiByC9qe/vyOIVLaKshcqEDe0nm
         OEMKISrT7AhdczkdtX0PtOJpt6NHgcnrLzm9/GYnr5ou+oGl9wOTcPyU2pena5UJ3x6N
         NLFN47ztdShm6Z6/b38ec7JOrrng1IbSrSv+sbmd4nFTLcEKGqBLDzM/mksANL5vSpJ+
         aDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TyI5fyPUKXkkIAcXmTgDM3DaYt99SdPZYi79JQtH2KU=;
        b=dVDNfioVn9wnhNhbR2HeO9ccBBwiLdzmjMdMJnzhuxhA4JWU1wkQhvCPYZH6Ecn23+
         TZmcfgEqq+nixcoOJB43Ljf3+cCSg7vm5Zx/hy7Kw1iEEC98DLI09tl+LPvStf9txoUc
         L80TiXceg68DzH9hH+Lm+hkgTIj8ZA76skw9fvSQ6RY/urscbzgbOsiecBavJK+49FtJ
         Pt7BQho2U53N8A115N0qELVq+irXwdgoGkN8fK7tEa/k0eZRQ54cbtlZwLEJuJQ9YrLy
         pLU3waEDPy0lw8uDvRf5Uz5OpXjkd329+ZmVt8e1LAqg6imz2/1cpy5YJghgzrw1n9QN
         EpPg==
X-Gm-Message-State: AOAM532c9KrgAviOfC1UN1/WoYQk9/yJZLW1ItJRoRMb62lS7x73wN5e
	+hxBEHKdELxAw4hZjSsVzU4yVDF8KBlpuAi7etY=
X-Google-Smtp-Source: ABdhPJz+iUncPWmgD95aY43sl9qQvHuVx2KRAb/GnnJYHaT1b2K2yrOwunB87DZIK+AokGtUT9edW4sUbz++JpnCotA=
X-Received: by 2002:a17:906:c0d7:: with SMTP id bn23mr27851604ejb.94.1614116252878;
 Tue, 23 Feb 2021 13:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20210223162705.2595483-1-andrei@gherzan.com> <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com> <20210223173002.aydz4xm65ylvgy4k@jama>
 <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com> <4deb9ec4-605e-431f-95f7-1b6f9e948635@www.fastmail.com>
In-Reply-To: <4deb9ec4-605e-431f-95f7-1b6f9e948635@www.fastmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2021 22:37:21 +0100
Message-ID: <CA+chaQch78dk=nF1Rj0znxRJ81a=cXbZpp-X_1RjZPwB1UEjOw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e10be905bc07b933"

--000000000000e10be905bc07b933
Content-Type: text/plain; charset="UTF-8"

OK, thanks for looking into that, I was assuming that native nsinstall is
provided by nss-native dependency we have and wasn't aware that it's built
for host as part of target build as well.

+1

On Tue, Feb 23, 2021 at 10:31 PM Andrei Gherzan <andrei@gherzan.com> wrote:

> On Tue, 23 Feb 2021, at 17:47, Andrei Gherzan wrote:
> > On Tue, 23 Feb 2021, at 17:30, Martin Jansa wrote:
> > > On Tue, Feb 23, 2021 at 05:19:16PM +0000, Andrei Gherzan wrote:
> > > > On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:
> > > > > On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <
> martin.jansa@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > > > > > > From: Khem Raj <raj.khem@gmail.com>
> > > > > > >
> > > > > > > We are seeing warnigs with gcc-10 even on target builds e.g.
> > > > > >
> > > > > > Do you use gcc-10 in dunfell builds?
> > > > > >
> > > > > > dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> > > > > > backports or the warning is reproducible also with gcc-9, but
> I'm not
> > > > > > seeing nss failures in my dunfell builds.
> > > > >
> > > > > I think its the native one he is running into issues. Perhaps he
> has
> > > > > newer build host OS which has gcc 10
> > > >
> > > > That is indeed the case. I'm running 10.2.0 on my host as of now.
> > >
> > > _on your host_, but why is it needed for target builds which should use
> > > gcc-cross-* 9.3.0?
> >
> > Good point. Let me take a deeper look into it and come back to you.
>
> I have taken a look into this and I think the conclusion is that your
> builds are not running on hosts with gcc-10+. The target build compiles a
> native tool: check nss/coreconf/nsinstall. This is why, as part of the
> recipe, we are passing the NATIVE_CC (as BUILD_CC) to get this pointing to
> the host's gcc. The Makefile in the path above uses it for compiling
> nsinstall.
>
> ```
> ifdef NATIVE_CC
> CC=$(NATIVE_CC)
> endif
> ```
>
> So this patch remains relevant for builds where this patch is not applied
> (for example dunfell) and on which the host provides gcc 10+.
>
> --
> Andrei
>

--000000000000e10be905bc07b933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks for looking into that, I was assuming that nati=
ve nsinstall is provided by nss-native dependency we have and wasn&#39;t aw=
are that it&#39;s built for host as part of target build as well.<div><br><=
/div><div>+1<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Feb 23, 2021 at 10:31 PM Andrei Gherzan &lt;<=
a href=3D"mailto:andrei@gherzan.com">andrei@gherzan.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 23 Feb 2021,=
 at 17:47, Andrei Gherzan wrote:<br>
&gt; On Tue, 23 Feb 2021, at 17:30, Martin Jansa wrote:<br>
&gt; &gt; On Tue, Feb 23, 2021 at 05:19:16PM +0000, Andrei Gherzan wrote:<b=
r>
&gt; &gt; &gt; On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa &lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei G=
herzan wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; We are seeing warnigs with gcc-10 even on tar=
get builds e.g.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Do you use gcc-10 in dunfell builds?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; dunfell has 9.3.0 gcc, so either you&#39;re using =
gcc-10 through some<br>
&gt; &gt; &gt; &gt; &gt; backports or the warning is reproducible also with=
 gcc-9, but I&#39;m not<br>
&gt; &gt; &gt; &gt; &gt; seeing nss failures in my dunfell builds.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I think its the native one he is running into issues. P=
erhaps he has<br>
&gt; &gt; &gt; &gt; newer build host OS which has gcc 10<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; That is indeed the case. I&#39;m running 10.2.0 on my host a=
s of now.<br>
&gt; &gt; <br>
&gt; &gt; _on your host_, but why is it needed for target builds which shou=
ld use<br>
&gt; &gt; gcc-cross-* 9.3.0?<br>
&gt; <br>
&gt; Good point. Let me take a deeper look into it and come back to you.<br=
>
<br>
I have taken a look into this and I think the conclusion is that your build=
s are not running on hosts with gcc-10+. The target build compiles a native=
 tool: check nss/coreconf/nsinstall. This is why, as part of the recipe, we=
 are passing the NATIVE_CC (as BUILD_CC) to get this pointing to the host&#=
39;s gcc. The Makefile in the path above uses it for compiling nsinstall.<b=
r>
<br>
```<br>
ifdef NATIVE_CC<br>
CC=3D$(NATIVE_CC)<br>
endif<br>
```<br>
<br>
So this patch remains relevant for builds where this patch is not applied (=
for example dunfell) and on which the host provides gcc 10+. <br>
<br>
--<br>
Andrei<br>
</blockquote></div>

--000000000000e10be905bc07b933--
