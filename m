Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.3819.1619496238570149507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 21:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQLcioyH;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id k127so3204164qkc.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 21:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uj/9dzcIKg7DlkXgHVOq4RG9QTGhXZPVxLP1JBrIhA8=;
        b=UQLcioyHFCFvfSwYtL763LvtIjOiiVWV91Vy9zrRsXgZ3wmbQIxgBfbO7JnCHjM/PB
         nzLR+uLhJ3XY/zeQltTzj2w4TQPGzF9VUuZEagWg3+3RS7h8MsUZbyZLKDSqqMUareoI
         dgoDpLsjKy6/UxO0SU58qtrsVzt8SDx76teVo8ZTL5jJPzkDBiPLpgCx62u6GzIDL7of
         5PsgiZuEJ45SsUlLBiFyDwHDLKIyz0HKEHmnDi8x93tM1iwsWWBBycs1b3I6/CP9Q9xe
         083XKT6n9eupBz5odAoJkz/Vrtd2XEncUKHqu875Ubw85qUScN0ajnj4Vr9sK8g7ar2V
         AgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uj/9dzcIKg7DlkXgHVOq4RG9QTGhXZPVxLP1JBrIhA8=;
        b=XEwkFKEd5n+zE9zZxXvoYZdK7Kdcgb5SqBFCpLpqEjO54PvILw0mWZw2wKg3GSJVLu
         RVQWqsm2fYezhVSEsFOtey+Iq9H2glS4b+JxvSjrTwH2srPTfrW9oLae5LMvcFXxDr7R
         yVruilk08QauxXljaCDGOBlWXB+l3qrDhcK5jr8f+g4JqcoZCMIi+9ruViDjczQnw2r3
         K+vdHumoFxNOSUv9LjI3Djo3dJAs8qyKhFXEO9DMBv/KcLl2v6BA7jjZ4zgQKpnH6yHf
         IQxG32GY5cL3V52mRa2rMfRo18JY8cdetX8sHJ8HEoVSLvr+t7AVrDAFIZwVxo0cmlmy
         Ahfw==
X-Gm-Message-State: AOAM5330CDxF6+u3SgZTogVZFOButNeyhg1s27XHHE4waAzr8XaB56pv
	rtx6TPdh7vdNIYFDESOBg8Ogbk4FnClHc0gTTxA=
X-Google-Smtp-Source: ABdhPJwsjDXbFhwcKDqNjtYiWtyiOi2k6zt4vNl0IfGmxcuctIPTy7gb8JJi9QMKg4QkULZN46BN4hULI2rmSmAzYPg=
X-Received: by 2002:a37:9607:: with SMTP id y7mr21159774qkd.25.1619496237615;
 Mon, 26 Apr 2021 21:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
In-Reply-To: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 26 Apr 2021 21:03:31 -0700
Message-ID: <CAMKF1srqFHxSdOspdBTuj-i8dqTDfTUsYgErq3yT=9p7+k33+w@mail.gmail.com>
Subject: Re: [oe] nostromo fetch error on master/hardknott
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 10:14 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Hello,
>
> I just notice new fetch errors for nostromo
> <https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb>
> in meta-webservers.
>
> The hosting site is not responding. https://www.nazgul.ch/
>
> My limited search for an alt source is coming up empty.  Is anyone using
> this app?

If this site stays AWOL then I am willing to accept a patch to delete
this recipe.

>
> -armin
>
>
> 
>
