Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.199.1587763019415869767
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 14:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HEHO5Kgr;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 23so6880506qkf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMecQtPuLL/VlPi1kgSDRA4tbbZwu9+sXaOlNa/EYbs=;
        b=HEHO5KgreS+q+YOpdiuqGa1fQysbyYIlKJxhN2kjltUoAMG4Mnbu8rJknqF+i9aWST
         gmi4WPLM1cOOXk3uDINUGAzN2cLyzelXB7+j9Y2cziE2ziCK/LCR85NYJz2GSVPzlL3p
         wz33dOpEodFcATD1HiAYt6WG+YTCAexm45bTVuLrJ3SS3vnu2s9K7NmR7p6Kt51Zpp4e
         mKUsPnt+GnDOaYjJpByiz2qYAWzaOYO1iVjjhXo+jxdsfH8gCnkTDpO8/vD7UNLxWd6L
         Vl9XhZCmFHhn/y7A1YYCywKy49y5rpVeABTA7LqU5nt4x60+5RnrzopUPIkKV0s2LHrM
         bcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMecQtPuLL/VlPi1kgSDRA4tbbZwu9+sXaOlNa/EYbs=;
        b=mOsefLAudvELmVeFhtvPC4MImV0fjwQCAqvYse+LnOzBwdwT6Lg3mRX2cajPCcdUs/
         A45yGiodNRshrKSvCP3X3RWhrF2q1xg0lmW3rQMxAJStE5FAr303PhIcLMfbcxq4niah
         u8fMc5CqJNvLxPizM+In7puwdW3fQP53wxlGuuuZyOgsXpGl9EnM45Be9JU1C8bclPfX
         DMB0AJ97a2qRhNxJdY/Y02de/BCPGYrchgxHFyDLJLXUi8XNa1mwZeOIixfuFprcPsJp
         GMUFienOL1CRfuRFxhvRHCv4fEtB2V6dRB3ESBw3sxiAtamjOyQD82mkD2aqO2s6zzLt
         zh8Q==
X-Gm-Message-State: AGi0Pua0L/TUqNf+eBMXZbuwZU3fGmCkc7+hO6BAWDc4hYzKW18mIFC7
	DfNxEWa89QGIVGmyy7ILqovtRhoXcAbbKbhT5Ow=
X-Google-Smtp-Source: APiQypIQIzPbBsapotUVgfMYyKwCXr3KV2+8EsSzM/1d/YMHtHKmBO9yrQzzDk5RpLb+aWyQSbEMOnyJwBCT7Sq1VIw=
X-Received: by 2002:ae9:dc46:: with SMTP id q67mr11029996qkf.431.1587763018365;
 Fri, 24 Apr 2020 14:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200424063130.386675-1-alistair@alistair23.me>
In-Reply-To: <20200424063130.386675-1-alistair@alistair23.me>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 24 Apr 2020 14:16:32 -0700
Message-ID: <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] libgit2: Update to v1.0.0
To: Alistair <alistair@alistair23.me>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This update has some issues

Fails on qemux86/clang
https://errors.yoctoproject.org/Errors/Details/407382/

for glibc/musl there is another failure which is caused by this

https://errors.yoctoproject.org/Errors/Details/407386/

On Thu, Apr 23, 2020 at 11:31 PM Alistair <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb}         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb => libgit2_1.0.0.bb} (64%)
>
> diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> similarity index 64%
> rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> index 9b9c19104..fd26a0fe9 100644
> --- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
> +++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> @@ -1,12 +1,12 @@
>  SUMMARY = "the Git linkable library"
>  HOMEPAGE = "http://libgit2.github.com/"
>  LICENSE = "GPL-2.0-with-GCC-exception & MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
>
>  DEPENDS = "curl openssl zlib libssh2 libgcrypt"
>
> -SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.28"
> -SRCREV = "106a5f27586504ea371528191f0ea3aac2ad432b"
> +SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
> +SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.26.0
>
> 
