Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.11504.1586944191325069334
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=URh8DGxT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.67, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f67.google.com with SMTP id y17so16416360iow.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r36+cxNxfraYe4Kw7MCXoP9eQFeiZeM0yqQxehuEcrY=;
        b=URh8DGxT7AsWvd3SrL0f/i0fWVO0QL6i7ZHygN1VE/Mt21IomsvLVt1E9XO8+6vF+U
         q19qw49oRQdcanThp19OLOWZYJAKS0JMJqPCdeULKKtNaPsPHxcHrSXpVmWXPkaQOPIc
         rnHWv5BUEC2XwvJPGjHb724V2HEvS6rUuWUbPP5PAOOYTgdEq7hlbV059wIJEGoclgAN
         pkE8K0Hg21lTBhAtTkT2YSemNSZhTwXZQhUD6Sa8ojIuR9reK0ve7tgOCwKTJQYvnJeN
         g350FBosg8cd+ZApZusjgQ2LJnEwMc6dqIvG+Q/9YyDDG4PDKqbnKF8RlcQ+Qt752hgt
         z/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r36+cxNxfraYe4Kw7MCXoP9eQFeiZeM0yqQxehuEcrY=;
        b=T0PxxLbPWnzt3pq8xxZji29CEoiBnJmf4yas+hh37K0QCgvtw3xAqQ7UkT1scSNLKD
         mZox1LhxUq/F2NtOE/auW2tbB7I8+ByMUVY7ULQNPD6VH7O7tD7ursInYSvaKcsRGvt+
         lYH19fYEbFEM/MulT98mgfgrCjL8u0UofaYZl//CuwbQ8ox+zo4e3/LCSCSnaGvwzb4d
         4g6rFXs9MFgxhPI3vPmPgHSuWxrJQ/i7E1ErUXkHkB+0tbQJIe1SWErG2KD7BETw4iP5
         YPBoQkXK4s1DUjHYXot0ayEgRU2q61r2KqbLaOcaO4cQ2kyuKwgnUdyPjpU6Wq6pf5s6
         OpBw==
X-Gm-Message-State: AGi0PuZMQeuSuNoIiM/3UcZjIy7ULbBmJknNAsU6RAlsJ+mratiMJQQT
	K85U7q8UpEImWwCS+qr0vPFE4tvQCZIaedPlYOCy+RKcA4Y=
X-Google-Smtp-Source: APiQypKARnuAD7/60+CENneEk31YCGB5O+NIPsrARY0HptBNuBe2tQOtGPmVQk9pX4mINwdgoL6da5FZskBbqkGJAoE=
X-Received: by 2002:a5e:8616:: with SMTP id z22mr4996422ioj.130.1586944190714;
 Wed, 15 Apr 2020 02:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200410124135.24217-1-brgl@bgdev.pl> <20200410124135.24217-2-brgl@bgdev.pl>
 <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com> <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
 <8896403c-4f12-5d3c-5722-5b9b0a000067@embexus.com> <CAMRc=MdO=x4FCEE2MVtFBZxr0sbChjMjHwOrMAYx23dkxKCJiw@mail.gmail.com>
 <677ae603-2d39-e550-c4ee-6a2cbf41784b@embexus.com>
In-Reply-To: <677ae603-2d39-e550-c4ee-6a2cbf41784b@embexus.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 15 Apr 2020 11:49:39 +0200
Message-ID: <CAMRc=Mfnt93Fczrm96yJ_zkDx6q-x03pGFeWn4D-_Gt0p0rMjA@mail.gmail.com>
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 14 kwi 2020 o 18:28 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(a=
):
>
>
> On 14.04.20 18:19, Bartosz Golaszewski wrote:
> > wt., 14 kwi 2020 o 11:17 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=
=82(a):
> >> Hi,
> >>
> >> On 14.04.20 11:05, Bartosz Golaszewski wrote:
> >>
> >> pon., 13 kwi 2020 o 12:58 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=
=C5=82(a):
> >>
> >> basically this class generate a dm-verity hash that needs to be inject=
ed
> >> inside the initramfs...it's a bit hacky.
> >>
> >> wouldn't be signing the hash, include the verifiication public key in
> >> initramfs more portable ?
> >>
> >> Sorry, but I don't see how this is a better solution. You then have to
> >> store two things somewhere: the hash and its signature. If the
> >> fitImage is already signed - there's no reason to have a second
> >> signature for the hash: it already comes from a trusted source.
> >>
> >> This would also inflate the size of the initramfs - not only would it
> >> need to include the cryptsetup tools but also additional tools for
> >> signature verification.
> >>
> >>
> >> The hash + signature doesn't need to be stored in initramfs in this ca=
se but appended to the rootfs image.
> >>
> >> yes you would need in this case a signature verification tool inside y=
our initramfs and the corresponding public key.
> >>
> > But how is this better? I know this is how Android does dm-verity, but
> > it's not any simpler - I'd argue the actual implementation is more
> > complicated.
>
>
> In case you do OTA Update with your approach you will need to always
> update kernel+initramfs and rootfs even nothing has changed in kernel
> oder initramfs for example to make sure that the Hash inside the
> initramfs is updated!

This is negligible in terms of size and doesn't add to the
complication. I know this, because we've been doing it like this in
real-life applications.

>
>
> Another case is if your kernel+initramfs are part of the rootfs how you
> will deal with it ? it's chicken/egg problem.
>

Of course they're not. I never said that.

It boils down to a matter of taste. If you want to implement a
different approach - there's nothing stopping you from adding some
switch that would result in a different way of storing the root hash.
For now: I'm still waiting for reviews on the OE-code part.

Bart

PS Could you set up your e-mail client to properly format quoted
parts? It's hard to tell who said what and what to respond to.
