Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.171.1617835600064607997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EOC+UKQX;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id iu14so9930886qvb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=800fzAQyh5d/rv61AbJJoh7iKQirZS4c0vxNZXp35NM=;
        b=EOC+UKQXLvIw2NMoXwCBRQgdP6QZGmrFFDRxvHtkM9s5cBS6EAvBR8MAK2hLsNaX0I
         fXJ23JmZnsA8jaWaMnTG5wLeGF8LSblXFC9XMgFJaYq911OxpyUBK3MdkY6DR4RC8AOO
         z5l5cg20vP/ihDmdlmYMjIKfQoWbD5S44xE3355j1CxZ+y1QPAvKioXiMdQ8vzeaOrTe
         HZI6r8tDshk9bnitrnSSW9jA+OvscY5RFJyXWqJnOnua6KoqkHjm+omwaHh7tfAjOeX+
         nYQp32/gq9mwzUPuUBgGESbolM7zF9ENC3quFSQL8HTXwe0wEi3lrJ//PhATc4FygaKO
         mNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=800fzAQyh5d/rv61AbJJoh7iKQirZS4c0vxNZXp35NM=;
        b=JXjwEJprmlT3LMpDH3wFqhAHzjKAtrustOA3neXZ7PpJXg+eb8N4W26V7sCXGzpDAA
         O4jpTZLfmPS73udQgOkhJ94oYA9KKJnWfTLXqnSQMccNaFc3WcHFDQVUrL9/hGd1Bg0Z
         yhx+oJDcL3ZIUCkkGM0Qgi0IciUoF3YlAh7hAV1NYoEoy0J0AToGXNq5TABLOwn9Z3S7
         9qHzo89MapfREnS/Y7+WM6xYS3HptmN4Dzy0UndaYH6k6vhdJgPC03I2lSKgCpY5JJk+
         qBVahA4SAbYBaL+PGsQRSZwtp7Fk3FSu9V3OKxFazXJ2BZK8jSaJSxfGJ7a6mHbFCiTF
         0auw==
X-Gm-Message-State: AOAM533FcrvpytlV3HTH1HBd3u1VXsxq9+VCivwE+wj5xz6ofV2VN1TD
	j6vXC42e6aqwW9pAEKlIczVpeo0JjfhmwIwBbFM=
X-Google-Smtp-Source: ABdhPJy4kU/6s3SKBnZ9FciIAKG70QBylm955TT7wDDaakXVXLfEYbc+cbFj3HZZ57YXF47xUDbkDGAkIPCrJxBwzwI=
X-Received: by 2002:ad4:4f05:: with SMTP id fb5mr3344633qvb.59.1617835599207;
 Wed, 07 Apr 2021 15:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
 <20210407221829.606871-2-schnitzeltony@gmail.com> <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
In-Reply-To: <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 8 Apr 2021 00:46:26 +0200
Message-ID: <CALbNGRSTsAjv017jex=h0T8iZPWwHiAQ6j+h1LHyO4k+Z4SkNQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager-openvpn: Fix packageing
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 8, 2021 at 12:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> >
> > Recent upgrade introduced:
> > | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: network=
manager-openvpn: Files/directories were installed but not shipped in any pa=
ckage:
> > |  /usr/share/metainfo
> > |  /usr/share/metainfo/network-manager-openvpn.metainfo.xml
> >
>
> I wonder why my world build missed this. Is there any setting you are
> use where this is triggered.
I wondered either :) My guess was: I am not on the very very latest
master of oe-core - maybe ${datadir}/metainfo was added to
bitbake.conf meanwhile

So before checking I decided to send this just in case openvpn-1.8.14
becomes a candidate on elder branches: it is prepared to merge back.

Andreas
