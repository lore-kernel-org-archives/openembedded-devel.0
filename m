Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5177530F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 13:30:23 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x4so14521269otg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 06:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1H7+VYb3KuIKtr1vXD+2dHnWk9TrLd9gqljt+9nt48g=;
	b=vCwxWpcJmRDvMqtaZVsW/wBgwBrLRkaL7KVLbYjKhdmEYAluiGcshNaKyqOmNQDv1G
	JL1pKahdJkPxNFpMQuVZe43Y4IGC/iwQ4v2PyNmzBY1VlAQiy3+QTpQ4zCN+vIRCokKc
	BGn3fidbrCQhobnDCj/whQDZNjhHizyu85cOnfOUp9doUNk1AfEs/eIyRKtfRTDYkVLv
	RkAvXsfrd0HghKrIBzsxmzd0lrCM0UNLMcDPTmcFexOwNHZv7xspqMRr8RutUIFh1kKL
	w2zmGc5SNQMmcceFv7DCnF3u4q8yQonf2SWpcb7ZQ4LrM9+6MiZmsNMfDC5shIYwTY58
	rWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1H7+VYb3KuIKtr1vXD+2dHnWk9TrLd9gqljt+9nt48g=;
	b=Ii3t/y90FmF/MZfrmsOFHiWLQiDr9U0liC+b58Evwf6/WJnPWyjFVbRjlJEQKxIBh0
	7x9QQZL069KJA7n/sIGemRd/rGYVMHc86hdcez+l72hSirBm2zE8XLwl0BVKDkiwE3gd
	yrthaI4KLUlHWXpJg4LxAt4xgbDZRsiIDM2C66SU2BTZJ+g2ULf8zUM0GdOMGOpoa9Je
	3EJz1zJYSIp4Y5vWLBWdyMMqG7gVoQwocHjx7U8rTAyUg6+okyeLvTZYj4HVgE+vAZnT
	XlwZnApZPiU9s7sC8mbe91sFU2MJQzHT7NzLnSpUVIhB5cfcu0kL+sUp13jQdOELhViS
	kWxQ==
X-Gm-Message-State: AGRZ1gIZcJoqsqlXIlY9g0krN5xhOLK9uo1JG73mh3lacBhxpOorw2RL
	cTeIkz0giDTtXUIyy86X8NxNDj/nLg4HoSAp/ts=
X-Google-Smtp-Source: AJdET5djqiazP03o34JRJUD6Kwvsho7xncVTqp8hd0caP6pqPH4DzbK+1tWWprgtpFbOLvWF1LK++sa+0AdK9PgIaiE=
X-Received: by 2002:a9d:5a83:: with SMTP id w3mr1745797oth.87.1540992623935;
	Wed, 31 Oct 2018 06:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<CALbNGRRO-qQFvXDJODFn28e9AGr-AgUgDY1D52-2TdDcViYcYg@mail.gmail.com>
	<CAKPa3c0ky_hpa2AhdzR2-=3dBxMjffzf+U4PZFnnbm3GYOi0Tg@mail.gmail.com>
In-Reply-To: <CAKPa3c0ky_hpa2AhdzR2-=3dBxMjffzf+U4PZFnnbm3GYOi0Tg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 31 Oct 2018 14:30:10 +0100
Message-ID: <CALbNGRR3CxGJ8o-AmZsxy+E9_wKocNnQ47Oqu6kYE-RNj-8=Hg@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Wed, 31 Oct 2018 13:30:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2018 at 2:17 PM Brendan Kerrigan <brendank310@gmail.com> wr=
ote:
>
> Yeah the recipes still using autotools were not utilizing meson at the ti=
me the work was started. If some of the projects have migrated in the mean =
time, it makes sense to do that work now. At this point I think it makes se=
nse to split this into two pull requests, the first set of patches will upr=
ev existing recipes (e.g. lcms, dconf to support native, etc), and a follow=
 on reflow of the additional recipes for supporting gnome-shell with the co=
mments addressed. I expect to be able to post a v2 by early next week as I =
have other commitments that have taken priority. Thanks for all the comment=
s so far.
>
> Brendan
postponing meson sounds reasonable - we've put a heavy load on your
TODO already :)

Thanks again for gnome3ing - I am excited to see how it performs.

Andreas

