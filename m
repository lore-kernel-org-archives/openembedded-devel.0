Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.13233.1586357774467038769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 07:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ho8mogLq;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id o15so1198678qvl.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=178FBOcM/p9wpMtF1Fsvsp95/K59f07PbPe6rOTGsUQ=;
        b=Ho8mogLqnqoqDT0WXLhjXIBXjkaYW6oDXfsmR0evkPXRr00tMhPggIyz2PIaTt4Ytg
         Rj50R+WUYFQAtj00Mxrc9ia7iXi/OH3uY/atV1uIWaKpjoO2UBxPhUxMHLosBS87PcqN
         0Bp9Xn6hpCe5l7f3qWOYv+AKpfpoMtqBYOpJ0/Fu5uf3Zq8OepjVmTpMCZ9n3Usz7Ukh
         imTJ3gXz/rBZWXWPYALBd14f7Mj62QnVDQLLyRcbEm4RSdA7vaKx1qRtoJjvm6PrTbU/
         npKyKlmSskSH0Pougtz8+3ZlKAU4Zz+4Yp5HLgmRzO5pLEaZFPVqKWt75FIrDBF8rnqh
         Elnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=178FBOcM/p9wpMtF1Fsvsp95/K59f07PbPe6rOTGsUQ=;
        b=N6s62iJKGlTIew+YQu8VtLt26IiHygGHJrprT3WVsK6CTNguA+q5xC7EkFsvdzZ/HK
         IecMz04sXw3JVLM0xyOXYS04cLbqEXippuPxO1a27a/fDann9GCgg4FN1pmZUO63RaIE
         y2ycNOAzZTtljAgixBMbvqq7hclZ0AndPRc2hSiMAXAcvwwb4QO1zF89WyBs2iPtx+11
         gcHm399Br7E1lWvdCAQjOSVPCvIv2AYG5jhbwgwVz8qjurIZELSzBC2598omkHVnQl+u
         ytSnGpLrlh/qDOACkfXisEep/z/7g1EZkmZLndQA7nszPHrM9PDnyI4CVxHAeaOeqMzz
         xkXA==
X-Gm-Message-State: AGi0PuYoKJwCQuhsD6I9KSs821gvE4JG9rNkL2R2NVBw/K1bJOLvKtAj
	qjbqNOMbvgqlIbWNIVvHbVtu6T75nLy70BtQEFI=
X-Google-Smtp-Source: APiQypKUJ+nyKMhNYB/EF76b1Akt2+8EfTVVjdz8VVZrt3cLhkdEo+YoFMk4C025A2BdCgid0BVXZNbfOh/5QhNf4pg=
X-Received: by 2002:a0c:9104:: with SMTP id q4mr7924770qvq.61.1586357770406;
 Wed, 08 Apr 2020 07:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com> <1586336650-19326-5-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1586336650-19326-5-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 07:55:44 -0700
Message-ID: <CAMKF1soEXbAQ+Hewpy8Phi00w=8q-WkSuKoJtkZN+XRqNss7nA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20190808 -> 1.3-20200327
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails on arm
http://errors.yoctoproject.org/Errors/Details/401495/

On Tue, Apr 7, 2020 at 6:57 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} (86%)
>
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
> similarity index 86%
> rename from meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
> rename to meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
> index a1acfcd00..5ac9b8902 100644
> --- a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
> +++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>
>  SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
>            "
> -SRC_URI[md5sum] = "f48b597251a26c522002736652e0300c"
> -SRC_URI[sha256sum] = "886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2"
> +SRC_URI[md5sum] = "f7a3c240af305b5282af590541e8f4b7"
> +SRC_URI[sha256sum] = "466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99"
>
>  # hardcoded here for use in dialog-static recipe
>  S = "${WORKDIR}/dialog-${PV}"
> --
> 2.17.1
>
>
>
> 
