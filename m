Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C29FE75279
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:46:18 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id c6-v6so16129108oiy.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ys3my5D+4Xocj0W+ms01hus0e3Iub4qE4VespjRTjSg=;
	b=MARJgslM3SFyeS89Y7luzEOUIwP8UZdT/Kruqw5m9FrRwLfu7WHXBCU6uEL7+3hhxp
	l0aWUYBFXnk1u3K1WByMR1HVUHnqvghY17xO9JZ2xykpP2wzI/1OoBqZ6e7K/SzXXuxl
	rhR5DNt30o991aVht5WdmSiuex8lbnotgfO1lUAdGeOlQO4zvIr5r/A+PUJPzzYVCLkX
	6LwSa68/6AO5+cTxzQV6JRShDYSWkvPXbG2pVcAq0gh7Zwl2cvcnZkzbZOMJuV1KqxVG
	sRMjHRN89aJ3Or5+5UJvE2j9hIxbhjs5zJ+hq4OsgnKsQVv1o/Tw2VQhSKPkygWHasll
	fAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ys3my5D+4Xocj0W+ms01hus0e3Iub4qE4VespjRTjSg=;
	b=gfUo5GMm+jc9imnh/zpYjwEVoiMG7IotkC64esSidf6LGMfl10r7+47d9a8/DhOwXh
	V1jSn4IpJkCgb2bmTtAgz30LpqqYSwZ2IfJOduQmbhk/SAxVT16wT40e8GzsyukEo2Nu
	t5ajtqHq8IToS2lr6x4PUTP/9GiSJayH9tQ9DyoShgMwW5rV64X4bz4g3ePFjHA6zzDF
	yG05+qJ+r0+qafQWqw43J+f0e3WuywzB6kDMlQOZJOIHS0kimZexenqrS+eiL5+6zHtX
	61l5Vm2+sLMItG78RLucpUVTRFZJ0Ja2OxZIFFlOoHdREe7fo4gNpXH8UW7hE6rTkBSt
	rdEg==
X-Gm-Message-State: APt69E1E2n9pqyPaxJCdk0f1HGlKe5s9mb4MZAzo7xrbLOrWxxQYdMCm
	BY8t2mJYxYtBmL1bGEeN1wEYb82kIR4ZC1mEr9M=
X-Google-Smtp-Source: ADUXVKJqeJchp6hBRtL97/8X+oI9UkHS5oEATdeBW59qWBboLyZfWTyMTcmE3KOQ0+HMvhITh4Gti86Y5X600J685xw=
X-Received: by 2002:aca:4f51:: with SMTP id
	d78-v6mr8282385oib.224.1529354779772; 
	Mon, 18 Jun 2018 13:46:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 13:46:18
	-0700 (PDT)
In-Reply-To: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 22:46:18 +0200
Message-ID: <CALbNGRQ+2HEhR_E6MH9ba5qCoGCWhDR_fPp+MC1D8=Q5C9pn6A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 6:51 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
> QA Error/Warning regarding files 'installed-vs-shipped':
>
>     ERROR: QA Issue: thunar: Files/directories were installed but not
>     shipped in any package:
>       /usr/lib
>       /usr/lib/systemd
>       /usr/lib/systemd/user
>       /usr/lib/systemd/user/thunar.service
>
> Correct the path to the systemd service file to match what we see in
> other recipes which include "user" service files.
>
I checked: My patch sets ${libdir}/system. That does not work for
systems with libdir=3D/usr/lib64

So:

* Sorry for causing trouble
* Thanks for fixing

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

