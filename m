Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.1894.1615912703188951483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 09:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vhWvWPeH;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id cx5so9815427qvb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6Wz/GDTcbNlKDt/M5IdgC8q3j3yW3j8Mpt6p+mPOUc=;
        b=vhWvWPeHvhuh2W/0jA70BsblyLWQa6/PkzBgyGC9ozmVI951UmkA7njqaphkjH4wxY
         ApzpRhvQ2zMBaVG7W8XBuYT1tJmi/hO+kYStBYD0uOtoH06sA6j7hGhGCQ/Nf4dCb+eP
         +j1xcz7HWitqLubvYW17p5tS7nnj8OiXtYXwTUFA+CWCSl9+BGPntSZ2IPhSxnseRySr
         /DKkEIs4xhvoqNY1Pc1Pp4qWcwgrbHlsYKawjKEcZH3BTf8r478rzELs43+AhGpGpZnu
         oAZc6aqihXOZq1bXUumefIliPZmj5nFaipy7+SpAt5txn+Em/6/sqxCC8lYQPLMPfxwZ
         woMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6Wz/GDTcbNlKDt/M5IdgC8q3j3yW3j8Mpt6p+mPOUc=;
        b=qM+t7dy56DE1dxdeU+EV0pbKwiO9fVyJmFCxv56zfe78JbY7PEx9am26Dq6GCCtYsn
         GmqjW2jInfIvnMtctMmN9mx0n1EyzVocnpV83zru43MdDvrg8JK3x8Zu8QzHXNgaJ6Ls
         5DzaUEdMn1f4pJjkLHUzmeU7X5Abb6t3Pft8oSgWKzSEM9Y+dDiuelx7dgKyU7cmEFaW
         m0J88syg1Jg9ByI2TqKhP3dSQsjSq4NGOn/53VJySgIe+X8bP4L5hNtZD/GrdEF57AR2
         3mkSFlakXhB8ioM2jspiUcOwWD3aiXTKtT44ICAoPYa6gzkp0iqhDxqAWwOoKF9vzJVG
         PqdQ==
X-Gm-Message-State: AOAM531bqMXsmJ2zBHBN95W2IiVyAh+OkFuRQW7bYfc3wVBlRz6C1F2O
	Rj32OlKuZxPAS2lOBjr8ihRha9TbV/Tky/C8RTc=
X-Google-Smtp-Source: ABdhPJwhvJbYHHcSI/QdMslNw2aLGO7WXdMA4xEvflrinVRJhfjtQAxcRphpWQ7RStYmzdBmPzYrfe8Eu8LDdDVwqng=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr517355qvb.55.1615912702016;
 Tue, 16 Mar 2021 09:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210315011408.6604-1-praneeth@ti.com> <d3134ab9-7a6f-584d-0e92-4ab1bccaba36@gmail.com>
In-Reply-To: <d3134ab9-7a6f-584d-0e92-4ab1bccaba36@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Mar 2021 09:37:55 -0700
Message-ID: <CAMKF1srYtLnpvQxkHoX--kFiyOL32jR4RLnjH2U4zhSXckzWrg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
To: akuster808 <akuster808@gmail.com>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, Changqing Li <changqing.li@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seems fine.

On Tue, Mar 16, 2021 at 8:41 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/14/21 6:14 PM, praneeth via lists.openembedded.org wrote:
>
> ah, the subject messed with my filters. I need to fix that
>
> Khem,
>
> I am going to fast track this to dunfell.
>
> -armin
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > [cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
> > Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> > ---
> >  .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > index 9f89bac22..3f82734ac 100644
> > --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
> > @@ -7,7 +7,7 @@ SECTION = "devel"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >  S = "${WORKDIR}/git"
> >
> > -SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
> > +SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
> >             file://0001-do-not-strip-pdata_tools-at-do_install.patch \
> >             file://use-sh-on-path.patch \
> >  "
> >
> > 
> >
>
