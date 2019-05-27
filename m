Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 60C4B7CBE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 22:37:36 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id j1so19763861qkk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wRJ3lm+qkxGe/fgcIgK9q/VR7xUtWOIHuMI7mV+yxgQ=;
	b=Lrhzlr/iMmbxHGLxbqJTqFj/vPf2goXhfNE5PeUMFuKBxn7vasdBm+nSqb5ZSI850d
	2SXCQvghSr3ntRmmIYoP/yIXmxy8vwZ4C6qm46HeLpZtaXgaoRSUlV1m3wz3D0x/jvyz
	fVRSwmAp5fucld7aPYQrXzVGwYpadZtjpq2bMyqyQvqJc6cCdVTSS4xjgbj6Lu3QItOS
	+BmlGPZN7N46nWZVfpgxYCeKcbAyBSTZv6YBsxXte+uBoGS8nAKqU1oW81wJNCXmzkng
	jHPZffPs1Mxo6JikX49bK6F4Aad6FTq7JwKwghUIP7C8apJN9xz8rOmAkhRpCfItdXNq
	wOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wRJ3lm+qkxGe/fgcIgK9q/VR7xUtWOIHuMI7mV+yxgQ=;
	b=r14Z8rsDdp0z17iGN+sIXqmZgJx3ZOofZMP5AuodePDlKqQhs045RTbpL+/yJFFibb
	vX3KOCHhlKhpWbk9AC16xMesT+qCQQw6imcNLgm1lJbkD0ZtMjBtfbPV7zRj6Rsm+F4D
	eNkxSmfm5Kz59oCfm0wrlXAgU08hpGk9hrJs9KSBUR74Rm2Qm0R693yWQbgzyBgG79fw
	C1qSPW5C7gEgXgMq0w16Ew68PvphnKZfQaOt2Ow+QyfriIjqtXjRoCVTNwwz4DozESKY
	BgMLJoM66MQ8H3S0nsaRbs/h/K8pXBsX1uBetfpwE6SCjkd0zeABoHih81I6Lnd16uZc
	LJ0Q==
X-Gm-Message-State: APjAAAVizXabXCjxsJYxZ85vGvuJh+TuGP9r2yomLvQq+4ApiPzfqlaW
	2pKRgkMPPP8DDcRGJU1A8RBzVSuAsVimW9Im5Ow=
X-Google-Smtp-Source: APXvYqxTEIP9590Bp+LMMpBnQacJcLKtR/zKNwHNoz6GDmI6Ag+UXhCOsi5W4eZWbkvO0+6MUsIqiosHvS+LyPFbPtM=
X-Received: by 2002:a37:a017:: with SMTP id j23mr8841432qke.258.1558996656973; 
	Mon, 27 May 2019 15:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558966857.git.akuster808@gmail.com>
In-Reply-To: <cover.1558966857.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 15:37:11 -0700
Message-ID: <CAMKF1sr6LUR3zpeqLsptcG67Xaa6s_LSK9V+dOfgoMGQsLSkbw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud 0/3] Patch review for thud
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
X-List-Received-Date: Mon, 27 May 2019 22:37:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 27, 2019 at 7:22 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> These are being backported from Warrior-next
>

LGTM.

> The following changes since commit f6b21313abee0fc53b77a7e977f3fa54a8428118:
>
>   ccid: fix SRC_URI (2019-05-26 09:09:32 -0700)
>
> are available in the git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib stable/thud-nmut
>   http://cgit.openembedded.org//log/?h=stable/thud-nmut
>
> Qi.Chen@windriver.com (1):
>   netkit-rsh: add tag to CVE patch
>
> Tom Rini (1):
>   netkit-rsh: don't build under musl
>
> Yi Zhao (1):
>   netkit-rsh: security fixes
>
>  .../CVE-2019-7282-and-CVE-2019-7283.patch          | 35 ++++++++++++++++++++++
>  .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

