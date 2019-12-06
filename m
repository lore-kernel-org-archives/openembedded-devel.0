Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 515F77FC06
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 09:05:20 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id z12so5602105iln.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=boD7/4ItBrWZxor/aN4S+WHlFBG1AmgPH2LGDB8hZHs=;
	b=nTvs0eRy7frC3gSxX5+jgh/QLA22TuAqU2CfB0tvwDfDgs7cWaPoxu68sUVvyVf0k5
	JAx0j2jpxfsGSEtIhDKGG3TmowvCHDkw/KSloWza4bKl5TvxBEEP39urBSyqmwB1/oW6
	gvPdNGt7to8wgvcHs6LkRNvMtNifMYmTb8rqo0suemz/kpun2LrkDNpXinxqwDXR3eB7
	cLe1O1/qXQl4JKPipCvlK2rZzlB/rfHmHuqLjasB0rqEcJWFvdxfDu3EiPADWHMKCCXg
	S+LyyN/eaVwP1i73YeZaA50qSQthvsu7B9yFUg+zOxpEi9xbDgEvyzPjCpfW59cFAuzJ
	P0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=boD7/4ItBrWZxor/aN4S+WHlFBG1AmgPH2LGDB8hZHs=;
	b=o5vCLkqcQm1rA9pFWQdXgjQLr/AVcQ3h0v/XAh2gfC+TsmKrn4jLACZb9fAwr7z3g1
	Duu2xrWb/kc5wtYxeCLVkf0CCbR7WP+V0VWbH4mbCcsEw/QvwwX+/1wchsAyEMiPJH3M
	iQBXCb/H5V78OA1jIWKWsK864l5UB1OpETyk+Do1amyeVVmVw1HnDIMNW8xfTsa8M1KN
	64MqxwMc1vpsC4yeNMFIP8sVynbraXQGyLlBor3QD2DG1oVZpq4B7aY9syer4FmK3FGl
	wd3rERtQ0yD7TeZRHWzB1gCimpYfDZjih6xorBbBd7VYjNGkkLg5b1RP0DRCjGs1r9yB
	Z+gw==
X-Gm-Message-State: APjAAAW4ZNhIBWheN6oJbBoNNm8HnzCHd0sN1QMqgg8rT/jgOCbdYn9U
	jkm07E5JGZXZTt5hNSk3l/hDQfwpudDRa4rJKTUUEA==
X-Google-Smtp-Source: APXvYqwm1PsSmlC31zyFAplT85Dq2NckM86v5RlYix1iyNaV0uRnaEhY7nYO0yguLJ+Vstr3/xbSbwPIHXzSD32xuuM=
X-Received: by 2002:a92:4781:: with SMTP id e1mr12640364ilk.147.1575623121656; 
	Fri, 06 Dec 2019 01:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
	<CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
In-Reply-To: <CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 10:05:10 +0100
Message-ID: <CALbNGRQAEhJbUdVw3Z69rU7jTLoY-=W9yUdDuxDSRNdRQfNH0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Fri, 06 Dec 2019 09:05:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 6, 2019 at 8:12 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Seeing below parsing errors
>
> 20:27:29 ERROR: Nothing PROVIDES 'gdm' (but
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
> DEPENDS on or otherwise requires it)
OOps - I have written much about gdm but the patch adding it her is
missing. Will send soon

Andreas

