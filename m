Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id E84E47F638
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 12:23:35 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b10so2352874iof.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ygIMoaukT+7iQCEtIYhW7rs8eNt0oNMDqWUn/00LfyM=;
	b=fftQh5MCeAoAe5JGIAUFkTyCgIWxTDSGI9kKKqbQCfZ2VXXHWXYAD5BviN+C8wC8oB
	7azARhshMsUx+vtE5qHular9fr6BmSETxfYs+p6rC/MAKnB+efpmOAgyhg2iivbShUDv
	dsq8GauHtRiUTh6sSrYBAy6t2X+O6RxmKPJIcormVNlSwzvKGCYUg/rEa5XPzfyZ0I8s
	bVfavl+KjfcWlQW/LYRMNimSY2J6DUkGMBMYg9A+d0RnX8ydHKiDEJGT9CTzfciQf0Qu
	Vjs0/9bOQnn7gDR2kWubRpv8APujCqbx7sLuBYKWLs+9c42gWSpUVmDYmhb+i0aNi84K
	NWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ygIMoaukT+7iQCEtIYhW7rs8eNt0oNMDqWUn/00LfyM=;
	b=Z+6Um0KvNUlgzNk2VDrs98Bf1uiHaxM8auhYFqjKPnMTWCwML2YlXIKOAwTUNDS+l+
	B1ibfMUcN+LudMhum6GeCZflU/XJyTKXY2gBCvMxfU5ks8KGTmt/6AmQhUQKpuyvy3zE
	ZcZPzp3yP9Y9wDptzvb0Y4rG9s1bmydSMnoAUN1zfHzBmqWw5QiUr1ejKXeQAATAwi6j
	w8UnFnJRP/EGxED/6lYwsVC4xS6Ohh0Cy84LBc+Op8AxwKQdv+6RT50QJdC+V4rn5pGB
	KWxZ2mvKAD3lNIIDdzmF5SrOmxkBNv0uq8RVZ4x64tK/Loj5Y4cEziNaFp9QnF+cV7wK
	Hf4g==
X-Gm-Message-State: APjAAAWQVostdCeDpBUZOxhrmRj64bcYbLvX4k0wR+P0qactLQDMbbmm
	XS84aesCR+9AAm0iiOF2NcWyf3ZZMEhXk4K6TTM=
X-Google-Smtp-Source: APXvYqxBAppVuWf1lG4mWxzaw5yn0cvrxkxa2ke0ezL3NEnPzp+llzIpCy40W3qtaU0/ikf+qCTvDyJep8qvL52qepw=
X-Received: by 2002:a02:3948:: with SMTP id w8mr3785904jae.124.1576326216789; 
	Sat, 14 Dec 2019 04:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20191211000845.13166-1-schnitzeltony@gmail.com>
	<20191211000845.13166-3-schnitzeltony@gmail.com>
	<CAMKF1sqDizC0FHRpoTB-BB8gEDyqu8zTa9OX7UMqh3x74M-18Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqDizC0FHRpoTB-BB8gEDyqu8zTa9OX7UMqh3x74M-18Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Dec 2019 13:23:25 +0100
Message-ID: <CALbNGRRibG=oyRRUvofT8LK4SGsDkoZ5_h57-=z-R_teKwKKEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gjs: exclude mips build
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
X-List-Received-Date: Sat, 14 Dec 2019 12:23:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 14, 2019 at 3:36 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> I sent another patch to fix mozjs which inturn fixes this problem
> so we really do not need to exclude gjs for mips anymore.
>
> see
>
> https://patchwork.openembedded.org/patch/168002/
>
Thanks for providing a solution on this

Andreas

