Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id EC6317D1DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 15:51:07 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id z126so5866950itd.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2019 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MB+6deygtJwY1YKSVqafKaUT+DiKZyt7hwD/MuaUQ84=;
	b=tC4Fl/YXNmkxvQbEIOy6JeIkyr+GoSzWH5NoYsQMCs9OAoFt5lMAK1SSzrxXLfc0Fd
	IRB0EYExJ5llrYe07XjSDmK3XuRsYdFl0D2vK2Tgfb9N7SXNSDcEBp+ouK7c7NgdaZmw
	igwH0RxXHtdIiKKKFgqo0lxVu1G9qM9mMFVgqDkFVcSxRu+qfjfUf3ccK4O4Fa2lcoqL
	OF6FV93fUnPrWO+nlbwC471eNNOGid6l9Z0rS1QERo8Gfc+JK4lrc7todyjvlUeWqTQz
	T/y+0EEEtDxwm0reUVmR+IsKfOrapHu9SGTJfUFDjI0GwUEfTcq25HfQoFh0cB4+pT/D
	8fzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MB+6deygtJwY1YKSVqafKaUT+DiKZyt7hwD/MuaUQ84=;
	b=liih1uE8Vcnr5VFABu3PHNqRcTQkMY3Q5jLpuZUG5Kkg/eCgQBjbYTG/pZZ/ZuKXc1
	Mcqp21XMxiPQBPAZqPP7goYKNolIxbUWOzYQYV8SSy35yT+N9q5hphqs2gxcnt9xVbpT
	l6Gstjhw6uzeOApQzE3dh1cAWaYk6YU7tZsnh+jr3/FBmpawvm4u0X3d05Q79/csNv2o
	HKcWv0IlzI4JiXZLH8s3gp5s04/Y/xpmKqcGehvChN836hnqh6QGAIbgvc1GIf9qw60V
	TMd+vkpkgR25wWovBpsy5Y5vaMf9FrffxSFJon+lJ4owzDERNXEiAqXxftrotm1/1axt
	IN7A==
X-Gm-Message-State: APjAAAWskQ6bE2z+WvKZGHxq6RejNOaklpMTZmePo8ODpkH+EpTSddmt
	Fg0wXcLF7qZdwS7gFGldsscnpdzOkyr3HtoUEpOIPYEI
X-Google-Smtp-Source: APXvYqw0+Gl5BxiYKcl7nqx+DbwWEVnEuD2x6bdNlY6dE3fo2hnwUm/CmSMr+cZ7V0KGGiK6KfA+BWrTErlimXu9WKA=
X-Received: by 2002:a24:7f90:: with SMTP id r138mr4485963itc.163.1554220268882;
	Tue, 02 Apr 2019 08:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190204145940.17783-1-bunk@stusta.de>
	<a8c5c5d2-886e-5689-2a43-b4615df3a0bf@balister.org>
	<20190204221453.GE17997@localhost>
In-Reply-To: <20190204221453.GE17997@localhost>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 2 Apr 2019 17:50:56 +0200
Message-ID: <CAB2nKc9junw1S9xreQy-QSePg5nFvDZtyjB2uwRgPM3P3KO7+Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 15:51:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

I'm planning to send patches for new stable zeromq/cppzmq (4.3.1) and czmq
(4.2.0).
I didn't saw your recipe before so I made a really short one, and I'm
wondering why you defined custom PACKAGES for czmq recipe ?

Best regards,
Vincent


Le lun. 4 f=C3=A9vr. 2019 =C3=A0 23:15, Adrian Bunk <bunk@stusta.de> a =C3=
=A9crit :

> On Mon, Feb 04, 2019 at 06:23:05PM +0100, Philip Balister wrote:
> > How are zmq bindings versioned? Just curious why this has a different
> > version to:
> >
> > http://layers.openembedded.org/layerindex/recipe/28410/
>
> These are different bindings (C versus C++) maintained separately.
>
> > Thanks,
> >
> > Philip
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

