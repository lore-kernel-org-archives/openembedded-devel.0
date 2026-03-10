Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3A8FD4F29
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 19:18:34 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3454.1773170306245357286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 12:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YJNbnC4N;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d556c1a79eso14365407a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773170305; cv=none;
        d=google.com; s=arc-20240605;
        b=J7+mcwNuoIF+x5XQ3T43WQWu6bwtmVFnuP1zqE4Z7f411Kd5K6ja6WUZp3V3M7bvxl
         eZ0P2+T50rl147I2MxA5tLUwZurBanQPwx4lgEbcCTAiA/bbMtbhjxOHNL9GLJkKs1XZ
         afk7K3hxEXNHkBVxYT7F2cRXemdTAm9ffmfG2Rweapx4NpmC7ifHxWj3MpOMlKY9nwl2
         J7IYDMe7DO3A9cOvqMrVDHDIBHt6icmcRZQPHub3CYRuKNEnCzNwuPcVfGEFB/c4+KqS
         YCRG17bQUdxkjTDAVvsdY8obJ0lbtoVcjA4ML7Wyyb83mXJetQG5fT0JDhlDhmAalDJP
         CtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jYfF68q0uNkkd8Y6Akpxj1fI5REcIIGpfmis7N+Cuc=;
        fh=dChDDggK5Sw66IKwp41lgrt/CSuby2/r2S7UnyZfzes=;
        b=TimggtUHQNr/SxgexJkwtoiY4Vs6sY8DjRWCj1E4X4ZBXjTipnyHeyppf/f8abrLn9
         bniHeMwY0anPWN3c8Ab1yXAPO0DNkhuk2EdN1hUHjmk8SNzNe0qqyhK0rca27CBnbnS+
         v+BY+5hqtQfCHmaZc+oPvpTlt8/qCSSOTJIVXINftG38BqPFjSLD2HRQoMnhm8LNu6av
         1ZdFw3rzk9v/QlgQDXfFMp+jHqtO2vzc0460HO8Q4aGrD+ti8QwgVHW3qErLj0XXAO0x
         qKrpNJjSVdrminMYMjjdIlD0T2YOfMQb0Q5O/GCH1W6pZj4fnQdx7EVXlLPZVctRB75G
         BB7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170305; x=1773775105; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jYfF68q0uNkkd8Y6Akpxj1fI5REcIIGpfmis7N+Cuc=;
        b=YJNbnC4NJywWPtXRKRdQD0iXGi2+2qU3mu49hNAdk9rvSRIX7pBbKb+T8Cpdigc6R8
         iVroNvsCunW1I3njcRiYnIbzLbNNJZTqkvGOSTvZtc74Cx9LssFW5kMuhSx64oeFlq9G
         3uJ2TbzL5KOxgi006TLwUv3bdSZbucF6mQeenMVInPIHw+pzXGXUWfhNC8B2SRVbEN5D
         JRMUYVpQXxTBuA4J22PtceUoI5oVyD4B2qk5nzcRy04dDmKvJTho+qttByLoYBfkr8OU
         wH42SJo6lCnmfZT+nLuA+Z1YqHrmOTIFBLpLSL/kHv0AD6YgJ8lhmOFjcAV8fP7WNlWM
         31iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170305; x=1773775105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jYfF68q0uNkkd8Y6Akpxj1fI5REcIIGpfmis7N+Cuc=;
        b=X4gmjfcU7Kwyxm73NsxPhdF7jR15Ommwd+KJIg16k3UN7w6JrjN1vvmtX5+rvrGn0Z
         cE+h6hH9SbEtdzHxJLizUA8IcpBPIgC0lQgCuwoUe+2wXoNex3zq52djf/AiqPeQzvJq
         E8IyOYQIQSikHFBMvLnyxhOKb7GtqPPoFMJ/q+Hww1SkEKPKKIuG5egDM1Hs4hHFggvM
         sLeVTeZjc+iyPcj6SteOTfvPXAWJIPgu7IQeURbYTPnHKH3M6Cf3/i3MTiVhrGrWeZc+
         Uj+6tx8e1kqD+PYrpxdjHq1ZKBSktKP5oIZHpcpkatcV5JUxGfc01cpL7UY7gIOFb09D
         0/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7JyCtitNlg3Vo/3Rf3KPqUdjPlleS2P+LFpw5vOTIe/MzXlzmfgD4NsjA19mlE96GMaBaU8vdF0UP4Bofwiiw1Oc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmpGXEF0qSV+hr8uB7Au60WPSquhDUIpnVsDd5rzTokmF1EzhO
	vs6ud6rdhKnPbg4AmRszKdbQhNPz0oyp912Bmi3bsbJ15Qu607a4H92i5fOWQs0+sOcl/6wtvMU
	+/w8AW0BMcQqz/MJkZeqflk+7F18Z5oA=
