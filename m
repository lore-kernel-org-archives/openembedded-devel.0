Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id F203E60722
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2019 18:07:26 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y16so10874862qki.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2019 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QleQIDcSchEajNHc+Cw+dRycARMbxwakVgH1iDKQgNA=;
	b=Ph8Fge5Moojgufs+TiNARtf80tWAmU9QaV9fTQegfBLtwrjW0jFam/pmd/2ZI5yzUo
	KA/QPCyBkVnBrmw7UjRIr6suyxTxyvOnd1n2j4LKSS/HFU5jk0kXc5wg6AJNYlY+Vxtu
	vmr2uBTThqyN2FXKUel9uFECe4IZ6x7X1qZOGWXWIjTB7T9LRmzDiDitU3FSspEOIliO
	dMi8OfQMw/+G9Jd/odCAvRM8KgnagHvd9URIOIqXowa6Jqq9Gb7EHBzWJQnGcxRfeyNg
	X5lQMW1BX8tMOH//k+QGnRJyHcgEmQC0to7L2LHBPYMnYcHxVe50Klz9yJS9s7/rZtDK
	707A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QleQIDcSchEajNHc+Cw+dRycARMbxwakVgH1iDKQgNA=;
	b=iZhCqt4RqPbiq7xlG/76IJNWvVwoItsSfvAk1LX1uuOarGDcwfbe81Fxsy5Q/sB7qe
	z7DJ+5H+Sx+0K+PmVoCyebyAwvEwjpad53NC0mKtQ6G49bsM69rJ1yPe/RrZjyldQffR
	Ns4vBGbApBmDi0TtrVMl/KwJYxi0ug/DmaLGmc9lfJyUrO4oPBhxr3PKxQHuYTUGMhp1
	TtzqCNBaF4VX+5klNiVSN2RTvpmVvGd6NKZKAWq2FmuF7UffsidZmLDjzKuOfkUk6WtV
	HIG3s88152p0sNTzFOr54MUusJ5WPSKkqxUpKyRPfPfY3MMZt3NbiLmzdGw9TlRI3dTs
	cyeA==
X-Gm-Message-State: AJcUuke6egvHcUDrYHJeN/ET9JtWW8/x/eFCumJowYMoEGjpQ5RfaiPw
	tyG0p1RGT/UUxStuP7N6R4sXEq28nrR/xk+TxUU=
X-Google-Smtp-Source: ALg8bN4JMTLbHRmRQ0af21txOX7xMOGBU8ZI1I1RbVo1uVXkDXS98jg+iar7KQpyAe63T689z5tYFpVsEzbMSr1Pl30=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr21843672qkf.223.1548007647626;
	Sun, 20 Jan 2019 10:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
	<CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
	<d198417638781fb108e77e953ae95550@agner.ch>
	<6021b113-7a55-7bb7-c813-b7d768147f57@windriver.com>
In-Reply-To: <6021b113-7a55-7bb7-c813-b7d768147f57@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jan 2019 10:07:01 -0800
Message-ID: <CAMKF1spfqh71NCqVa4SweQehNMGMgezBJdnkMdoGAErt5f2g6A@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
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
X-List-Received-Date: Sun, 20 Jan 2019 18:07:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 4:30 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 1/17/19 1:39 PM, Stefan Agner wrote:
> > On 17.01.2019 18:53, Andreas M=C3=BCller wrote:
> >> On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
> >>>
> >>> From: Stefan Agner <stefan.agner@toradex.com>
> >>>
> >>> systemd and polkit are not directly related. It is just fine to build
> >>> with systemd but without polkit.
> >> Surely it builds but is it still usable as unpriviledged user?
> >
> > TBH, I don't know, did not run XFCE.
>
> We do! :)
>
> >
> > If it is unusable, we probably should not make it an option anyway? Jus=
t
> > enable it always and make polkit a fixed dependency?
>
> Grace,
> Please apply this series of patches and check if
> xfce4-power-manager is usable as an unprivileged user?

Thanks for testing it out, I will wait to hear from you

