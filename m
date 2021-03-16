Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.154.1615923435141374011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=l1CLCsZ2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.53, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f53.google.com with SMTP id dx17so74189637ejb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCn9PO+UriU0TcFoktC0vrTPuZmdUkfsanYbikjKelM=;
        b=l1CLCsZ2Fd/wKyCbbT4AK7l5vrScXN5cB1cSGbaUluftPC5boboss56RmrCn4PmaX7
         3tQxgQ4nXnxLMRe0/D0tH2v4l/sOEfIwTqM4Ga4N314UmVwQ7EayXnm5broAJ5KsVlEz
         Htq3LsMh68dJJT9UpBTmsT02c7dyaT7sw6F8DeamQKKZ+CraGFykL7W6QeO7PuNgslG2
         ecCDuVvbbR8U85+VoYa3Vn5zMRz28E1LeTTMQL0l/kOqYV/udev7HfTVL5YA9KrK2+2m
         6Z7kn2v9TblOZeuqKTu5mHc9oBq+KO3nfozA+QmV12dYlwucUnZgL8H7MvipL/lUpbC/
         LrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCn9PO+UriU0TcFoktC0vrTPuZmdUkfsanYbikjKelM=;
        b=E0FqqaTSNMLTCUG+4/TSGmzglS6iMLWDohBGT76vioAoxUNHa6ho5UUzHYFbJPXiQM
         iYoX+ATSegiYL5Et+Nlwt1BDkIuiCBbuzoZbozIRIPRA3r6wdkafKxf57AD0Ohi5YMHn
         JUJKMzdt278jKVt2K7uuTa38Rbxhp/SDnUUWZwkA0aRcF6o8tb/MsYZqK67zuW7MvobD
         dnYtS6Q/79iFmq/jRPxHXZX0reMShQLjnP0RO9puNXsNIiYi2w//vv66s2EH9P2yvoJ7
         xYfBSi8+CQ04i4ZtFUVhTBAVNwgAylsId5TWXTu1tmrQfOaUDoua/k/7KVEPxdVrLlPy
         LT9Q==
X-Gm-Message-State: AOAM5316MI6iU3X/1cxMBGSb9+KjJewMYY/62T4mP9slJRU7F+KuFuHT
	6HUo3QPBJ/CdEubSLG3snyo//j+snzwrxqHT5me/Pw==
X-Google-Smtp-Source: ABdhPJycIWS1vOF4zQvqtbgzZ80pTJ5b7QuM8ElGbY+QKRVjX1VkYw7XDJAoa8U9rW2nvfBWYfLwBcqyar5nVEhKEkM=
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr12000964ejm.87.1615923433674;
 Tue, 16 Mar 2021 12:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210307152224.31148-1-brgl@bgdev.pl>
In-Reply-To: <20210307152224.31148-1-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 16 Mar 2021 20:37:02 +0100
Message-ID: <CAMRc=Mes-0FtjGgfYVNbFjmF9aiOOWJ6C6KtqVei_dJA+6FLqw@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-wpa-supplicant: new package
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 7, 2021 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Add a recipe for python3-wpa-supplicant - a package allowing to talk to
> the wpa_supplicant over dbus using a convenient python API.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Gentle ping for this one, I think it got lost on the list.

Bart