X-Gm-Gg: ATEYQzyEU2KWuUf8ryDHWx4siRMHzvYzQ/w7aCRuTU93VjiGWWuSDvWkdOYwLgx2waN
	17AakhqY/eUtm+YgIATrC225mA7j2u6/oAjzXJCtZ1Jyh9/SvhgOUTn0XcNjjQ0z+0QRVP7AG7w
	6j/hEM14fRNG1GY49ULJ2ahtjcCah+FNE7S2OuQqKyOP8lP8b+WUs/YWlNzYk0BfobYpbvfj5gA
	PeMYIiv0J0wmFaU4WXhLSmsVS8lAcCKiGO0zQQfBQ6b6tc3DE9YCs+VY3ShMtaqg/nRnGtjNDNI
	xEC4Wic/
X-Received: by 2002:a05:6870:1706:b0:417:2454:278e with SMTP id
 586e51a60fabf-4177c9c1e1amr20497fac.51.1773170305264; Tue, 10 Mar 2026
 12:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com> <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
In-Reply-To: <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 11 Mar 2026 08:18:14 +1300
X-Gm-Features: AaiRm50MP1z64G6T_RjT5F1iPEz1efuboOK_6dVMu4Pb_5tLi8QXYp0yiOdNzRo
Message-ID: <CADySD0HYvcqYqhkHcXtLo-6A+HUaqo_L4S129Qu-AjPbVeB+Xw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
To: skandigraun@gmail.com
Cc: deepesh.varatharajan@windriver.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 19:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125037

On Wed, Mar 11, 2026 at 6:19=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 3/10/26 14:48, Varatharajan, Deepesh via lists.openembedded.org wrote:
> > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >
> > Add a recipe for the cxx crate, which provides a safe and efficient
> > bridge for interoperability between Rust and C++ code. It allows
> > defining the FFI boundary in a shared Rust module and generates
> > compatible bindings for both languages during the build process.
> >
> > The crate is implemented in Rust and supports zero-overhead FFI with
> > common Rust and C++ standard library types.
> >
> > More information: https://crates.io/crates/cxx
> >
> > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
> > ---
> >  meta-oe/recipes-devtools/cxx/cxx-crates.inc | 130 ++++++++++++++++++++
> >  meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb |  34 +++++
> >  2 files changed, 164 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/cxx/cxx-crates.inc
> >  create mode 100644 meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb
> >
>
> This is mostly just a thought, I don't intend this as a blocker of this
> patch. Maybe a loud thought, or a quick-discussion starter?
>
> cxx is pretty generic name, I find it hard to guess that it's a Rust
> library for FFI.
>
> Debian prefixes this (and similar packages) with librust - this one is
> called librust-cxx. Fedora calls it rust-cxx. (Though OpenSuse just
> calls it cxx - I guess there is accepted no standard)
> What if we would follow Debian or Fedora naming with such Rust
> libraries, similar to what is done with many Python and Perl recipes? I
> imagine that over time there will be more similar recipes.
>

Had similar thoughts when I read the recipe name.
Another idea is to use "cxx-crates" name for both, inc and bb files.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125035): https://lists.openembedded.org/g/openembedde=
d-devel/message/125035
> Mute This Topic: https://lists.openembedded.org/mt/118240942/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

