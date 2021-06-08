Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.88.1623174130121090066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 10:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vb7jk+SD;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so14527878pjs.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zf8lZAsrhr7TzDF31MWd5vfhImTuJ/j/ImS2M0klX0s=;
        b=Vb7jk+SDtVkRblBnhStVoFkLcX5gtyZCl14N7b4JqLR4NceYjxc+U2cw0Gwk3WfEra
         RgOEaZBhD61OfupCRC+vvGQf7MxXGZB8KoOsUZF3Wtp4PvDb6AWQLd6QGHCsIA1+uv95
         4P4+/FvWcJH8MRLqmpfS4xjj3lAis8miuSH9qaV0c7uamvnlnyk+8KoSMSf9gqtnavBi
         vt8wjLPJ2KlPaMBPVTFxpil9A6BqR7Di8sSFBKB0GsWgR3+StNJYc7AyZ3U8+M0wNuYy
         NGlHWlOHOlHcAj/g2Pov6TY46i7yA7oPRFfyAHDgWuRDqji7eVJGy9W4GTxBBMaf+bfB
         xNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zf8lZAsrhr7TzDF31MWd5vfhImTuJ/j/ImS2M0klX0s=;
        b=syhr/k3M903anKFenj+HSbDQVSZcOgrad6nPahxIMK0z2qGTLK+o1HNTSWDgtYGMYD
         t6j9+2lljLJmT7WCBE9gsb5Nar7IDHbr4lvc101vHk1GJXowIEx1mQAkU58GieXB3U2E
         V/BLF8fg75OoJcwo3Gik7ECY9TgCFJIZLr/Mai8RyRUiY/8n34gCRBSq7qHhBC2BTMgv
         lEg1EHcT9gO5KpN6u6wd/n77VkG/+DRt93X55PiZuhlFXd4N9tHVh0P0SR+rw2rnOTBy
         lnjIuU7ciIWcKRAggUh7BPnXZTfSvESY2kosYwt+B2nUGZwXJ09KDuxk6o3i0lkD7/LC
         1+fw==
X-Gm-Message-State: AOAM5316Jl9Vebk4DS8nNuA5tK1d6NB8wc7/NjkHzgVpVIuSy4KRohne
	9IltKhC827In0fooC2pU1x4BvQvhGcIojSFpQiw=
X-Google-Smtp-Source: ABdhPJy8cjN/dlWHFzolpqsh2lP/8TKGfgJkwmTPMq7o0ON3HdFOtB1uY0p181wEB7DuUj28MCv9XisP7S4Q5XJthBQ=
X-Received: by 2002:a17:902:ed0c:b029:104:8397:3376 with SMTP id
 b12-20020a170902ed0cb029010483973376mr797678pld.60.1623174129465; Tue, 08 Jun
 2021 10:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210608062212.2887426-1-schnitzeltony@gmail.com>
 <20210608062212.2887426-4-schnitzeltony@gmail.com> <CAMKF1srWuzL8WW31Nz0cj5JO=EGj106+8xkeh+dZVkTW6NiguA@mail.gmail.com>
In-Reply-To: <CAMKF1srWuzL8WW31Nz0cj5JO=EGj106+8xkeh+dZVkTW6NiguA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 8 Jun 2021 19:41:56 +0200
Message-ID: <CALbNGRREy5qbGSHC_m95j9b9jUkYFpnmutjtj10E5yktB1CFRQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] gthumb: initial add 3.10.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 7:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this errors
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1314

If I interpret error correctly, gthumb needs same required features as colord.

Will send a follow up in next series

Andreas
