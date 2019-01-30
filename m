Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB927C3B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 23:31:20 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id d11so1090608itf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ECdUp/SMbjyqPRxxViqMwdqdLj3KfyDJgLAtw4ME0fI=;
	b=Rao5HS8DAr6XTOKymMdrwpymxBqEKgH1cSwd/ts+mzY/sQDK+pWgxFJPYmVSjMSFkj
	t7cUj9y+bARFoPbQ267+CXCTgsdlVsG0RUIQTEI6yTWTBJvnKtHy9wn14MHVNPwcg4WE
	J+PFr+QyDby2hYXBLLF3MDThBz94+gnQShWsfemQsGu4AH/KR3m/Lp9A4yQGYW2wSyCJ
	ZMFSZoXFkp+nUeG6iVgUnL+dhE8ta4yDfh2ycHtqeFQ8Yhx/F7ayzGecIukEarb5CqU/
	LwCJM5YMgEa3ap0npziAaBAbYEcUXrgh/4fUkbasAWGPtke0U8rPteT2ed9x5pGRxIbT
	8jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ECdUp/SMbjyqPRxxViqMwdqdLj3KfyDJgLAtw4ME0fI=;
	b=bUXduEZ995OPZnVdNQ58ngTtI/II9hoVYLBKoQLRGOxxY5G/0HbrURSIZOro25MnoN
	cS6A926p9itRO/8of5X6O+jw28PCBj7nXh+Tz5+ywgC96c/Rwrtwg9b/8N5/U7pZgyNL
	oq8XBLYv/x5p+vg6qx62OPerrj5vrdQp9RQsApsMf4Uovp1nosH5ug07p/QMuF1LSZl1
	Kn8k5XJgUvY9OtFReGn3isVV2BXKAp6Z/hAkhkJbcMkRrBH/wRVyiWltlSx6qPW/P1W1
	J9d9zs9iHwpz6Ea5Q021mZNpcKVujRS54BBq9K/SfkiuygkFFob08cXTpwHMiT/Q6Jfz
	ALEA==
X-Gm-Message-State: AJcUukdsnqLSsosdU9EEBZFNO8dJmk+/KUNtmJ8nkx3e3qcSeNewznwu
	zhAdCfcIQ6CgjGS6gyQS1jIgObNIEa8A504W5hc=
X-Google-Smtp-Source: ALg8bN5TBBKKwbMWUDrkpUvCZz32/PU9vEM+ouNnyBnEm08ZO6v+oQvfLkyzoSlahaNGJUhIjkDI3142GP6map4xlcQ=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr18319899itj.154.1548891081509;
	Wed, 30 Jan 2019 15:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
	<CALbNGRQSDpsjP8=2wyuo_f9kdK3ekXrA4q8Tp0iqhmB5jjfhrg@mail.gmail.com>
	<bbc1dade-81c0-6c17-f275-c7786e7a725a@gmail.com>
In-Reply-To: <bbc1dade-81c0-6c17-f275-c7786e7a725a@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Jan 2019 00:31:09 +0100
Message-ID: <CALbNGRSFkaE_FqEtved6bCTWSyypuydRwEvSKZ4-R=EFzBYfhQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud][PATCH 0/4] Fixes
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
X-List-Received-Date: Wed, 30 Jan 2019 23:31:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 8:09 PM akuster808 <akuster808@gmail.com> wrote:
>
> Andreas,
>
> On 1/11/19 3:15 AM, Andreas M=C3=BCller wrote:
> > On Fri, Dec 28, 2018 at 4:17 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> >> Patch 2 is an update but necessary to build gvfs with libmtp in PACKAG=
ECONFIG
> >>
> >> Andreas M=C3=BCller (4):
> >>   libxklavier: Fix keyboard layout bug for xfce4-settings
> >>   libmtp: upgrade 1.1.5 -> 1.1.16 and rework
> >>   networkmanager: move udev-rules from /usr/lib -> /lib
> >>   openjpeg: fix build for multilib
> >>
> > Ping?
> I have them stagged for some build testing.
>
> thanks,
> Armin
Did something go wrong?

Andreas

