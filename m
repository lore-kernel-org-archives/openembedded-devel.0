Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.74034.1597781336258461234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 13:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GzOE7Hoo;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: marek.belisko@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a14so16270253edx.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 13:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=4yZuM5zW+g7grcZyUuKbzgotJT5CQo3hVs9qt8+KlqA=;
        b=GzOE7HooG5qblFDa/xoF7klbfSUhgTQyiPzKUzor01YNweefSiwioJn8UA9yOcf3AP
         Vxh7fVy87P2dhGpeYO5Z0Mm/kSOzhPKvE6xMtqOvKJ3dtpiNfM/fx+tYsULqCp6mzcjO
         5aV5gc+q+kqt3M8cVHW67bAecmpj10wHbx9vPHC/4rSJImWyl2nhoILO8gUblCyDo0Qp
         toc2M1krJ0nQ35Dsw2xYqNm0FZtZbzodseHEedmMj51CQujdfpkGfFL29NfcHHlxd+XI
         D8L/SremaNVWdTGOUpNIQXmWTEddl0m4E6uPuKZZwFUNa8VfMmEUJObVPSFOOcQHj7Pq
         9OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4yZuM5zW+g7grcZyUuKbzgotJT5CQo3hVs9qt8+KlqA=;
        b=gFDJDIyUVkzQiIB8F6nycHyu/H8hqXYyCqaXgDx/H3x7BhPj3RyqiURG9Mk1bifGmC
         Tfy4hK4RezWRv/89mcFPdX9S05YqrKEF5fA3kYgCJUc+TKHdc4JTXoKvWD9DM19bvVC4
         5Pq4LxlSsk+MWDAnfecJXSXojUOXYzHDwnkZmVbcw3+fWfYYXiP6+NIlzIDq54++Oprd
         ObX/S0XkyeybIWm6NyKSNOdKWj570TT0p27Botzy5nFNW6L47l2vf57VkI5/2SrIDd7U
         mE4Meh1sSP/zl5Y4hMnq66GQeY9LIaNTb6ncKiDqbX7nvRpE/DDtq9rIl4y3clBAkC9V
         rJ7A==
X-Gm-Message-State: AOAM533zlmrjR3XABX2wZ3ALqq5uJoX91lxmjZzrIFPhAbBZZn2jiPDd
	XT0XMgMn3LVp1adV4nujkRtH5/wEbBG+CFg7iUi/zDJhytQ=
X-Google-Smtp-Source: ABdhPJy6Eaf0T/jMFKNt1er/vmc1mdEk79klP/vkiuJ0SIxrv3lmoUiAwpHIC/b8FycfvuNMlboG9EtoYNv614OhmzI=
X-Received: by 2002:aa7:d983:: with SMTP id u3mr22271324eds.366.1597781334333;
 Tue, 18 Aug 2020 13:08:54 -0700 (PDT)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Tue, 18 Aug 2020 22:08:43 +0200
Message-ID: <CAAfyv36viDXoJC6VQ2asswo=TaDU=0zJftXGSxbhkfDDk13KYg@mail.gmail.com>
Subject: libgpiod using STAGING_KERNEL_DIR
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using poky warrion and added meta-openembedded to have libgpiod
recipe. I'm using a custom 5.6 kernel and I would like to update
libgpiod to version 1.5.1 but this version needs kernel headers >= 5.g
(but kernel headers on warrior are 4.x). My idea was to somehow pass
STAGING_KERNEL_DIR to CFLAGS but this seems it's not the way to go. As
I understand from the kernel-header recipe I cannot simply bump
kernel-headers because libc depends on it also. Any ideas how to
achieve this? Thanks.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
