Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.34562.1591010421109441465
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sOVsVFwc;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: jonatan.p@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id b5so2814992iln.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3sPKOG+BzH1r6u7aPhoypc65bFUrUzsSScApYgEGfh4=;
        b=sOVsVFwcYuZvXqH78K9vsHxZcgBRFfy+G81ntqvATXoIruRzB+DjuhceMO7kdW3mrP
         6vyc9d7edUwSkUwjTwYo0AKfC+iIvrywSNyXstQFr/07k44hDIZaCSqJA6zaATExMSVk
         H7RuqS1O77yH6z0Q4rjQauO6v1H3oFAwHanfQqN8wWf9ZbwqB8YQ6xACnV2oL7udlSwo
         cDBPglFGhBlMm8gEEfe3fMB0iR/4QyENEB1OHtlqKnXPTjGgcodvkhxDLNVrwdhGa1uf
         DVVoMOfBXTDqv4iQ69J461QkLx9/ujsMxU6U6r24sF0hcT+MRX+flisd63hb2rzQKr9e
         SBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3sPKOG+BzH1r6u7aPhoypc65bFUrUzsSScApYgEGfh4=;
        b=GHXjS6JjldA2P0V8yv8UkCPnR0/zgslr7nnyp4uAgP2avcCxf6gTOAbIsUIwJx47EJ
         hY5Maq4UKJPdb9tgRNHJZsP4uk5/f9w60Trq0GUnP1lAK2E+6Nl/7md8BilLj2B8aSGi
         wYycJLpSo6QjXvViAWumZaPCzgaFPwPv8lwEy3Yae6rG4geEKYGcnuNB016RvqFYmD32
         NUso9gk3ZYav/3sPWG+wyB4YzKnP/tlOBMa79WjGhp0+wlCK6nwZz7J3hVyNXKLN0pha
         kpXc8HVd9tJMVnPkwnEcItkyXpVz1qTBj7FE6gGirHC23bB3lmUzc2ia9QoVXXVs56Jh
         kgLw==
X-Gm-Message-State: AOAM532LJB0Mu6X6OqAYrWrKHBbhKBeaNlTF0Ec6gNaVpx3eqtgMDWDA
	GwP5KaYpwfyRxO3YgvWsU8H+gkR8qYQKHTFB0fAXNucB
X-Google-Smtp-Source: ABdhPJwPM+wy9lSv0/RCqgm5+pgguDF3+3xY13gBjn2sJYHgfKLLpyAfI7CKNmPsNA6m/MTS641s5idrYZOnhEKSqyY=
X-Received: by 2002:a92:cd0e:: with SMTP id z14mr19620602iln.307.1591010420281;
 Mon, 01 Jun 2020 04:20:20 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9uYXRhbiBQw6Vsc3Nvbg==?= <jonatan.p@gmail.com>
Date: Mon, 1 Jun 2020 13:20:09 +0200
Message-ID: <CAKm+giO0HyHER+MkPyiN0GQou9j2Jsc6AuGTp6TyVBeHQSZ9qg@mail.gmail.com>
Subject: Rootfs conflicts when using multilib and doc-pkgs
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a Yocto 2.6 build with multilib enabled. I also have the
doc-pkgs IMAGE_FEATURE enabled. I have issues with lib32-foo-doc and
foo-doc both installing manpages into the same location in the rootfs,
which causes conflicts during do_rootfs of my image recipe.

The way I understand it, there shouldn't be any issues with having
lib32-foo-doc and foo-doc installing the same manpage, as long as the
manpages from both packages are identical. My problem is that in some
cases, the foo package is cached in sstate, but the lib32-foo package
is not, and the manpage contains a timestamp of when it was built.
This if course gives two different versions of the manpage.

When the doc-pkgs IMAGE_FEATURE is enabled,
IMAGE_INSTALL_COMPLEMENTARY is populated with "*-doc", which matches
both lib32-foo-doc and foo-doc. This happens in image.bbclass. My
current work-around for this is to set PACKAGE_EXCLUDE_COMPLEMENTARY
to "lib32-*-doc" - which filters out all lib32 versions of the
manpages. In the vast majority of cases, I suspect that the lib32
version of the docs and the "normal" version should have the same
contents, which means that keeping only one version of the manpages
would work.

Is the inclusion of both lib32-foo-doc and foo-doc intentional in
IMAGE_INSTALL_COMPLEMENTARY, or is this a mistake? If it is a mistake,
do you have any suggestions on what the correct behavior would be?
Excluding all packages with the MLPREFIX seems to work in my case, but
it seems like an inelegant approach.

Thanks,
Jonatan
