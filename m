Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3F671DBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 22:24:20 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 35so73370179uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 14:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=VdmZPSt98/88jSgjs7wA3DzE7xnf5N7iS3/YLGOTjuQ=;
	b=EbMlkYLOG0VaqOU1qKARx6e97fS2KMK+J+2Oo0Rl96csR+GYmWMeIOp2UwQM6U05vc
	sA4W5s7rElrMls4koucLNeA5MsY9AKC+tsTIu4bBz2i0Fk/at5p59Bg651eIhH3SHemL
	EGZiTpmI5w8qkwfOBHFdqPoy6j+VaPL+tGyaRIWgYR6rReDExz5nMM0PGgUhHVJeNZq2
	KyBm9o/Xnu3P64/3/74YNA/d6n60SfVtEi7kCwM5wkHC/h1VpeA9+2DUx9GPQdnLuyA5
	Q4VW8wOuokW3a5BzpaXoMUz4hUj3CsiYCo3iFF50y+0EBkc9i54C3Pdl+HTTmRh2kdrt
	2FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=VdmZPSt98/88jSgjs7wA3DzE7xnf5N7iS3/YLGOTjuQ=;
	b=AjVM6I1tGkiSzwBFrUO9RViU8vBSj+FlnCT65HXtQgTVbtDwM7/TXnpyKpnzKZ2S9W
	WJ+84+p7KyT8kOOzMEgFTsj90OsJ3Lq3hXwXpiWgCjamlZYDw7/SYnRm8qohI8lw5UKs
	0Xbi/hBENUh1mPWxMZQpMOu+boxnM9Alwr7JHJWzrZT8fG87qm/4FNTkANnpZhxprdZS
	iw/WhABtxMXcQcVFxSuA3sxRfsQbXjZFzE2y2ehL2wKrobO1RWmuvhVb0AJVPcFgJZNu
	AF/xDa6giwuwGUcQEeyLB+wnEKXFq7utJAMwgfOq+gSGRwq9tKpUtbNfBBkl3zeoMBRt
	BHTA==
X-Gm-Message-State: AMke39krnLfVjuCGwYRm8Bmr11+42SBr3YI7iGjHCLQiw5Pr5SObDhh7otr6oCRsN3SM4v/JEvrdh6yqNheBew==
X-Received: by 10.159.37.169 with SMTP id 38mr9792316uaf.80.1487629461926;
	Mon, 20 Feb 2017 14:24:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Mon, 20 Feb 2017 14:24:21 -0800 (PST)
In-Reply-To: <20170220180700.29836-9-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
	<20170220180700.29836-9-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 20 Feb 2017 23:24:21 +0100
Message-ID: <CALbNGRSktvJjZj42x1uX+YjYC=E9ZjmnBVeoSjKa1p1j1Q9h1Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 08/44] mpd: rework DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 22:24:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 7:06 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> To be honest: Have no idea why it failed detecting icu-i18n
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
...
> +inherit autotools useradd systemd
^ I bet it still fails. Guess pkgconfig is missing here...

Andreas

