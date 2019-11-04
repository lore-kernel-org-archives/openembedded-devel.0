Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF4D7CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:56:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j13so3473048ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=wHJKnH2x1SP8bNBqI9F+z0WHIbG+rmEidk0X3FZkm2Y=;
	b=fv1DACmfGCM/fCfp7me/+6DmVlhYsykl7sKtYG9vYjOcE4cA1JN9vd/pj+Oal1wo8i
	tJz9O+OHLEy4hTB0QCxXDrL8bqbmcTN8867pgxLHvSKTOn3fHRBrhX2wgK7DrOjOS+ej
	Zx/SVbPWXAweCGlouf0Pf0EvDKvhC/MaagrFST7Gmj6xH44aPhhVlHJTjmuRUXQln+ke
	YRvSfqSS7T+qi9fd819RxuAqTjvbFDLfAIMGm9ogLKH6uPvWosabOyvnmI47nCfwVPUs
	qfnFA8iSagzjsjY5dmmLvAKkzGixYwyvLGUjHM3QbaL7Jua+cDtBnz4Sq08AIy1HrDBj
	RgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=wHJKnH2x1SP8bNBqI9F+z0WHIbG+rmEidk0X3FZkm2Y=;
	b=e3x+EN/9JzuJQIRfydBcCo1hxEPZWyu/2r6RaUq2U+/IhLVQCBYaR1VmgBF5x1uRVH
	wGlFCJLPFqbxBAHt6uWs3iT7NoNH2dHIiDi34M/JlTYWKKl4G3hLoGSt3outbXPWj3G6
	+aeuCPvraeMQuTg+NqGMSSyrNljQ/e5IWKDxqHHGcEeBX+eV1EI+QjboKeV10doY0YbO
	/MprN+01EvzyLPHdYvUdEO9ckBUgV+N0VB2Y/KGGNmypsAUbC/dSi9G6BG3VhhSOx3ZO
	jRbkVfvcsBncU3em+yIXiNOBCcyfn5w98M/TQnAC08BI0gkbt3TkleusUhdtZH45ORby
	Vj8w==
X-Gm-Message-State: APjAAAVuSZl+8bKbkrPaORrYTQ3iMkZ3A64yDAdmbhgh8hv02JrzRZaU
	0Hi/4rwgMbccwTQAnjB0dW58Hjr96GJ/Ijlbu2krA4gn
X-Google-Smtp-Source: APXvYqxg+Qm1WVrYN5IdvxbWsl8TGreRgAzeACzbul6RKug8f/4lMl6VnTXkU7WW7rtN80SRd8o4af2Hl6LKh/4zR1U=
X-Received: by 2002:a5d:8146:: with SMTP id f6mr25934031ioo.108.1572897373266; 
	Mon, 04 Nov 2019 11:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20191104190114.5076-1-schnitzeltony@gmail.com>
	<20191104190114.5076-3-schnitzeltony@gmail.com>
In-Reply-To: <20191104190114.5076-3-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 4 Nov 2019 20:56:02 +0100
Message-ID: <CALbNGRRW0_jMhchE9L0PEsjd1LvAw5qMQny2RkJh3==Sd=D76A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mm-common: build for allarch
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
X-List-Received-Date: Mon, 04 Nov 2019 19:56:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 8:01 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> mm-common does not compile anything and just installs scripts/marcros/doc=
s. So
> make it allarch and save a few build-tasks.
Please ignore this one: It breaks dependency chain for
libsigc++-3-native & libsigc++-2.0-native

BTW: why do we have native variants for libsigc++-?

Andreas

