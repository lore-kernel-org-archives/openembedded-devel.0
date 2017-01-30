Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD6B60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 21:41:05 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id r136so27608793vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 13:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=ASMfz/WXNmm+JrUMbRKCz9gPAfg18LbLV5HbXFz2kvM=;
	b=bhYjm5j3Pd8ZB4PF+UgcAEanf3+uttfli8XW2hWlISIP7HEZkdG/TQIhpeHN1AaNkM
	NyorlAmuoL1Mi2ugnKpWUqM+ZfEDG+6SCPp6AAb5z0KTOGiYVWgujukHiYPymr3OGA2L
	vJGKryMS4VokknCu0FH6VCldYUfmSoxW0URSOopGPK/pu9oFHy/ZEcZc6HrzOCp8R3Cx
	TS2BDP2ojC/O7TO2VS2ZW8lOt5jcrR43eMCs3NxjrDqEqU8Hps0G2UZ+Zg/xsPSgc19u
	eRBDWbxNbhxD11ljLBSxh7pXpfaPloeWyn9/LBfMLD0JruhakKWLkNm+eOePkBaGAuWf
	ne0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=ASMfz/WXNmm+JrUMbRKCz9gPAfg18LbLV5HbXFz2kvM=;
	b=Bxe9ibO6X7bPVsRvF2ks13KCkNopN9R1sFtBbOBPjnHjSueP6+K9tQGmRdsBYwIpNI
	dUDjao45c99A8ppmbUKdLRNLKei09JL+symjdFbVfkjUGHG8xvt+4K5pW3/Rh9jLahCR
	ifazbtdocJcFBW7UXVB5COq4AsMHS6JlSUf8mlKe54+KgEsq/uY+FQWsyqMcbVbJIXmo
	n47WIrzMzuZpJBLF5MDJzSSDdCscRHsgY8YqS6Nwm45jbnqEGyhBwIH1TatWnfpO342V
	X0cgD6FB3/gXaA7GDQK9gsyOBnO9FIxyfLbL2zOigF+iOJgCsRiYpR8AOFHFWDne76vf
	Q8zA==
X-Gm-Message-State: AIkVDXIbq/1z35PumLqxcdGZwM+n4y2qlbLX2Hy+KrFk/zkXK4kjM+7GDiAGpb6qclB+ZJae5qU1XSP9ixpVJA==
X-Received: by 10.31.155.75 with SMTP id d72mr10952965vke.55.1485812465372;
	Mon, 30 Jan 2017 13:41:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 30 Jan 2017 13:41:05 -0800 (PST)
In-Reply-To: <1485374763-7114-2-git-send-email-schnitzeltony@googlemail.com>
References: <1485374763-7114-1-git-send-email-schnitzeltony@googlemail.com>
	<1485374763-7114-2-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 30 Jan 2017 22:41:05 +0100
Message-ID: <CALbNGRRVcvt1JdHiaL4AswX1UUSTCjHgUPJXbXtUmQdRRQmUag@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] fluidsynth: add ARM NEON support for sample interpolation
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
X-List-Received-Date: Mon, 30 Jan 2017 21:41:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 9:06 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...e_dsp_interpolate_4th_order-make-use-of-A.patch | 158 +++++++++++++++=
++++++
>  .../fluidsynth/fluidsynth_1.1.6.bb                 |   5 +-
>  2 files changed, 162 insertions(+), 1 deletion(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/files/0=
001-fluid_rvoice_dsp_interpolate_4th_order-make-use-of-A.patch

Sorry but I get the feeling that this patch does not accelerate
interpolation. I need to write some performance test to check (don't
trust optimizations without performance numbers) So for please ignore
this patch.

Andreas

