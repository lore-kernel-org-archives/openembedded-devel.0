Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB15CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 15:46:44 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.18356.1755618397422492217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 08:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I7NpA+7G;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e94eec0de32so489210276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755618396; x=1756223196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3K+UxxYwPhvLucxtEVx52KzKKdttDxc8qe0jETWvm0=;
        b=I7NpA+7G3ZKuG7oPtqmJMIxUTPYFXnb7/aSiMRI184aZ4lwseoE84gXRBcFEOa21e8
         glctZhVXl9TeOg89J1p5oNiYUg33FeCPzb9IO9p3KztfS8nQZnWWFQyOSuVu6rvasE1o
         h5n4I0lrfwWIrcUQQpKdxV8Kom766ErhiHY+ZPqQWBXcn79Tiqp/Q9wETKX1aoaTkmyS
         cMN46RAny+72sp3t/7U4l6OS6ti4J/JAByfTG/QQ9Rw9mywBJC9Fyshbp8G2EIOLVOxn
         J8NKellMQbrzrY8I5u3RUSN69qAmnWx1qXeNsmckqXa0Y782IS9zAIfxo7ocQw/VC5k0
         +jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755618396; x=1756223196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3K+UxxYwPhvLucxtEVx52KzKKdttDxc8qe0jETWvm0=;
        b=ZLy1YHAtXf4x2og8Nr68AnnEOJH8WbYYcw6+YAEn19AgY+7jS0tNgAtMBtgqW7dfSg
         Rkav2y1MPXBXN4h+4iA6MFmE41BrpM98HdT/PFcGd8hIhJeHnR+AhDuBkk8iHAYpXR+z
         qltPUuxed7yFU2sd4NWx447IkO+rpDYNn56m6TwKKLEWsgu+rWosFpQSOq+vBA3Vrlos
         n93Auvw4DHbSPCqxnSwQBW7vneovSMwLyDZ2xAg2wk+hcibiU4cwHNTwjvvi707Q9Rzi
         WGKY1kSHevKofO/97qmTgU1pKa+Ho+bQPEU48rVClbN8e5VlKHNST/ecDTECleJUesdJ
         K00A==
X-Forwarded-Encrypted: i=1; AJvYcCXI+Dm1Whzy98DW6Kg7KiG2GpPGrMc4RAmUqDpUWlCRthwTdpEarhhSjJOaO5uMfhiv0TAbb9Dq5Hw77VpJb60YWqo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrKGELU/RYLbh0Zgc+ylY8jOuLJW2TLW7eNhtyeu9E3OylY0mQ
	COaLunEw8M1IQGobaih2YFsWZ9ZS4AJI2UvHvkDWK/gtUURiNqgogzvbBRACsnd3O0vMxa3xtk9
	dv3MUP0UyEhAtEM3iT+pFgnWinPSe3OOOJdz0
X-Gm-Gg: ASbGnct969bCac/VE1Oncx2yuekEX0WH1wQ2mhHaPBIZiNsQdsPH9dt4AzCKwZQVWy+
	z5RTJ2fObYdOGsPCZcMm7GQJs4XIV7RcQAqHnnGC61q2+2YbtC2RmBjsKbnz9p3kr8tvnmAYynw
	liJSEjavt8e7c0XroY7naK4Q+vnIcKNDmNSObK3MKCq+eBOzkAAwoDKJZ+jSTSJTJZPYqCf0kDm
	+Qdtcyfo0PU1SWH5SZ4YlOP6r6GeFCBj5Z6wVg=
X-Google-Smtp-Source: AGHT+IHbaRkeOFFxNUKNukFPPGDOUdGR/RPTSa0NN4ggO19/exOnSSHFE093e/wejmTYFT6OqzpfFCH4VK1l+2MLvCY=
X-Received: by 2002:a05:6902:33c9:b0:e93:4a5e:dfda with SMTP id
 3f1490d57ef6-e94e6296315mr3109377276.31.1755618396426; Tue, 19 Aug 2025
 08:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250815105844.584334-1-karn.jye.lau@intel.com>
 <04cd09ff-cb1d-4948-a198-7b2b7a244f16@gmail.com> <CA+chaQdBWW2jkTrUw0ipruVzRT8NWyn-1a5WmQMtH0BpZBy5oQ@mail.gmail.com>
 <e21b33b0-8be5-49e7-ad82-52ff7fc73c70@gmail.com>
In-Reply-To: <e21b33b0-8be5-49e7-ad82-52ff7fc73c70@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Aug 2025 08:46:10 -0700
X-Gm-Features: Ac12FXxhKZ0qyp5KIgr1nRNeVhOTI5axCQlMzzWkpAs5ErPQf1ikMJM1Eet9dug
Message-ID: <CAMKF1soD3zfAzBKg+EB8KE=e1=+GQTC0xWWTc18L6sXfG9xHDQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] mbedtls: drop tag
 parameter from SRC_URI.
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org, 
	"akuster808@gmail.com" <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 15:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119005

On Tue, Aug 19, 2025 at 4:27=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 8/19/25 13:24, Martin Jansa wrote:
> > On Tue, Aug 19, 2025 at 12:44=E2=80=AFPM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> Armin, Khem,
> >>
> >> Would that be possible to prepare an unscheduled fix-release with this=
?
> >> It keeps tripping people, I see reports on all channels.
> > Khem already merged the fix yesterday. Thanks Khem!
>

I needed to understand the problem a bit.

> Oh, I wish it worked like this with everything I wish for.
>
> Sorry for the noise then, and thanks for the fix.

