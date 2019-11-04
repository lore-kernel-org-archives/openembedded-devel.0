Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB2907F921
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:02:53 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q1so19747509ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=SQ/rwq5WGX4eF//NhZ7zlwh7O14AYPt0wRmYb8lYfiM=;
	b=f68ObaM5QMGwsLozKx13d+jcTITwp3846/SS88zh6+gpR3pd+wJ052DuLUqGewzsvR
	1DXMS0hS/GN7JDhYSvT5FSgHykO2LYtQ6LPKF5IRYEgq7BQg9itYs54CMc7JR7uISP2M
	M1f49J8TDl4UcOngVzGbswXa8nBPnnz1PgLdxkkOhz647bNtGt2ekzeEbYvlVrlv75pQ
	5P468Z2CSpzDA/y3ThtmbzT363lI/2cYzVCQPbKDYHETO3WLuS40SjSB+IyXbMwdQ9W8
	J+7W7WihIYPdmFgJdRquKLbkcHaDEZcLXW2JZCm6fjAI6WJIv6tD3/H9vXDDbsK8dQq8
	lVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=SQ/rwq5WGX4eF//NhZ7zlwh7O14AYPt0wRmYb8lYfiM=;
	b=O2m+oIf/0sfm55S+2sOxQDJbo5fIJu4msbUAiD9L41TP2waOq+na+Y5OFYhBE/5orm
	kdr1d263KnJDqRdjgNCPbRBDuko9BLKydkxe4L8fKDX0iRSzVVBen5K5hn4AYx3UrLrT
	uoo9Zp9X14jtlx1GyVyaFUGWfQqSrcOGajjRSsORdPn9BkbDP4SS+rIV920PMEprqBMF
	yFxQ8ix5v3GaHPR/hxyVnp950aqs6hAa1hFRvOvKGwI/ujrp0D8kFRcCCPo1XP5qDqcV
	d4rPF1e+SBRl6Yetk7LHxWDU2Yx/obRHEVGL/8keAtZYcgFbW8oXNpyak1iR+AG7dCI6
	JIyQ==
X-Gm-Message-State: APjAAAUhLXquZZ/FlpT+dFOqk8p7Kc98T+R4O8OfsPRxCKBY84GN3DET
	MiNc6nyQniybAeHLRZCY1l77rEDHuFrJMt+sYlYgqg==
X-Google-Smtp-Source: APXvYqxuvxaxHeeRWZqSUoeO8G8cnfaXXfrzGD9SPOajHvtZNXXukuBlxxabkE9euu4zV7pGm+ujjL7fuBIJaDk4xg8=
X-Received: by 2002:a05:6638:34b:: with SMTP id
	x11mr899572jap.128.1572894174472; 
	Mon, 04 Nov 2019 11:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20191104190114.5076-1-schnitzeltony@gmail.com>
In-Reply-To: <20191104190114.5076-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 4 Nov 2019 20:02:43 +0100
Message-ID: <CALbNGRSfgVLSyNLgyYpVa7ZaToRYPaJZkQ7CCwC03mAVGcCFzg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] mm-common follow-ups
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
X-List-Received-Date: Mon, 04 Nov 2019 19:02:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 8:01 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> To avoid another rebasing dance I sent out 'upgrade 0.9.12 -> 1.0.0 / mes=
on
> build / add SUMMARY' in a hurry.
> Since hurry has never been a good idea I decided to look into mm-common
> again and found:
>
> Andreas M=C3=BCller (2):
>   mm-common: do really build with meson
>   mm-common: build for allarch

Forgot: should apply master-next
>
>  ...ot-ask-for-python-installation-versi.patch | 41 +++++++++++++++++++
>  .../recipes-core/mm-common/mm-common_1.0.0.bb |  9 ++--
>  2 files changed, 45 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-core/mm-common/mm-common/0001-meson.b=
uild-do-not-ask-for-python-installation-versi.patch
>
> --
> 2.21.0
>

