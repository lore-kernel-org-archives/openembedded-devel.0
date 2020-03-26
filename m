Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.497.1585242860723086157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NVSzoSmf;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id g4so3388180qvo.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRTtKbX0YElCAZPxiO4QjmDDyDG7Roi7ftXSyhpmnd8=;
        b=NVSzoSmf+FkqlOeCbpLeQW1GxNr57/jfTJTR0fTakCLlvUHfyo7NccptiDXmG9uJjS
         H/sIv00QsrogCn59C52mqx/1GJ8NTwzBKwZOts2E3WQkFHhYIbBbNLUFVGHZEOcuR4R2
         Z4VSRHNpq8sVa1kbfxK9vd1FMgn2G7eWrnv/mQ2R5xKKZfjjID5iCVRNYCJgbK5KvSfl
         mcNK1jVv5IILr0DvyeAXDKV6S/OkqxyAKqLAhkqrOXpjr9GsMs5bhnXDaOaG2U8KMJaY
         q+osWkRUNi2Z+lDCtEG88CzhClZOYSXgxvapQtLKxV/+XZl/DJ0gUT7pUrV+26v31wi/
         oR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRTtKbX0YElCAZPxiO4QjmDDyDG7Roi7ftXSyhpmnd8=;
        b=az7+6U1rOlcFfNtke1Xiw1MB661O1U16SsVYc70XpShUWKEunasWBP/FZMhaP3g5e4
         qKDaj1JGW++M2xcHaqCt7U2Lxh4pu69m/pxOyCWXeKugeqgyzdiYLYEwqq26cyLpFRZN
         6lI85dD0jQuTk9zCDWVYKSOgq3v94gA6Bkayzc/9SyK9pHl+f814mKcm61+x2JK36umM
         z4mjJb1Pd6r/1GLA0MUUnF3bi2FUL85LQSdwCIN9tJi6sfM2nBrEyKIgVFPJrnVIjptA
         0Gp6wkaep3HuxjnGTGvRPF7ub04vRiUhA7qUkmoSMW6U4Y+BaIP/dUzIRsauhgSHHqWd
         YcYg==
X-Gm-Message-State: ANhLgQ0BVEzs/ivu/rBQbY7LCp7Oj+OT1ubGdlS5oznMhTu9rxBB3tOk
	5N2KN4g8gT1fE6u+p4xp1nLNo9YK/3zUsSEauzY=
X-Google-Smtp-Source: ADFU+vvT7df73taAwizMKJzvxwuPBac2lWxn66cMm21I2etTREOxHo6Whi4xOvwpNxcXFAmnlW51h+/F/S450StvKhA=
X-Received: by 2002:a0c:c311:: with SMTP id f17mr9375753qvi.146.1585242859583;
 Thu, 26 Mar 2020 10:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200326000257.GF1578@denix.org> <20200326005529.c77siajyzfgxdc4a@jama>
 <20200326170721.GH1578@denix.org>
In-Reply-To: <20200326170721.GH1578@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 10:13:52 -0700
Message-ID: <CAMKF1srxY6873+cEoy+2jOQrQxjbnmq+nFxXSEFpXH5pgqM2bg@mail.gmail.com>
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
To: Denys Dmytriyenko <denis@denix.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:07 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Mar 26, 2020 at 01:55:29AM +0100, Martin Jansa wrote:
> > On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacast(char const*)'
> > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacall(QMetaObject::Call, int, void**)'
> > > | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandler::staticMetaObject'
> > > | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: undefined reference to 'vtable for QWebFullScreenVideoHandler'
> > >

Yeah I have seen this failure too on master.

> > > FWIW, it was building just fine before the update...
> >
> > If you care about qtwebkit, then please send patches for this.
>
> On the other hand - if you don't care about qtwebkit, why would you update it
> from a working version to a broken one?
>
> The issue is that with the upcoming 3.1 LTS around the corner, many of us are
> trying to finalize and stabilize our own code bases in master. I was very
> close to resolving most of the breakages for my builds just couple days ago,
> and now I got few more unexpected failures from meta-qt5...
>

meta-qt5 has already branched out dunfell before bumping QT version,
so we should be good there
 unless Martin plans to backport it into dunfell branch

> Anyway, I'll see if I can find some time to look into this breakage...
>
> --
> Denys
> 
