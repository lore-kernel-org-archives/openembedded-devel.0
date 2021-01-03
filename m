Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.24841.1609680380349853145
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 05:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qBfJfqqH;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id x12so12985839plr.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4mshgXbOUc0mAmbYlfYk6t6HelKyOmL8YfdaXNcQ1rY=;
        b=qBfJfqqHHZIAODqozrFjA7jElB0+GDeMdIDgLerfiB7wBd4gay17GX00yAtP3ox3kY
         CUBgrM7P3JCZWOuxUPPc6AAq/1ZUX6n8gdtokMpKZ0ml1QhrRVjiMo07trHk9cIRGeYw
         Yp0UPHVGK8b1Axr5W0ZayLYvR7kkjLg9tIJeeN3bIKOa9s2hC7sx2VkRYj/ExoIhRJDM
         opSas+AMwpQmgLnMYoOG4SMV27bcX/q84slfePQumQI1Wj8l001qhMO8UcUP1e7ycIII
         qx45FCXLmckBfrFrnRt3FGOibaHtP6LNytriIUAYRpS1FXId0ZZX5KjBRyHlkaOVoyhc
         78UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=4mshgXbOUc0mAmbYlfYk6t6HelKyOmL8YfdaXNcQ1rY=;
        b=EeesJPJcT4wUdVkl6q7ghtBJFhXzMqIHs6Hyy98ISUUeT2so5MkPOo8gtOtcikRe5h
         fH2V7b+J6G2M1fLRMHRZdsv34+PrjzRLyOBiptyEI3faUC5t7IeRc7PqwiSTX6vhGpQF
         PS0EhkrKbJOMXC6wjjCNZOcJ8ivEzY7qhY5acXi4wX0g2CuPv4euxtr296m+sCXyFav5
         YPz4cikdgyghHApfQZwdbPeO38z4OeVmHVsHZzPQEUm8UPl024nFlFFsz7I8/xL14Vyv
         /bStmMyNhDy+DRJ8yV54k2RrcG0wE0ZQ9dojqGg49BC+5sTB2SwWjnN4kHn8QgIQzXRd
         eBSQ==
X-Gm-Message-State: AOAM530ytETcjq08Zenr50pFLv7lGyDMpg5A6N6j+dLO4fRY6jJU1RRL
	I5Le5y77dwMlG+Jqe1Bpt0D/E5TaDu/E9O09/q3cpE/9fEM=
X-Google-Smtp-Source: ABdhPJxYr30uR9n8Rx9vy45wqdMQCCQrTj0vXbFEZEh4nV363xU+mgxHyDBdstZgSuCr56tPusCsXbDv0Hjcu3AJcsc=
X-Received: by 2002:a17:90a:a2a:: with SMTP id o39mr25284727pjo.161.1609680379704;
 Sun, 03 Jan 2021 05:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 3 Jan 2021 14:26:08 +0100
Message-ID: <CALbNGRSwUQJ6Um_D5rBxztbu0nuwpQOGeZAG5+H6s78k8h-Qjw@mail.gmail.com>
Subject: Re: [PATCH 00/16] xfce pre 4.16 batch
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 3, 2021 at 2:26 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Non xfce core upgrades tested befor upgrading to 4.16
>
> Andreas M=C3=BCller (16):
>   xfce4-panel-profiles: upgrade 1.0.10 -> 1.0.12
>   xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
>   mousepad: upgrade 0.4.2 -> 0.5.2
>   xfce4-screenshooter: upgrade 1.9.7 -> 1.9.8
>   xfce4-taskmanager: upgrade 1.2.3 -> 1.4.0
>   xfce4-calculator-plugin: upgrade 0.7.0 -> 0.7.1
>   /xfce4-cpugraph-plugin: upgrade 1.1.0 -> 1.2.0
>   xfce4-datetime-plugin: upgrade 0.8.0 -> 0.8.1
>   xfce4-diskperf-plugin: upgrade 2.6.2 -> 2.6.3
>   xfce4-fsguard-plugin: upgrade 1.1.1 -> 1.1.2
>   xfce4-smartbookmark-plugin: upgrade 0.5.1 -> 0.5.2
>   xfce4-systemload-plugin: upgrade 1.2.3 -> 1.2.4
>   xfce4-verve-plugin: upgrade 2.0.0 -> 2.0.1
>   xfce4-wavelan-plugin: upgrade 0.6.1 -> 0.6.2
>   xfce4-whiskermenu-plugin: upgrade 2.4.6 -> 2.5.1
>   xfce4-xkb-plugin: upgrade 0.8.1 -> 0.8.2

Will send V2 with md5 checksums removed soon

Andreas
