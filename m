Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 963A371AD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:50:13 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id i68so55189224uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=qnOFxKDIyKP58/7THm/VZoXqUjuISNiWcqNXdBiZJa8=;
	b=r3ukEbRcczUE0XsHPgZpYXR/OIpwCwrZ+eJU17c5/zV6oM8n/AHonAo2XRNyZh/pHF
	9NlQXhj7HignYZl0J2ffGn8K4UXSRjBBBQGUeopWsPjC7NgaUWLuJRdDx9/9U2Gib5nD
	RHb924u7Z5XkHuxsoI/eXckSDEtWZE4zLm30eYCiAJwaEKMkPXVQA48QzL4L/Jf5KtcM
	6kjysHwrEqs6DDyS9hee0No9yUD5IiikBFaDR41bNvuORAJuS3oP4aIM0P4H0aXc2uL5
	rXFVbsnioEF4ym5RkaR4pwcVXkvoAS/u4xB2720BM2LNjmZr3X5iiGa3so0DN4KuofPT
	R6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=qnOFxKDIyKP58/7THm/VZoXqUjuISNiWcqNXdBiZJa8=;
	b=mh/Pb+FYUPCEUh1oGK6otogxWg3WP5eJkSAtv929ZFAoVx3uUpsfSqRGwCvlDR2Z2i
	pgnqEbFDqEPRRiBaT56UvihuPKfj0vmAGbIxEnJCQRL9qED3vhdCzjUietFd5ROcJi1B
	+Sq8V7Dltar3BmC0XXJeuYr15MRPEX+TnnbjV81wKjeLtpxJdNAYsC5jjg/FGy6wisfR
	tizc9h7gYH1kXDe1+jrSg1/h6a4AD+k5P5Ek+0+3fJzubgEtMaZgR8ftM/8dWJbqxO7j
	uvjcs5aOGDPOGHocuoj8TEBunRyabuHoI5yGfRk4E9mH4KFqirqGoPs9JJgS16PsW5yJ
	VmNw==
X-Gm-Message-State: AIkVDXJoXjI35DGa0HJBWyzNC/aB/7xmRaZPkOZKNxn8BDYiUYMYkq6fTfnXZc9A0R8CGg3knmacoc+DxojhcQ==
X-Received: by 10.176.82.16 with SMTP id i16mr1144838uaa.77.1484139013528;
	Wed, 11 Jan 2017 04:50:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Wed, 11 Jan 2017 04:50:12 -0800 (PST)
In-Reply-To: <CA+chaQebbXGgSc81--LcB0gif+wc_3JP3On_jWtDpvj40W1=VA@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
	<CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
	<949c3c51-85ac-75b8-9a13-61176d7a43c2@linux.intel.com>
	<CALbNGRT-f-yFag_OQhK9Ra_FqEL4PHBGgV7JGtrs5y_REqbETQ@mail.gmail.com>
	<CA+chaQebbXGgSc81--LcB0gif+wc_3JP3On_jWtDpvj40W1=VA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 11 Jan 2017 13:50:12 +0100
Message-ID: <CALbNGRQDG-dcFtSfda3fUzTw3-2rYvJvKPcy09vdPsOoTaGDMA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:50:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 1:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> He could be using more strict PATCHTOOL or the patch got mangled by
> patchwork/git-am.
>
> Can you upload your changes to some branch for Fabio to compare with what
> he applied from patchwork?
>
I create the patches from scratch currently and saw minor changes.
Will send V3 that should apply hopefully...

Andreas

