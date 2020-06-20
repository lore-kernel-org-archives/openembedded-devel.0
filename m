Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.10947.1592660338246008163
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 06:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+iP30n5;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id e11so11877223ilr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jun 2020 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xKsugPRyX44Li3zOIGPVmeo7FzCVDbC6hVuhl37sX08=;
        b=J+iP30n54RfRgxntAsKJ+ZHOxGHcj+xtxa7uKWLb2ZsxR4U0/r/HFzQcqmxDh/SEpO
         1O9K3fqkx4Kfpvf2OS9NmAwGQzCa6xNRCKYxjnSM6osrJ/X871yzMcb5So9wiwwhtpnx
         8XCpSj2i+D1PsMJBTRPEvnBYrZhqkbg4DUtEmF+TfIvRhQgnk9WCBwkW3ZzNv7rqTKpX
         CsIOa747aC+GrfM3NCejHoQ/X9Tq9DS3hIlmruTaieMUc33Df54X3LYov0LvXjzA6qa3
         dda+lEBs5jhDr0u8YJDn0IcySC/x+RLz6Tpu/Bi+nyU3Wcz98qKRHhl3mNzK1iIhHAUo
         ns+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xKsugPRyX44Li3zOIGPVmeo7FzCVDbC6hVuhl37sX08=;
        b=b4YD1dBPQ/qEvj6jOD1bTQAGI23tZ/voLE3JYzdND8oIBX1mSuhmOOP2lUGSqZuAaQ
         vKVoNmsGcS9D2DIzZEbpiStcxxjlWyfVqg4E+JGX57W2fg8qH7HA60vj2A3AY9UMLUuT
         /jA4v0RVJlqfc2P7KFmonYiMp7/SJ0wHzOjJ0nJBfZsSwYyoe/p5sa8prvx+zSJCxxu5
         vXAJ09D8siVzUP7Qqvu5YCuGXg8ovWiBpDUseve9ke0ef/Fa3VafDCVy21F2to511sJH
         lpj/X88N6FIj9nBs5Djg1gkYEqUoGZ1xTICxuX8vedrdqLNYu4eDOfOuf+TBzrzBPEjK
         yJPA==
X-Gm-Message-State: AOAM533v8f9OpHTjObeUERK/dV/Jue4ySSeuFANI/GrkRHIpOoh4GXAI
	OvHXfAfplfHLn6UQU+pUrLMWP/EsC7dflwMALBM=
X-Google-Smtp-Source: ABdhPJw5GFguLUPfx4Ba4f2+EYhHQWlpWVnXHzcf0tfRvt48Lq6t3nAtlZUf1n0xskGTSE8MRwqsKKapyfozuOZ/Jbo=
X-Received: by 2002:a92:c852:: with SMTP id b18mr8450613ilq.224.1592660337627;
 Sat, 20 Jun 2020 06:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
 <20200619113201.2811033-10-schnitzeltony@gmail.com> <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
 <CALbNGRR3bTe4ATHS-2505iGUOsQq+H3YPqRoLc-+cHCYvNmNLg@mail.gmail.com>
 <079febc3-4665-d650-22af-03f6fac48454@gmail.com> <2162972d9efc41a3bfb7a0ca4a6b964e@XBOX03.axis.com>
In-Reply-To: <2162972d9efc41a3bfb7a0ca4a6b964e@XBOX03.axis.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 20 Jun 2020 15:38:46 +0200
Message-ID: <CALbNGRTEyj7hz7difs-_SfyFDcd3VRtjnGm=UCsF108Q4J1AyA@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 1:08 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 19 juni 2020 18:05
> > To: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / renam=
e
> > recipe
> >
> > On 6/19/20 8:55 AM, Andreas M=C3=BCller wrote:
> > > On Fri, Jun 19, 2020 at 5:48 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >> On 6/19/20 4:32 AM, Andreas M=C3=BCller wrote:
> > >>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > >>> ---
> > >>>  .../libgit2/{libgit2_1.0.0.bb =3D> libgit2_git.bb}               |=
 3
> > ++-
> > >>
> > >> I think we have been preferring to use PV via recipe names if
> > possible.
> > >> which this recipe is already doing, is there any benefit of renaming
> > it
> > >> to _git ?
> > > Renaming:
> > > * needs extra efforts to create diff while working on a recipe
> > > * might cause issues on huge diffs
> > >
> > > Shall I switch back to old scheme and send V2?
> > >
> >
> > So one easy problem you run into with _git recipes is that SRCREV gets
> > updated but PV does not, the issues with renaming recipes is as you
> > described and also git history tracking is a bit painful too, I am not
> > hard opined either way.
> >
> > Lets keep the _PV version if its a proper release SRCREV that we are
> > jumping to.
> >
> > > Andreas
>
> One reason to keep the version in the filename is because you cannot do
> versioned bbappends otherwise. I.e., it is not possible to do a
> "libgit2_1.0.%.bbappend" if the recipe is called "libgit2_git.bb".
>
> //Peter
OK - will send V2 for the two recipe-rename recipes tonight

Andreas
