Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.23018.1592110774237807125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 21:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GDJjnW9k;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 205so12819475qkg.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2020 21:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aJsQQL74uXu8gI0+xpil4OcaPdikS9+dcW4kkvvOehs=;
        b=GDJjnW9kAVN7zZ1xipvbiDeup2UYhwC3gtYUbjwFiEkfjThFr5YLLQA4XNaUfTRm4O
         Fd3XyjErpTVZ5aMz3wsTowxOFnIyAzC7L87KvcCLPiJT0j3Qe7N3CmVA98YLcJiF0fwH
         xxx/v4N/+sx9SjlHX+LkcL+n8crM2BIMq9+vC4BwaRTIBZkg8Uzfy+QVmOMd4YUk2D1B
         Lsk6cVHifHabqP0wxpC3YxnrlNP1XEvAjN0Is8txEHE3l0fpBUHnoeMkazem7/5WqJiu
         su38vOowP4pNmJOVKlZ4mYi1uuZz0sGdgy196a9YeeTyR77P3ZeycM9O/D0UrVjg/gsv
         bCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aJsQQL74uXu8gI0+xpil4OcaPdikS9+dcW4kkvvOehs=;
        b=at5Var4y+X/79N+3QMOWyaNXK8AVoD8USSK6rtQfb/cmzy0FchvCztyEckPOAEzk2r
         keopSpQkNoxGajfQfXtf5fOl7tQPwRPyYq34kYRn7hTRHMvC9rbtvnlXi4iKoBFICnIn
         5Sz3SC0Y4AaVY76VirYP3o8M44DpUckDDAMAtcDe7c7J0iLqwivq7GmIZP8DeTPOujFH
         93OwFwygWtNj72Zj0Uoa0hMalfN3QDxlxXacbCc0zdqAm7y86RCnmUys1iSYt97ZqnND
         yYa3pE+741I6NLvV4URO6sNTeJ/JHmIQj3Ka0/upvF6L6EnCll57sKGzOoZwr2S01AVc
         RDqQ==
X-Gm-Message-State: AOAM531jAIfzYm/PZL0wWzLA+gRXm6hQa1wqgr92fxn7dYo9jMImLW3R
	EZifFv6lU0zpGiHtLaU+TQ/g4AjKx3lG3nNqtwA=
X-Google-Smtp-Source: ABdhPJx+K3/xSK7PNOCG0YUR8GLQw+X3cjcUFeL4gRlH5NK2Q77k2kdJzVye1UGujkRQL7VQcPihkoFetg2bGo3OBaw=
X-Received: by 2002:a05:620a:2050:: with SMTP id d16mr10317322qka.215.1592110773261;
 Sat, 13 Jun 2020 21:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200613183645.22689-1-liu.ming50@gmail.com> <CALbNGRRd26tfWNK5wcifdoisN8Fid0j0kwRh0WZFU=6ijg3yag@mail.gmail.com>
In-Reply-To: <CALbNGRRd26tfWNK5wcifdoisN8Fid0j0kwRh0WZFU=6ijg3yag@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 13 Jun 2020 21:59:06 -0700
Message-ID: <CAMKF1sr-UVwujYmKYmDamm9pWqorQB9uD6WBwxc8dqV=nT8h0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] packagegroup-boot: drop recipe
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2020 at 2:12 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Jun 13, 2020 at 8:34 PM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <ming.liu@toradex.com>
> >
> > It's duplicated to packagegroup-core-boot in OE, let's drop it.
> NAK - it is not a duplicate - packagegroup-core-boot completely
> different recipe. And by the way this recipe does not hurt anybody.
>

agreed

> Andreas
>=20
